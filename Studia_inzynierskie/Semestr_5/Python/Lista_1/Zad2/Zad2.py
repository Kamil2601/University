
def rest(amount):
    print(amount,"zł:")
    for c in [20,10,5,2,1]:
        if (amount >= c):
            n = amount // c
            amount %= c

            print(" ",n,"*",c,"zł")

rest(7)
rest(107)
rest(99)