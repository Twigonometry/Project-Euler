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

    {- problem 9
    for the pythagorean triplet a + b + c = 1000, find the product abc -}
    problem9 :: Int
    problem9 = a * b * c
        where (a, b, c) = head([(a, b, c) | (a, b, c) <- pythTrips, a + b + c == 1000])

    {- problem 14
    which starting number, under 1000000, produces the longest collatz sequence? -}
    problem14 :: Int
    problem14 =  head(maximumBy (compare `on` length) (map collatz [1..1000000]))