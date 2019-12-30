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

    {- lattice paths (problem 15)
    define coordinate structure
    and define method for advancing -}

    --pair of coordinates
    type LatticeCoord = (Int, Int)

    --move either right or down one step    
    makeMove :: LatticeCoord -> Char -> LatticeCoord
    makeMove (x, y) c | c == 'R' = (x + 1, y)
                      | c == 'D' = (x, y + 1)

    --find solution: build list of moves, add to list of solutions
    --can only take a move if not already at 20 (bottom-right corner)
    
    --given a coordinate, return list of possible moves (R for right, D for down)
    possibleMoves :: LatticeCoord -> [Char]
    possibleMoves (x, y) | x < 20 && y < 20 = ['R', 'D']
                         | x < 20 = ['R']
                         | y < 20 = ['D']
                         | otherwise = []

    --follow all possible starting moves
    findSolutions :: LatticeCoord -> [[Char]]
    findSolutions (x, y) = [followMoves (x, y) firstMove | firstMove <- (possibleMoves (x, y))]

    --recursive function to follow all possible moves from a coordinate to (20, 20)
    --dummy function for now just returns the move
    --in future will pass result of move to itself with new possible moves
    followMoves :: LatticeCoord -> Char -> [Char]
    followMoves (x, y) move = [move]