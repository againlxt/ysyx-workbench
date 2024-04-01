#include "minunit.h"
#include <lcthw/list_algos.h>
#include <lcthw/list_algos.c>
#include <lcthw/list.c>
#include <assert.h>
#include <string.h>
#include <time.h>
#include <stdlib.h>

char *values[] = {"XXXX", "1234", "abcd", "xjvef", "NDSS"};
int array[] = {5 ,1 , 54, 84, 66, 45, 21, 15 ,78 ,55 ,88, 95, 45, 0};
#define NUM_VALUES   5
#define REPEAT       1
#define NUMBER_SIZE  1000000
#define ARRAY_LENGTH 14

int intcmp(const void *a, const void *b) {
    // 将void指针转换为int指针，并解引用获取其值
    int intA = *(const int*)a;
    int intB = *(const int*)b;

    // 比较两个整数的值
    if (intA < intB) {
        return -1; // 如果第一个参数小于第二个
    } else if (intA > intB) {
        return 1; // 如果第一个参数大于第二个
    } else {
        return 0; // 如果两个参数相等
    }
}

List *create_words()
{
    int i = 0;
    List *words = List_create();

    for(i = 0; i < NUM_VALUES; i++) {
        List_push(words, values[i]);
    }

    return words;
}

List *create_numbers()
{
    srand((unsigned)time(NULL));
    int size = rand()%1000000;
    List *numbers = List_create();

    for (int i = 0; i < size; i++)
    {
        int var = rand();
        List_push(numbers, &var);
    }

    return numbers;
}

int is_sorted(List *words)
{
    LIST_FOREACH(words, first, next, cur) {
        if(cur->next && strcmp(cur->value, cur->next->value) > 0) {
            debug("%s %s", (char *)cur->value, (char *)cur->next->value);
            return 0;
        }
    }

    return 1;
}

char *test_bubble_sort()
{
    List *words = create_words();

    // should work on a list that needs sorting
    int rc = List_bubble_sort(words, (List_compare)strcmp);
    mu_assert(rc == 0, "Bubble sort failed.");
    mu_assert(is_sorted(words), "Words are not sorted after bubble sort.");

    // should work on an already sorted list
    rc = List_bubble_sort(words, (List_compare)strcmp);
    mu_assert(rc == 0, "Bubble sort of already sorted failed.");
    mu_assert(is_sorted(words), "Words should be sort if already bubble sorted.");

    List_destroy(words);

    // should work on an empty list
    words = List_create(words);
    rc = List_bubble_sort(words, (List_compare)strcmp);
    mu_assert(rc == 0, "Bubble sort failed on empty list.");
    mu_assert(is_sorted(words), "Words should be sorted if empty.");

    List_destroy(words);

    return NULL;
}

char *test_merge_sort()
{
    List *words = create_words();

    // should work on a list that needs sorting
    List *res = List_merge_sort(words, (List_compare)strcmp);
    mu_assert(is_sorted(res), "Words are not sorted after merge sort.");

    List *res2 = List_merge_sort(res, (List_compare)strcmp);
    mu_assert(is_sorted(res), "Should still be sorted after merge sort.");
    List_destroy(res2);
    List_destroy(res);

    List_destroy(words);
    return NULL;
}

char *test_performences()
{
    double bubble_time    = 0;
    double merge_time     = 0;

    for (int i = 0; i < REPEAT; i++)
    {
        clock_t start_t, finish_t;
        List *numbers_bubble    = create_numbers();
        List *numbers_merge     = List_copy(numbers_bubble);
        mu_assert(List_eqa(numbers_bubble, numbers_merge, (List_compare)intcmp), "Wrong to copy");
        start_t = clock();
        List_bubble_sort(numbers_bubble, (List_compare)intcmp);
        finish_t = clock();
        bubble_time += (double)(finish_t - start_t) / CLOCKS_PER_SEC;

        start_t = clock();
        List_merge_sort(numbers_merge, (List_compare)intcmp);
        finish_t = clock();
        merge_time += (double)(finish_t - start_t) / CLOCKS_PER_SEC;
        List_destroy(numbers_bubble);
        List_destroy(numbers_merge);
    }

    printf("Performence Test begin\n");
    printf("Bubble time: %.6f\n", bubble_time);
    printf("Merge time: %.6f\n", merge_time);

    return NULL;
}

char test_merge_sort_buttom_to_top()
{
    merge_sort(array, ARRAY_LENGTH);
    return NULL;
}


char *all_tests()
{
    mu_suite_start();

    mu_run_test(test_bubble_sort);
    mu_run_test(test_merge_sort);
    mu_run_test(test_performences);
    mu_run_test(test_merge_sort_buttom_to_top);

    return NULL;
}

RUN_TESTS(all_tests);