{-# LANGUAGE BangPatterns #-}
-- |
-- Module: TabWrapper
-- Transforms configurator output into an OutputFormat value.

module TabWrapper (toOutputFormat,primenator,takeFromList) where

import BasicPrelude hiding (null,empty)
import Data.Sequence

import Generator
import Tabulator
import Input
import Output
import Types
import Error

-- toOutputFormat
-- tabulation driver
toOutputFormat :: [Text] -> OutputFormat
toOutputFormat input = either formatError primenator $ configurator input

-- primenator
-- formats prime number generation for multiplication table
primenator :: Int -> OutputFormat
primenator bound = formatTable (tabulator primenator')
  where
    primenator' = takeFromList bound primes

-- | 
-- takeFromList
-- based on take from Data.List, and fromList from Data.Sequence
takeFromList :: Int -> [a] -> Seq a
takeFromList n xs
  | n > 0     =  unsafeTakeFromList n xs
  | otherwise = empty

-- |
-- unsafeTakeFromList
-- Comment on the BangPattern usage: It is a annotation to tell the compiler,
-- that this function should behave strict in its first argument.
-- http://stackoverflow.com/questions/41229489/whats-going-on-in-this-pattern-match
unsafeTakeFromList :: Int -> [a] -> Seq a
unsafeTakeFromList !_ []    = empty
unsafeTakeFromList 1 (x:_)  = singleton x
unsafeTakeFromList m (x:xs) = x <| unsafeTakeFromList (m - 1) xs 

