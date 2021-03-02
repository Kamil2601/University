from math import sqrt
import timeit

def prime(k):
        for i in range(2,int(sqrt(k)+1)):
            if k%i == 0:
                return False
        return True

def primes_less(n):
    temp = [True for i in range(n+1)]
    for i in range(2,n+1):
        if temp[i]:
            j = 2*i
            while j<=n:
                temp[j] = False
                j+=i
    return [i for i in range(2,n+1) if temp[i]]

def distribution_imperative(n):
    result = []
    i = 2
    count = 0
    while (n>1):
        count = 0
        while n%i==0:
            count+=1
            n//=i
        if count>0: result.append((i,count))
        i+=1

    return result

def exp(p,n):
    count = 0
    while n%p==0:
        count+=1
        n//=p
    return count

def distribution_fold(n):
    return [(p,exp(p,n)) for p in primes_less(n//2+1) if n%p==0]
    
def distribution_functional(n):
    return list(map(lambda x : (x,exp(x,n)),(filter(lambda x : n%x==0, primes_less(n//2+1)))))

def function_time(function,n):
    SETUP_CODE = "from __main__ import " + function
    TEST_CODE = function + "(" + str(n) + ")"

    times = timeit.timeit(setup = SETUP_CODE, 
                          stmt = TEST_CODE, 
                          number = 10000) 
  
    print('{}({}) time: {}'.format(function,n,times)) 
        

print(distribution_imperative(1234567))
print(distribution_fold(10))
print(distribution_functional(20))
print(distribution_imperative(1000))
print(distribution_fold(1000))
print(distribution_functional(1000))

function_time("distribution_imperative",1000)
function_time("distribution_fold",1000)
function_time("distribution_functional",1000)