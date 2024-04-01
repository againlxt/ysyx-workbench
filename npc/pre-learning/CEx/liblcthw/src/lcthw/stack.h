#ifndef lcthw_Stack_h
#define lcthw_Stack_h

#include <lcthw/list.h>

typedef struct Stack
{
    List *list;
}Stack;

Stack *Stack_create() 
{
    Stack *stack = calloc(1, sizeof(Stack));
    stack->list = calloc(1, sizeof(ListNode));
    return stack;
}

void Stack_destroy(Stack *stack)
{
    LIST_FOREACH(stack->list, first, next, cur) {
        if (cur->prev)
        {
            free(cur->prev);
        }
    }
    free(stack->list->last);
    free(stack);
}

void Stack_push(Stack *stack, void *value)
{
    ListNode *node = calloc(1, sizeof(ListNode));
    check_mem(node);
    check(stack!=NULL, "Failed to push, stack is NULL");
    check(value!=NULL, "Failed to push, value is NULL");

    node->value = value;
    node->next  = NULL;
    if(stack->list->last == NULL) {
        stack->list->first = node;
        stack->list->last = node;
        node->prev = NULL;
    } else {
        stack->list->last->next = node;
        node->prev = stack->list->last;
        stack->list->last = node;
    }

    stack->list->count++;

error:
    return;
}

void *Stack_peek(Stack *stack)
{
    return stack->list->last->value;
}

int Stack_count(Stack *stack)
{
    return stack->list->count;
}

#define STACK_FOREACH(A, B) ListNode *_node = NULL;\
    ListNode *B = NULL;\
    for (B = _node = A->list->first; _node != NULL; B = _node = _node->next)
#endif

void *Stack_pop(Stack *stack)
{
    void *result = NULL;
    check(stack, "stack can't be NULL");
    check(stack->list->first && stack->list->last, "List is empty");
    ListNode *node = stack->list->last;

    if (node == stack->list->first)
    {
        result = node->value;
        stack->list->count --;
        return result;
    }
    else
    {
        result = node->value;
        stack->list->last = node->prev;
        stack->list->last->next = NULL;
        stack->list->count --;
        return result;
    }

error:
    return result;
}
