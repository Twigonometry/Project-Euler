{- Author: Mac Goodwin
Utility Functions for Project Euler problems -}

module Utils where
    --nth fibonacci number, assuming fib1 = 1 & fib2 = 2 (definition from question)
    fibN :: Int -> Int
    fibN 1 = 1
    fibN 2 = 2
    fibN n = fibN (n-1) + fibN (n-2)

    --definition of infinite fibs series, to be evaluated lazily
    --from https://stackoverflow.com/questions/1105765/generating-fibonacci-numbers-in-haskell
    fibs :: [Int]
    fibs = 1 : 1 : zipWith (+) fibs (tail fibs)

    pythTrips :: [(Int, Int, Int)]
    pythTrips = [(a, b, c) | c <- [1..], b <- [2..c-1], a <- [0..b-1], a^2 + b^2 == c^2 ]

    {- recursively build collatz sequence
    base case: a 1 is reached -}
    collatz :: Int -> [Int]
    collatz n | n == 1 = [1]
              | otherwise = n:(collatz (collatzSucc n))

    --successor of an integer in collatz sequence
    collatzSucc :: Int -> Int
    collatzSucc n | n `mod` 2 == 0 = n `div` 2
                  | otherwise = 3*n + 1
                  
    --combinations (n choose r)
    nCr :: Int -> Int -> Int
    --nCr n r = product [1..n] `div` (product [1..r] * product [1..(n-r)])
    nCr n r = product [1..40] `div` (product [1..20] * product [1..20])
    --product [1..40] `div` (product [1..20] * product [1..20])