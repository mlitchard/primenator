import BasicPrelude

import Lens.Micro ((<&>))
import TabWrapper
import Output

-- |
-- getArgs :: IO ([Text])
-- getArgs <&> toOutputFormat :: IO OutputFormat
-- getArgs <&> toOutputFormat >>= printout :: IO ()
main :: IO ()
main =  getArgs <&> toOutputFormat >>= printout
