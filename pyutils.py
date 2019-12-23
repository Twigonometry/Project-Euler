""" Author: Mac Goodwin
Project Euler utility functions in Python """

import math
import numpy as np
from timeit import default_timer as timer

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
        
#we can use memoization to tabulate previously calculated fibs
#source: https://stackoverflow.com/questions/18172257/efficient-calculation-of-fibonacci-series
def fibMemo(n, computed = {1: 1, 2: 2}):
    if n not in computed:
        computed[n] = fibMemo(n-1, computed) + fibMemo(n-2, computed)
    return computed[n]

#or we can use a matrix representation of fibonacci numbers
#source: https://www.nayuki.io/page/fast-fibonacci-algorithms
def fibMatrix(n):
    mat = np.array([[1,1],[1,0]])
    matN = np.linalg.matrix_power(mat, n)
    return matN[0,1]