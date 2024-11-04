/*
 * @Author: lxt leixiaotian434@gmail.com
 * @Date: 2024-11-04 18:47:10
 * @LastEditors: lxt leixiaotian434@gmail.com
 * @LastEditTime: 2024-11-04 18:52:32
 * @FilePath: /ysyx-workbench/npc/csrc/device/uart.c
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
#include <utils.h>

extern "C" void uart(unsigned char chr);
void uart(unsigned char chr) {
	putchar(chr);
}
