/*
 * @Author: lxt leixiaotian434@gmail.com
 * @Date: 2024-08-10 10:44:23
 * @LastEditors: lxt leixiaotian434@gmail.com
 * @LastEditTime: 2024-08-23 10:53:20
 * @FilePath: /ysyx-workbench/npc/include/common.h
 * @Description: 
 * 
 * Copyright (c) 2024 by ${git_name_email}, All Rights Reserved. 
 */
#ifndef __COMMON_H__
#define __COMMON_H__

#include <stdint.h>
#include <inttypes.h>
#include <stdbool.h>
#include <string.h>
#include <assert.h>
#include <debug.h>
#include <cstdlib>
#include <cassert>
#include <macro.h>
#include <generated/autoconf.h>

// typedef MUXDEF(CONFIG_ISA64, uint64_t, uint32_t) word_t;
// typedef MUXDEF(CONFIG_ISA64, int64_t, int32_t)  sword_t;

typedef uint32_t word_t;
typedef int32_t sword_t;

// #define FMT_WORD MUXDEF(CONFIG_ISA64, "0x%016" PRIx64, "0x%08" PRIx32)
#define FMT_WORD "0x%08" PRIx32

typedef word_t vaddr_t;
// typedef MUXDEF(PMEM64, uint64_t, uint32_t) paddr_t;
typedef uint32_t paddr_t;
typedef uint32_t iaddr_t;
// #define FMT_PADDR MUXDEF(PMEM64, "0x%016" PRIx64, "0x%08" PRIx32)
#define FMT_PADDR "0x%08" PRIx32

typedef uint16_t ioaddr_t;

#endif
