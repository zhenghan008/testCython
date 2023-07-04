from test import Test

z = Test(b="cdf", a=10)
z.set_t(b1="abc", a1=20)
z.set_callback()
print(z.get_p_t())

