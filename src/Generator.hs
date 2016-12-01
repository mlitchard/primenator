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
  , adjust
  , wheel2357 -- added to export to shut compiler up
  , sieve'    -- added to export to shut compiler up
  ) where

import qualified PriorityQ as PQ

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
primes = error ("primes not implemented")

-- |
-- sieve
-- 
sieve :: [Integer] -> [Integer]
sieve = error ("sieve not implemented")

-- |
-- spin
--
spin :: [Integer] -> Integer -> [Integer]
spin = error ("spin not implemented")

wheel2357 :: [Integer]
wheel2357 = error ("wheel2357 not implemented")

-- |
-- sieve'
-- sieve' works incrementaly, crossing off all multiples of a prime 
-- just-in-time, i.e lazily.
-- See the O'Neill paper
-- for further detail.
sieve' :: [Integer] -> PrimeQueue -> [Integer]
sieve' = error ("sieve' not implemented")

insertPrime :: Integer -> [Integer] -> PrimeQueue
insertPrime = error ("insertPrime not implemented")

-- |
-- adjust
-- guarantees minimum value in priority queue
adjust :: Integer -> PrimeQueue -> PrimeQueue 
adjust = error ("adjust not implemented")


