""" Author: Mac Goodwin
Project Euler solutions in Python """

import numpy as np
import pyutils
from timeit import default_timer as timer

#we can use memoization to tabulate previously calculated fibs
#source: https://stackoverflow.com/questions/18172257/efficient-calculation-of-fibonacci-series
def problem2memo(n, computed = {1: 1, 2: 2}):
    if n not in computed:
        computed[n] = problem2memo(n-1, computed) + problem2memo(n-2, computed)
    return computed[n]

#or we can use a matrix representation of fibonacci numbers
#source: https://www.nayuki.io/page/fast-fibonacci-algorithms
def problem2matrix(n):
    mat = np.array([[1,1],[1,0]])
    matN = np.linalg.matrix_power(mat, n)
    return matN[0,1]

def problem2():
    sum = 0
    i=1
    currentFib = problem2memo(i)
    while(currentFib < 4000000):
        if currentFib % 2 == 0:
            sum += currentFib
        i+=1
        currentFib = problem2memo(i)

    return sum

def problem9():
    for a in range(1, 1000):
        for b in range(1, 1000):
            #we know the form of c - don't need to loop
            c = 1000 - a - b
            if (a**2 + b**2 == c**2):
                return a*b*c

def nPrimes(n):
    for i in range(n):
        if pyutils.isPrime(i):
            print(i)

def main():
    #print(pyutils.isPrime(9))
    #print(pyutils.isPrime(15))
    ts = timer()
    #print(nPrimes(50))
    print(pyutils.isPrime(5001))
    print(timer() - ts)

main()