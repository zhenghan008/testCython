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

B* new_b(T* t, U* u){
    printf("call new_b\n");
    B* b = (B *)malloc(sizeof(B));
    if (b == NULL) {
        printf("malloc mem fail!\n");
        return NULL;
    }
    b->t = t;
    b->u = u;
    printf("b ptr: %p, b->t: %p, b->u: %p\n", b, b->t, b->u);
    return b;

}



U* new_u(void* data,  char type_u){
    printf("call new_u\n");
    U* u = (U *)malloc(sizeof(U));
    if (u == NULL) {
        printf("malloc mem fail!\n");
        return NULL;
    }
    switch (type_u) {
        case 'i':
            u -> c = *(int*)data;
            printf("u ptr: %p,u->c: %d\n", u, u->c);
            break;
        case 'f':
            u -> e = *(float *)data;
            printf("u ptr: %p,u -> e: %f\n", u, u -> e);
            break;
        case 's':
            strcpy(u -> d, (char *)data);
            printf("u ptr: %p,u -> d: %s\n", u, u -> d);
            break;
        default:
            free(u);
            printf("no type for union U\n");
            return NULL;
    }
    return u;

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
    int a1 = 100;
    float f1 = 3.1415;
    U* u1 = new_u(&t1->b, 's');
    U* u2 = new_u(&a1, 'i');
    U* u3 = new_u(&f1, 'f');
    B* b1 = new_b(t1, u1);
    printf("t1->b: %s\n", t1->b);
    free(t);
    free(u1);
    free(b1);
    free(u2);
    free(u3);
    return 0;
}