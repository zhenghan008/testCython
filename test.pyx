# distutils: sources = test-include/tp.c
# distutils: include_dirs =test-include/

cimport test
from libc.stdlib cimport free





cdef class Test:

    cdef test.T* c_t
    cdef test.U* c_u
    cdef test.B * c_b
    cdef int i
    cdef float f
    cdef char* s
    pt = {}

    def __cinit__(self, a: int, b: str, u_dict: dict):
        self.c_t = test.new_t(a, b.encode("utf8"))
        _type_ = int.from_bytes(u_dict.get("type").encode(), "little")
        if u_dict.get("type") == "i":
            self.i = u_dict.get("data")
            self.c_u = test.new_u(&self.i, _type_)
        elif u_dict.get("type") == "f":
            self.f = u_dict.get("data")
            self.c_u = test.new_u(&self.f, _type_)
        elif u_dict.get("type") == "s":
            _data = u_dict.get("data").encode("utf8")
            self.s = _data
            self.c_u = test.new_u(self.s, _type_)
        else:
            self.c_u = test.new_u(self.s, _type_)
        self.c_b = test.new_b(self.c_t, self.c_u)




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
            print("free c_t ptr")
            free(self.c_t)
        if self.c_u is not NULL:
            print("free c_u ptr")
            free(self.c_u)
        if self.c_b is not NULL:
            print("free c_b ptr")
            free(self.c_b)


