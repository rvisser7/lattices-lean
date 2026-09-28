import Mathlib

/-!
# Jordan splittings and scale exponents of local lattices

Planned content (O'Meara §91; [EffTart, §3]): Jordan splittings of `𝓞_𝔭`-lattices into modular
blocks of rank `≤ 2`, scale exponents `s₁ ≤ ⋯ ≤ sₙ`, and their basic inequalities.
So far only the purely arithmetic inequality on scale exponents is stated.
-/

namespace LatticesLean.Local

/-- **[EffTart, Lemma 3.5]**: if `s₁ ≤ ⋯ ≤ sₙ` are scale exponents (`n ≥ 4`), then
`(n - 3) s₄ ≤ ∑ sᵢ`, hence `s₄ ≤ ⌊ord 𝔳M / (n - 3)⌋`. -/
theorem sub_three_mul_le_sum {n : ℕ} (hn : 4 ≤ n) (s : Fin n → ℕ) (hs : Monotone s) :
    (n - 3) * s ⟨3, by omega⟩ ≤ ∑ i, s i := by
  sorry

end LatticesLean.Local
