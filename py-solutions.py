import numpy as np

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

def main():
    print(problem2memo(10))

main()