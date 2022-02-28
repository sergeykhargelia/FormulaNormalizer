module ToNNF where

import Formula

deleteImpls :: Formula -> Formula
deleteImpls (Not f) = Not $ deleteImpls f
deleteImpls (And f1 f2) = And (deleteImpls f1) (deleteImpls f2)
deleteImpls (Or f1 f2) = Or (deleteImpls f1) (deleteImpls f2)
deleteImpls (Impl f1 f2) = Or (Not f1) f2
deleteImpls (BidirectionalImpl f1 f2) = And (deleteImpls $ Impl f1 f2) (deleteImpls $ Impl f2 f1) 
deleteImpls var = var

pushNegations :: Formula -> Formula
pushNegations (Not Top) = Bottom
pushNegations (Not Bottom) = Top
pushNegations (Not (Not f)) = pushNegations f
pushNegations (Not (And f1 f2)) = Or (pushNegations $ Not f1) (pushNegations $ Not f2)
pushNegations (Not (Or f1 f2)) = And (pushNegations $ Not f1) (pushNegations $ Not f2)
pushNegations (And f1 f2) = And (pushNegations f1) (pushNegations f2)
pushNegations (Or f1 f2) = Or (pushNegations f1) (pushNegations f2)
pushNegations f = f

toNNF :: Formula -> Formula
toNNF = pushNegations . deleteImpls