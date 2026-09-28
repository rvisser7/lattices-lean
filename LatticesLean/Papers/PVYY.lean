import LatticesLean.Universality.MinimalRank
import LatticesLean.Universality.CriterionSet
import LatticesLean.ForMathlib.Combinatorics.EulerTransform

/-!
# [PVYY] Park–Visser–Yatsyna–Yoon, *Asymptotics of n-universal lattices over number fields*

Front door: the paper's main results under the paper's numbering, as aliases of the library
theorems (which carry descriptive names and live in `Universality/` and `ForMathlib/`).
-/

namespace LatticesLean.Papers.PVYY

/-- [PVYY, Theorem 1.1] (case `d ≥ 3`). -/
alias thm_1_1 := LatticesLean.log_minRankNUniversal_isBigO

/-- [PVYY, Theorem 1.2] (existence form). -/
alias thm_1_2 := LatticesLean.exists_bound_degree_discr_of_minRankNUniversal_lt

/-- [PVYY, Theorem 1.3] (existence form). -/
alias thm_1_3 := LatticesLean.exists_bound_discr_of_minRankNUniversal_two_lt

/-- [PVYY, Theorem 1.4] (existence form). -/
alias thm_1_4 := LatticesLean.exists_bound_discr_of_minRankNUniversal_gap_lt

/-- [PVYY, Theorem 1.5] (existence form). -/
alias thm_1_5 := LatticesLean.exists_bound_degree_discr_of_criterionSet_ncard_lt

/-- [PVYY, Theorem 1.6]. -/
alias thm_1_6 := LatticesLean.exists_infinite_minCriterionSets

/-- [PVYY, Theorem 9.1]. -/
alias thm_9_1 := Nat.eulerTransform_le_pow_mul_factorial_sq

end LatticesLean.Papers.PVYY
