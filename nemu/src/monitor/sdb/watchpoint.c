/***************************************************************************************
* Copyright (c) 2014-2022 Zihao Yu, Nanjing University
*
* NEMU is licensed under Mulan PSL v2.
* You can use this software according to the terms and conditions of the Mulan PSL v2.
* You may obtain a copy of Mulan PSL v2 at:
*          http://license.coscl.org.cn/MulanPSL2
*
* THIS SOFTWARE IS PROVIDED ON AN "AS IS" BASIS, WITHOUT WARRANTIES OF ANY KIND,
* EITHER EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO NON-INFRINGEMENT,
* MERCHANTABILITY OR FIT FOR A PARTICULAR PURPOSE.
*
* See the Mulan PSL v2 for more details.
***************************************************************************************/

#include <sdb.h>

#define NR_WP 32

static WP wp_pool[NR_WP] = {};
static WP *head = NULL, *free_ = NULL, *end = NULL, *free__end = NULL;

void new_wp();
void free_wp(uint32_t n);
void init_wp_pool();
void traverse_watchpoint();
static void init_wp(WP *wp, char *str, int val);
static bool wp_pool_is_full();
static bool wp_pool_is_empty();
static bool wp_is_NULL();
static void wp_delete();
static void wp_add_free_();
static WP* find_the_previous_wp(WP *wp, WP *head);

static void init_wp(WP *wp, char *str, int val) {
  strcpy(wp->expr, str);
  wp->val = val;
  wp->next = NULL;
}

static bool wp_pool_is_full() {
  if(free_ == NULL)  return true;
  else               return false;
}

static bool wp_pool_is_empty() {
  if(head == NULL)   return true;
  else               return false;
}

static bool wp_is_NULL(WP *wp) {
  if (wp == NULL) return true;
  else            return false;
}

static WP* find_the_previous_wp(WP *wp, WP *head) {
  if(wp == head)  log_warn("wp is head!");
  WP *pre_wp = head;
  while (pre_wp->next != wp) {
    pre_wp = pre_wp->next;
  }
  return pre_wp;
}

static void wp_delete(WP *wp, WP *h) {
  if(wp == h) {
    head = wp->next;
    WP *temp = wp;
    while (temp != NULL) {
      temp->NO --;
      temp = temp->next;
    }
    init_wp(wp, "", 0);
  }
  else {
    WP *pre_wp = find_the_previous_wp(wp, h);
    WP *temp = wp;
    pre_wp->next = wp->next;
    while (temp != NULL) {
      temp->NO --;
      temp = temp->next;
    }
    init_wp(wp, "", 0);
  }
}

static void wp_add_free_(WP *wp) {
  init_wp(wp, "", 0);
  if (wp_pool_is_full()) {
    log_warn("Failed to add, wp_pool is full!");
    return;
  }
  else if (wp_pool_is_empty()) {
    free_ = wp;
    free__end = wp;
  }
  else {
    free__end->next = wp;
    free__end = free__end->next;
  }
}

void init_wp_pool() {
  int i;
  for (i = 0; i < NR_WP; i ++) {
    wp_pool[i].NO = i;
    init_wp((wp_pool+i), "", 0);
    wp_pool[i].next = (i == NR_WP - 1 ? NULL : &wp_pool[i + 1]);
  }

  head = NULL;
  end = NULL;
  free_ = wp_pool;
  free__end = &wp_pool[NR_WP-1];
}

void new_wp(char *str) {
  if (wp_pool_is_full()) log_err("Failed to new a wp, wp_pool is full!");
  else if (wp_pool_is_empty()) {
    head = free_;
    end = free_;
    head->NO = 1;
    free_ = free_->next;
    bool *success = calloc(1, sizeof(bool));
    init_wp(end, str, (int32_t) expr(str, success));
  }
  else {
    end->next = free_;
    end->next->NO = end->NO + 1;
    end = end->next;
    free_ = free_->next;
    bool *success = calloc(1, sizeof(bool));
    init_wp(end, str, (int32_t) expr(str, success));
  }
}

void free_wp(uint32_t n) {
  WP *wp = head;
  if(wp_is_NULL(wp)) {
    log_warn("Failed to free wp, wp is NULL!");
    return;
  }
  for (uint32_t i = 1; i < n; i++) {
    wp = wp->next;
    if(wp_is_NULL(wp)) {
      log_warn("Failed to free wp, the monitoring point n does not exist!");
      return;
    }
  }

  wp_delete(wp, head);
  wp_add_free_(wp);
}

void print_wp(WP *wp) {
  if(wp_is_NULL(wp)) log_warn("Warning to print wp, wp is NULL");
  printf("NO.%d expr:%s\t\tval:%d\n", wp->NO, wp->expr, wp->val);
}

void print_wp_pool() {
  if(wp_pool_is_empty()) log_warn("wp_pool is empty!");
  for (WP *wp = head; wp != NULL; wp = wp->next) {
    print_wp(wp);
  }
}

void traverse_watchpoints() {
  if(wp_pool_is_empty()) {
    log_warn("wp_pool is empty!");
  }
  WP *wp = head;

  while (!wp_is_NULL(wp)) {
    bool *success = calloc(1, sizeof(bool));
    *success = false;
    int32_t val = expr(wp->expr, success);
    if(val != wp->val) {
      nemu_state.state = NEMU_STOP;
      init_wp(wp, wp->expr, val);
      printf("Watchpoint value changes: %s = %d\n", wp->expr, wp->val);
      return;
    }
    else {}
    wp = wp->next;
  }
}
