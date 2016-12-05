-- |
-- Module: Tabulator
-- Stability: experimental
-- Computes prime number multiplication table.

module Tabulator (tabulator) where

-- import Generator
import BasicPrelude hiding (empty)
import qualified Data.Map.Strict as M
-- import Control.Parallel
import Control.Parallel.Strategies

type Prime      = Integer
type Product    = Prime
type Multiplier = Prime
type MTable     = Map Prime [(Product, Multiplier)]

-- | tabulator
-- tabulator multiplies every prime with each prime in the list.
-- stores in strict Map with each prime being keyed to the results.
tabulator :: [Prime] -> MTable
tabulator primes =
  foldr (multi) M.empty primes 
  where
    multi :: Prime -> MTable -> MTable
    multi prime mtable = M.insert prime products mtable
      where
        products =  BasicPrelude.map (multi' prime) primes `using` parList rseq

multi' :: Prime -> Prime -> (Product, Multiplier)
multi' p1 p2 = (,) (p1 * p2) p2


