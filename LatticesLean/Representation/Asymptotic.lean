import LatticesLean.Definite.Represent

/-!
# The asymptotic local–global principle

A positive lattice of rank `m ≥ 2n + 3` represents every lattice of rank `n` that it represents
locally everywhere, provided the minimum of the latter is large enough [HKK78, Theorem 3]
(Theorem 1 there is the case `K = ℚ`). The case `n = 1` is Tartakowsky's theorem.

The proof of [HKK78] uses (see `ROADMAP.md`, §6): `𝔭^r`-maximal local lattices and 91:2
(Lemma 1.1), spinor genera, 102:5, 104:5 (Lemma 1.2), Dickson's lemma (Lemma 1.4,
`Set.finite_setOf_minimal_fin_nat`), Jordan splittings (Lemma 1.5), primes in ray classes
(Lemma 1.6), and Minkowski/Humbert reduction (Lemma 1.7).
-/

open scoped NumberField
open IsDedekindDomain NumberField

namespace LatticesLean.PDLattice

variable {K : Type*} [Field K] [NumberField K] [IsTotallyReal K]

/-- **[HKK78, Theorem 3]** (Theorem 1 for `K = ℚ`). -/
theorem exists_isRepresentedBy_of_traceMin {m n : ℕ} (hmn : 2 * n + 3 ≤ m)
    (M : PDLattice K m) (hM : IsIntegralLattice M.B M.L) :
    ∃ c : ℝ, ∀ N : PDLattice K n, N.TraceMinAtLeast c →
      (∀ v : HeightOneSpectrum (𝓞 K), N.IsRepresentedByAt M v) →
        N.IsRepresentedBy M := by
  sorry

/-- **Tartakowsky's theorem over `K`** (the case `n = 1` of [HKK78, Theorem 3], in the norm form
of the remark following it): for `m ≥ 5`, every totally positive `A` of large enough norm that is
represented by `M` everywhere locally is represented by `M`. -/
theorem exists_representsNum_of_norm_gt {m : ℕ} (hm : 5 ≤ m) (M : PDLattice K m)
    (hM : IsIntegralLattice M.B M.L) :
    ∃ C : ℝ, ∀ A : 𝓞 K, IsTotallyPositive (algebraMap (𝓞 K) K A) →
      (∀ v : HeightOneSpectrum (𝓞 K), M.RepresentsNumAt A v) →
        C < (Algebra.norm ℚ (algebraMap (𝓞 K) K A) : ℝ) → M.RepresentsNum A := by
  sorry

end LatticesLean.PDLattice
