
main :: IO ()
main = do
  input <- getArgs
  putStrLn $ tabWrapper input
