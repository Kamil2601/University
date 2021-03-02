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


def function_time(function,n):
    SETUP_CODE = "from __main__ import " + function
    TEST_CODE = function + "(" + str(n) + ")"

    times = timeit.timeit(setup = SETUP_CODE, 
                          stmt = TEST_CODE, 
                          number = 10000) 
  
    print('{}({}) time: {}'.format(function,n,times)) 

print(primes_imperative(100))
print(primes_fold(100))
print(primes_functional(100))

function_time("primes_imperative",1000)
function_time("primes_fold",1000)
function_time("primes_functional",1000)