{-# LANGUAGE OverloadedStrings #-}
module ErrorTest (unitInput) where

import BasicPrelude

import Test.Hspec (it, Spec, shouldBe, describe)

import Input
import Types

unitInput :: Spec
unitInput = do
  describe "Correct Response to Bad Input" $ do
    it "returns (NoInput :: PrimeError)" $ 
      configurator [] `shouldBe` (Left NoInput) 
    it "returns (OnlyOne :: PrimeError)" $
      configurator ["10","20"] `shouldBe` (Left OnlyOne)
    it "returns (NotAnInteger :: PrimeError)" $
      configurator buffalo `shouldBe` (Left NotAnInteger)
    it "returns (NotPInt :: PrimeError)" $
      configurator ["-10"] `shouldBe` (Left NotPInt)

-- |
-- -- https://en.wikipedia.org/wiki/Buffalo_buffalo_Buffalo_buffalo_buffalo_buffalo_Buffalo_buffalo

buffalo :: [Text]
buffalo = ["Buffalo Buffalo Buffalo Buffalo Buffalo Buffalo Buffalo Buffalo"]
    
