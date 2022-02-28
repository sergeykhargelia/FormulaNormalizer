module Main where

import Tests
import ToNNF
import ToDNF
import ToCNF
import Formula

main :: IO ()
main = do
    putStr testNNF1
    