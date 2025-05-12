#include <am.h>
#include <riscv/riscv.h>

#define UART16550_BASE 0x10000000
#define UART16550_RBR_THR_DLL   (0x0 + UART16550_BASE)
#define UART16550_IER_DLM 		(0x1 + UART16550_BASE)
#define UART16550_IIR_FCR 		(0x2 + UART16550_BASE)
#define UART16550_LCR 			(0x3 + UART16550_BASE)
#define UART16550_MCR 			(0x4 + UART16550_BASE)
#define UART16550_LSR 			(0x5 + UART16550_BASE)
#define UART16550_MSR 			(0x6 + UART16550_BASE)

void __am_uart_rx(AM_UART_RX_T * uart_rx) {
    if (*(volatile uint8_t *) UART16550_LSR & 0x01) uart_rx->data = inb(UART16550_RBR_THR_DLL);
    else uart_rx->data = (uint8_t) 0xff;
}
