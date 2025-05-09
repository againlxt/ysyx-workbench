#include "trap.h"
#define GPIOBASE 0x10002000
uint16_t led[16] =   {0x0001, 0x0002, 0x0004, 0x0008, 0x0010, 0x0020, 0x0040, 0x0080,
                     0x0100, 0x0200, 0x0400, 0x0800, 0x1000, 0x2000, 0x4000, 0x8000};

int main() {
	volatile uint16_t* gpio = (volatile uint16_t*) GPIOBASE;
    int i = 0;
    while (1) {
        *gpio = led[(i++)%16];
    }
	return 0;
}
