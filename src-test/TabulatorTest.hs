module TabulatorTest (propTabulator)where

import BasicPrelude hiding (zip)
import Test.Hspec (Spec,describe)
import Test.Hspec.QuickCheck (modifyMaxSuccess,prop)
import Test.QuickCheck (forAll,choose)

import Data.Sequence (zip,fromList)
import Data.Foldable (toList)
import BasicPrelude hiding (zip)

import Types
import Tabulator
import Generator

propTabulator :: Int -> Spec
propTabulator ub = 
  describe "QuickCheck testing muliplication tabulator" $
    modifyMaxSuccess (const maxS) $
    prop propMsg                  $
    forAll (choose (10,ub)) verifyTabulation
    where
      propMsg = "Lowerbound: 10 Upperbound: " <> show ub
      maxS    = (ub `div` 10) :: Int

verifyTabulation :: Int -> Bool
verifyTabulation ub = all (== True) $ concatMap tabTest tabulated
  where
    tabTest :: (Prime, Seq Product) -> [Bool]
    tabTest (prime,products) = 
      toList $ map (\(a,b) -> (a `div` prime == b) ) paired
      where
        paired = zip products (multipliers ub)
    tabulated = toList $ tabulator $ multipliers ub 

multipliers ub = fromList $ take ub [1 .. ]
