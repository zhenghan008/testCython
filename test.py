from tolib import Test
import random

while 1:
    z = Test(b=random.choice(["I love cython", "I love python", "I love c"]), a=random.choice(range(1000)),
             u_dict={"data": random.choice(["I love cython", "I love python", "I love c"]), "type": "s"})
    z.set_callback()
    # z1 = Test(b=random.choice(["I love cython", "I love python", "I love c"]), a=random.choice(range(1000)), u_dict={"data": random.choice(range(1000)), "type": "i"})
    # z2 = Test(b=random.choice(["I love cython", "I love python", "I love c"]), a=random.choice(range(1000)), u_dict={"data": random.random(), "type": "f"})
    # z3 = Test(b="ghi", a=10, u_dict={"data": 100, "type": "d"})
