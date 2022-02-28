module Formula where

data Formula = Top                                |
               Bottom                             |
               Atom String                        | 
               Not Formula                        |               
               And Formula Formula                | 
               Or Formula Formula                 |  
               Impl Formula Formula               |
               BidirectionalImpl Formula Formula

printBinOp :: Formula -> Formula -> String -> String
printBinOp f1 f2 operation = "(" ++ show f1 ++ operation ++ show f2 ++ ")"

instance Show Formula where
    show Top = "1"
    show Bottom = "0"
    show (Atom var) = var
    show (Not f) = "(~" ++ show f ++ ")"
    show (And f1 f2) = printBinOp f1 f2 " & "
    show (Or f1 f2) = printBinOp f1 f2 " | "
    show (Impl f1 f2) = printBinOp f1 f2 " => "
    show (BidirectionalImpl f1 f2) = printBinOp f1 f2 " <=> "