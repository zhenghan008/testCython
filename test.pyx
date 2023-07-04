# distutils: sources = test-include/tp.c
# distutils: include_dirs =test-include/

cimport test
from libc.stdlib cimport free



cdef class Test:

    cdef test.T* c_t
    pt = {}

    def __cinit__(self, a: int, b: str):
        self.c_t = test.new_t(a, b.encode("utf8"))


    def set_t(self, a1: int, b1: str):
        cdef test.T* t1 = test.set_t(self.c_t, a1, b1.encode("utf8"))
        print(t1.a, t1.b.decode("utf8"))


    @staticmethod
    cdef void c_call (int a):
        res = a + 100
        print(f"call c_call res: {res}")


    def get_p_t(self):
        Test.pt["p_a"] = self.c_t.a
        Test.pt["p_b"] = self.c_t.b.decode("utf8")
        return Test.pt

    def set_callback(self):
        return test.set_callback(self.c_call, self.c_t)


    def __dealloc__(self):
        if self.c_t is not NULL:
            print("free ptr")
            free(self.c_t)


