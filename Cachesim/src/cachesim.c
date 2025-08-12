#include <common.h>
#include <math.h>
#include <inttypes.h>
#include <stdlib.h>
#include <time.h>
#include <stdio.h>
#include <assert.h>

#define CONFIG_CACHE_SIZE   16       // 缓存块大小(字节)
#define CONFIG_CACHE_NUM    4       // 缓存总块数
#define CONFIG_CACHE_WAY    1        // 相联度

typedef enum {
    FIFO,
    LRU,
    RANDOM
} ReplacementPolicy;

#define REPLACEMENT_POLICY  LRU  // 这里修改替换策略

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
    uint64_t    access_cnt;   // 用于LRU/FIFO策略的访问计数或插入时间
    uint64_t    insert_time;  // 用于FIFO策略
} CacheLine;

static CacheLine cache[CONFIG_CACHE_NUM/CONFIG_CACHE_WAY][CONFIG_CACHE_WAY] = {{{0}}};
static uint64_t access_counter = 0;  // 全局访问计数器

static double inst_counter = 0;
static double hit_counter = 0;

// 查找替换候选行
static CacheLine* find_replacement_candidate(size_t index) {
    // 先找无效行
    for (size_t i = 0; i < CONFIG_CACHE_WAY; i++) {
        if (!cache[index][i].valid) {
            return &cache[index][i];
        }
    }
    
    // 全部有效，按策略替换
    CacheLine* candidate = &cache[index][0];
    if (REPLACEMENT_POLICY == FIFO) {
        uint64_t oldest = candidate->insert_time;
        for (size_t i = 1; i < CONFIG_CACHE_WAY; i++) {
            if (cache[index][i].insert_time < oldest) {
                candidate = &cache[index][i];
                oldest = cache[index][i].insert_time;
            }
        }
    } else if (REPLACEMENT_POLICY == LRU) {
        uint64_t min_access = candidate->access_cnt;
        for (size_t i = 1; i < CONFIG_CACHE_WAY; i++) {
            if (cache[index][i].access_cnt < min_access) {
                candidate = &cache[index][i];
                min_access = cache[index][i].access_cnt;
            }
        }
    } else if (REPLACEMENT_POLICY == RANDOM) {
        candidate = &cache[index][rand() % CONFIG_CACHE_WAY];
    }
    
    return candidate;
}

static void cache_check(uint32_t addr) {
    const uint32_t tag = addr >> (m + n);
    const uint32_t index = (addr >> m) & ((1 << n) - 1);
    uint8_t hit = 0;
    
    inst_counter++;
    access_counter++;
    
    // 查找命中
    for (size_t i = 0; i < CONFIG_CACHE_WAY; i++) {
        if (cache[index][i].valid && cache[index][i].tag == tag) {
            hit = 1;
            hit_counter++;
            // LRU 策略更新访问时间
            if (REPLACEMENT_POLICY == LRU) {
                cache[index][i].access_cnt = access_counter;
            }
            return;
        }
    }
    
    // 未命中，替换
    if (!hit) {
        CacheLine* replace_cache = find_replacement_candidate(index);
        replace_cache->valid = 1;
        replace_cache->tag = tag;
        replace_cache->data = addr;
        // 初始化访问计数
        if (REPLACEMENT_POLICY == FIFO) {
            replace_cache->insert_time = access_counter;
            // access_cnt 对 FIFO 可不更新也无妨
        } else if (REPLACEMENT_POLICY == LRU) {
            replace_cache->access_cnt = access_counter;
        } else if (REPLACEMENT_POLICY == RANDOM) {
            // RANDOM 不用更新时间戳
        }
    }
}

void cachesim() {
    FILE *file;
    char line[100];
    uint32_t inst = 0;
    unsigned int seed = (unsigned int)time(NULL);
    srand(seed);

    file = fopen(cachesim_file, "r");
    if (file == NULL) {
        perror("无法打开文件");
        assert(0);
    }
    
    while (fgets(line, sizeof(line), file) != NULL) {
        if (sscanf(line, "%x", &inst) == 1) {
            cache_check(inst);
        } else {
            printf("无法解析的行: %s", line);
        }
    }

    printf("Inst count: %.0lf\n", inst_counter);
    printf("Hit  count: %.0lf\n", hit_counter);
    printf("Miss count: %.0lf\n", inst_counter - hit_counter);
    printf("Hit   rate: %0.6lf\n", hit_counter / inst_counter);
    fclose(file);
}
