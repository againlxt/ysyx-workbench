#ifndef __PADDR_h__
#define __PADDR_H__

#include <common.h>

typedef uint32_t paddr_t;

word_t vaddr_read(vaddr_t addr, int len);

word_t paddr_read(paddr_t addr, int len);

#endif
