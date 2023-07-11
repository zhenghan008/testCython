# distutils: sources = test-include/tp.c
# distutils: include_dirs =test-include/

cimport tolib
from libc.stdlib cimport free





cdef class Test:

    cdef tolib.T* c_t
    cdef tolib.U* c_u
    cdef tolib.B* c_b
    cdef int i
    cdef float f
    cdef char* s
    pb = {"T": {"a": 0, "b": ""}, "U": {}}

    def __cinit__(self, a: int, b: str, u_dict: dict):
        self.c_t = tolib.new_t(a, b.encode("utf8"))
        _type_ = int.from_bytes(u_dict.get("type").encode(), "little")
        if u_dict.get("type") == "i":
            self.i = u_dict.get("data")
            self.c_u = tolib.new_u(&self.i, _type_)
            Test.pb["U"]["c"] = self.c_u.c
        elif u_dict.get("type") == "f":
            self.f = u_dict.get("data")
            self.c_u = tolib.new_u(&self.f, _type_)
            Test.pb["U"]["e"] = self.c_u.e
        elif u_dict.get("type") == "s":
            _data = u_dict.get("data").encode("utf8")
            self.s = _data
            self.c_u = tolib.new_u(self.s, _type_)
            Test.pb["U"]["d"] = self.c_u.d.decode("utf8")
        else:
            self.c_u = tolib.new_u(self.s, _type_)
        self.c_b = tolib.new_b(self.c_t, self.c_u)
        Test.pb["T"]["a"] = self.c_b.t.a
        Test.pb["T"]["b"] = self.c_t.b.decode("utf8")


    def set_t(self, a1: int, b1: str):
        cdef tolib.T* t1 = tolib.set_t(self.c_t, a1, b1.encode("utf8"))
        print(t1.a, t1.b.decode("utf8"))


    @staticmethod
    cdef void c_call (int a):
        res = a + 100
        print(f"call c_call res: {res}")


    def get_p_b(self):
        return Test.pb


    def set_callback(self):
        return tolib.set_callback(<tolib.CallbackFunc>self.c_call, self.c_t)

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


