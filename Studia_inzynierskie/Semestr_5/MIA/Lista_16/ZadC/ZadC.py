from sys import stdout

def print_flush(s):
    print(s)
    stdout.flush()

def solve():
    n = int(input())
    start = 0
    min_index = 0
    max_index = 0

    if n%2==0:
        print_flush("? 1 2")
        answer = input()
        if answer == "<":
            min_index = 1
            max_index = 2
        else:
            min_index = 2
            max_index = 1
        start = 3
    else:
        min_index = max_index = 1
        start = 2

    for i in range(start,n,2):
        print_flush("? {} {}".format(i,i+1))
        answer = input()
        if answer == "<":
            print_flush("? {} {}".format(min_index, i))
            ans = input()
            if ans == ">":
                min_index = i

            print_flush("? {} {}".format(max_index, i+1))
            ans = input()
            if ans == "<":
                max_index = i+1
        else:
            print_flush("? {} {}".format(min_index, i+1))
            ans = input()
            if ans == ">":
                min_index = i+1

            print_flush("? {} {}".format(max_index, i))
            ans = input()
            if ans == "<":
                max_index = i

    print_flush("! {} {}".format(min_index,max_index))
            


def main():
    tests = input()

    for i in range(int(tests)):
        solve()

if __name__=="__main__":
    main()