import LatticesLean.Definite.Basic

/-!
# Representations of numbers, local representations, minima and volumes

Definitions needed for the asymptotic local–global principle
(Tartakowsky; Hsia–Kitaoka–Kneser; Hsia–Icaza; and our effective version).

## Local representation: design decision

Local lattices `M_𝔭 = M ⊗ 𝓞_𝔭` are not yet set up in this project. For **integral**
lattices, "represented over `𝓞_𝔭`" is equivalent to "represented modulo `𝔭^k` for every `k`"
(`⇒` by density of `M` in `M_𝔭`; `⇐` by compactness of `M_𝔭`). We therefore *define*
local representability by congruences, which needs no completions.

TODO: once `M_𝔭` is defined (via Mathlib's `HeightOneSpectrum.adicCompletionIntegers`),
prove the equivalence with the `𝔭`-adic definition.
-/

open scoped NumberField
open IsDedekindDomain

namespace LatticesLean.PDLattice

variable {K : Type*} [Field K] [NumberField K]

/-- `M` represents the algebraic integer `A`: `A = Q(x)` for some `x ∈ M`. -/
def RepresentsNum {m : ℕ} (M : PDLattice K m) (A : 𝓞 K) : Prop :=
  ∃ x ∈ M.L, M.B x x = algebraMap (𝓞 K) K A

/-- `A` is represented by `M` at the prime `v`: for every `k` there is `x ∈ M` with
`Q(x) ≡ A (mod 𝔭_v^k)`. Equivalent to `A ∈ Q(M_𝔭)` for integral `M` (see the module docstring). -/
def RepresentsNumAt {m : ℕ} (M : PDLattice K m) (A : 𝓞 K)
    (v : HeightOneSpectrum (𝓞 K)) : Prop :=
  ∀ k : ℕ, ∃ x ∈ M.L, ∃ c : 𝓞 K, c ∈ v.asIdeal ^ k ∧
    algebraMap (𝓞 K) K c = M.B x x - algebraMap (𝓞 K) K A

/-- `N` is represented by `M` at the prime `v`: for every `k` there is an `𝓞 K`-linear
`σ : N → M` with `B(σx, σy) ≡ B'(x, y) (mod 𝔭_v^k)` for all `x, y ∈ N`. -/
def IsRepresentedByAt {n m : ℕ} (N : PDLattice K n) (M : PDLattice K m)
    (v : HeightOneSpectrum (𝓞 K)) : Prop :=
  ∀ k : ℕ, ∃ σ : N.L →ₗ[𝓞 K] M.L, ∀ x y : N.L, ∃ c : 𝓞 K, c ∈ v.asIdeal ^ k ∧
    algebraMap (𝓞 K) K c = M.B (σ x) (σ y) - N.B x y

/-- `μ(N) ≥ c`, where `μ(N) = min {Tr_{K/ℚ} Q(x) : 0 ≠ x ∈ N}` is the minimum of [HKK78, §3]. -/
def TraceMinAtLeast {n : ℕ} (N : PDLattice K n) (c : ℝ) : Prop :=
  ∀ x ∈ N.L, x ≠ 0 → c ≤ (Algebra.trace ℚ K (N.B x x) : ℝ)

/-- `N_{K/ℚ}(𝔳M)`, computed as the index `[M^# : M]` (valid for integral `M`, where
`𝔳M = [M^# : M]` by [OMeara63, 82:11]).
Note: in some Mathlib versions `relindex` is spelled `relIndex`. -/
noncomputable def volumeNorm {m : ℕ} (M : PDLattice K m) : ℕ :=
  (M.L.toAddSubgroup).relIndex (dual M.B M.L).toAddSubgroup

end LatticesLean.PDLattice
