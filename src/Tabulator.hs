-- |
-- Module: Tabulator
-- Stability: experimental
-- Computes prime number multiplication table.

module Tabulator (tabulator) where

import BasicPrelude hiding (empty)
import Data.Sequence
import Types (Prime,Product,MTable)

-- | tabulator
-- tabulator multiplies every prime with each prime in the list.
-- stores in strict Map with each prime being keyed to the results.
tabulator :: Seq Prime -> MTable
tabulator primes = foldr tabulator' empty primes
  where tabulator' prime mtable = (prime, products) <| mtable
          where products =  multi prime <$> primes

multi :: Prime -> Prime -> Product
multi p1 p2 = p1 * p2
