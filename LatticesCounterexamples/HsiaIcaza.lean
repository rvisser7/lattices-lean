import Mathlib

/-!
# A counterexample to the application of [HI99, Lemma 2.5(ii)]

This file records the counterexample of [EffTart, Remark 6.2]: [HI99, Lemma 2.5(ii)] needs
`ord_p Q(v) ∈ {0, 1}`, which is not available where [HI99, proof of Theorem 3.1] applies it.
Take `p = 3`, `M₃ = H ⊥ ⟨1, 1⟩ ⊥ ⟨3⟩`, `v = e + (9/2) f` with `Q(v) = 9`. Then
`v^⊥ = ⟨-9⟩ ⊥ ⟨1, 1⟩ ⊥ ⟨3⟩`, which does not represent `6` over `ℤ₃`, although `6 ∈ Q(M₃)`
(the hyperbolic plane `H` is universal).
-/

namespace LatticesCounterexamples.HsiaIcaza

/-- The key computation: `b² + c² + 3d² ≢ 6 (mod 9)`. Hence `-9a² + b² + c² + 3d² = 6` has no
solution even modulo `9`. (If `decide` is too slow, try `native_decide`.) -/
theorem remark_6_2_mod_nine : ∀ b c d : ZMod 9, b ^ 2 + c ^ 2 + 3 * d ^ 2 ≠ 6 := by
  decide

/-- `⟨-9⟩ ⊥ ⟨1, 1⟩ ⊥ ⟨3⟩` does not represent `6` over `ℤ₃`.

Proof sketch: apply the ring homomorphism `PadicInt.toZModPow 2 : ℤ_[3] →+* ZMod (3 ^ 2)`,
note `-9 ↦ 0`, and use `remark_6_2_mod_nine`. -/
theorem remark_6_2 :
    ¬ ∃ a b c d : ℤ_[3], -9 * a ^ 2 + b ^ 2 + c ^ 2 + 3 * d ^ 2 = 6 := by
  sorry

/-- ... while `6` is represented by the hyperbolic plane `Q(xe + yf) = 2xy`. -/
theorem six_mem_hyperbolic : ∃ x y : ℤ, 2 * x * y = 6 :=
  ⟨3, 1, by norm_num⟩

end LatticesCounterexamples.HsiaIcaza
