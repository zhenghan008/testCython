# distutils: sources = test-include/tp.h
# distutils: include_dirs =test-include/

cdef extern from "tp.h" nogil:
    DEF SIZE_C = 1000
    ctypedef struct T:
       int a
       char b[SIZE_C]
    ctypedef union U:
        int c
        char d[SIZE_C]
        float e
    ctypedef struct B:
        T* t
        U * u
    ctypedef void (*CallbackFunc) (int a)
    U * new_u(void * data, char type_u)
    B * new_b(T * t, U * u)
    T*  new_t(int a, char * b)
    T * set_t(T * t, int a, char * b)
    void set_callback(CallbackFunc func, T * t)