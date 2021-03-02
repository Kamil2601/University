from sys import stdout

def main():
    n = int(input())
    a = [0 for _ in range(n+1)]

    print("? 1 2")
    x = int(input())
    print("? 1 3")
    y = int(input())
    print("? 2 3")
    z = int(input())

    a[1] = (x + y - z) / 2;
    a[2] = (x - y + z) / 2;
    a[3] = (-x + y + z) / 2;

    for p in range(4,n+1):
        print("? 1 {}".format(p))
        u = int(input())
        a[p] = u - a[1]

    print("!", end=" ")

    for a in a[1:]:
        print(int(a),end=" ")

    print("")

if __name__=="__main__":
    main()