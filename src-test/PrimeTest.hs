module PrimeTest (propPrime) where

import PropImports 
import Math.NumberTheory.Primes.Testing (isPrime)

propPrime :: Int -> Spec
propPrime ub = 
  describe "QuickCheck testing prime Generator" $
    modifyMaxSuccess (const maxS)        $
    prop propMsg                         $
    forAll (choose (10,ub)) verifyPrime
  where
    propMsg = "Lowerbound: 10 Upperbound: " <> show ub
    maxS    = (ub `div` 1000) :: Int

verifyPrime :: Int -> Bool
verifyPrime p = all (== True) $ isPrime <$> take p primes 
