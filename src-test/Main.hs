module Main (main) where

import BasicPrelude
import Test.Hspec (hspec)

import PrimeTest
import TabulatorTest

-- |
-- Two sets of tests.
-- PrimeTest is a property test for the prime generator
-- ToDo: TableTest is a unit test for the tabulator

main :: IO ()
main = do
  hspec $ propPrime upper_bound
  hspec $ propTabulator upper_bound 

upper_bound :: Int
upper_bound = 100000

