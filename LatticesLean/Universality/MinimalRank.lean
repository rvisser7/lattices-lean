import LatticesLean.Universality.NUniversal

/-!
# Growth of the minimal rank `U_{𝓞_K}(n)` of `n`-universal lattices

Results of [PVYY]. The effective bounds (3)–(5) of the paper are stated here only in existence
form; explicit versions are a later goal.

## Plan
The analytic inputs (Körner's and Siegel's mass formulas, Odlyzko's and Stark's bounds,
Collins/Friedland, Wright's theorem) will enter as explicitly named hypotheses, and the deductions
of [PVYY] will be proved from them.
-/

open NumberField Filter Asymptotics Real

namespace LatticesLean

/-- The second-order constant `P_K = (2 log Δ_K - 2d log(2π) - 3d) / 8` of [PVYY, (1)]. -/
noncomputable def minRankSecondOrderConst (K : Type*) [Field K] [NumberField K] : ℝ :=
  (2 * Real.log |(discr K : ℝ)| - 2 * (Module.finrank ℚ K : ℝ) * Real.log (2 * π)
    - 3 * (Module.finrank ℚ K : ℝ)) / 8

/-- **[PVYY, Theorem 1.1]** (case `d ≥ 3`; the paper also covers `K = ℚ` and all but at most
559 real quadratic fields): `log U(n) = (d/4) n² log n + P_K n² + O(n log n)`. -/
theorem log_minRankNUniversal_isBigO (K : Type*) [Field K] [NumberField K] [IsTotallyReal K]
    (hd : 3 ≤ Module.finrank ℚ K) :
    (fun n : ℕ => Real.log (minRankNUniversal K n : ℝ)
        - ((Module.finrank ℚ K : ℝ) / 4 * (n : ℝ) ^ 2 * Real.log n
          + minRankSecondOrderConst K * (n : ℝ) ^ 2))
      =O[atTop] (fun n : ℕ => (n : ℝ) * Real.log n) := by
  sorry

/-- **[PVYY, Theorem 1.2]** (existence form of (3)–(4)): for `n ≥ 3`, fields with `U(n) < C`
have bounded degree and discriminant (hence are finite in number, by Hermite's theorem). -/
theorem exists_bound_degree_discr_of_minRankNUniversal_lt (n : ℕ) (hn : 3 ≤ n) (C : ℝ) :
    ∃ D₁ D₂ : ℝ, ∀ (K : Type) [Field K] [NumberField K] [IsTotallyReal K],
      (minRankNUniversal K n : ℝ) < C →
        (Module.finrank ℚ K : ℝ) ≤ D₁ ∧ |(discr K : ℝ)| ≤ D₂ := by
  sorry

/-- **[PVYY, Theorem 1.3]** (existence form): for fixed degree `d`, fields with `U(2) < C` have
bounded discriminant. -/
theorem exists_bound_discr_of_minRankNUniversal_two_lt (d : ℕ) (C : ℝ) :
    ∃ D : ℝ, ∀ (K : Type) [Field K] [NumberField K] [IsTotallyReal K],
      Module.finrank ℚ K = d → (minRankNUniversal K 2 : ℝ) < C → |(discr K : ℝ)| ≤ D := by
  sorry

/-- **[PVYY, Theorem 1.4]** (existence form): for fixed degree `d` and even `n`, fields with
`U(n+4) - U(n) < C` have bounded discriminant. -/
theorem exists_bound_discr_of_minRankNUniversal_gap_lt (d n : ℕ) (hn : Even n) (C : ℝ) :
    ∃ D : ℝ, ∀ (K : Type) [Field K] [NumberField K] [IsTotallyReal K],
      Module.finrank ℚ K = d →
        (minRankNUniversal K (n + 4) : ℝ) - minRankNUniversal K n < C →
          |(discr K : ℝ)| ≤ D := by
  sorry

end LatticesLean
