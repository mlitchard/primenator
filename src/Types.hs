module Types 
  ( PrimeError (..)
  , PrimeQueue
  , Prime
  , Product
  , Multiplier
  , MTable
  ) where

import BasicPrelude

import PriorityQ (PriorityQ)
data PrimeError 
  = NotAnInteger
  | NotPInt
  | OnlyOne
  | NoInput
    deriving (Eq)
-- |
-- PrimeQueue
-- A type synonym for the priority queue used to describe the sequence of primes
type PrimeQueue = PriorityQ Prime [Prime]

type Prime      = Integer
type Product    = Prime
type Multiplier = Prime
type MTable     = Map Prime [(Product, Multiplier)] 
