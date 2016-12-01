module PrimeTest (propPrime) where

import BasicPrelude
import Test.Hspec
import Test.Hspec.QuickCheck
import Test.QuickCheck
import Generator
import Math.NumberTheory.Primes.Testing (isPrime)

propPrime :: Int -> Spec
propPrime ub = do
  describe "QuickCheck testing fizzbuzz" $
    modifyMaxSuccess (const maxS)        $
    prop propMsg                         $
    forAll (choose (10,ub)) verifyPrime
  where
    propMsg = "Lowerbound: 10 Upperbound: " <> showUB
    showUB  = show ub
    maxS    = (ub `div` 10) :: Int

verifyPrime :: Int -> Bool
verifyPrime p = all (== True) $ isPrime <$> take p primes 
