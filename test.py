from tolib import Test
import random

size = 0
while 1:
    z = Test(b=random.choice(["I love cython", "I love python", "I love c"]), a=random.choice(range(1000)),
             u_dict={"data": random.choice(["I love cython", "I love python", "I love c"]), "type": "s"})
    o = z.get_p_b()
    size += 1
    if size > 100:
        break
for i in range(10):
    print(o)