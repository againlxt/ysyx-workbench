#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <inttypes.h>
#include <string.h>
#include <time.h>
#include <math.h>
#include <assert.h>

/* ========== 配置 ========== */
/* 预测器类型 */
typedef enum { P_BIMODAL, P_GSHARE, P_ALWAYS_T, P_ALWAYS_N, P_BTFN } PredType;
#ifndef CONFIG_PRED_TYPE
#define CONFIG_PRED_TYPE P_BIMODAL
#endif

/* 预测表项数（必须为 2 的幂）*/
#ifndef CONFIG_TABLE_ENTRIES
#define CONFIG_TABLE_ENTRIES 8
#endif

/* gshare 全局历史位数 */
#ifndef CONFIG_GHIST_BITS
#define CONFIG_GHIST_BITS 8
#endif

#ifndef CONFIG_INSTR_BYTES
#define CONFIG_INSTR_BYTES 4
#endif

/* ====== BTB 配置 ====== */
/* BTB 总行数（必须为 2 的幂） */
#ifndef CONFIG_BTB_ENTRIES
#define CONFIG_BTB_ENTRIES 8
#endif
/* BTB 相联度 */
#ifndef CONFIG_BTB_WAY
#define CONFIG_BTB_WAY 1
#endif
/* BTB 替换策略 */
typedef enum { BTB_LRU, BTB_FIFO, BTB_RANDOM } BTBReplacePolicy;
#ifndef CONFIG_BTB_POLICY
#define CONFIG_BTB_POLICY BTB_LRU
#endif

/* ========== 全局变量 ========== */
char *pred_file = NULL;

/* 2-bit 饱和计数器预测表 */
static uint8_t pred_table[CONFIG_TABLE_ENTRIES];

/* Gshare 历史寄存器 */
#if CONFIG_PRED_TYPE == P_GSHARE
static uint32_t ghist = 0;
#endif

/* ====== BTB 数据结构 ====== */
typedef struct {
    uint8_t  valid;
    uint32_t tag;
    uint64_t target;
    uint64_t last_access_time; // LRU
    uint64_t insert_time;      // FIFO
} BTBEntry;

/* BTB 集合数 */
static const uint32_t BTB_SETS = CONFIG_BTB_ENTRIES / CONFIG_BTB_WAY;
/* BTB 表 */
static BTBEntry btb[CONFIG_BTB_ENTRIES / CONFIG_BTB_WAY][CONFIG_BTB_WAY];
/* 全局时间戳 */
static uint64_t global_time = 0;

/* 统计 */
static double inst_counter = 0;   
static double correct_counter = 0;
static double miss_counter = 0;

/* 随机种子 */
static unsigned int seed_time = 0;

/* 检查表项数为 2 的幂 */
static void check_pow2(uint32_t n, const char *name) {
    if ((n & (n - 1)) != 0) {
        fprintf(stderr, "%s must be a power of two\n", name);
        exit(1);
    }
}

/* 初始化 */
static void pred_init(void) {
    check_pow2(CONFIG_TABLE_ENTRIES, "CONFIG_TABLE_ENTRIES");
    check_pow2(CONFIG_BTB_ENTRIES, "CONFIG_BTB_ENTRIES");
    for (uint32_t i = 0; i < CONFIG_TABLE_ENTRIES; i++) pred_table[i] = 2;
    memset(btb, 0, sizeof(btb));
    seed_time = (unsigned int)time(NULL);
    srand(seed_time);
#if CONFIG_PRED_TYPE == P_GSHARE
    ghist = 0;
#endif
    global_time = 0;
}

/* 预测表索引 */
static inline uint32_t get_pred_index(uint64_t pc) {
    uint64_t pc_shift = pc >> (uint32_t)(log(CONFIG_INSTR_BYTES)/log(2));
    uint32_t mask = CONFIG_TABLE_ENTRIES - 1;
    uint32_t idx = (uint32_t)(pc_shift & mask);
#if CONFIG_PRED_TYPE == P_GSHARE
    uint32_t hist_mask = ((CONFIG_GHIST_BITS >= 32) ? 0xFFFFFFFFu : ((1u << CONFIG_GHIST_BITS) - 1u));
    uint32_t hist = ghist & hist_mask;
    idx = (idx ^ hist) & mask;
#endif
    return idx;
}

/* BTB 索引与 tag */
static inline void get_btb_index_tag(uint64_t pc, uint32_t *index, uint32_t *tag) {
    uint64_t pc_shift = pc >> 2; // 去掉低2位
    *index = pc_shift & (BTB_SETS - 1);
    *tag = (uint32_t)(pc_shift >> (uint32_t)(log(BTB_SETS)/log(2)));
}

/* BTB 查找 */
static BTBEntry* btb_lookup(uint64_t pc) {
    uint32_t index, tag;
    get_btb_index_tag(pc, &index, &tag);
    for (size_t i = 0; i < CONFIG_BTB_WAY; i++) {
        if (btb[index][i].valid && btb[index][i].tag == tag) {
            btb[index][i].last_access_time = global_time;
            return &btb[index][i];
        }
    }
    return NULL;
}

