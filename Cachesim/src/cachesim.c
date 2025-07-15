#include <common.h>
#include <math.h>
#include <inttypes.h>
#include <stdlib.h>
#include <time.h>

#define CONFIG_CACHE_SIZE   16       // 缓存块大小(字节)
#define CONFIG_CACHE_NUM    16      // 缓存总块数
#define CONFIG_CACHE_WAY    8       // 相联度
#define REPLACEMENT_POLICY  LRU     // 替换策略: FIFO 或 LRU

typedef enum {
    FIFO,
    LRU,
    RANDOM
} ReplacementPolicy;

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
    uint8_t     valid;
    uint32_t    tag;
    uint32_t    data;
    uint64_t    access_cnt;  // 用于LRU/FIFO策略
    uint64_t    insert_time;  // 用于FIFO策略
} CacheLine;

static CacheLine cache[CONFIG_CACHE_NUM/CONFIG_CACHE_WAY][CONFIG_CACHE_WAY] = {{{0}}};
static uint64_t access_counter = 0;  // 全局访问计数器

static double inst_counter = 0;
static double hit_counter = 0;

// 查找替换候选行
static CacheLine* find_replacement_candidate(size_t index) {
    CacheLine* candidate = &cache[index][0];
    for (size_t i = 0; i < CONFIG_CACHE_WAY; i++) {
        if(!cache[index][i].valid) {
            candidate = &cache[index][i];
            return candidate;
        }
    }
    if (REPLACEMENT_POLICY == FIFO) {
        // FIFO策略: 选择最早插入的行
        uint64_t oldest = cache[index][0].insert_time;
        for (size_t i = 0; i < CONFIG_CACHE_WAY; i++) {
            if(oldest < cache[index][i].insert_time) {
                candidate   = &cache[index][i];
                oldest      = cache[index][i].insert_time;
            }
        }
    } else if (REPLACEMENT_POLICY == LRU) {
        // LRU策略: 选择最近最少使用的行
        uint64_t useless_one = cache[index][0].access_cnt;
        for (size_t i = 0; i < CONFIG_CACHE_WAY; i++) {
            if(useless_one > cache[index][i].access_cnt) {
                candidate   = &cache[index][i];
                useless_one = cache[index][i].access_cnt;
            }
        }
    } else {
        candidate   = &cache[index][rand()%CONFIG_CACHE_WAY];
    }
    
    return candidate;
}

static void cache_check(uint32_t addr) {
    const uint32_t tag = addr >> (m + n);
    const uint32_t index = (addr >> m) & ((1 << n) - 1);
    uint8_t hit = 0;
    
    inst_counter++;
    access_counter++;
    
    // 检查是否命中
    for (size_t i = 0; i < CONFIG_CACHE_WAY; i++) {
        if (cache[index][i].valid && cache[index][i].tag == tag) {
            hit = 1;
            hit_counter ++;
            cache[index][i].access_cnt += 1; // 更新访问次数
            return;
        }
    }
    
    // 未命中，需要替换
    if (!hit) {
        CacheLine* replace_cache = find_replacement_candidate(index);
        replace_cache->valid = true;
        replace_cache->tag = tag;
        replace_cache->data = addr;
        replace_cache->access_cnt = 0;
        replace_cache->insert_time = access_counter;
    }
    
}

void cachesim() {
    FILE *file;
    char line[100];
    uint32_t inst = 0;
    unsigned int seed = (unsigned int)time(NULL);
    srand(seed);

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
