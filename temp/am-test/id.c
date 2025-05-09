#include "trap.h"
#define GPIOBASE 0x10002000
#define ID 0x23060306

int main() {
	volatile uint32_t* gpio = (volatile uint32_t*) GPIOBASE;
    *(gpio+2) = (uint32_t) ID;
	for (size_t i = 0; i < 10000; i++)
    {
    }
    
    return 0;
}
