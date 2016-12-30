-- | 
-- Module: Output.hs
-- Handles the printing of the multiplication table
 
{-# LANGUAGE OverloadedStrings, NoImplicitPrelude #-}
module Output (printout,formatTable) where

import BasicPrelude hiding (product,foldl', empty)
import Data.Sequence ((|>),empty,viewr,ViewR (..))
import Data.Foldable (toList,foldl')

import qualified Data.Text as T (lines,replicate,length,pack,center)
import Types 

-- | printout
--   prints either an input error or table
printout :: OutputFormat -> IO ()
printout (ErrorFormat err)   = putStrLn err
printout (TableFormat frows) = 
  printTableHeader >> printRows >> print tableBorder
  where
    printTableHeader = mapM_ print tableHeader
    printRows        = mapM_ (print . concat . uncurry (:)) zipRCHeaders 
    tableHeader      = T.lines $
                       tableBorder <> headerPadding <> concat columnHeaders
    headerPadding    = "\n" <> "|" <> T.replicate (headerSize - 1) " "
    columnHeaders    = toList $ map fst frows
    headerSize       = T.length (head columnHeaders)
    numberOfColumns  = length columnHeaders
    rows             = toList $ map (toList . snd ) frows
    zipRCHeaders     = zip columnHeaders rows
    tableBorder      = T.replicate (headerSize * (numberOfColumns + 1)) "*"

-- | formatTable
--   we format each cell based on the number of digits 
--   in the final calculated prime
formatTable :: MTable -> OutputFormat
formatTable table =
  TableFormat (foldl' (formatColumnRow cellsize) empty table)
  where
    cellsize         = 2 + length (show lastprime)
    ((:>) _ lastprime) = viewr lastproducts
    ((:>) _ (_,lastproducts))   = viewr table

-- | formatColumnRow
--   rows of products of primes are formatted, paired with the row header
formatColumnRow :: Int -> FormattedRows -> Row -> FormattedRows
formatColumnRow cellsize ftable (prime,products) = ftable |> paired 
  where
    paired                    = (,) centerLabel ( centerProduct' <$> products)
    centerProduct' product    = centerProduct product cellsize
    centerLabel               = formatted primeString cellsize
    primeString               = (T.pack . show) prime

-- | Utilities
--   

centerProduct :: Integer -> Int -> Text
centerProduct product = formatted productString 
  where productString = (T.pack . show) product

formatted :: Text -> Int -> Text
formatted number cellsize =
  bookend <> centeredText <> bookend
  where
    centeredText = T.center cellsize ' ' number 

bookend :: Text
bookend = "|"
