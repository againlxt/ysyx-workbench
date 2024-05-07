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

#include <isa.h>
#include <cpu/cpu.h>
#include <readline/readline.h>
#include <readline/history.h>
#include <memory/paddr.h>
#include <math.h>
#include <sdb.h>

static int is_batch_mode = false;

void init_regex();
void init_wp_pool();

static int str2int(char *str) {
  int result = 0;
  int len = strlen(str);
  for (int i = 0; i < len; i++)
  {
    result = (*(str + i) - 48) * pow(10, len - i - 1) + result;
  }
  return result;
}

static uint str2uint(char *str) {
  uint result = 0;
  uint len = strlen(str);
  for (uint i = 0; i < len; i++)
  {
    result = (*(str + i) - 48) * pow(10, len - i - 1) + result;
  }
  return result;
}

/* We use the `readline' library to provide more flexibility to read from stdin. */
static char* rl_gets() {
  static char *line_read = NULL;

  if (line_read) {
    free(line_read);
    line_read = NULL;
  }

  line_read = readline("(nemu) ");

  if (line_read && *line_read) {
    add_history(line_read);
  }

  return line_read;
}

static int cmd_c(char *args) {
  cpu_exec(-1);
  return 0;
}

static int cmd_q(char *args) {
  nemu_state.state = NEMU_QUIT;
  return -1;
}

static int cmd_si(char *args) {
  args = strtok(NULL, " ");
  uint64_t n;
  if (args == NULL) n = 1;
  else n = (uint64_t) strtoull(args, NULL, 10);
  
  cpu_exec(n);
  return 0;
}

static int cmd_info(char *args) {
  args = strtok(NULL, " ");
  if (args == NULL) {
    printf("Please enter subcmd.(r or w)\n");
    return 0;
  }
  else {
    if (strcmp(args, "r") == 0) {
      isa_reg_display();
    }
    else if (strcmp(args, "w") == 0) {
      print_wp_pool();
    }
    else {
      printf("Subcmd wrong, please enter r or w.\n");
    }
  }
  return 0;
}

static int cmd_x(char *args) {
  int n = str2int(strtok(NULL, " "));
  args = strtok(NULL, " ");
  args = args + 2;
  paddr_t addr = (paddr_t) strtoll(args, NULL, 16);
  for (int i = 0; i < n; i++) {
    paddr_t value = paddr_read(addr + 4*i, 4);

    printf("%#x:\t%#X\n", addr + 4*i, value);
  }
  
  return 0;
}

static int cmd_w(char *args) {
  char *expr = strtok(NULL, " ");
  new_wp(expr);
  return 0;
}

static int cmd_d(char *args) {
  char *num = strtok(NULL, " ");
  uint32_t n = (uint32_t) strtol(num, NULL, 10);
  free_wp(n);
  return 0;
}

static int cmd_test(char *args) {
  char *cmd;
  cmd = strtok(NULL, " ");
  if (strcmp(cmd, "exprtest") == 0) {
    FILE *file = fopen("/home/lxt/ysyx-workbench/nemu/src/monitor/sdb/input", "r");
    assert(file != NULL);
    char line_buf[1024];
    int l = 0;
    while (fgets(line_buf, sizeof(line_buf), file) != NULL) {
      l ++;
      uint32_t answer = str2uint(strtok(line_buf, " "));
      char *str = strtok(NULL, " \n\t");
      bool *success = calloc(1, sizeof(bool));
      *success = true;
      bool *correct = calloc(1, sizeof(bool));
      *correct = false;

      if (answer > 2147483647) {
        free(success);
        free(correct);
        continue;
      }
      else {
        uint32_t ans = (uint32_t) expr((str),success);
        *correct = (ans == answer) ? true : false;
        printf("Line%d\tAnswer:%u\t\tCorrect:%d\n", l, ans, *correct);
      }
      free(success);
      free(correct);
    }
  }
  else if(strcmp(cmd, "expr") == 0){
    bool *success = calloc(1, sizeof(bool));
    *success = true;
    uint32_t val = expr(args+5, success);
    if (*success == true) {
      printf("result: %d\n", val);
    }
    else {
      printf("Evaluate Wrong!\n");
    }
  }
  return 0;
}

static int cmd_help(char *args);

static struct {
  const char *name;
  const char *description;
  int (*handler) (char *);
} cmd_table [] = {
  { "help", "Display information about all supported commands", cmd_help },
  { "c", "Continue the execution of the program", cmd_c },
  { "q", "Exit NEMU", cmd_q },

  /* TODO: Add more commands */
  { "si", "Followed by parameter n, Execute n times", cmd_si},
  { "info", "Print program status, followed with parameter. If parameter \
  is r, printing register status. If parameter is w, print monitoring point information", cmd_info},
  { "x", "Find the value of the expression EXPR and use the result as the starting memory \
  Address, output N consecutive 4 bytes in hexadecimal form", cmd_x},
  { "w", "Set a watchpoint. When the value of expression EXPR changes, program execution is paused.", cmd_w},
  { "d", "Delete the monitoring point with serial number N", cmd_d},

  // test
  { "test", "test the current cmd", cmd_test},

};

#define NR_CMD ARRLEN(cmd_table)

static int cmd_help(char *args) {
  /* extract the first argument */
  char *arg = strtok(NULL, " ");
  int i;

  if (arg == NULL) {
    /* no argument given */
    for (i = 0; i < NR_CMD; i ++) {
      printf("%s - %s\n", cmd_table[i].name, cmd_table[i].description);
    }
  }
  else {
    for (i = 0; i < NR_CMD; i ++) {
      if (strcmp(arg, cmd_table[i].name) == 0) {
        printf("%s - %s\n", cmd_table[i].name, cmd_table[i].description);
        return 0;
      }
    }
    printf("Unknown command '%s'\n", arg);
  }
  return 0;
}

void sdb_set_batch_mode() {
  is_batch_mode = true;
}

void sdb_mainloop() {
  if (is_batch_mode) {
    cmd_c(NULL);
    return;
  }

  for (char *str; (str = rl_gets()) != NULL; ) {
    char *str_end = str + strlen(str);

    /* extract the first token as the command */
    char *cmd = strtok(str, " ");
    if (cmd == NULL) { continue; }

    /* treat the remaining string as the arguments,
     * which may need further parsing
     */
    char *args = cmd + strlen(cmd) + 1;
    if (args >= str_end) { 
      args = NULL;
    }

#ifdef CONFIG_DEVICE
    extern void sdl_clear_event_queue();
    sdl_clear_event_queue();
#endif

    int i;
    for (i = 0; i < NR_CMD; i ++) {
      if (strcmp(cmd, cmd_table[i].name) == 0) {
        if (cmd_table[i].handler(args) < 0) { return; }
        break;
      }
    }

    if (i == NR_CMD) { printf("Unknown command '%s'\n", cmd); }
  }
}

void init_sdb() {
  /* Compile the regular expressions. */
  init_regex();

  /* Initialize the watchpoint pool. */
  init_wp_pool();
}
