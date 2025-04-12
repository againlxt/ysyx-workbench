/*
 * @Author: lxt leixiaotian434@gmail.com
 * @Date: 2025-02-02 17:33:24
 * @LastEditors: lxt leixiaotian434@gmail.com
 * @LastEditTime: 2025-02-02 17:33:45
 * @FilePath: /ysyx-workbench/am-kernels/tests/cpu-tests/tests/char_test.c
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
#define UART_BASE 0x10000000L
#define UART_TX   0x0
void main() {
  *(volatile char *)(UART_BASE + UART_TX) = 'A';
  *(volatile char *)(UART_BASE + UART_TX) = '\n';
  while (1);
}