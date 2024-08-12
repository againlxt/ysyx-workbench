#ifndef __DEBUG_H__
#define __DEBUG_H__

#include "common.h"
#include <stdio.h>

#define Log(format, ...) do { \
	printf(format, ##__VA_ARGS__); \
} while (0)

#define Assert(cond, format, ...) \
	do { \
		if (!(cond)) { \
			Log(format, ##__VA_ARGS__); \
		} \
	} while (0)

#define panic(format, ...) Assert(0, format, ##__VA_ARGS__)

#define TODO() panic("please implement me")
#endif
