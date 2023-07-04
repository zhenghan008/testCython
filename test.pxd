# distutils: sources = test-include/tp.h
# distutils: include_dirs =test-include/

cdef extern from "tp.h":
    DEF SIZE_C = 1000
    ctypedef struct T:
       int a
       char b[SIZE_C]
    ctypedef void (*CallbackFunc) (int a)
    T * new_t(int a, char * b)
    T * set_t(T * t, int a, char * b)
    void set_callback(CallbackFunc func, T * t)