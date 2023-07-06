//
// Created by zpz on 2023/6/29.
//

#ifndef TESTC_TEST_H
#define TESTC_TEST_H
#define SIZE_C 1000
typedef struct TestS {
   int a;
   char b[SIZE_C];
} T;

typedef union TestU{
    int c;
    char d[SIZE_C];
    float e;
} U;

typedef struct TestB {
    T* t;
    U* u;
} B;


typedef void (*CallbackFunc)(int a);
U* new_u (void* data,  char type_u);
B* new_b(T* t, U* u);
T* new_t(int a, char* b);
T* set_t(T* t, int a, char* b);
void set_callback(CallbackFunc func, T* t);

#endif //TESTC_TEST_H
