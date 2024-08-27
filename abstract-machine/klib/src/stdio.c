/*
 * @Author: lxt leixiaotian434@gmail.com
 * @Date: 2024-01-15 09:47:31
 * @LastEditors: lxt leixiaotian434@gmail.com
 * @LastEditTime: 2024-08-26 16:47:08
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

#define ZEROPAD 1               // Pad with zero
#define SIGN    2               // Unsigned/signed long
#define PLUS    4               // Show plus
#define SPACE   8               // Space if plus
#define LEFT    16              // Left justified
#define SPECIAL 32              // 0x
#define LARGE   64              // Use 'ABCDEF' instead of 'abcdef'

#define is_digit(c) ((c) >= '0' && (c) <= '9')

#if !defined(__ISA_NATIVE__) || defined(__NATIVE_USE_KLIB__)

static char *digits = "0123456789abcdefghijklmnopqrstuvwxyz";
static char *upper_digits = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";

int int2str(int a, char* charbuf);
int vprintf(const char *restrict format, va_list ap);
/*
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
*/

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

int sprintf(char *out, const char *fmt, ...) {
	va_list args;
	int n;

	va_start(args, fmt);
	n = vsprintf(out, fmt, args);
	return n;
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

static int skip_atoi(const char **s)
{
    int i = 0;
    while (is_digit(**s))
    {
        i = i*10 + *((*s)++) - '0';
    }
    return i;
}

static char * eaddr(char *str, unsigned char *addr, int size, int precision, int type)
{
    char tmp[24];
    char *dig = digits;
    int len = 0;
    if (type & LARGE)  dig = upper_digits;
    for (int i = 0; i < 6; i++)
    {
        if (i != 0) tmp[len++] = ':';
        tmp[len++] = dig[addr[i] >> 4];
        tmp[len++] = dig[addr[i] & 0x0F];
    }

    if (!(type & LEFT))
    {
        while (len < size--) *str++ = ' ';
    }

    for (int i = 0; i < len; ++i)
    {
        *str++ = tmp[i];
    }

    while (len < size--) *str++ = ' ';

    return str;
}

static char * number(char *str, long num, int base, int size, int precision, int type)
{
    char c, sign, tmp[66];
    char *dig = digits;
    int i;

    if (type & LARGE)  dig = upper_digits;
    if (type & LEFT) type &= ~ZEROPAD;
    if (base < 2 || base > 36) return 0;

    c = (type & ZEROPAD) ? '0' : ' ';
    sign = 0;
    if (type & SIGN)
    {
        if (num < 0)
        {
            sign = '-';
            num = -num;
            size--;
        }
        else if (type & PLUS)
        {
            sign = '+';
            size--;
        }
        else if (type & SPACE)
        {
            sign = ' ';
            size--;
        }
    }

    if (type & SPECIAL)
    {
        if (16 == base)
            size -= 2;
        else if (8 == base)
            size--;
    }

    i = 0;

    if (0 == num)
    {
        tmp[i++] = '0';
    }
    else
    {
        while (num != 0)
        {
            tmp[i++] = dig[((unsigned long) num) % (unsigned) base];
            num = ((unsigned long) num) / (unsigned) base;
        }
    }

    if (i > precision) precision = i;
    size -= precision;
    if (!(type & (ZEROPAD | LEFT)))
    {
        while(size-- > 0) *str++ = ' ';
    }
    if (sign) *str++ = sign;

    if (type & SPECIAL)
    {
        if (8 == base)
        {
            *str++ = '0';
        }
        else if (16 == base)
        {
            *str++ = '0';
            *str++ = digits[33];
        }
    }

    if(!(type & LEFT))
    {
        while(size-- > 0) *str++ = c;
    }
    while(i < precision--) *str++ = '0';
    while(i-- > 0) *str++ = tmp[i];
    while(size-- > 0) *str++ = ' ';

    return str;
}

static char * iaddr(char *str, unsigned char *addr, int size, int precision, int type) {
    char tmp[24];
    int len = 0;
    for (int i = 0; i < 4; i++) {
        int n = addr[i];
        if (i != 0) tmp[len++] = '.';

        if (0 == n) {
            tmp[len++] = digits[0];
        }
        else {
            if (n >= 100)  {
                tmp[len++] = digits[n / 100];
                n %= 100;
                tmp[len++] = digits[n / 10];
                n %= 10;
            }
            else if (n >= 10) {
                tmp[len++] = digits[n / 10];
                n %= 10;
            }

            tmp[len++] = digits[n];
        }
    }

    if (!(type & LEFT)) {
        while(len < size--) *str++ = ' ';
    }

    for (int i = 0; i < len; ++i) {
        *str++ = tmp[i];
    }

    while (len < size--) *str++ = ' ';

    return str;
}

static unsigned long strnlen(const char *s, int count) {
    const char *sc;
    for (sc = s; *sc != '\0' && count--; ++sc);
    return sc - s;
}

int vsprintf(char *buf, const char *fmt, va_list args) {
#define LEFT	16 	// Left justified
#define PLUS	4 	// Show plus
#define SPACE	8 	// Space if plus
#define SPECIAL	32 	// 0x
#define ZEROPAD	1 	// Pad with zero
	char *str;
	int field_width;	/* Width of output field */

	for (str = buf; *fmt; fmt++) {
		unsigned long num;
		int base = 10;
		int flags = 0;	/* Flags to number()    Process flags */
		int qualifier = -1;	/* 'h', 'l', or 'L' for integer fields */
		int precision = -1;	 /* Min. # of digits for integers; max number of chars for from string */
		bool bFmt = true;
		if (*fmt != '%') {
			*str++ = *fmt;
			continue;
		}

		bFmt = true;
		while (bFmt) {
			fmt ++;	/* This also skips first '%' */
			switch (*fmt)
			{
			case '-': 	flags |= LEFT; 		break;
			case '+':	flags |= PLUS; 		break;
			case ' ':	flags |= SPACE;		break;
			case '#':	flags |= SPECIAL;	break;
			case '0':	flags |= ZEROPAD;	break;
			default:	bFmt = false;
				break;
			}
		}

		/* Get field width */
		field_width = -1;
		if (is_digit(*fmt)) {
			field_width = skip_atoi(&fmt);
		}
		else if ('*' == *fmt) {
			fmt ++;
			field_width = va_arg(args, int);
			if (field_width < 0) {
				field_width = -field_width;
				flags |= LEFT;
			}
		}

		/* Get the precision */
		precision = -1;
		if ('.' == *fmt) {
			++fmt;
			if (is_digit(*fmt)) {
				precision = skip_atoi(&fmt);
			}
			else if('*' == *fmt) {
				++fmt;
				precision = va_arg(args, int);
			}
			if(precision < 0) precision = 0;
		}

		/* Get the conversion qualifier */
        qualifier = -1;
        if ('h' == *fmt || 'l' == *fmt || 'L' == *fmt) {
            qualifier = *fmt;
            fmt++;
        }

		/* Default base */
        base = 10;
		switch (*fmt) {
			case 'c': {
				if (!(flags & LEFT)) while (--field_width > 0) *str++ = ' ';
                *str++ = (unsigned char) va_arg(args, int);
                while (--field_width > 0) *str++ = ' ';
                continue;
			}
			case 's': {
				int len;
                char * s = va_arg(args, char *);
                if (!s) s = "<NULL>";
                len = strnlen(s, precision);
                if (!(flags & LEFT)) while (len < field_width--) *str++ = ' ';
                for (int i = 0; i < len; ++i) *str++ = *s++;
                while (len < field_width--) *str++ = ' ';
                continue;
			}
			case 'p': {
                if (-1 == field_width)
                {
                    field_width = 2 * sizeof(void *);
                    flags |= ZEROPAD;
                }
                str = number(str, (unsigned long) va_arg(args, void *), 16, field_width, precision, flags);
                continue;
            }
			case 'n': {
                if ('l' == qualifier) {
                    long *ip = va_arg(args, long *);
                    *ip = (str - buf);
                }
                else {
                    int *ip = va_arg(args, int *);
                    *ip = (str - buf);
                }
                continue;
            }
			case 'A': {
                flags |= LARGE; /* no break */
            }
			case 'a': {
                if ('l' == qualifier) {
                    str = eaddr(str, va_arg(args, unsigned char *), field_width, precision, flags);
                }
                else {
                    str = iaddr(str, va_arg(args, unsigned char *), field_width, precision, flags);
                }
                continue;
            }
			/* Integer number formats - set up the flags and "break" */
            case 'o': {
                base = 8;
                break;
            }
			case 'X': {
                flags |= LARGE; /* no break */
            }
			case 'x': {
                base = 16;
                break;
            }
			case 'd':
            case 'i': {
                flags |= SIGN; /* no break */
            }
			case 'u': {
                break;
            }
			default: {
                if (*fmt != '%') *str++ = '%';
                if (*fmt) {
                    *str++ = *fmt;
                }
                else {
                    --fmt;
                }
                continue;
            }
		} /* end of switch (*fmt) */

		if (qualifier == 'l') {
            num = va_arg(args, unsigned long);
        }
        else if (qualifier == 'h') {
            if (flags & SIGN)
                num = (short) va_arg(args, int);
            else
                num = (unsigned short) va_arg(args, int);
        }
        else if (flags & SIGN) {
            num = va_arg(args, int);
        }
        else {
            num = va_arg(args, unsigned long);
        }

		str = number(str, num, base, field_width, precision, flags);
	} /* end of for (str = buf; *fmt; fmt++) */

	*str = '\0';
    return str - buf;
}

#endif
