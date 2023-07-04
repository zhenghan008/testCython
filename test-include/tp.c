//
// Created by zpz on 2023/6/29.
//

#include "tp.h"
#include "stdlib.h"
#include "stdio.h"
#include "string.h"

T* new_t(int a, char* b){
    T* t = (T *)malloc(sizeof(T));
    if (t == NULL) {
        printf("malloc mem fail!\n");
        return NULL;
    }
    t->a = a;
    strcpy(t->b, b);
    printf("call new_t\n");
    printf("t ptr: %p, t->a: %d, t->b: %s\n", t, t->a, t->b);
    return t;

}

T* set_t(T* t, int a, char* b){
    t->a = t->a + a;
    char* c = " ";
    strcat(t->b, c);
    strcat(t->b, b);
    printf("call set_t\n");
    printf("t ptr: %p, t->a: %d, t->b: %s\n", t, t->a, t->b);
    return t;
}

void set_callback(CallbackFunc func, T* t){
    printf("call set_callback\n");
    func(t->a);
    printf("t ptr: %p, before t->a: %d, t->b: %s\n",t, t->a, t->b);
    strcpy(t->b, "abc");
    printf("t ptr: %p, after t->a: %d, t->b: %s\n",t, t->a, t->b);

}

void my_call(int a){
    int c = a + 10;
    printf("my_call res: %d\n", c);
}

int main() {
    T* t = new_t(1, "fuck");
    T* t1 = set_t(t, 3, "you");
    set_callback(my_call, t1);
    free(t);
    return 0;
}