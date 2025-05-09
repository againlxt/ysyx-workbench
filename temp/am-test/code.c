#include "trap.h"
#define GPIOBASE 0x10002000
#define CODE 0x1111

int main() {
	volatile uint16_t* gpio = (volatile uint16_t*) GPIOBASE;
    while (1) {
        if (*(gpio+2) == (uint16_t) CODE) {
            printf("CODE correct!\n");
            break;
        }
    }
	return 0;
}
