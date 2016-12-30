-- | 
-- Module: Types.hs
-- All the types used in generating,manipulating, and formatting 
-- prime numbers and the prime number multiplication table
module Types 
  ( PrimeError (..)
  , OutputFormat (..)
  , FormattedLabel
  , FormattedRows
  , FormattedProduct
  , Header
  , PrimeQueue
  , Prime
  , Product
  , Row
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
    deriving (Show,Eq) -- instances for unit testing

-- |
-- PrimeQueue
-- A type synonym for the priority queue used to describe the sequence of primes
type PrimeQueue = PriorityQ Prime [Prime]

type Prime      = Integer
type Product    = Prime
type Multiplier = Prime
type Row        = (Prime, Seq Product)
type MTable     = Seq Row

type FormattedLabel   = Text
type Header        = Text
type FormattedProduct = Text
type FormattedRows     = Seq (Header, Seq FormattedProduct)
 
data OutputFormat 
  = ErrorFormat Text
  | TableFormat FormattedRows
    deriving (Show)
