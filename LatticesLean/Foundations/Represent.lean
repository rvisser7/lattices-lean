import LatticesLean.Foundations.Lattice

/-!
# Representations and isometries of lattices

`L'` (in the space `(V', B')`) is *represented by* `L` (in `(V, B)`), written `L' → L`,
if there is an `R`-linear map `σ : L' → L` with `B (σ x) (σ y) = B' x y`.
(With `Q x = B x x` and `2` invertible this is equivalent to `Q (σ x) = Q' x`.)
-/

namespace LatticesLean

variable {R : Type*} [CommRing R] {K : Type*} [Field K] [Algebra R K]
variable {V : Type*} [AddCommGroup V] [Module K V] [Module R V] [IsScalarTower R K V]
variable {V' : Type*} [AddCommGroup V'] [Module K V'] [Module R V'] [IsScalarTower R K V']
variable {V'' : Type*} [AddCommGroup V''] [Module K V''] [Module R V''] [IsScalarTower R K V'']

/-- `L'` is represented by `L`. -/
def IsRepresentedBy (B' : LinearMap.BilinForm K V') (L' : Submodule R V')
    (B : LinearMap.BilinForm K V) (L : Submodule R V) : Prop :=
  ∃ σ : L' →ₗ[R] L, ∀ x y : L', B (σ x) (σ y) = B' x y

/-- `L'` is isometric to `L`. -/
def IsIsometric (B' : LinearMap.BilinForm K V') (L' : Submodule R V')
    (B : LinearMap.BilinForm K V) (L : Submodule R V) : Prop :=
  ∃ e : L' ≃ₗ[R] L, ∀ x y : L', B (e x) (e y) = B' x y

theorem IsRepresentedBy.refl (B : LinearMap.BilinForm K V) (L : Submodule R V) :
    IsRepresentedBy B L B L :=
  ⟨LinearMap.id, fun _ _ => rfl⟩

theorem IsRepresentedBy.trans
    {B'' : LinearMap.BilinForm K V''} {L'' : Submodule R V''}
    {B' : LinearMap.BilinForm K V'} {L' : Submodule R V'}
    {B : LinearMap.BilinForm K V} {L : Submodule R V}
    (h₁ : IsRepresentedBy B'' L'' B' L') (h₂ : IsRepresentedBy B' L' B L) :
    IsRepresentedBy B'' L'' B L := by
  obtain ⟨σ, hσ⟩ := h₁
  obtain ⟨τ, hτ⟩ := h₂
  exact ⟨τ.comp σ, fun x y => by simp only [LinearMap.comp_apply, hτ, hσ]⟩

/-- A sublattice is represented by the lattice containing it. -/
theorem IsRepresentedBy.of_le (B : LinearMap.BilinForm K V) {L₁ L₂ : Submodule R V}
    (h : L₁ ≤ L₂) : IsRepresentedBy B L₁ B L₂ :=
  ⟨Submodule.inclusion h, fun _ _ => rfl⟩

theorem IsIsometric.isRepresentedBy
    {B' : LinearMap.BilinForm K V'} {L' : Submodule R V'}
    {B : LinearMap.BilinForm K V} {L : Submodule R V}
    (h : IsIsometric B' L' B L) : IsRepresentedBy B' L' B L := by
  obtain ⟨e, he⟩ := h
  exact ⟨e.toLinearMap, fun x y => he x y⟩

end LatticesLean
