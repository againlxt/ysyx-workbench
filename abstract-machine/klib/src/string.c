/*
 * @Author: hzxOnlineOk
 * @Date: 2024-01-15 09:47:31
 * @LastEditors: lxt leixiaotian434@gmail.com
<<<<<<< HEAD
 * @LastEditTime: 2024-07-22 16:19:48
=======
 * @LastEditTime: 2024-07-23 15:13:40
>>>>>>> 2e0aeb1 (	modified:   abstract-machine/klib/include/klib.h)
 * @Description: 请填写简介
 */
#include <klib.h>
#include <klib-macros.h>
#include <stdint.h>

#if !defined(__ISA_NATIVE__) || defined(__NATIVE_USE_KLIB__)

/**
 * @description: The strlen() function calculates the length of the string pointed
       to by s, excluding the terminating null byte ('\0').
 * @param {char} *s
 * @return {*}
 */
size_t strlen(const char *s) {
  size_t i = 0;
  while (s[i] != '\0') {
    i++;
  }
  return i;
}

/**
 * @description: Copy a string, The programmer is
              responsible for allocating a destination buffer large
              enough, that is, strlen(src) + 1.
 * @param {char} *dst
 * @param {char} *src
 * @return {*}
 */
char *strcpy(char *dst, const char *src) {
<<<<<<< HEAD
  size_t len = strlen(src);
  memcpy(dst, src, len);
  dst[len] = '\0';
  return dst;
=======
  char *ret = dst;
  while ((*dst++ = *src++) != '\0');
  return ret;
>>>>>>> 2e0aeb1 (	modified:   abstract-machine/klib/include/klib.h)
}

/**
 * @description: The strncpy() function is similar with strcpy, except that at
 *  most n bytes of src are copied. Warning: If there is no null byte
 *  among the first n bytes of src, the string placed in dest will not be null-terminated.
 * @param {char} *dst
 * @param {char} *src
 * @param {size_t} n
 * @return {*}
 */
char *strncpy(char *dst, const char *src, size_t n) {
  size_t i;
  for (i = 0; i < n && src[i] != '\0'; i++)
    dst[i] = src[i];
  for (; i < n; i++)
    dst[i] = '\0';

  return dst;
}

/**
 * @description: This function catenates the string pointed to by src,
              after the string pointed to by dst (overwriting its
              terminating null byte).  The programmer is responsible for
              allocating a destination buffer large enough, that is,
              strlen(dst) + strlen(src) + 1.
 * @param {char} *dst
 * @param {char} *src
 * @return {*}
 */
char *strcat(char *dst, const char *src) {
  strcpy(dst + strlen(dst), src);
  return dst;
}

/**
 * @description: compare two strings
 * @param {char} *s1
 * @param {char} *s2
 * @return {*} 
 */
int strcmp(const char *s1, const char *s2) {
<<<<<<< HEAD
  while (*s1 && (*s1 == *s2)) {
    s1++;
    s2++;
=======
  size_t i=0;

  while (*(s1+i)==*(s2+i) && *(s1+i)!='\0' && *(s2+i)!='\0') {
    i ++;
>>>>>>> 2e0aeb1 (	modified:   abstract-machine/klib/include/klib.h)
  }
  return *(unsigned char *)s1 - *(unsigned char *)s2;
}

int strncmp(const char *s1, const char *s2, size_t n) {
  size_t i = 0;

  while (i < n && s1[i] == s2[i]) {
    if (s1[i] == '\0' || s2[i] == '\0') {
      break;
    }
    i++;
  }

  if (i == n) {
    return 0;
  } else {
    return (unsigned char)s1[i] - (unsigned char)s2[i];
  }
}

/**
 * @description: The memset() function fills the first n bytes of the memory area
       pointed to by s with the constant byte c.
 * @param {void} *s
 * @param {int} c
 * @param {size_t} n
 * @return {*}
 */
void *memset(void *s, int c, size_t n) {
  unsigned char *is = (unsigned char *)s;
<<<<<<< HEAD
  for (size_t i = 0; i < n; i++)
    is[i] = (unsigned char)c;

=======
  unsigned char uc = (unsigned char)c;
  for (size_t i = 0; i < n; i++)
    is[i] = uc;
>>>>>>> 2e0aeb1 (	modified:   abstract-machine/klib/include/klib.h)
  return s;
}

/**
 * @description: copy memory area, resolve situations when memory conflicts occur
 * @param {void} *dst Destination pointer address
 * @param {void} *src Source pointer address
 * @param {size_t} n  The length of bytes to move
 * @return {*}
 */
void *memmove(void *dst, const void *src, size_t n) {
  unsigned char *cdst = (unsigned char *)dst;
  const unsigned char *csrc = (const unsigned char *)src;

  if (cdst < csrc) {
    // copy from front to back
    for (size_t i = 0; i < n; i++) {
      cdst[i] = csrc[i];
    }
  } else if (cdst > csrc) {
    // copy from back to front
    for (size_t i = n; i != 0; i--) {
      cdst[i - 1] = csrc[i - 1];
    }
  }

  return dst;
}

/**
 * @description: copy memory area
 * @param {void} *out Destination pointer address
 * @param {void} *in Source pointer address
 * @param {size_t} n  The length of bytes to move
 * @return {*}
 */
void *memcpy(void *out, const void *in, size_t n) {
  // 将void*转换为char*以进行指针运算
  unsigned char *cout = (unsigned char *)out;
  const unsigned char *cin = (const unsigned char *)in;

  // 检查内存重叠
  if ((cout < cin && cout + n > cin) || (cin < cout && cin + n > cout)) {
    panic("Memory conflicts!");
  } else {
    // 复制内存内容
    for (size_t i = 0; i < n; i++) {
      cout[i] = cin[i];
    }
  }

  return out;
}

int memcmp(const void *s1, const void *s2, size_t n) {
  const unsigned char *cs1 = (const unsigned char *)s1;
  const unsigned char *cs2 = (const unsigned char *)s2;

  while (n-- > 0) {
    if (*cs1 != *cs2) {
      return *cs1 < *cs2 ? -1 : 1;
    }
    cs1++;
    cs2++;
  }

  return 0;
}

#endif
