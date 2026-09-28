import LatticesLean.Foundations.Lattice

/-!
# Bridge to Mathlib's `QuadraticForm`

This project follows O'Meara: a quadratic space is `(V, B)` with `B` symmetric bilinear and
`Q x = B x x`. Mathlib's field-level theory (isometries, diagonalisation, Sylvester's law of
inertia, anisotropy, Clifford algebras) is phrased for `QuadraticForm`. The field-level parts of
[OMeara63] and [Cassels78] (folders `Forms/`, `Algebras/`, `OrthogonalGroup/`) should be built on
Mathlib's API, using this file to move between the two conventions.

TODO: the converse direction via `QuadraticMap.associated` (needs `Invertible (2 : K)`), and
transport of isometries between the two settings.
-/

namespace LatticesLean

variable {K : Type*} [Field K] {V : Type*} [AddCommGroup V] [Module K V]

/-- The quadratic form `Q x = B x x` attached to a bilinear form, as a Mathlib `QuadraticForm`. -/
def toQuadraticForm (B : LinearMap.BilinForm K V) : QuadraticForm K V :=
  LinearMap.BilinMap.toQuadraticMap B

@[simp]
theorem toQuadraticForm_apply (B : LinearMap.BilinForm K V) (x : V) :
    toQuadraticForm B x = B x x := by
  simp [toQuadraticForm]

end LatticesLean
