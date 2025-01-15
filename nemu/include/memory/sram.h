#ifndef __SRAM_H__
#define __SRAM_H__

#include <common.h>

#define SRAM_LEFT  ((paddr_t)CONFIG_SRAMBASE)
#define SRAM_RIGHT ((paddr_t)CONFIG_SRAMBASE + CONFIG_SRAMSIZE - 1)

void init_sram();
bool in_sram(word_t addr);
uint8_t* guest_to_host_sram(word_t saddr);
word_t host_to_guest_sram(uint8_t *saddr);
word_t sram_read(word_t addr, int len);
void sram_write(paddr_t addr, int len, word_t data);
#endif