-- |
-- Module: Tabulator
-- Stability: experimental
-- Computes prime number multiplication table.

module Tabulator (tabulator) where

import BasicPrelude hiding (empty)
import qualified Data.Map.Strict as M
import Control.Parallel.Strategies

import Types (Prime,Product,Multiplier,MTable)

-- | tabulator
-- tabulator multiplies every prime with each prime in the list.
-- stores in strict Map with each prime being keyed to the results.
tabulator :: [Prime] -> MTable
tabulator primes =
  foldr (tabulator') M.empty primes 
  where
    tabulator' :: Prime -> MTable -> MTable
    tabulator' prime mtable = M.insert prime products mtable
      where
        products =  BasicPrelude.map (multi prime) primes `using` parList rseq

multi :: Prime -> Prime -> (Product, Multiplier)
multi p1 p2 = (,) (p1 * p2) p2


