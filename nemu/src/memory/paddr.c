/*
 * @Author: lxt leixiaotian434@gmail.com
 * @Date: 2024-01-15 09:47:26
 * @LastEditors: lxt leixiaotian434@gmail.com
 * @LastEditTime: 2025-02-28 11:43:04
 * @FilePath: /ysyx-workbench/nemu/src/memory/paddr.c
 * @Description: 
 * 
 * Copyright (c) 2024 by ${git_name_email}, All Rights Reserved. 
 */
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

#include <memory/host.h>
#include <memory/paddr.h>
#include <device/mmio.h>
#include <isa.h>

#if   defined(CONFIG_PMEM_MALLOC)
static uint8_t *pmem = NULL;
#else // CONFIG_PMEM_GARRAY
static uint8_t pmem[CONFIG_MSIZE] PG_ALIGN = {};
#endif

#ifdef CONFIG_HAS_MROM
static uint8_t mrom[CONFIG_MROMSIZE] PG_ALIGN = {};
#endif

#ifdef CONFIG_HAS_SRAM
static uint8_t sram[CONFIG_SRAMSIZE] PG_ALIGN = {};
#endif

#ifdef CONFIG_HAS_FLASH
static uint8_t flash[CONFIG_FLASHSIZE] PG_ALIGN = {};
#endif

#ifdef CONFIG_HAS_SDRAM
static uint8_t sdram[CONFIG_SDRAMSIZE] PG_ALIGN = {};
#endif

#ifdef CONFIG_MTRACE
static word_t mtrace_begin   = PMEM_LEFT;
static word_t mtrace_end	 = PMEM_RIGHT;
#endif

uint8_t* guest_to_host(paddr_t paddr) {
  #ifdef CONFIG_HAS_MROM
  if (in_mrom(paddr))
    return mrom + paddr - CONFIG_MROMBASE;
  #endif
  #ifdef CONFIG_HAS_SRAM
  if (in_sram(paddr))
    return sram + paddr - CONFIG_SRAMBASE;
  #endif
  #ifdef CONFIG_HAS_FLASH
  if (in_flash(paddr))
    return flash + paddr - CONFIG_FLASHBASE;
  #endif
  #ifdef CONFIG_HAS_SDRAM
  if (in_sdram(paddr))
    return sdram + paddr - CONFIG_SDRAMBASE;
  #endif
  return pmem + paddr - CONFIG_MBASE; 
}
paddr_t host_to_guest(uint8_t *haddr) { return haddr - pmem + CONFIG_MBASE; }

// my design of mtrace
#ifdef CONFIG_MTRACE
#define MTRACE_LOG(mtrace_address, mtrace_length, mtrace_operation, mtrace_value) do { \
    log_write("m %#X\t%u\t%s\t%#X\n", mtrace_address, mtrace_length, mtrace_operation, mtrace_value); \
} while(0);
#endif
// design end

static word_t pmem_read(paddr_t addr, int len) {
  word_t ret = host_read(guest_to_host(addr), len);
  return ret;
}

static void pmem_write(paddr_t addr, int len, word_t data) {
  host_write(guest_to_host(addr), len, data);
}

static void out_of_bound(paddr_t addr) {
  panic("address = " FMT_PADDR " is out of bound of pmem [" FMT_PADDR ", " FMT_PADDR "] at pc = " FMT_WORD,
      addr, PMEM_LEFT, PMEM_RIGHT, cpu.pc);
}

void init_mem() {
#if   defined(CONFIG_PMEM_MALLOC)
  pmem = malloc(CONFIG_MSIZE);
  assert(pmem);
#endif
  IFDEF(CONFIG_MEM_RANDOM, memset(pmem, rand(), CONFIG_MSIZE));
  Log("physical memory area [" FMT_PADDR ", " FMT_PADDR "]", PMEM_LEFT, PMEM_RIGHT);
}

word_t paddr_read(paddr_t addr, int len) {
  #if defined(CONFIG_HAS_MROM) || defined(CONFIG_HAS_SRAM) || defined(CONFIG_HAS_FLASH)
  if (in_pmem(addr)) {
    word_t value = pmem_read(addr, len);
    #ifdef CONFIG_MTRACE
    if(mtrace_begin <= addr && addr <= mtrace_end)	MTRACE_LOG(addr, len, "read", value);
    #endif
	  return value;
  }
  #else
  if (likely(in_pmem(addr))) {
    word_t value = pmem_read(addr, len);
    #ifdef CONFIG_MTRACE
    if(mtrace_begin <= addr && addr <= mtrace_end)	MTRACE_LOG(addr, len, "read", value);
    #endif
	  return value;
  }
  #endif
  #ifdef CONFIG_HAS_MROM
  else if (in_mrom(addr)) {
    word_t value = pmem_read(addr, len);
    return value;
  }
  #endif
  #ifdef CONFIG_HAS_SRAM
  else if (in_sram(addr)) {
    word_t value = pmem_read(addr, len);
    return value;
  }
  #endif
  #ifdef CONFIG_HAS_FLASH
  else if (in_flash(addr)) {
    word_t value = pmem_read(addr, len);
    return value;
  }
  #endif
  #ifdef CONFIG_HAS_SDRAM
  else if (in_sdram(addr)) {
    word_t value = pmem_read(addr, len);
    return value;
  }
  #endif
  
  IFDEF(CONFIG_DEVICE, return mmio_read(addr, len));
  out_of_bound(addr);
  return 0;
}

void paddr_write(paddr_t addr, int len, word_t data) {
  #if defined(CONFIG_HAS_MROM) || defined(CONFIG_HAS_SRAM)
  if (in_pmem(addr)) { 
	  pmem_write(addr, len, data);
    #ifdef CONFIG_MTRACE
    MTRACE_LOG(addr, len, "write", data);
    #endif
	  return; 
  }
  #else
  if (likely(in_pmem(addr))) { 
	  pmem_write(addr, len, data); 
    #ifdef CONFIG_MTRACE
    MTRACE_LOG(addr, len, "write", data);
    #endif
	  return; 
  }
  #endif
  #ifdef CONFIG_HAS_MROM
  else if (in_mrom(addr)) {
    pmem_write(addr, len, data);
    return;
  }
  #endif
  #ifdef CONFIG_HAS_SRAM
  else if (in_sram(addr)) {
    pmem_write(addr, len, data);
    return;
  }
  #endif
  #ifdef CONFIG_HAS_FLASH
  else if (in_flash(addr)) {
    pmem_write(addr, len, data);
    return;
  }
  #endif
  #ifdef CONFIG_HAS_SDRAM
  else if (in_sdram(addr)) {
    pmem_write(addr, len, data);
    return;
  }
  #endif
  IFDEF(CONFIG_DEVICE, mmio_write(addr, len, data); return);
  out_of_bound(addr);
}
