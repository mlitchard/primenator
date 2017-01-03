[![BuildStatus](https://travis-ci.org/mlitchard/primenator.svg?branch=master)](https://travis-ci.org/mlitchard/primenator)
primenator
=============
This is a command-line tool to generate multiplcation tables
based off of a sequence of prime numbers.
I based the prime number generator off of [The Genuine Sieve of Eratosthenes](https://www.cs.hmc.edu/~oneill/papers/Sieve-JFP.pdf)
The modification I made was to swap out [lists](https://hackage.haskell.org/package/base-4.9.0.0/docs/Data-List.html) for [sequences](https://hackage.haskell.org/package/containers-0.5.9.1/docs/Data-Sequence.html).
This allowed for a right-side append cost of O(1), which was nice.

The priority queue code is from [this collection](http://www.cs.hmc.edu/~oneill/code/haskell-primes.zip), with slight modification by me.

#Usage :
Your environment may require the use of sudo for the `docker` commands.

`cd $HOME`

`git clone https://github.com/mlitchard/primenator.git`

`cd primenator`

`export INPUT=10`

`docker build -t ${USER}:primenator .` 

`docker run --rm --name run_primenator_7 -it mlitchard:primenator ${INPUT}`

#Manual Testing
`docker run --entrypoint="/bin/bash" --rm --name run_primenator_7 -it mlitchard:primenator`

`stack test`

## * Docker commands may require sudo
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
