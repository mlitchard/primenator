-- |
-- Module: Tabulator
-- Stability: experimental
-- Computes prime number multiplication table.

module Tabulator (tabulator) where

-- import Generator
import BasicPrelude

type Prime      = Integer
type Product    = Integer
type Multiplier = Integer
type MTable     = Map Prime [(Product, Multiplier)]

-- | tabulator
-- tabulator multiplies every prime with each prime in the list.
-- stores in strict Map with each prime being keyed to the results.
tabulator :: [Integer] -> MTable
tabulator = error ("tabulator undefined")

