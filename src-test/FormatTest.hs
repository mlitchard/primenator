module FormatTest (propFormatter) where

import PropImports hiding (filter)

import Data.Sequence hiding (take,filter)
import Data.Text (filter)
import Data.Char (isDigit)

propFormatter :: Int -> Spec
propFormatter ub =
  describe "QuickCheck testing formatter" $
    modifyMaxSuccess (const maxS)         $
    prop propMsg                          $
    forAll (choose (10,ub)) verifyFormatting
    where
      propMsg = "Lowerbound: 10 Upperbound: " <> show ub
      maxS    = (ub `div` 10) :: Int

verifyFormatting :: Int -> Bool
verifyFormatting ub = mtable == (table <$> ftable)
  where
    pseq                 = fromList $ take ub primes
    mtable               = tabulator pseq
    (TableFormat ftable) = formatTable mtable

rProducts :: Seq FormattedProduct -> Seq Prime
rProducts formatted_products 
  = read . filter isDigit <$> formatted_products

rPrime :: Header -> Prime
rPrime formatted_prime = read $ filter isDigit formatted_prime

table :: (Header,Seq FormattedProduct) -> (Prime, Seq Prime) 
table (prime,products) = (,) (rPrime prime) (rProducts products)
