import LatticesLean.Foundations.Lattice

/-!
# Orthogonal splittings and indecomposable lattices

Internal orthogonal splittings `L = L₁ ⊥ L₂` of a lattice, components,
and (orthogonally) indecomposable lattices.

## TODO
* External orthogonal sums of lattices in different spaces (needed for the paper's
  definition of *additively indecomposable* lattices).
-/

namespace LatticesLean

variable {R : Type*} [CommRing R] {K : Type*} [Field K] [Algebra R K]
variable {V : Type*} [AddCommGroup V] [Module K V] [Module R V] [IsScalarTower R K V]

/-- `L₁` and `L₂` are orthogonal: `B(L₁, L₂) = 0`. -/
def IsOrtho (B : LinearMap.BilinForm K V) (L₁ L₂ : Submodule R V) : Prop :=
  ∀ x ∈ L₁, ∀ y ∈ L₂, B x y = 0

/-- `L = L₁ ⊥ L₂`: an orthogonal splitting of `L`. -/
structure IsOrthSplit (B : LinearMap.BilinForm K V) (L L₁ L₂ : Submodule R V) : Prop where
  sup_eq : L₁ ⊔ L₂ = L
  inf_eq : L₁ ⊓ L₂ = ⊥
  ortho : IsOrtho B L₁ L₂

/-- `L₁` *splits* `L` (is a *component* of `L`). -/
def IsComponent (B : LinearMap.BilinForm K V) (L L₁ : Submodule R V) : Prop :=
  ∃ L₂, IsOrthSplit B L L₁ L₂

/-- `L` is (orthogonally) indecomposable. -/
def IsIndecomposable (B : LinearMap.BilinForm K V) (L : Submodule R V) : Prop :=
  L ≠ ⊥ ∧ ∀ L₁ L₂, IsOrthSplit B L L₁ L₂ → L₁ = ⊥ ∨ L₂ = ⊥

/-- `S` is a decomposition of `L` into pairwise orthogonal indecomposable sublattices.
Intended for positive definite `B`, where pairwise orthogonality implies independence. -/
structure IsIndecompDecomp (B : LinearMap.BilinForm K V) (L : Submodule R V)
    (S : Finset (Submodule R V)) : Prop where
  sup_eq : S.sup id = L
  indec : ∀ M ∈ S, IsIndecomposable B M
  ortho : ∀ M ∈ S, ∀ M' ∈ S, M ≠ M' → IsOrtho B M M'

/-- **[OMeara63, 82:15a]** A unimodular sublattice of an integral lattice splits it. -/
theorem IsUnimodular.isComponent [IsDedekindDomain R] [IsFractionRing R K]
    {B : LinearMap.BilinForm K V} (hB : IsSymm B) {L L₁ : Submodule R V}
    (hL : IsLattice L) (hint : IsIntegralLattice B L) (h₁ : L₁ ≤ L)
    (hu : IsUnimodular B L₁) :
    IsComponent B L L₁ := by
  sorry

end LatticesLean
