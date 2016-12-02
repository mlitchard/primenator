module TabulatorTest where

import BasicPrelude
import Tabulator
import Data.Map.Strict hiding (map)
import Test.Hspec
import Test.Hspec.QuickCheck
import Test.QuickCheck

propTabulator :: Int -> Spec
propTabulator ub = do
  describe "QuickCheck testing muliplication tabulator" $
    modifyMaxSuccess (const maxS) $
    prop propMsg                  $
    forAll (choose (10,ub)) verifyTabulation
    where
      propMsg = "Lowerbound: 10 Upperbound: " <> showUB
      showUB  = show ub
      maxS    = (ub `div` 100) :: Int

verifyTabulation :: Int -> Bool
verifyTabulation ub = all (== True) $ concat $ map tabTest tabulated
  where
--    tabulated = map (\x -> (,) x $ map (multi x) range) range
    tabTest (x,y) = map (\(a,b) -> (a `div` x == b) == True) y
--    multi x y = (,) (x * y) y              
    tabulated   = toList $ tabulator range 
    range     = [1 .. (fromIntegral ub)]                            
