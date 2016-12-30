-- | 
-- Module: src-test/Main.hs 
-- There are three property tests.
-- propPrime : verifies the prime number generator generates prime numbers.
-- propTabulator : verifies the tabulator is producing a multiplication table.
-- propFormatter : verifies the formatted data is accurately produced from 
-- tabulator.
--
-- propPrime checks against known-to-be-accurate isPrime function.
-- both propTabulator and propFormatter reconstructs input from output.
--
-- There is one unit test
-- unitInput verifies error handling works correctly.
module Main (main) where

import BasicPrelude
import Test.Hspec (hspec)

-- 
import PrimeTest
import TabulatorTest
import FormatTest

import ErrorTest

main :: IO ()
main = do
  hspec unitInput
  hspec $ propPrime pUpperBound
  hspec $ propTabulator tUpperBound
  hspec $ propFormatter fUpperBound
  hspec unitInput

pUpperBound :: Int
pUpperBound = 100000

tUpperBound :: Int
tUpperBound = 1000

fUpperBound :: Int
fUpperBound = 100
