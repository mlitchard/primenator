module TabWrapper (tabWrapper) where

import BasicPrelude
import Data.Text (pack)
-- import Control.Monad.Except
-- import Control.Monad.Identity
import Control.Monad.Reader
import Generator
import Tabulator
import Input
import Output
import Types

primenator :: Int -> [Text]
primenator bound = prettyPrintTable bound (tabulator primenator')
  where
    primenator' = take bound primes

tabWrapper :: [Text] -> [Text]
tabWrapper input = either ( mungeError ) primenator $ configurator input

mungeError :: PrimeError -> [Text]
mungeError error' = prettyPrintError error' : []
