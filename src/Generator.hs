-- |
-- Module: Generator
-- Stability: experimental
-- Portability: non-portable
-- Prime number generator based on
-- The Genuine Sieve of Eratosthenes by Melissa O'Neil
-- (http://www.cs.hmc.edu/~oneill/papers/Sieve-JFP.pdf). 

module Generator 
  ( primes
  , sieve
  , spin
  , insertPrime
  , wheel2357 -- added to export to shut compiler up
  , sieve'    -- added to export to shut compiler up
  ) where

import qualified PriorityQ as PQ
import BasicPrelude

-- |
-- PrimeQueue
-- A type synonym for the priority queue used to describe the sequence of primes
type PrimeQueue = PQ.PriorityQ Integer [Integer]

-- |
-- primes
-- The interface to the prime number generation machinery.
-- Builds the primes by using a factorization wheel to help the sieve
--  eliminate compound numbers.
primes :: [Integer]
primes = 2 : 3 : 5 : 7 : sieve (spin wheel2357 11)

-- |
-- sieve
-- 
sieve :: [Integer] -> [Integer]
sieve [] = []
sieve (x:xs) = x : sieve' xs (insertPrime x xs PQ.empty)

-- |
-- spin
--
spin :: [Integer] -> Integer -> [Integer]
spin [] _ = []
spin (x:xs) n = n : spin xs (n + x)

wheel2357 :: [Integer]
wheel2357 = cycle $ 2:4:2:4:6:2:6:4:2:4:6:6:2:6:4:2:6:4:6:8:4:2:4:2:4:8:6:4:6:2:4:6:2:6:6:4:2:4:6:2:6:4:2:4:2:10:2:10:[]

-- |
-- sieve'
-- sieve' works incrementaly, crossing off all multiples of a prime 
-- just-in-time, i.e lazily.
-- See the O'Neill paper
-- for further detail.
sieve' :: [Integer] -> PrimeQueue -> [Integer]
sieve' [] _ = []
sieve' (x:xs) table
  | nextComposite <= x = sieve' xs (adjust table)
  | otherwise          = x : sieve' xs (insertPrime x xs table)
    where
      nextComposite = PQ.minKey table
      adjust table'
        | n <= x    = adjust (PQ.deleteMinAndInsert n' ns table')
        | otherwise = table'
          where
            (n, n':ns) = PQ.minKeyValue table'

insertPrime :: Integer -> [Integer] -> PrimeQueue -> PrimeQueue
insertPrime p xs table = PQ.insert (p*p) ((* p) <$> xs) table


