[![BuildStatus](https://travis-ci.org/mlitchard/primenator.svg?branch=master)](https://travis-ci.org/mlitchard/primenator)
primenator
=============
This is a command-line tool to generate multiplcation tables
based off of a sequence of prime numbers.
I based the prime number generator off of [The Genuine Sieve of Eratosthenes](https://www.cs.hmc.edu/~oneill/papers/Sieve-JFP.pdf)

The priority queue code is from [this collection](http://www.cs.hmc.edu/~oneill/code/haskell-primes.zip), with slight modification by me.

#Usage :
## Docker commands may require sudo

`cd $HOME`

`git clone https://github.com/mlitchard/primenator.git`

`cd primenator`

`export INPUT=10`

`docker build -t ${USER}:primenator .` 

`docker run --rm --name run_primenator -it ${USER}:primenator ${INPUT}`

#Manual Testing
`docker run --entrypoint="/bin/bash" --rm --name run_primenator -it ${USER}:primenator`

`stack test`

The code below is for `stack test`.

~~~ {.haskell}
module Main where
{-# LANGUAGE OverloadedStrings #-}
import BasicPrelude

import Lens.Micro ((<&>))
import TabWrapper
import Output

main :: IO ()
main = fakeGetArgs <&> toOutputFormat >>= printout

fakeGetArgs :: IO [Text]
fakeGetArgs = return ["10"]
