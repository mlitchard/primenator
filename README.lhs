primenator
=============
This is a command-line tool to generate multiplcation tables
based off of a sequence of prime numbers.

Usage :

~~~ {.haskell}
module Main where
{-# LANGUAGE OverloadedStrings #-}
import BasicPrelude

import Lens.Micro
import TabWrapper
import Output

main :: IO ()
main = fakeGetArgs <&> toOutputFormat >>= printout

fakeGetArgs :: IO [Text]
fakeGetArgs = return ["10"]
