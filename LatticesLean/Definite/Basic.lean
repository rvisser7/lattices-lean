import LatticesLean.Foundations.Represent

/-!
# Positive definite lattices over totally real fields

To talk about "all lattices of rank `n`" without universe issues, we realise every
rank-`n` lattice inside `K^n = Fin n → K`: a `PDLattice K n` is a positive definite
symmetric bilinear form on `K^n` together with an `𝓞 K`-lattice on `K^n`.
Every positive definite `𝓞 K`-lattice of rank `n` is isometric to one of these.
-/

open scoped NumberField

namespace LatticesLean

/-- `x` is totally positive: positive under every real embedding. -/
def IsTotallyPositive {K : Type*} [Field K] (x : K) : Prop :=
  ∀ φ : K →+* ℝ, 0 < φ x

variable (K : Type*) [Field K] [NumberField K]

/-- A positive definite `𝓞 K`-lattice of rank `n`, realised on `K^n`. -/
structure PDLattice (n : ℕ) where
  /-- The symmetric bilinear form on `K^n`. -/
  B : LinearMap.BilinForm K (Fin n → K)
  symm : IsSymm B
  posDef : ∀ x : Fin n → K, x ≠ 0 → IsTotallyPositive (B x x)
  /-- The lattice. -/
  L : Submodule (𝓞 K) (Fin n → K)
  isLatticeOn : IsLatticeOn K L

namespace PDLattice

variable {K}

/-- `N` is represented by `M`. -/
def IsRepresentedBy {n m : ℕ} (N : PDLattice K n) (M : PDLattice K m) : Prop :=
  LatticesLean.IsRepresentedBy N.B N.L M.B M.L

/-- `N` is isometric to `N'`. -/
def IsIsometric {n n' : ℕ} (N : PDLattice K n) (N' : PDLattice K n') : Prop :=
  LatticesLean.IsIsometric N.B N.L N'.B N'.L

theorem IsRepresentedBy.refl {n : ℕ} (N : PDLattice K n) : N.IsRepresentedBy N :=
  LatticesLean.IsRepresentedBy.refl _ _

theorem IsRepresentedBy.trans {n m k : ℕ} {N : PDLattice K n} {M : PDLattice K m}
    {P : PDLattice K k} (h₁ : N.IsRepresentedBy M) (h₂ : M.IsRepresentedBy P) :
    N.IsRepresentedBy P :=
  LatticesLean.IsRepresentedBy.trans h₁ h₂

end PDLattice

end LatticesLean
