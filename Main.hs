module Main where

import Tests
import ToNNF
import ToDNF
import ToCNF

main :: IO ()
main = do
    runTests 1 
        where runTests :: Int -> IO ()
              runTests testId = if (testId <= 10) then do 
                                    putStr (testNNF testId)
                                    putStr (testDNF testId)
                                    putStr (testCNF testId)
                                    runTests (testId + 1)
                                else do
                                    putStr "Testing completed!\n"
