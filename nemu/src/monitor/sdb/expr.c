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

#include <isa.h>

/* We use the POSIX regex functions to process regular expressions.
 * Type 'man regex' for more information about POSIX regex functions.
 */
#include <regex.h>
#include <memory/paddr.h>
#include <math.h>

enum
{
  TK_NOTYPE = 256,
  TK_REG,
  TK_HEX,
  TK_NUMBER,
  TK_NEGETIVE_NUMBER,
  TK_POINTER,
  TK_LBRACKET,
  TK_RBRACKET,
  TK_PLUS,
  TK_SUB,
  TK_MUL,
  TK_DIV,
  TK_EQ,
  TK_UNEQ,
  TK_AND,
  /* TODO: Add more token types */

};

static struct rule
{
  const char *regex;
  int token_type;
} rules[] = {

    /* TODO: Add more rules.
     * Pay attention to the precedence level of different rules.
     */

    {" +", TK_NOTYPE},     // spaces
    {"\\$[\\$0-9a-zA-Z][0-9a-zA-Z]", TK_REG}, // reg
    {"0[xX][0-9a-fA-F]+", TK_HEX}, // hexadecimal number
    {"[0-9]+", TK_NUMBER}, // number
    {"\\(", TK_LBRACKET},  // left bracket
    {"\\)", TK_RBRACKET},  // right bracket
    {"\\+", TK_PLUS},      // plus
    {"-", TK_SUB},         // sub
    {"\\*", TK_MUL},       // mul
    {"/", TK_DIV},         // div
    {"==", TK_EQ},         // equal
    {"!=", TK_UNEQ},       // unequal
    {"&&", TK_AND},        // and
};

#define NR_REGEX ARRLEN(rules)

static regex_t re[NR_REGEX] = {};

/* Rules are used for many times.
 * Therefore we compile them only once before any usage.
 */
void init_regex()
{
  int i;
  char error_msg[128];
  int ret;

  for (i = 0; i < NR_REGEX; i++)
  {
    ret = regcomp(&re[i], rules[i].regex, REG_EXTENDED);
    if (ret != 0)
    {
      regerror(ret, &re[i], error_msg, 128);
      panic("regex compilation failed: %s\n%s", error_msg, rules[i].regex);
    }
  }
}

typedef struct token
{
  int type;
  char str[32];
} Token;

static Token tokens[128] __attribute__((used)) = {};
static int nr_token __attribute__((used)) = 0;

static bool check_brackets_legal(uint32_t begin, uint32_t end);
static bool check_left_is_operator(uint32_t index);
static uint32_t str2uint32_t_have_operator(char *operator, char *num);


static void uint2str(uint32_t num, char* str) {
  strcpy(str, "");
  uint32_t strlen = 0, temp = num;

  while (temp != 0) {
    temp = temp / 10;
    strlen ++;
  }
  for (uint32_t i = 0; i < strlen; i++) {
    *(str+i) = num / pow(10, strlen-i-1) + '0';
    num = num - (*(str+i)-'0') * pow(10, strlen-i-1);
  }
  *(str+strlen) = '\0';
}

