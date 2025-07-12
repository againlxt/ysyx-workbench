#include <memory/ysyxsoc.h>
#include <memory/host.h>
#ifdef CONFIG_HAS_SOC
uint8_t mrom[CONFIG_MROMSIZE] PG_ALIGN = {};
uint8_t sram[CONFIG_SRAMSIZE] PG_ALIGN = {};
uint8_t flash[CONFIG_FLASHSIZE] PG_ALIGN = {};
uint8_t sdram[CONFIG_SDRAMSIZE] PG_ALIGN = {};
uint8_t timer[2] = {};
uint8_t uart[2] = {};

#define UART16550_BASE 0x10000000
#define UART16550_RBR_THR_DLL   (0x0 + UART16550_BASE)
#define UART16550_IER_DLM 		(0x1 + UART16550_BASE)
#define UART16550_IIR_FCR 		(0x2 + UART16550_BASE)
#define UART16550_LCR 			(0x3 + UART16550_BASE)
#define UART16550_MCR 			(0x4 + UART16550_BASE)
#define UART16550_LSR 			(0x5 + UART16550_BASE)
#define UART16550_MSR 			(0x6 + UART16550_BASE)

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

static inline bool in_clint(paddr_t addr) {
    return addr - CONFIG_SOC_CLINTBASE < 8;
}

static inline bool in_uart(paddr_t addr) {
    return addr - CONFIG_SOC_UARTBASE < 8;
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
  if (in_clint(paddr))
    return timer + paddr - CONFIG_SOC_CLINTBASE;
  if (in_uart(paddr))
    return uart + paddr - CONFIG_SOC_UARTBASE;
  return NULL;
}

static word_t soc_mem_read(paddr_t addr, int len) {
  word_t ret = host_read(guest_to_host(addr), len);
  return ret;
}

static void soc_mem_write(paddr_t addr, int len, word_t data) {
  host_write(guest_to_host(addr), len, data);
}

static word_t soc_dev_read(paddr_t addr, int len) {
  word_t ret = host_read(guest_to_host(addr), len);
  return ret;
}

static void soc_dev_write(paddr_t addr, int len, word_t data) {
  host_write(guest_to_host(addr), len, data);
}

void init_soc() {
    
}

bool in_socMem(paddr_t addr) {
    return in_sram(addr) | in_mrom(addr) | in_flash(addr) | in_sdram(addr);
}

bool in_socDev(paddr_t addr) {
    return in_clint(addr) | in_uart(addr);
}

word_t soc_read(paddr_t addr, int len) {
  if (in_socMem(addr)) {
      word_t value = soc_mem_read(addr, len);
      return value;
  }
  else if (in_socDev(addr)) {
      if (in_uart(addr)) {
        word_t value = soc_dev_read(addr, len);
        if((value & 0x20) == 0)
          soc_dev_write(addr, len, value + 0x20);
        return value;
      } else if (in_clint(addr)) {
        word_t value = soc_dev_read(addr, len);
        return value;
      }
  }
  assert(0);
  return 0;
}

void soc_write(paddr_t addr, int len, word_t data) {
    if (in_socMem(addr)) {
        soc_mem_write(addr, len, data);
        return;
    } else if (in_socDev(addr)) {
        soc_dev_write(addr, len, data);
        return;
    }
    assert(0);
}
#endif
