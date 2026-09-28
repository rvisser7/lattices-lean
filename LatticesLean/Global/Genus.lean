import LatticesLean.Definite.Represent

/-!
# Genus, classes and mass of positive definite `𝓞 K`-lattices

The objects needed to state Siegel's mass formula.

Local isometry is expressed through the congruence form of local representation
(see `Definite/Represent.lean`): two local lattices that represent each other are
isometric (a representation between nondegenerate lattices of the same rank and volume is an
isometry), so mutual representation at `𝔭` is local isometry at `𝔭`. For positive definite
lattices, local isometry at all finite primes also gives isometry of the ambient spaces
(Hasse–Minkowski), so `SameGenus` agrees with O'Meara's genus.
-/

open scoped NumberField
open IsDedekindDomain

namespace LatticesLean.PDLattice

variable {K : Type*} [Field K] [NumberField K]

/-- `N` and `M` are isometric at the prime `v`. -/
def IsLocallyIsometricAt {n : ℕ} (N M : PDLattice K n) (v : HeightOneSpectrum (𝓞 K)) : Prop :=
  N.IsRepresentedByAt M v ∧ M.IsRepresentedByAt N v

/-- `N` and `M` lie in the same genus. -/
def SameGenus {n : ℕ} (N M : PDLattice K n) : Prop :=
  ∀ v : HeightOneSpectrum (𝓞 K), IsLocallyIsometricAt N M v

/-- The automorphism group `O(N)` of the lattice `N`. -/
def Aut {n : ℕ} (N : PDLattice K n) : Type _ :=
  {e : N.L ≃ₗ[𝓞 K] N.L // ∀ x y : N.L, N.B (e x) (e y) = N.B x y}

/-- `#O(N)`; finite for positive definite `N` over a totally real field. -/
noncomputable def autCard {n : ℕ} (N : PDLattice K n) : ℕ :=
  Nat.card N.Aut

variable (K) in
/-- Isometry as an equivalence relation on rank-`n` lattices. -/
def isometrySetoid (n : ℕ) : Setoid (PDLattice K n) where
  r N N' := N.IsIsometric N'
  iseqv := ⟨fun _ => sorry, fun _ => sorry, fun _ _ => sorry⟩

/-- The isometry classes in the genus of `L`. -/
def genusClasses {n : ℕ} (L : PDLattice K n) : Set (Quotient (isometrySetoid K n)) :=
  {c | SameGenus (Quotient.out c) L}

/-- The class number `h(gen L)`. -/
noncomputable def classNumber {n : ℕ} (L : PDLattice K n) : ℕ :=
  (genusClasses L).ncard

/-- The Siegel mass `mass(L) = ∑_{Λ ∈ gen L / ≅} 1 / #O(Λ)`. -/
noncomputable def mass {n : ℕ} (L : PDLattice K n) : ℚ :=
  ∑ᶠ c ∈ genusClasses L, (1 : ℚ) / autCard (Quotient.out c)

/-- **[OMeara63, 103:4]** (definite case; also a consequence of Humbert's reduction theory):
a genus contains only finitely many classes. -/
theorem genusClasses_finite [NumberField.IsTotallyReal K] {n : ℕ} (L : PDLattice K n) :
    (genusClasses L).Finite := by
  sorry

/-- A positive definite lattice has a finite, nontrivial automorphism group (`±1 ∈ O(N)`). -/
theorem two_le_autCard [NumberField.IsTotallyReal K] {n : ℕ} (hn : 0 < n)
    (N : PDLattice K n) : 2 ≤ autCard N := by
  sorry

end LatticesLean.PDLattice
