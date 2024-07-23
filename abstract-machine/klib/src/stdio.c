/*
 * @Author: lxt leixiaotian434@gmail.com
 * @Date: 2024-01-15 09:47:31
 * @LastEditors: lxt leixiaotian434@gmail.com
 * @LastEditTime: 2024-07-23 15:21:45
 * @FilePath: /ysyx-workbench/abstract-machine/klib/src/stdio.c
 * @Description: 
 * 
 * Copyright (c) 2024 by ${git_name_email}, All Rights Reserved. 
 */
#include <am.h>
#include <klib.h>
#include <klib-macros.h>
#include <stdarg.h>

#define CHARBUF_LEN 1024
#define CHARBUFTMP_LEN 128

#if !defined(__ISA_NATIVE__) || defined(__NATIVE_USE_KLIB__)

int int2str(int a, char* charbuf);
int vprintf(const char *restrict format, va_list ap);
static int escape_char_trans(const char* src, int len, va_list ap, char* dst);

static int escape_char_trans(const char* src, int len, va_list ap, char* dst) {
    char end = src[len - 1];
    switch (end) {
        case 'd': {
            int int_temp = va_arg(ap, int);
            if (!int2str(int_temp, dst)) return 0;
            break;
        }
        case 's': {
            const char* str_temp = va_arg(ap, const char*);
            strcpy(dst, str_temp);
            break;
        }
        default:
            strncpy(dst, src, len);
            dst[len] = '\0';
            return 0;
    }
    return 1;
}

int vprintf(const char *restrict format, va_list ap) {
    char chararray[CHARBUF_LEN] = "";
    int success = vsprintf(chararray, format, ap);
    putstr(chararray);
    return success;
}

int printf(const char *fmt, ...) {
	va_list args;
	va_start(args, fmt);
	return vprintf(fmt, args);
}

int vsprintf(char *out, const char *fmt, va_list ap) {
	char charfmtbuf[CHARBUF_LEN] = "";
	char* strfmtbuf = charfmtbuf;
	strcpy(strfmtbuf, fmt);
	char chararray[CHARBUF_LEN] = "";
	char* str = chararray;
	int k = 0;

	for (int i = 0; *(fmt+i) != '\0'; i ++) {
		chararray[k++] = *(fmt+i);

		if (*(fmt + i + 1) == '%' || *(fmt + i + 1) == '\0') {
			int j = i+1;
			char charbuf[CHARBUFTMP_LEN] = "";
			char* strbuf = charbuf;
			while(*(fmt + (i++)) <= '9') {};
			if(!escape_char_trans((strfmtbuf+j), (i-j), ap, strbuf)) return 0;
			str = strcat(str, strbuf);
			k += strlen(strbuf);
		} 
	}

	va_end(ap);

	return 1;
}

int sprintf(char *out, const char *fmt, ...) {
	va_list args;
	va_start(args, fmt);
	return vsprintf(out, fmt, args);
}

int snprintf(char *out, size_t n, const char *fmt, ...) {
  	panic("Not implemented");
}

int vsnprintf(char *out, size_t n, const char *fmt, va_list ap) {
  	panic("Not implemented");
}

int int2str(int a, char* charbuf) {
	int b = 0; int i = 0;
	if(a < 0) *(charbuf + (i++)) = '-';

	while (a != 0) {
		b = a % 10;
		a = a / 10;
		*(charbuf + (i++)) = b + '0';
	}

	return 1;
}

#endif