static bool make_token(char *e)
{
  int position = 0;
  int i;
  regmatch_t pmatch;

  nr_token = 0;


  while (e[position] != '\0')
  {
    uint32_t val = 0;
    char str[128] = {};
    /* Try all rules one by one. */
    for (i = 0; i < NR_REGEX; i++)
    {
      if (regexec(&re[i], e + position, 1, &pmatch, 0) == 0 && pmatch.rm_so == 0)
      {
        char *substr_start = e + position;
        int substr_len = pmatch.rm_eo;

        // Log("match rules[%d] = \"%s\" at position %d with len %d: %.*s",
        //    i, rules[i].regex, position, substr_len, substr_len, substr_start);

        position += substr_len;

        /* TODO: Now a new token is recognized with rules[i]. Add codes
         * to record the token in the array `tokens'. For certain types
         * of tokens, some extra actions should be performed.
         */

        switch (rules[i].token_type)
        {
        case TK_NOTYPE: /*tokens[nr_token].type = TK_NOTYPE; strcpy(tokens[nr_token].str, " ");*/
          break;
        case TK_REG:
          bool *success = calloc(1, sizeof(bool));
          *success = false;
          strncpy(str, substr_start+1, substr_len-1);
          str[substr_len] = '\0';
          val = (uint32_t) isa_reg_str2val(str, success);
          uint2str(val, str);
          if (*success == true) strcpy(tokens[nr_token].str, str);
          else  assert(0);
          nr_token ++;
          break;
        case TK_EQ:
          tokens[nr_token].type = TK_EQ;
          strcpy(tokens[nr_token].str, "=");
          nr_token++;
          break;
        case TK_UNEQ:
          tokens[nr_token].type = TK_UNEQ;
          strcpy(tokens[nr_token].str, "!");
          nr_token++;
          break;
        case TK_AND:
          tokens[nr_token].type = TK_AND;
          strcpy(tokens[nr_token].str, "&");
          nr_token++;
          break;
        case TK_PLUS:
          tokens[nr_token].type = TK_PLUS;
          strcpy(tokens[nr_token].str, "+");
          nr_token++;
          break;
        case TK_SUB:
          tokens[nr_token].type = TK_SUB;
          strcpy(tokens[nr_token].str, "-");
          nr_token++;
          break;
        case TK_MUL:
          tokens[nr_token].type = TK_MUL;
          strcpy(tokens[nr_token].str, "*");
          nr_token++;
          break;
        case TK_DIV:
          tokens[nr_token].type = TK_DIV;
          strcpy(tokens[nr_token].str, "/");
          nr_token++;
          break;
        case TK_LBRACKET:
          tokens[nr_token].type = TK_LBRACKET;
          strcpy(tokens[nr_token].str, "(");
          nr_token++;
          break;
        case TK_RBRACKET:
          tokens[nr_token].type = TK_RBRACKET;
          strcpy(tokens[nr_token].str, ")");
          nr_token++;
          break;
        case TK_NUMBER:
          tokens[nr_token].type = TK_NUMBER;
          strncpy(tokens[nr_token].str, substr_start, substr_len);
          tokens[nr_token].str[substr_len] = '\0';
          nr_token++;
          break;
        case TK_HEX:
          tokens[nr_token].type = TK_NUMBER;
          strncpy(tokens[nr_token].str, substr_start, substr_len);
          tokens[nr_token].str[substr_len] = '\0';
          uint32_t val = (uint32_t) strtol(tokens[nr_token].str, NULL, 16);
          uint2str(val, tokens[nr_token].str);
          nr_token++;
          break;
        default:
          break;
        }
        assert(nr_token <= 128);
        break;
      }
    }

    if (i == NR_REGEX)
    {
      printf("no match at position %d\n%s\n%*.s^\n", position, e, position, "");
      return false;
    }
  }

  return true;
}

static uint32_t str2uint32_t(char *str)
{
  uint32_t result = 0;
  uint32_t len = strlen(str);
  for (uint32_t i = 0; i < len; i++)
  {
    result = (*(str + i) - 48) * pow(10, len - i - 1) + result;
  }
  return result;
}

static uint32_t str2uint32_t_have_operator(char *operator, char *num) {
  switch (*operator) {
  case '*':
    paddr_t addr = (paddr_t) strtol(num, NULL, 10);
    return (uint32_t) paddr_read(addr, 4);
    break;
  case '-':
    return (0 - (uint32_t) strtol(num, NULL, 10));
  default:
    break;
  }

  return 0;
}

typedef struct bstack
{
  char brackets[32];
  int top;
} BStack;

static void push(BStack *stack, char str) {
  stack->brackets[stack->top] = str;
  stack->top++;
}

static char pop(BStack *stack) {
  char var = stack->brackets[stack->top - 1];
  stack->brackets[stack->top - 1] = '\0';
  stack->top--;
  return var;
}

/*
Determine whether the expression is surrounded by a pair of matching parentheses,
and also check whether the left and right parentheses of the expression match.
*/
static bool check_brackets_legal(uint32_t begin, uint32_t end) {
  BStack *Bstack = calloc(1, sizeof(BStack));
  strcpy(Bstack->brackets, "");
  Bstack->top = 0;
  uint32_t i = begin, j = end;

  for (; i <= j; i++) {
    if (tokens[i].type == TK_LBRACKET) {
      push(Bstack, tokens[i].str[0]);
    }
    else if (tokens[i].type == TK_RBRACKET) {
      if (pop(Bstack) == '\0') {
        return false;
      }
    }
  }
  if (Bstack->top != 0) {
    return false;
  }
  return true;
}

