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

def problem5():
    i = 20
    while True:
        #if testing multiples of 20, only need to test non-factors of 20
        for j in [3, 6, 7, 8, 9, 11, 12, 13, 14, 15, 16, 17, 18, 19]:
            if i % j != 0:
                #stop testing if not divisible
                break
            elif j == 19:
                return i
        #only test multiples of 20
        i+=20

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
    print(problem5())

main()