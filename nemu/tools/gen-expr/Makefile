#***************************************************************************************
# Copyright (c) 2014-2022 Zihao Yu, Nanjing University
#
# NEMU is licensed under Mulan PSL v2.
# You can use this software according to the terms and conditions of the Mulan PSL v2.
# You may obtain a copy of Mulan PSL v2 at:
#          http://license.coscl.org.cn/MulanPSL2
#
# THIS SOFTWARE IS PROVIDED ON AN "AS IS" BASIS, WITHOUT WARRANTIES OF ANY KIND,
# EITHER EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO NON-INFRINGEMENT,
# MERCHANTABILITY OR FIT FOR A PARTICULAR PURPOSE.
#
# See the Mulan PSL v2 for more details.
#**************************************************************************************/

NAME = gen-expr
SRCS = gen-expr.c
FILE_NAME = input
DEST = /home/lxt/ysyx-workbench/nemu/src/monitor/sdb
CFLAGS = -Wall -g2 -O0
NUMBER ?= 1000
run:
	rm -f $(NAME) $(FILE_NAME)
	gcc $(CFLAGS) -o $(NAME) $(SRCS) -lm
	./$(NAME) $(NUMBER) > $(FILE_NAME)
	cp $(FILE_NAME) $(DEST)
include $(NEMU_HOME)/scripts/build.mk
