import math

def isPrime(n):
    if n == 1:
        return False
    elif n in [2,3]:
        return True
    #false if even
    elif n % 2 == 0:
        return False
    else:
        #check if divisible by odd numbers up to root n
        root = math.floor(math.sqrt(n))
        for i in range(3, root + 2, 2):
            if n % i == 0:
                return False
        return True