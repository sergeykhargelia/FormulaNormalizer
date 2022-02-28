module ToDNF where

import Formula
import ToNNF

applyDistrLawDNF :: Formula -> Formula
applyDistrLawDNF (Or f1 f2) = Or (applyDistrLawDNF f1) (applyDistrLawDNF f2)
applyDistrLawDNF (And f1 f2) = let e = And (applyDistrLawDNF f1) (applyDistrLawDNF f2) in case e of 
                                   And e1 (Or e2 e3) -> Or (applyDistrLawDNF (And e1 e2)) (applyDistrLawDNF (And e1 e3))
                                   And (Or e1 e2) e3 -> Or (applyDistrLawDNF (And e1 e3)) (applyDistrLawDNF (And e2 e3))
                                   otherwise -> e
applyDistrLawDNF f = f


toDNF :: Formula -> Formula
toDNF = applyDistrLawDNF . toNNF
