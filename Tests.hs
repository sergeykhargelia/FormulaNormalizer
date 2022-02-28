module Tests where

import TestsHelper
import ToNNF
import ToDNF
import ToCNF
import Formula

input :: Int -> Formula
input testId | testId == 1 = Atom "x"
             | testId == 2 = And (Atom "x") (Atom "y")
             | testId == 3 = Or Top (Not Bottom)
             | testId == 4 = Not (And (Or Top Bottom) (Or (Atom "x") (Not (Atom "y"))))
             | testId == 5 = Impl (input 2) (input 3)
             | testId == 6 = BidirectionalImpl (input 3) (input 5)
             | testId == 7 = Or (input 5) (input 6)
             | testId == 8 = And (input 3) (input 5)
             | testId == 9 = Not (Not (input 8))
             | testId == 10 = Or (input 9) (input 1)
             | otherwise = undefined

testNNF :: Int -> String
testNNF testId = let result = (toNNF . input) testId in
                 if (isNNF result) 
                     then "NNF test " ++ show testId ++ ": passed!\n"
                 else 
                     "NNF test " ++ show testId ++ ": failed!\n"

testDNF :: Int -> String
testDNF testId = let result = (toDNF . input) testId in
                 if (isDNF result) 
                     then "DNF test " ++ show testId ++ ": passed!\n"
                 else 
                     "DNF test " ++ show testId ++ ": failed!\n"

testCNF :: Int -> String
testCNF testId = let result = (toCNF . input) testId in
                 if (isCNF result) 
                     then "CNF test " ++ show testId ++ ": passed!\n"
                 else 
                     "CNF test " ++ show testId ++ ": failed!\n"
