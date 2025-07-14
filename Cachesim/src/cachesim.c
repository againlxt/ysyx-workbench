#include <common.h>
#include <math.h>
#include <inttypes.h>

#define CONFIG_CACHE_SIZE   4       // 缓存块大小(字节)
#define CONFIG_CACHE_NUM    16      // 缓存总块数
#define CONFIG_CACHE_WAY    1       // 相联度

char *cachesim_file = NULL;

/*
地址划分：
+---------+---------+--------+
|   tag   |  index  | offset |
+---------+---------+--------+
*/
static const uint8_t m = (uint8_t)(log(CONFIG_CACHE_SIZE) / log(2));  // offset位数
static const uint8_t n = (uint8_t)(log(CONFIG_CACHE_NUM/CONFIG_CACHE_WAY) / log(2)); // index位数

typedef struct {
    bool        valid;
    uint32_t    tag;
    uint32_t    data;
} Cache;

static Cache cache[CONFIG_CACHE_NUM/CONFIG_CACHE_WAY][CONFIG_CACHE_WAY] = {{{0}}};

static double inst_counter = 0;   // 使用uint64_t代替double更合适
static double hit_counter = 0;

static void cache_check(uint32_t addr) {
    const uint32_t tag = addr >> (m + n);           // 正确计算tag
    const uint32_t index = (addr >> m) & ((1 << n) - 1); // 正确计算index
    
    inst_counter++;
    
    // 直接映射缓存的快速路径
    if (CONFIG_CACHE_WAY == 1) {
        if (cache[index][0].valid && cache[index][0].tag == tag) {
            hit_counter++;
        } else {
            cache[index][0].tag = tag;
            cache[index][0].valid = true;
            cache[index][0].data = addr;
        }
        return;
    }
    
    // 组相联缓存处理
    for (size_t i = 0; i < CONFIG_CACHE_WAY; i++) {
        if (cache[index][i].valid && cache[index][i].tag == tag) {
            hit_counter++;
            return;
        }
    }
    
    // 未命中时的替换策略(这里使用简单轮转)
    size_t replace_idx = (uint64_t) inst_counter % CONFIG_CACHE_WAY;
    cache[index][replace_idx].tag = tag;
    cache[index][replace_idx].valid = true;
    cache[index][replace_idx].data = addr;
}

void cachesim() {
    FILE *file;
    char line[100];
    uint32_t inst = 0;

    // 打开文件
    file = fopen(cachesim_file, "r");
    if (file == NULL) {
        perror("无法打开文件");
        assert(0);
    }
    
    // 逐行读取文件
    while (fgets(line, sizeof(line), file) != NULL) {
        if (sscanf(line, "%x", &inst) == 1) {
        } else {
            printf("无法解析的行: %s", line);
        }
        cache_check(inst);
    }

    printf("Inst count: %.0lf\n", inst_counter);
    printf("Hit  count: %.0lf\n", hit_counter);
    printf("Miss count: %.0lf\n", inst_counter - hit_counter);
    printf("Hit   rate: %0.6lf\n", hit_counter/inst_counter);
    fclose(file);
}
