
def rozklad(n):
    primes = {}

    while (n>1):
        i = 2
        while (n % i != 0):
            i+=1
        
        if (i in primes.keys()):
            primes[i]+=1
        else:
            primes[i]=1

        n //= i

    return [(i,primes[i]) for i in primes.keys()]

print(rozklad(120))
print(rozklad(10))
print(rozklad(88))