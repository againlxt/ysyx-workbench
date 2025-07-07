#ifndef _YSYXSOC_H_
#define _YSYXSOC_H_
#include <common.h>
#ifdef CONFIG_HAS_SOC
void init_soc();
bool in_socMem(paddr_t addr);
bool in_socDev(paddr_t addr);

word_t soc_read(paddr_t addr, int len);
void soc_write(paddr_t addr, int len, word_t data);
#endif
#endif