/* BTB 选择替换行 */
static BTBEntry* btb_find_replacement(uint32_t index) {
    /* 找空行 */
    for (size_t i = 0; i < CONFIG_BTB_WAY; i++) {
        if (!btb[index][i].valid) return &btb[index][i];
    }
    /* 替换策略 */
    BTBEntry *victim = &btb[index][0];
    if (CONFIG_BTB_POLICY == BTB_LRU) {
        uint64_t oldest = btb[index][0].last_access_time;
        for (size_t i = 1; i < CONFIG_BTB_WAY; i++) {
            if (btb[index][i].last_access_time < oldest) {
                oldest = btb[index][i].last_access_time;
                victim = &btb[index][i];
            }
        }
    } else if (CONFIG_BTB_POLICY == BTB_FIFO) {
        uint64_t oldest = btb[index][0].insert_time;
        for (size_t i = 1; i < CONFIG_BTB_WAY; i++) {
            if (btb[index][i].insert_time < oldest) {
                oldest = btb[index][i].insert_time;
                victim = &btb[index][i];
            }
        }
    } else { // RANDOM
        victim = &btb[index][rand() % CONFIG_BTB_WAY];
    }
    return victim;
}

/* BTB 更新 */
static void btb_update(uint64_t pc, uint64_t target) {
    uint32_t index, tag;
    get_btb_index_tag(pc, &index, &tag);
    BTBEntry *e = btb_lookup(pc);
    if (!e) {
        e = btb_find_replacement(index);
    }
    e->valid = 1;
    e->tag = tag;
    e->target = target;
    e->last_access_time = global_time;
    e->insert_time = global_time;
}

/* 预测器辅助函数 */
static inline int predict_from_counter(uint8_t c) { return c >= 2; }
static inline void update_counter(uint8_t *c, int taken) {
    if (taken) { if (*c < 3) (*c)++; }
    else       { if (*c > 0) (*c)--; }
}

/* 处理分支 */
static void handle_transfer(uint64_t from_pc, uint64_t to_pc) {
    global_time++;
    uint64_t fall_through = from_pc + CONFIG_INSTR_BYTES;
    int is_taken = (to_pc != fall_through);

    /* BTB 查询 */
    BTBEntry *btb_entry = btb_lookup(from_pc);
    int btb_hit = (btb_entry != NULL);

    int prediction = 0;
    switch (CONFIG_PRED_TYPE) {
        case P_ALWAYS_T: prediction = 1; break;
        case P_ALWAYS_N: prediction = 0; break;
        case P_BTFN: prediction = (to_pc < from_pc); break;
        case P_BIMODAL:
        case P_GSHARE:
            prediction = predict_from_counter(pred_table[get_pred_index(from_pc)]);
            break;
    }

    /* 统计 */
    inst_counter++;
    if (prediction == is_taken && (!is_taken || (btb_hit && btb_entry->target == to_pc))) {
        correct_counter++;
    } else {
        miss_counter++;
    }

    /* 更新预测表 */
    if (CONFIG_PRED_TYPE == P_BIMODAL || CONFIG_PRED_TYPE == P_GSHARE) {
        update_counter(&pred_table[get_pred_index(from_pc)], is_taken);
    }

    /* 更新 BTB（仅 taken 分支存储目标） */
    if (is_taken) {
        btb_update(from_pc, to_pc);
    }

#if CONFIG_PRED_TYPE == P_GSHARE
    if (CONFIG_GHIST_BITS > 0) {
        ghist = ((ghist << 1) | (is_taken ? 1u : 0u)) &
                ((CONFIG_GHIST_BITS >= 32) ? 0xFFFFFFFFu : ((1u << CONFIG_GHIST_BITS) - 1u));
    }
#endif
}

/* 处理 trace 文件 */
static void process_trace_file(const char *filename) {
    FILE *f = fopen(filename, "r");
    if (!f) { perror("fopen"); exit(1); }
    char line[256];
    while (fgets(line, sizeof(line), f)) {
        if (line[0] == '\n' || line[0] == '#') continue;
        uint64_t from = 0, to = 0; char ch;
        if (sscanf(line, " %c %" SCNx64 " : %" SCNx64, &ch, &from, &to) == 3) {
            if (ch == 'f' || ch == 'F') handle_transfer(from, to);
        } else if (sscanf(line, " %" SCNx64 " %" SCNx64, &from, &to) == 2) {
            handle_transfer(from, to);
        }
    }
    fclose(f);
}

void branchsim(void) {
    if (!pred_file) {
        fprintf(stderr, "pred_file is NULL\n");
        return;
    }
    pred_init();
    process_trace_file(pred_file);

    printf("Trace: %s\n", pred_file);
    printf("Predictor: %d\n", CONFIG_PRED_TYPE);
    printf("BTB: %d entries, %d-way, policy=%d\n", CONFIG_BTB_ENTRIES, CONFIG_BTB_WAY, CONFIG_BTB_POLICY);
    printf("Branches: %.0f, Correct: %.0f, Mispred: %.0f, Mispredict rate: %.6f\n",
           inst_counter, correct_counter, miss_counter,
           inst_counter ? (miss_counter / inst_counter) : 0.0);
}
