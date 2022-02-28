module ToCNF where

import Formula
import ToNNF

applyDistrLawCNF :: Formula -> Formula
applyDistrLawCNF (And f1 f2) = And (applyDistrLawCNF f1) (applyDistrLawCNF f2)
applyDistrLawCNF (Or f1 f2) = let e = Or (applyDistrLawCNF f1) (applyDistrLawCNF f2) in case e of
                                  Or e1 (And e2 e3) -> And (Or e1 e2) (Or e1 e3)
                                  Or (And e1 e2) e3 -> And (Or e1 e3) (Or e2 e3)
                                  otherwise -> e
applyDistrLawCNF f = f

toCNF :: Formula -> Formula
toCNF = applyDistrLawCNF . toNNF