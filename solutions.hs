{- Author: Mac Goodwin
Assorted solutions for Project Euler problems -}

module Solutions where
    import Utils
    import Data.List (maximumBy)
    import Data.Function (on)

    {- problem 1
    sum of all multiples of 3 and 5 below n -}
    problem1 :: Int -> Int
    problem1 n = sum([x | x <- [0..n-1], (x `mod` 3 == 0 || x `mod` 5 == 0)])

    {- problem 2
    sum of all even fibonacci numbers < n
    following implementation quickly creates a stack overflow
    implement in python instead, where we can save and lookup values -}
    problem2 :: Int -> Int
    problem2 n = sum([fibN x | x <- [0..], fibN x < n, fibN x `mod` 2 == 0])

    --solution using infinite list of fibs
    problem2' :: Int -> Int
    problem2' n = sum([x | x <- fibs, x < n, x `mod` 2 == 0])

    {- problem 5
    what is the smallest possible number that is evenly divisible
    by all of the numbers from 1 to n -}
    problem5 :: Int -> [Int]
    problem5 n = [i | i <- [1..500000000000000], and(predOverList1 (\x -> i `mod` x == 0) [1..n])]

    {- problem 6
    Find the difference between the sum of the squares of the first one hundred
    natural numbers and the square of the sum
    -}
    problem6 :: Int
    problem6 = (sum [1..100])^2 - sum (map (\x -> x*x) [1..100])
    
    {- problem 9
    for the pythagorean triplet a + b + c = 1000, find the product abc -}
    problem9 :: Int
    problem9 = a * b * c
        where (a, b, c) = head([(a, b, c) | (a, b, c) <- pythTrips, a + b + c == 1000])

    {- problem 14
    which starting number, under 1000000, produces the longest collatz sequence? -}
    problem14 :: Int
    problem14 =  head(maximumBy (compare `on` length) (map collatz [1..1000000]))

    {- problem 15
    number of paths through a 20x20 grid, being limited to down and right
    using combinatoric approach, it is combinations of 20 right and 20 down
    i.e. 40 choose 20 -}
    problem15 :: Int
    problem15 = nCr 40 20