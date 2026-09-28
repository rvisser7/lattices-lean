import LatticesLean.Definite.Basic

/-!
# `n`-universal lattices and the minimal rank `U_{𝓞_K}(n)`
-/

open scoped NumberField

namespace LatticesLean

variable (K : Type*) [Field K] [NumberField K]

namespace PDLattice

variable {K}

/-- `M` is `n`-universal: it represents every positive definite lattice of rank `n`. -/
def IsNUniversal {m : ℕ} (M : PDLattice K m) (n : ℕ) : Prop :=
  ∀ N : PDLattice K n, N.IsRepresentedBy M

end PDLattice

/-- `U_{𝓞_K}(n)`: the minimal rank of an `n`-universal `𝓞 K`-lattice. -/
noncomputable def minRankNUniversal (n : ℕ) : ℕ :=
  sInf {m : ℕ | ∃ M : PDLattice K m, M.IsNUniversal n}

/-- `n`-universal lattices exist (e.g. Chan–Oh [CO23]); in particular `minRankNUniversal`
is attained. -/
theorem exists_nUniversal [NumberField.IsTotallyReal K] (n : ℕ) :
    ∃ m, ∃ M : PDLattice K m, M.IsNUniversal n := by
  sorry

end LatticesLean
