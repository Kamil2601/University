# for i in range(0, 26):
#     for j in range(0, 26):
#         print((i*j)%26, end=" ")
#     print()


for x in range(1, 26):
    for y in range(1, 26):
        for z in range (1, 26):
            for w in range(1, 26):
                if (23*x+21*y)%26==13 and (10*y+19*z)%26==6 and (13*z+6*w)%26==14:
                    print(x,y,z,w)
