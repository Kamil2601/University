from math import sqrt
import timeit

def prime(k):
        for i in range(2,int(sqrt(k)+1)):
            if k%i == 0:
                return False
        return True

def primes_imperative(n):
    result = []
    for i in range(2,n+1):
        if prime(i):
            result.append(i)
    
    return result


def primes_fold(n):
    return [i for i in range(2,n+1) if prime(i)]

def primes_functional(n):
    return list(filter(lambda x : prime(x), range(2,n+1)))

def is_prime(k):
        for i in range(2,int(sqrt(k)+1)):
            if k%i == 0:
                return False
        return True

class PrimeNumbers:
    def __iter__(self):
        self.n = 2
        return self

    def __next__(self):
        result = self.n
        self.n+=1
        while(not is_prime(self.n)):
            self.n+=1
        return result

def primes_iterator_imperative(n):
    result = []
    primes = iter(PrimeNumbers())
    for i in range(n):
        result.append(primes.__next__())

    return result

def primes_iterator_fold(n):
    primes = iter(PrimeNumbers())
    return [next(primes) for i in range(n)]

def function_time(function,n):
    SETUP_CODE = "from __main__ import " + function
    TEST_CODE = function + "(" + str(n) + ")"
    num = 1000
    time = timeit.timeit(setup = SETUP_CODE, 
                          stmt = TEST_CODE, 
                          number = num) 
    return time


print("        |  imperative  |    fold      |  functional  |  iterator")

if __name__ == "__main__":
    for n in [10,100,1000]:
        imperative = str(function_time("primes_imperative",n))[:10]
        fold = str(function_time("primes_fold",n))[:10]
        functional = str(function_time("primes_functional",n))[:10]
        iterator = str(function_time("primes_iterator_fold",n))[:10]
        print((5-len(str(n)))*" ",n," | ", imperative, " | ", fold, " | ", functional, " | ", iterator)