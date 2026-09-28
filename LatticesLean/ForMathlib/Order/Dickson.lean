import Mathlib

/-!
# Dickson's lemma: finitely many minimal elements in `ℕ^k`

Used in [HKK78, Lemma 1.4].
-/

/-- **Dickson's lemma** ([HKK78, Lemma 1.4]): every subset of `ℕ^k` has only finitely many
minimal elements.

Hint: `Fin k → ℕ` is well-quasi-ordered, and the minimal elements of `X` form an antichain;
look for `Set.IsPWO` and antichain finiteness lemmas in Mathlib. -/
theorem Set.finite_setOf_minimal_fin_nat (k : ℕ) (X : Set (Fin k → ℕ)) :
    {x | Minimal (· ∈ X) x}.Finite := by
  sorry
