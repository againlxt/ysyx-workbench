#include "minunit.h"
#include <lcthw/ringbuffer.c>
#include <assert.h>

static RingBuffer *ringbuffer = NULL;
char *tests[] = {"test1 data", "test2 data", "test3 data"};
#define NUM_TESTS 3
#define LENGTH 3

char *test_create()
{
    ringbuffer = RingBuffer_create(LENGTH);
    mu_assert(ringbuffer != NULL, "Failed to create ringbuffer");

    return NULL;
}

char *test_destroy()
{
    mu_assert(ringbuffer != NULL, "Failed to make ringbuffer");
    RingBuffer_destroy(ringbuffer);

    return NULL;
}

char *test_read_write()
{
    int i = 0;
    for (i = 0; i < NUM_TESTS; i++)
    {
        RingBuffer_write(ringbuffer, tests[i], 1);
        mu_assert(RingBuffer_gets(ringbuffer, i) == tests[i], "Wrong next value.");
    }
    
    mu_assert(ringbuffer->length == NUM_TESTS, "Wrong length on write.");

    for (i = 0; i < ringbuffer->length; i++)
    {
        debug("VAL: %s", ringbuffer->buffer + i);
    }
    
    for (i = 0; i < NUM_TESTS; i++)
    {
        char *var = calloc(1, sizeof("1"));
        RingBuffer_read(ringbuffer, var, 1);
        mu_assert(var == tests[i], "Wrong value on read");
    }
    
    return NULL;
}

char *all_tests() {
    mu_suite_start();

    mu_run_test(test_create);
    mu_run_test(test_read_write);
    mu_run_test(test_destroy);

    return NULL;
}

RUN_TESTS(all_tests);
