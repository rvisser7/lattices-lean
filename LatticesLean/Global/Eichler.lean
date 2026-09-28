import LatticesLean.Foundations.Decomposition
import LatticesLean.Definite.Basic

/-!
# Eichler's unique decomposition theorem

A positive definite lattice over a totally real field has a *unique* decomposition
into indecomposable components (unique as sublattices, not just up to isometry).
-/

open scoped NumberField

namespace LatticesLean

variable {K : Type*} [Field K] [NumberField K]
variable {V : Type*} [AddCommGroup V] [Module K V] [Module (𝓞 K) V] [IsScalarTower (𝓞 K) K V]

/-- **[OMeara63, 105:1]** (Eichler's unique decomposition). -/
theorem indecompDecomp_unique [NumberField.IsTotallyReal K]
    {B : LinearMap.BilinForm K V} (hB : IsSymm B)
    (hpos : ∀ x : V, x ≠ 0 → IsTotallyPositive (B x x))
    {L : Submodule (𝓞 K) V} (hL : IsLattice L)
    {S T : Finset (Submodule (𝓞 K) V)}
    (hS : IsIndecompDecomp B L S) (hT : IsIndecompDecomp B L T) :
    S = T := by
  sorry

end LatticesLean
