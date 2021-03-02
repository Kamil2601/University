

def romb(n):
    for i in range(n+1):
        print((n-i)*" ", (2*i+1)*"#")

    for i in range(n-1,-1, -1):
        print((n-i)*" ", (2*i+1)*"#")


romb(4)
romb(5)
romb(3)