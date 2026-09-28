import Mathlib

/-!
# Humbert's reduction theory over number fields

* [Hu40] P. Humbert, *Théorie de la réduction des formes quadratiques définies positives dans un
  corps algébrique K fini*, Comment. Math. Helv. 12 (1939/40), 263–306 (Humbert's thesis, "T").
* [Hu49] P. Humbert, *Réduction de formes quadratiques dans un corps algébrique fini*,
  Comment. Math. Helv. 23 (1949), 50–63.

A *system* attached to `K` is a family of positive definite matrices, one per infinite place:
real symmetric at real places, hermitian at complex places. Unimodular matrices over `𝓞 K` act
by `S ↦ S[U]`, conjugating `U` at each place.

## Scope
This file treats **totally real** `K` (all places real, systems are real symmetric).
TODO: complex places (hermitian matrices), and hermitian forms over fields where complex
conjugation commutes with the Galois group ([Hu49, §3.2]).

## Note on the reduction domain
[Hu49, (2)–(4)] are transcribed below as I read them (the PDF text layer is partly garbled);
please check them against the paper. Following [EffTart, Remark 7.7], the statement used
downstream is `exists_reducing_matrix` (Humbert's *first* transformation, into `R(c)` with an
integral matrix of bounded determinant), **not** a statement about fully reduced bases: the
inequalities need not hold after the second transformation.
-/

open scoped NumberField Matrix

namespace LatticesLean.Reduction

variable {K : Type*} [Field K] [NumberField K]

/-- A system of positive definite forms in `m` variables (totally real case). -/
abbrev System (K : Type*) [Field K] (m : ℕ) := (K →+* ℝ) → Matrix (Fin m) (Fin m) ℝ

/-- Every component of the system is positive definite. -/
def IsPosSystem {m : ℕ} (S : System K m) : Prop :=
  ∀ φ, (S φ).PosDef

/-- The transformed system `S[A]`: at the place `φ`, `(Aᵠ)ᵀ Sᵠ Aᵠ`. -/
def transform {m : ℕ} (S : System K m) (A : Matrix (Fin m) (Fin m) K) : System K m :=
  fun φ => (A.map φ)ᵀ * S φ * A.map φ

/-- The domain `R(c₁, c₂, c₃)` of [Hu49, (2)–(4)] (cf. [Hu40, (5)] and [Hu40, Théorème 4]):
* (2) `s_i^{(λ)} ≤ c₁ s_j^{(μ)}` for `i ≤ j` and all places `λ, μ`;
* (3) `|s_{ij}^{(k)}| ≤ c₂ s_i^{(k)}` for `i < j`;
* (4) `s_1^{(k)} ⋯ s_m^{(k)} ≤ c₃ |S^{(k)}|`. -/
structure InDomain {m : ℕ} (c₁ c₂ c₃ : ℝ) (S : System K m) : Prop where
  diag : ∀ i j : Fin m, i ≤ j → ∀ φ ψ : K →+* ℝ, S φ i i ≤ c₁ * S ψ j j
  offdiag : ∀ i j : Fin m, i < j → ∀ φ : K →+* ℝ, |S φ i j| ≤ c₂ * S φ i i
  det : ∀ φ : K →+* ℝ, ∏ i, S φ i i ≤ c₃ * (S φ).det

/-- **[Hu40, Théorèmes 1, 4]; [EffTart, Proposition 7.6]** (first transformation): there are
constants such that every positive system is carried into `R(c)` by an integral matrix whose
determinant has bounded norm. -/
theorem exists_reducing_matrix [NumberField.IsTotallyReal K] (m : ℕ) :
    ∃ c₁ c₂ c₃ c₀ : ℝ, ∀ S : System K m, IsPosSystem S →
      ∃ A : Matrix (Fin m) (Fin m) (𝓞 K), A.det ≠ 0 ∧
        |(Algebra.norm ℤ A.det : ℝ)| ≤ c₀ ∧
        InDomain c₁ c₂ c₃ (transform S (A.map (algebraMap (𝓞 K) K))) := by
  sorry

/-- **[Hu49, Théorème 1]** (analogue of [Hu40, Théorème 6]): if two systems in `R(c)` are related
by a nondegenerate matrix `A` over `K` with `aA` and `aA⁻¹` integral, then all conjugates of
the entries of `A` and `A⁻¹` are bounded in terms of `m`, `K`, `a` (and `c`). -/
theorem transition_matrix_bounded [NumberField.IsTotallyReal K] (m : ℕ) (c₁ c₂ c₃ : ℝ)
    (a : ℕ) (ha : 0 < a) :
    ∃ C : ℝ, ∀ (S T : System K m) (A : Matrix (Fin m) (Fin m) K),
      IsPosSystem S → IsPosSystem T → InDomain c₁ c₂ c₃ S → InDomain c₁ c₂ c₃ T →
      A.det ≠ 0 → (∀ i j, IsIntegral ℤ ((a : K) * A i j)) →
      (∀ i j, IsIntegral ℤ ((a : K) * A⁻¹ i j)) → T = transform S A →
      ∀ (φ : K →+* ℝ) (i j : Fin m), |φ (A i j)| ≤ C ∧ |φ (A⁻¹ i j)| ≤ C := by
  sorry

/-- **[Hu49, Théorème 2]**: if `S ∈ R(c)` then `S⁻¹`, with the order of the variables reversed,
lies in `R(c')` for constants `c'` depending only on `m`, `K` (and `c`). -/
theorem inv_reverse_inDomain [NumberField.IsTotallyReal K] (m : ℕ) (c₁ c₂ c₃ : ℝ) :
    ∃ c₁' c₂' c₃' : ℝ, ∀ S : System K m, IsPosSystem S → InDomain c₁ c₂ c₃ S →
      InDomain c₁' c₂' c₃' (fun φ => (S φ)⁻¹.submatrix Fin.rev Fin.rev) := by
  sorry

/-- **[Hu49, Théorème 5]** (quadratic case, any number field, definite *or indefinite*): there are
finitely many classes of symmetric matrices over `𝓞 K` with given nonzero determinant norm,
under `G ↦ Uᵀ G U` with `U ∈ GL_m(𝓞 K)`. (This is the free-lattice statement.) -/
theorem finite_classes_symm_matrix (K : Type*) [Field K] [NumberField K] (m : ℕ) (D : ℤ)
    (hD : D ≠ 0) :
    ∃ S : Finset (Matrix (Fin m) (Fin m) (𝓞 K)), ∀ G : Matrix (Fin m) (Fin m) (𝓞 K),
      G.IsSymm → Algebra.norm ℤ G.det = D →
        ∃ G' ∈ S, ∃ U : Matrix (Fin m) (Fin m) (𝓞 K), IsUnit U.det ∧ G = Uᵀ * G' * U := by
  sorry

end LatticesLean.Reduction
