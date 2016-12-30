-- |
-- Module: Error.hs
-- handles printing usage errors
{-# LANGUAGE OverloadedStrings #-}

module Error (formatError) where

import Data.Text (Text)
import Types (PrimeError (..),OutputFormat (..))

formatError :: PrimeError -> OutputFormat
formatError prime_error = ErrorFormat (primeErrorToText prime_error)

primeErrorToText :: PrimeError -> Text
primeErrorToText NotAnInteger = integerMSG
primeErrorToText NotPInt      = integerMSG
primeErrorToText OnlyOne      = "primenator only needs one integer"
primeErrorToText NoInput      = "how can primenator make a multiplication table when you haven't told it how big it should be."

integerMSG :: Text
integerMSG = "primenator can make a multiplicaton for you, if you give it a positive integer."
