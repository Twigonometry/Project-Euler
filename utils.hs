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