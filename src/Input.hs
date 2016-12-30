-- | 
-- Module: Input.hs
-- Transforms input into either an error or a bound for [Prime]

{-# LANGUAGE OverloadedStrings, NoImplicitPrelude #-}
module Input (configurator) where

import BasicPrelude hiding (bool)

import              Data.Either.Utils (maybeToEither)
import              Data.Text (unpack)
import              Text.Read (readMaybe)
import              Data.Bool (bool)
import              Types (PrimeError (..))


-- | configurator 
-- Driver for imput processing
configurator :: [Text] -> Either PrimeError Int
configurator user_input = convertToPInt =<< mustHaveOne user_input

-- | convertToPInt
-- takes String and returns either an error or positive Integer
convertToPInt :: Text -> Either PrimeError Int
convertToPInt input = isPInt =<< toDigit
  where
    toDigit = maybeToEither NotAnInteger $ (readMaybe . unpack) input
    isPInt int = boolToEither (int >= 0) NotPInt int

-- | mustHaveOne
-- checks to see if number of arguments is correct
mustHaveOne :: [Text] -> Either PrimeError Text
mustHaveOne [arg] = Right arg
mustHaveOne []       = Left NoInput
mustHaveOne _        = Left OnlyOne

-- | boolToEither
-- It is what it says on the tin.
boolToEither :: Bool -> a -> b -> Either a b
boolToEither p a b = bool (Left a) (Right b) p
