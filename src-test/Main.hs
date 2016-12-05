module Main (main) where

import BasicPrelude
import Test.Hspec (hspec)

-- import PrimeTest
import TabulatorTest

-- |
-- Two sets of tests.
-- PrimeTest is a property test for the prime generator
-- TableTest is a property test for the tabulator

main :: IO ()
main = do
  hspec $ propPrime upper_bound
  hspec $ propTabulator t_upper_bound 

p_upper_bound :: Int
p_upper_bound = 100000

t_upper_bound :: Int
t_upper_bound = 1000
