import Mathlib

/-!
# Counting integers with bounded conjugates

Used in [EffTart, Lemma 8.1] (counting reduced Gram matrices).
-/

open scoped NumberField

/-- At most `(2Υ + 1)^[K:ℚ]` integers of a totally real field have all conjugates bounded
by `Υ` ([EffTart, Lemma 8.1]). For finiteness, see `NumberField.Embeddings.finite_of_norm_le`. -/
theorem NumberField.card_setOf_abs_conj_le (K : Type*) [Field K] [NumberField K]
    [NumberField.IsTotallyReal K] (Υ : ℝ) (hΥ : 0 ≤ Υ) :
    {γ : 𝓞 K | ∀ φ : K →+* ℝ, |φ (algebraMap (𝓞 K) K γ)| ≤ Υ}.Finite ∧
    ({γ : 𝓞 K | ∀ φ : K →+* ℝ, |φ (algebraMap (𝓞 K) K γ)| ≤ Υ}.ncard : ℝ) ≤
      (2 * Υ + 1) ^ Module.finrank ℚ K := by
  sorry