static bool check_parentheses(uint32_t begin, uint32_t end) {
  if (tokens[begin].type == TK_LBRACKET && tokens[end].type == TK_RBRACKET) {
    return true;
  }
  else {
    return false;
  }
}

static bool check_left_is_operator(uint32_t index) {
  if (index == 0) return false;
  else if (tokens[index-1].type >= TK_PLUS) return true;
  return false;
}

uint32_t findop(uint32_t begin, uint32_t end) {
  // uint32_t id[32];
  uint32_t j = 0;
  uint32_t optype = 0;
  for (uint32_t i = begin; i <= end; i++) {
    if (tokens[i].type == TK_LBRACKET) {
      uint32_t l = 1, r = 0;
      while (1) {
        i ++;
        if (tokens[i].type == TK_LBRACKET) {
          l ++;
        }
        else if (tokens[i].type == TK_RBRACKET) {
          r ++;
        }
        if (l == r) {
          break;
        }
      }
    }
    else {
      if (optype == TK_POINTER || optype == TK_NEGETIVE_NUMBER) {
        if (tokens[i].type == TK_MUL || tokens[i].type == TK_DIV || tokens[i].type == TK_PLUS || tokens[i].type == TK_SUB || tokens[i].type == TK_EQ || tokens[i].type == TK_UNEQ || tokens[i].type == TK_AND || optype == TK_POINTER || optype == TK_NEGETIVE_NUMBER) {
          optype = tokens[i].type;
          j = i;
        }
      }
      if (optype == TK_EQ || optype == TK_UNEQ || optype == TK_AND) {
        if (tokens[i].type == TK_MUL || tokens[i].type == TK_DIV || tokens[i].type == TK_PLUS || tokens[i].type == TK_SUB || tokens[i].type == TK_EQ || tokens[i].type == TK_UNEQ || tokens[i].type == TK_AND) {
          optype = tokens[i].type;
          j = i;
        }
      }
      else if (optype == TK_MUL || optype == TK_DIV) {
        if (tokens[i].type == TK_MUL || tokens[i].type == TK_DIV || tokens[i].type == TK_PLUS || tokens[i].type == TK_SUB) {
          optype = tokens[i].type;
          j = i;
        }
      }
      else if (optype == TK_PLUS || optype == TK_SUB){
        if (tokens[i].type == TK_PLUS || tokens[i].type == TK_SUB) {
          optype = tokens[i].type;
          j = i;
        }
      }
      else {
        optype = tokens[i].type;
        j = i;
      }
    }
  }
  return j;
}

static uint32_t eval(uint32_t begin, uint32_t end) {
  assert(check_brackets_legal(begin, end) != false);

  if (begin > end) {
    printf("The starting position is further back than the ending position\n");
    assert(0);
  }
  else if (begin == end) {
    return str2uint32_t(tokens[begin].str);
  }
  else if (begin == end-1) {
    return str2uint32_t_have_operator(tokens[begin].str, tokens[end].str);
  }
  else if (check_parentheses(begin, end) == true) {
    return eval(begin + 1, end - 1);
  }
  else {
    uint32_t op = findop(begin, end);
    uint32_t val1 = eval(begin, op - 1);
    uint32_t val2 = eval(op + 1, end);

    switch (tokens[op].str[0]) {
    case '+':
      return val1 + val2;
    case '-':
      return val1 - val2;
    case '*':
      return val1 * val2;
    case '/':
      return val1 / val2;
    case '=':
      return val1 == val2;
    case '!':
      return val1 != val2;
    case '&':
      return val1 && val2;
    default:
      assert(0);
    }
  }
}

word_t expr(char *e, bool *success) {
  if (!make_token(e))
  {
    *success = false;
    return 0;
  }
  for (int i = 0; i < nr_token; i ++) {
    if (tokens[i].type == TK_MUL && (i == 0 || check_left_is_operator(i)) ) {
      tokens[i].type = TK_POINTER;
    }
    if (tokens[i].type == TK_SUB && (i == 0 || check_left_is_operator(i)) ) {
      tokens[i].type = TK_NEGETIVE_NUMBER;
    }
  }

  /* TODO: Insert codes to evaluate the expression. */
  return eval(0, nr_token - 1);
}
