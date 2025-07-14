#include <common.h>
#include <math.h>

#define CONFIG_CACHE_SIZE   4
#define CONFIG_CACHE_NUM    16
#define CONFIG_CACHE_WAY    1

char *cachesim_file = NULL;
/*
 31    m+n m+n-1   m m-1    0
+---------+---------+--------+
|   tag   |  index  | offset |
+---------+---------+--------+
*/
static uint8_t m = (uint8_t) log(CONFIG_CACHE_SIZE);
static uint8_t n = (uint8_t) log(CONFIG_CACHE_NUM/CONFIG_CACHE_WAY);
typedef struct cache_unit {
    bool        valid;
    uint32_t    tag;
    uint32_t    data;
} Cache;
static Cache cache[CONFIG_CACHE_NUM/CONFIG_CACHE_WAY][CONFIG_CACHE_WAY] = {};

static double inst_counter = 0;
static double hit_counter = 0;

static void cache_check(uint32_t inst) {
    uint32_t tag = inst >> (m+n-1);
    uint32_t index = (inst - tag) >> (m-1);
    bool hit = 0;
    inst_counter ++;
    size_t i = 0;
    for (i = 0; i < CONFIG_CACHE_WAY; i++) {
        if (cache[index][i].valid & (cache[index][i].tag == tag)) {
            hit = 1;
            break;
        }
    }
    if (hit == 0) {
        cache[index][i].tag     = tag;
        cache[index][i].valid   = 1;
        cache[index][i].data    = inst;
    }
    
    hit_counter += hit;
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
        printf("%s\n", line);
        cache_check(inst);
    }

    printf("Inst count: %lf\n", inst_counter);
    printf("Hit  count: %lf\n", hit_counter);
    printf("Miss count: %lf\n", inst_counter - hit_counter);
    printf("Hit   rate: %0.6lf\n", hit_counter/inst_counter);
    fclose(file);
}
