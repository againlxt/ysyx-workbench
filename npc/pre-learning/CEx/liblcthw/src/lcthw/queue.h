#ifndef lcthw_Queue_h
#define lcthw_Queue_h

#include <lcthw/list.h>

typedef struct Queue
{
    List *list;
}Queue;

Queue *Queue_create() 
{
    Queue *queue = calloc(1, sizeof(Queue));
    queue->list = calloc(1, sizeof(ListNode));
    return queue;
}

void Queue_destroy(Queue *queue)
{
    LIST_FOREACH(queue->list, first, next, cur) {
        if (cur->prev)
        {
            free(cur->prev);
        }
    }
    free(queue->list->last);
    free(queue);
}

void Queue_push(Queue *queue, void *value)
{
    ListNode *node = calloc(1, sizeof(ListNode));
    check_mem(node);
    check(queue!=NULL, "Failed to push, queue is NULL");
    check(value!=NULL, "Failed to push, value is NULL");

    node->value = value;
    node->next  = NULL;
    if(queue->list->last == NULL) {
        queue->list->first = node;
        queue->list->last = node;
        node->prev = NULL;
    } else {
        queue->list->last->next = node;
        node->prev = queue->list->last;
        queue->list->last = node;
    }

    queue->list->count++;

error:
    return;
}

void *Queue_peek(Queue *queue)
{
    return queue->list->last->value;
}

int Queue_count(Queue *queue)
{
    return queue->list->count;
}

#define QUEUE_FOREACH(A, B) ListNode *_node = NULL;\
    ListNode *B = NULL;\
    for (B = _node = A->list->first; _node != NULL; B = _node = _node->next)
#endif

void *Queue_pop(Queue *queue)
{
    void *result = NULL;
    check(queue, "queue can't be NULL");
    check(queue->list->first && queue->list->last, "List is empty");
    ListNode *node = queue->list->first;

    if (node == queue->list->last)
    {
        result = node->value;
        queue->list->count --;
        return result;
    }
    else
    {
        result = node->value;
        queue->list->first = node->next;
        queue->list->first->prev = NULL;
        queue->list->count --;
        return result;
    }

error:
    return result;
}
