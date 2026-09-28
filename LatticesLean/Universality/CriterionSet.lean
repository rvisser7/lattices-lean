import LatticesLean.Universality.NUniversal

/-!
# `n`-universal criterion sets

A *criterion set* for `n`-universality is a finite set `S` of rank-`n` lattices such that
a lattice is `n`-universal if and only if it represents every lattice in `S`.
-/

open scoped NumberField

namespace LatticesLean

variable (K : Type*) [Field K] [NumberField K]

/-- `S` is an `n`-universal criterion set for `𝓞 K`. -/
def IsCriterionSet (n : ℕ) (S : Set (PDLattice K n)) : Prop :=
  S.Finite ∧ ∀ (m : ℕ) (M : PDLattice K m), M.IsNUniversal n ↔ ∀ N ∈ S, N.IsRepresentedBy M

/-- `S` is a criterion set of the smallest possible cardinality. -/
def IsMinCriterionSet (n : ℕ) (S : Set (PDLattice K n)) : Prop :=
  IsCriterionSet K n S ∧ ∀ T, IsCriterionSet K n T → S.ncard ≤ T.ncard

variable {K} in
/-- Two sets of lattices agree up to isometry. -/
def SetIsometric {n : ℕ} (S S' : Set (PDLattice K n)) : Prop :=
  (∀ N ∈ S, ∃ N' ∈ S', N.IsIsometric N') ∧ (∀ N' ∈ S', ∃ N ∈ S, N.IsIsometric N')

/-- Finite criterion sets exist (Chan–Oh [CO23]). -/
theorem exists_criterionSet [NumberField.IsTotallyReal K] (n : ℕ) :
    ∃ S, IsCriterionSet K n S := by
  sorry

/-- **[PVYY, Theorem 1.5]** (existence form of the bounds (3)–(4)): for `n ≥ 3`, fields
admitting an `n`-universal criterion set of size `< C` have bounded degree and discriminant. -/
theorem exists_bound_degree_discr_of_criterionSet_ncard_lt (n : ℕ) (hn : 3 ≤ n) (C : ℝ) :
    ∃ D₁ D₂ : ℝ, ∀ (K : Type) [Field K] [NumberField K] [NumberField.IsTotallyReal K],
      (∃ S, IsCriterionSet K n S ∧ (S.ncard : ℝ) < C) →
        (Module.finrank ℚ K : ℝ) ≤ D₁ ∧ |(NumberField.discr K : ℝ)| ≤ D₂ := by
  sorry

/-- **[PVYY, Theorem 1.6]**: for `n ≥ 17` there are infinitely many pairwise non-isometric
`n`-universal criterion sets of the smallest cardinality. -/
theorem exists_infinite_minCriterionSets [NumberField.IsTotallyReal K] (n : ℕ) (hn : 17 ≤ n) :
    ∃ F : ℕ → Set (PDLattice K n),
      (∀ i, IsMinCriterionSet K n (F i)) ∧ Pairwise fun i j => ¬ SetIsometric (F i) (F j) := by
  sorry

end LatticesLean
