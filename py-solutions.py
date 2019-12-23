""" Author: Mac Goodwin
Project Euler solutions in Python """

import pyutils

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
    print("Hello there")

main()