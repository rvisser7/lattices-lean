import LatticesLean.Representation.Asymptotic
import LatticesLean.ForMathlib.Order.Dickson

/-!
# [HKK78] Hsia–Kitaoka–Kneser, *Representations of positive definite quadratic forms*
J. Reine Angew. Math. 301 (1978), 132–141.

Front door. The library versions live in `Representation/Asymptotic.lean`.
Theorem 1 of the paper is the case `K = ℚ` of Theorem 3.
-/

namespace LatticesLean.Papers.HKK

/-- [HKK78, Theorem 3]. -/
alias thm_3 := LatticesLean.PDLattice.exists_isRepresentedBy_of_traceMin

/-- Tartakowsky's theorem over `K` (the case `n = 1` of [HKK78, Theorem 3], norm form). -/
alias tartakowsky := LatticesLean.PDLattice.exists_representsNum_of_norm_gt

/-- [HKK78, Lemma 1.4] (Dickson's lemma). -/
alias lemma_1_4 := Set.finite_setOf_minimal_fin_nat

end LatticesLean.Papers.HKK
