module PropImports 
  ( module PropImports) where

import BasicPrelude          as PropImports
import Test.Hspec            as PropImports (Spec, hspec, describe)
import Test.Hspec.QuickCheck as PropImports (modifyMaxSuccess, prop)
import Test.QuickCheck       as PropImports (forAll,elements,choose)

import Generator             as PropImports
import Tabulator             as PropImports
import Output                as PropImports
import Types                 as PropImports
