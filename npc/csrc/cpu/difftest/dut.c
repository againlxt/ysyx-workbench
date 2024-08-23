/*
 * @Author: lxt leixiaotian434@gmail.com
 * @Date: 2024-08-20 16:44:35
 * @LastEditors: lxt leixiaotian434@gmail.com
 * @LastEditTime: 2024-08-23 16:51:39
 * @FilePath: /ysyx-workbench/npc/csrc/cpu/difftest/dut.c
 * @Description: 
 * 
 * Copyright (c) 2024 by ${git_name_email}, All Rights Reserved. 
 */

#include <dlfcn.h>

#include <utils.h>
#include <memory/paddr.h>
#include <isa/reg.h>
#include <difftest-def.h>

void (*ref_difftest_memcpy)(paddr_t addr, void *buf, size_t n, bool direction) = NULL;
void (*ref_difftest_regcpy)(void *dut, bool direction) = NULL;
void (*ref_difftest_exec)(uint64_t n) = NULL;
void (*ref_difftest_raise_intr)(uint64_t NO) = NULL;

static bool is_skip_ref = false;
static int skip_dut_nr_inst = 0;

void init_difftest(char *ref_so_file, long img_size, int port) {
	assert(ref_so_file != NULL);

	void *handle;
	handle = dlopen(ref_so_file, RTLD_LAZY);
	assert(handle);

	ref_difftest_memcpy = (void (*)(paddr_t, void*, size_t, bool)) dlsym(handle, "difftest_memcpy");
	assert(ref_difftest_memcpy);

	ref_difftest_regcpy = (void (*)(void*, bool)) dlsym(handle, "difftest_regcpy");
	assert(ref_difftest_regcpy);

	ref_difftest_exec = (void (*)(uint64_t)) dlsym(handle, "difftest_exec");
	assert(ref_difftest_exec);

	ref_difftest_raise_intr = (void (*)(uint64_t)) dlsym(handle, "difftest_raise_intr");
	assert(ref_difftest_raise_intr);

	void (*ref_difftest_init)(int) = (void (*)(int)) dlsym(handle, "difftest_init");
  	assert(ref_difftest_init);

	Log("Differential testing: %s", ANSI_FMT("ON", ANSI_FG_GREEN));
  	Log("The result of every instruction will be compared with %s. "
      "This will help you a lot for debugging, but also significantly reduce the performance. "
      "If it is not necessary, you can turn it off in menuconfig.", ref_so_file);

	ref_difftest_init(port);
	ref_difftest_memcpy(RESET_VECTOR, guest_to_host(RESET_VECTOR), img_size, DIFFTEST_TO_REF);
	ref_difftest_regcpy(regsData, DIFFTEST_TO_REF);
}
