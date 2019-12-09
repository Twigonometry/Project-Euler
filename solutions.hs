{- Author: Mac Goodwin
Assorted solutions for Project Euler problems -}

module Solutions where
    {- problem 1
    sum of all multiples of 3 and 5 below n -}
    problem1 :: Int -> Int
    problem1 n = sum([x | x <- [0..n-1], (x `mod` 3 == 0 || x `mod` 5 == 0)])