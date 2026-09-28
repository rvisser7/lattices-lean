import LatticesLean.Definite.Represent

/-!
# Effective versions of Tartakowsky's theorem

Explicit thresholds in the asymptotic local–global principle for numbers:
[HI99] over `ℤ` and over totally real fields with `2` unramified; [EffTart] over all totally real
fields (with corrected exponents, see [EffTart, Remark 6.2]).

Theorem 1.2 / 7.8 and Theorem 1.3 of [EffTart] involve the internal constants `Γ_{m,F}`, `C_F`,
`r`, `Ξ`, `E`; they will be stated once those constants are defined.
See `ROADMAP.md`, §6, for the dependency structure of the proof.
-/

open scoped NumberField
open IsDedekindDomain NumberField

namespace LatticesLean

/-- The threshold of [EffTart, Corollary 1.4], in the form `exp (Z ^ κ * D ^ (6 (l+1) m²))`
used in its proof, with `Z = 3 l^l m^m |d_F| exp(5^l l^l R_F)` and `κ = 12 (l+1)^3 (m+1)^4`. -/
noncomputable def effectiveTartakowskyBound (K : Type*) [Field K] [NumberField K]
    (m D : ℕ) : ℝ :=
  let l : ℕ := Module.finrank ℚ K
  let κ : ℕ := 12 * (l + 1) ^ 3 * (m + 1) ^ 4
  let Z : ℝ := 3 * (l : ℝ) ^ l * (m : ℝ) ^ m * |(discr K : ℝ)| *
    Real.exp (5 ^ l * (l : ℝ) ^ l * NumberField.Units.regulator K)
  Real.exp (Z ^ κ * (D : ℝ) ^ (6 * (l + 1) * m ^ 2))

/-- **Effective Tartakowsky theorem over totally real fields** [EffTart, Corollary 1.4]:
no hypothesis on the splitting of `2`; the threshold depends only on `[K:ℚ]`, `m`, `|d_K|`,
the regulator and `N(𝔳M)`. -/
theorem PDLattice.representsNum_of_norm_gt_effectiveTartakowskyBound
    (K : Type*) [Field K] [NumberField K] [IsTotallyReal K]
    {m : ℕ} (hm : 5 ≤ m) (M : PDLattice K m) (hM : IsIntegralLattice M.B M.L)
    (A : 𝓞 K) (hA : IsTotallyPositive (algebraMap (𝓞 K) K A))
    (hloc : ∀ v : HeightOneSpectrum (𝓞 K), M.RepresentsNumAt A v)
    (hbig : effectiveTartakowskyBound K m M.volumeNorm <
      (Algebra.norm ℚ (algebraMap (𝓞 K) K A) : ℝ)) :
    M.RepresentsNum A := by
  sorry

end LatticesLean
