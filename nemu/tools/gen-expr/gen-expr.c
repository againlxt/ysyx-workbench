/***************************************************************************************
* Copyright (c) 2014-2022 Zihao Yu, Nanjing University
*
* NEMU is licensed under Mulan PSL v2.
* You can use this software according to the terms and conditions of the Mulan PSL v2.
* You may obtain a copy of Mulan PSL v2 at:
*          http://license.coscl.org.cn/MulanPSL2
*
* THIS SOFTWARE IS PROVIDED ON AN "AS IS" BASIS, WITHOUT WARRANTIES OF ANY KIND,
* EITHER EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO NON-INFRINGEMENT,
* MERCHANTABILITY OR FIT FOR A PARTICULAR PURPOSE.
*
* See the Mulan PSL v2 for more details.
***************************************************************************************/

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <assert.h>
#include <string.h>
#include <math.h>

// Maximum number of digits
#define MAX_NUMBER 1

// this should be enough
static char buf[65536] = {};
static uint32_t buf_len = 0;
static uint32_t gen_len = 0;
static char code_buf[65536 + 128] = {}; // a little larger than `buf`
static char *code_format =
"#include <stdio.h>\n"
"int main() { "
"  unsigned result = %s; "
"  printf(\"%%d\", result); "
"  return 0; "
"}";

static uint32_t choose(uint32_t n) {
  return (uint32_t) rand()%n;
}

/*

*/

static void init_gen() {
  strcpy(buf, "");
  // 最短长度为30，且给buf留有一定空间，防止溢出
  buf_len = choose(2) + 3;
  gen_len = 0;
}

void uint2str(uint32_t num, char* str) {
  uint32_t strlen = 0, temp = num;

  while (temp != 0) {
    temp = temp / 10;
    strlen ++;
  }
  for (uint32_t i = 0; i < strlen; i++) {
    *(str+i) = num / pow(10, strlen-i-1) + '0';
    num = num - (*(str+i)-'0') * pow(10, strlen-i-1);
  }
}

static void gen_num() {
  uint32_t num = choose(pow(10, MAX_NUMBER));
  if (num == 0) {
    gen_num();
    strcat(buf, "0");
    return;
  }
  
  char str[MAX_NUMBER+1] = {};
  uint2str(num, str);
  strcat(buf, str);
  gen_len += strlen(str); 
}

static void gen(char *str) {
  if (strcmp(str, "(")==0) {
    char *str1 = calloc(1, sizeof(buf));
    strcpy(str1, str);
    strcat(str1, buf);
    strcpy(buf, str1);
    free(str1);
  }
  else if (strcmp(str, ")")==0) {
    strcat(buf, str);
  }
  gen_len += strlen(str);
}

static void gen_rand_op() {
  switch (choose(4)) {
  case 0: strcat(buf, "+"); break;
  case 1: strcat(buf, "-"); break;
  case 2: strcat(buf, "*"); break;
  case 3: strcat(buf, "/"); break;
  default: break;
  }
}

static void gen_rand_expr() {
  if (gen_len >= buf_len) {
    gen_num();
    return;
  }
  while (1) {
    switch (choose(3)) {
    case 0: 
    gen_num(); break;
    case 1: 
    gen("("); 
    gen_rand_expr(); 
    gen(")"); break;
    default: 
    gen_rand_expr(); 
    gen_rand_op(); 
    gen_rand_expr(); break;
    }
    if (gen_len >= buf_len) {
      break;
    }
  }
}

int main(int argc, char *argv[]) {
  int seed = time(0);
  srand(seed);
  int loop = 10;
  if (argc > 1) {
    sscanf(argv[1], "%d", &loop);
  }
  int i;
  for (i = 0; i < loop; i ++) {
    init_gen();
    gen_rand_expr();

    sprintf(code_buf, code_format, buf);

    FILE *fp = fopen("/tmp/.code.c", "w");
    assert(fp != NULL);
    fputs(code_buf, fp);
    fclose(fp);

    int ret = system("gcc /tmp/.code.c -o /tmp/.expr");
    if (ret != 0) continue;

    fp = popen("/tmp/.expr", "r");
    assert(fp != NULL);

    int result;
    ret = fscanf(fp, "%d", &result);
    pclose(fp);

    printf("%u %s\n", result, buf);
  }
  return 0;
}
