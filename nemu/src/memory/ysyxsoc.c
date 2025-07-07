#include <memory/ysyxsoc.h>
#include <memory/host.h>
#ifdef CONFIG_HAS_SOC
static uint8_t mrom[CONFIG_MROMSIZE] PG_ALIGN = {};
static uint8_t sram[CONFIG_SRAMSIZE] PG_ALIGN = {};
static uint8_t flash[CONFIG_FLASHSIZE] PG_ALIGN = {};
static uint8_t sdram[CONFIG_SDRAMSIZE] PG_ALIGN = {};

static inline bool in_sram(word_t addr) {
    return addr - CONFIG_SRAMBASE < CONFIG_SRAMSIZE;
}

static inline bool in_mrom(word_t addr) {
    return addr - CONFIG_MROMBASE < CONFIG_MROMSIZE;
}

static inline bool in_flash(word_t addr) {
    return addr - CONFIG_FLASHBASE < CONFIG_FLASHSIZE;
}

static inline bool in_sdram(word_t addr) {
    return addr - CONFIG_SDRAMBASE < CONFIG_SDRAMSIZE;
}

static uint8_t* guest_to_host(paddr_t paddr) {
  if (in_mrom(paddr))
    return mrom + paddr - CONFIG_MROMBASE;
  if (in_sram(paddr))
    return sram + paddr - CONFIG_SRAMBASE;
  if (in_flash(paddr))
    return flash + paddr - CONFIG_FLASHBASE;
  if (in_sdram(paddr))
    return sdram + paddr - CONFIG_SDRAMBASE;
  return NULL;
}

static word_t soc_mem_read(paddr_t addr, int len) {
  word_t ret = host_read(guest_to_host(addr), len);
  return ret;
}

static void soc_mem_write(paddr_t addr, int len, word_t data) {
  host_write(guest_to_host(addr), len, data);
}

void init_soc() {
    
}

bool in_socMem(paddr_t addr) {
    return in_sram(addr) | in_mrom(addr) | in_flash(addr) | in_sdram(addr);
}

bool in_socDev(paddr_t addr) {
    return true;
}

word_t soc_read(paddr_t addr, int len) {
    if (in_mrom(addr)) {
        word_t value = soc_mem_read(addr, len);
        return value;
    }
    else if (in_sram(addr)) {
        word_t value = soc_mem_read(addr, len);
        return value;
    }
    else if (in_flash(addr)) {
        word_t value = soc_mem_read(addr, len);
        return value;
    }
    else if (in_sdram(addr)) {
        word_t value = soc_mem_read(addr, len);
        return value;
    }
    assert(0);
    return 0;
}

void soc_write(paddr_t addr, int len, word_t data) {
    if (in_mrom(addr)) {
        soc_mem_write(addr, len, data);
        return;
    }
    else if (in_sram(addr)) {
        soc_mem_write(addr, len, data);
        return;
    }
    else if (in_flash(addr)) {
        soc_mem_write(addr, len, data);
        return;
    }
    else if (in_sdram(addr)) {
        soc_mem_write(addr, len, data);
        return;
    }
    assert(0);
}
#endif
