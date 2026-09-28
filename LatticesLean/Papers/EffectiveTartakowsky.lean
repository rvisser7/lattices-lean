import LatticesLean.Representation.Effective
import LatticesLean.Local.Jordan
import LatticesLean.ForMathlib.NumberTheory.Bertrand
import LatticesLean.ForMathlib.NumberTheory.NumberField.BoundedConjugates

/-!
# [EffTart] An effective Tartakowsky theorem over totally real number fields

Front door. Generalises [HI99, §6] by removing the hypothesis that `2` is unramified.
See `ROADMAP.md`, §6, for the dependency structure of the proof.
-/

namespace LatticesLean.Papers.EffTart

/-- [EffTart, Corollary 1.4]. -/
alias cor_1_4 := LatticesLean.PDLattice.representsNum_of_norm_gt_effectiveTartakowskyBound

/-- [EffTart, Lemma 3.5]. -/
alias lemma_3_5 := LatticesLean.Local.sub_three_mul_le_sum

/-- [EffTart, Lemma 8.1]. -/
alias lemma_8_1 := NumberField.card_setOf_abs_conj_le

/-- The bound `q ≤ 4|d_F| D` on the auxiliary prime in [EffTart, Theorem 8.13]
(apply with `N = 2|d_F| D`). -/
alias aux_prime_bound := Nat.exists_prime_not_dvd_le_two_mul

end LatticesLean.Papers.EffTart
