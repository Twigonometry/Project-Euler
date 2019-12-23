""" Author: Mac Goodwin
Project Euler utility functions in Python """

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
        i = 3
        while i*i <= n:
            if n % i == 0:
                return False
            i+=2
        return True
        