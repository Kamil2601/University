from math import sqrt
from sys import stdout

def end():
    stdout.flush()
    exit(0)

def prime(k):
        for i in range(2,int(sqrt(k)+1)):
            if k%i == 0:
                return False
        return True

def primes_(n):
    result = []
    for i in range(2,n+1):
        if prime(i):
            result.append(i)
    
    return result


#usun podzielne przez n
def remove_div(s,n):
    res = set()
    for x in s:
        if x%n != 0:
            res.add(x)
    return res

#usun niepodzielne przez n
def remove_not_div(s,n):
    res = set()
    for x in s:
        if x%n == 0:
            res.add(x)
    return res

def system_answer(n):
    my_number = 2
    if my_number%n==0:
        return "yes"
    else:
        return "no"



def check_if_n(composites,n,iters):
    composites = remove_not_div(composites, n)
    for i in range(iters):
        if composites == set():
            print("prime")
            end()
        else:
            m = min(composites)
            print(m)
            answer = input()
            if answer == "no":
                composites = remove_div(composites,m)
            else:
                print("composite")
                end()
    

def main():
    possible = set(range(2,101))
    primes = set(primes_(100))
    composites = possible - primes

    print(2)
    answer = input()
    if answer == "yes":
        check_if_n(composites,2,19)

    print(3)
    answer = input()
    if answer == "yes":
        check_if_n(composites,3,18)

    print(5)
    answer = input()
    if answer == "yes":
        check_if_n(composites,5,17)

    print(7)
    answer = input()
    if answer == "yes":
        check_if_n(composites,7,16)

    print("prime")
    end()

if __name__ == "__main__":
    main()