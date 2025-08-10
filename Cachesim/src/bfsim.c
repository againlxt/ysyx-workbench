#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <inttypes.h>
#include <string.h>
#include <time.h>
#include <math.h>
#include <assert.h>

/* ========== 配置 ========== */
/* 选择预测器类型（编译前宏可以改）*/
typedef enum { P_BIMODAL, P_GSHARE, P_ALWAYS_T, P_ALWAYS_N } PredType;

#ifndef CONFIG_PRED_TYPE
#define CONFIG_PRED_TYPE P_BIMODAL
#endif

/* 表项数（必须为 2 的幂） */
#ifndef CONFIG_TABLE_ENTRIES
#define CONFIG_TABLE_ENTRIES 32
#endif

/* gshare 全局历史位数（仅当使用 GSHARE 时有意义） */
#ifndef CONFIG_GHIST_BITS
#define CONFIG_GHIST_BITS 8
#endif

/* 假定指令字节数（判断 next PC） */
#ifndef CONFIG_INSTR_BYTES
#define CONFIG_INSTR_BYTES 4
#endif

/* ========== 全局变量（风格与 cachesim 保持一致） ========== */
char *pred_file = NULL;

/* 2-bit 饱和计数器表（每项用 uint8_t 存 0..3） */
static uint8_t pred_table[CONFIG_TABLE_ENTRIES] = {0};

/* gshare 全局历史寄存器（低位有效）*/
#if CONFIG_PRED_TYPE == P_GSHARE || defined(CONFIG_PRED_TYPE)
static uint32_t ghist = 0;
#endif

/* 统计 */
static double inst_counter = 0;   /* 被认为需要预测的分支数（trace 中的控制转移计数） */
static double correct_counter = 0;
static double miss_counter = 0;

/* 随机种子，以便实现 random 策略（若将来扩展） */
static unsigned int seed_time = 0;

/* 辅助：检查 CONFIG_TABLE_ENTRIES 是否为 2 的幂 */
static void check_table_pow2(void) {
    uint32_t n = CONFIG_TABLE_ENTRIES;
    if ((n & (n - 1)) != 0) {
        fprintf(stderr, "CONFIG_TABLE_ENTRIES must be a power of two\n");
        exit(1);
    }
}

/* 初始化表，默认初始化为弱 Taken (2) —— 你可以改为弱 NotTaken (1) */
static void pred_init(void) {
    check_table_pow2();
    for (uint32_t i = 0; i < CONFIG_TABLE_ENTRIES; i++) pred_table[i] = 2; /* weak taken */
    seed_time = (unsigned int)time(NULL);
    srand(seed_time);
    ghist = 0;
}

/* 计算索引：
   - 使用 PC 的低位（丢弃对齐的 m bits）并 mask 到表大小
   - 对于 gshare，使用 ghist 与索引 XOR（只使用 ghist 的低 CONFIG_GHIST_BITS）
*/
static inline uint32_t get_index(uint64_t pc) {
    /* 忽略最低对齐位 */
    uint64_t pc_shift = pc >> (uint32_t)(log(CONFIG_INSTR_BYTES)/log(2));
    uint32_t mask = CONFIG_TABLE_ENTRIES - 1;
    uint32_t idx = (uint32_t)(pc_shift & mask);
#if defined(CONFIG_GHIST_BITS)
#if CONFIG_GHIST_BITS > 0
    /* 仅在使用 gshare 时进行 xor */
#if CONFIG_PRED_TYPE == P_GSHARE
    uint32_t hist_mask = ( (CONFIG_GHIST_BITS>=32) ? 0xFFFFFFFFu : ((1u << CONFIG_GHIST_BITS) - 1u) );
    uint32_t hist = ghist & hist_mask;
    idx = (idx ^ hist) & mask;
#endif
#endif
#endif
    return idx;
}

/* 预测：基于2-bit计数器返回 0（not-taken）或 1（taken） */
static inline int predict_from_counter(uint8_t c) {
    return c >= 2 ? 1 : 0;
}

/* 更新2-bit计数器 */
static inline void update_counter(uint8_t *c, int taken) {
    if (taken) {
        if (*c < 3) (*c)++;
    } else {
        if (*c > 0) (*c)--;
    }
}

