module Main where

import Tests
import ToNNF
import ToDNF
import ToCNF
import Formula

main :: IO ()
main = do
    putStr testNNF1
    putStr testNNF2
    putStr testNNF3
    putStr testNNF4
    putStr testNNF5
    putStr testDNF1
    putStr testDNF2
    putStr testDNF3
    putStr testDNF4
    putStr testDNF5
    putStr testCNF1
    putStr testCNF2
    putStr testCNF3
    putStr testCNF4
    putStr testCNF5
