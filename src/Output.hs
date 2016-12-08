module Output (prettyPrintError, prettyPrintTable) where

import BasicPrelude
import Types

prettyPrintError :: PrimeError -> Text
prettyPrintError = error ("prettyPrintError undefined")

prettyPrintTable :: Int -> MTable -> [Text]
prettyPrintTable = error ("prettyPrintTable undefined")