/* 对单条 trace 进行预测与更新
   - from_pc: 控制转移指令地址
   - to_pc: 目标地址
*/
static void handle_transfer(uint64_t from_pc, uint64_t to_pc) {
    /* 认为 taken 当且仅当 to_pc != from_pc + CONFIG_INSTR_BYTES */
    uint64_t fall_through = from_pc + (uint64_t)CONFIG_INSTR_BYTES;
    int is_taken = (to_pc != fall_through) ? 1 : 0;

    /* 依据选择的 predictor 做出预测 */
    int prediction = 0;
    switch (CONFIG_PRED_TYPE) {
        case P_ALWAYS_T:
            prediction = 1; break;
        case P_ALWAYS_N:
            prediction = 0; break;
        case P_BIMODAL: {
            uint32_t idx = get_index(from_pc);
            prediction = predict_from_counter(pred_table[idx]);
            break;
        }
        case P_GSHARE: {
            uint32_t idx = get_index(from_pc);
            prediction = predict_from_counter(pred_table[idx]);
            break;
        }
        default:
            prediction = 0; break;
    }

    /* 统计 */
    inst_counter++;
    if (prediction == is_taken) correct_counter++;
    else miss_counter++;

    /* 更新表（除 Always 类型之外都要更新） */
    if (CONFIG_PRED_TYPE == P_BIMODAL || CONFIG_PRED_TYPE == P_GSHARE) {
        uint32_t idx = get_index(from_pc);
        update_counter(&pred_table[idx], is_taken);
    }

    /* gshare 更新 global history */
#if CONFIG_PRED_TYPE == P_GSHARE
    {
        if (CONFIG_GHIST_BITS > 0) {
            ghist = ((ghist << 1) | (is_taken ? 1u : 0u)) & ((CONFIG_GHIST_BITS>=32) ? 0xFFFFFFFFu : ((1u<<CONFIG_GHIST_BITS)-1u));
        } else {
            ghist = 0;
        }
    }
#endif
}

/* 解析行：
   支持形式：
     f 0X3000000C: 0X30000010
     f 0x3000000c: 0x30000010
     0x3000000c  （若只有一个地址，则认为是顺序指令地址，不做分支预测）
   我们将只对以 'f' 开始的行或含有两个 hex 值的行进行预测
*/
static void process_trace_file(const char *filename) {
    FILE *f = fopen(filename, "r");
    if (!f) {
        perror("fopen");
        exit(1);
    }
    char line[256];
    while (fgets(line, sizeof(line), f) != NULL) {
        /* 忽略空行与注释 */
        if (line[0] == '\n' || line[0] == '#') continue;

        /* 尝试 parse 两个 hex 值 */
        uint64_t from = 0, to = 0;
        char ch;
        //int got = 0;
        /* 先尝试 'f %x : %x' 格式（兼容大小写 X） */
        if (sscanf(line, " %c %" SCNx64 " : %" SCNx64, &ch, &from, &to) == 3) {
            if (ch == 'f' || ch == 'F') {
                handle_transfer(from, to);
                continue;
            }
        }
        /* 再尝试两个 hex 并列的情况： '0x.. 0x..' */
        if (sscanf(line, " %" SCNx64 " %" SCNx64, &from, &to) == 2) {
            handle_transfer(from, to);
            continue;
        }
        /* 若只是单个地址（或格式不匹配），跳过 */
    }
    fclose(f);
}

/* 外部接口：类似于 cachesim() 的函数名与行为 */
void branchsim(void) {
    if (!pred_file) {
        fprintf(stderr, "pred_file is NULL, set the global pred_file to trace path\n");
        return;
    }
    pred_init();
    process_trace_file(pred_file);

    printf("Trace: %s\n", pred_file);
#if CONFIG_PRED_TYPE == P_BIMODAL
    printf("Predictor: Bimodal (2-bit counters)\n");
#elif CONFIG_PRED_TYPE == P_GSHARE
    printf("Predictor: Gshare (ghist %d bits)\n", CONFIG_GHIST_BITS);
#elif CONFIG_PRED_TYPE == P_ALWAYS_T
    printf("Predictor: Always-Taken\n");
#elif CONFIG_PRED_TYPE == P_ALWAYS_N
    printf("Predictor: Always-Not\n");
#else
    printf("Predictor: Unknown\n");
#endif

    printf("Table entries: %d\n", CONFIG_TABLE_ENTRIES);
    printf("Instr bytes assumed: %d\n", CONFIG_INSTR_BYTES);
    printf("Total branch transfers considered: %.0f\n", inst_counter);
    printf("Correct: %.0f\n", correct_counter);
    printf("Mispred: %.0f\n", miss_counter);
    double mr = inst_counter ? (miss_counter / inst_counter) : 0.0;
    printf("Mispredict rate: %.6f\n", mr);
}
