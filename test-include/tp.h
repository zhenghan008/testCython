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
typedef void (*CallbackFunc)(int);
T* new_t(int a, char* b);
T* set_t(T* t, int a, char* b);
void set_callback(CallbackFunc func, T* t);

#endif //TESTC_TEST_H
