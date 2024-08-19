/*
 * @Author: lxt leixiaotian434@gmail.com
 * @Date: 2024-08-16 10:11:52
 * @LastEditors: lxt leixiaotian434@gmail.com
 * @LastEditTime: 2024-08-16 20:27:06
 * @FilePath: /ysyx-workbench/npc/csrc/single_cycle_cpu/monitor/sdb/sdb.cpp
 * @Description: 
 * 
 * Copyright (c) 2024 by ${git_name_email}, All Rights Reserved. 
 */
#include <sdb.h>
#include <cpu/cpu.h>
#include <readline/readline.h>
#include <readline/history.h>
#include <isa/reg.h>

static int is_batch_mode = false;

static char* rl_gets();
static int cmd_c(char *args);
static int cmd_q(char *args);
static int cmd_help(char *args);
static int cmd_si(char *args);
static int cmd_info(char *args);

static struct {
	const char *name;
	const char *description;
	int (*handler) (char *);
} cmd_table [] = {
	{ "help", "Display information about all supported commands", cmd_help },
	{ "c", "Continue the execution of the program", cmd_c },
	{ "q", "Exit NEMU", cmd_q },

	{ "si", "Followed by parameter n, Execute n times", cmd_si},
	{ "info", "Print program status, followed with parameter. If parameter \
  	is r, printing register status. If parameter is w, print monitoring point information", cmd_info},
};

#define NR_CMD ARRLEN(cmd_table)

static char* rl_gets() {
	static char *line_read = NULL;

	if (line_read) {
		free(line_read);
		line_read = NULL;
	}

	line_read = readline("(npc) ");

	if (line_read && *line_read) {
		add_history(line_read);
	}

	return line_read;
}

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

static int cmd_c(char *args) {
	cpu_exec(-1);
	return 0;
}

static int cmd_q(char *args) {
	npc_state.state = NPC_QUIT;
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
		else {
			printf("Subcmd wrong, please enter r or w.\n");
		}
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
