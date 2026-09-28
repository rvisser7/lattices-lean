# O'Meara, *Introduction to Quadratic Forms* — integration map

Key: `[OMeara63, 82:15a]` in docstrings. Each section is mapped to the folder where its results
will live, with the current state of Mathlib and of this project. For per-theorem progress, run
`python3 scripts/coverage.py` and see `docs/coverage/generated/OMeara63.md`.

**Mathlib column** is my best reading of Mathlib as of mid-2026 and should be checked before
starting a section: Mathlib moves fast, and something marked "partial" may already be complete.
Legend: **M** largely in Mathlib · **p** partially in Mathlib · **—** not in Mathlib.

Parts One to Three are field-level theory, much of it already in Mathlib; results missing there
belong in `ForMathlib/` (general algebra and number theory) or `Forms/`, `Algebras/`,
`OrthogonalGroup/` (quadratic forms over fields, built on Mathlib's `QuadraticForm`, see
`Foundations/Bridge.lean`). Part Four is the core of this project.

## Part One: Arithmetic theory of fields

| § | Title | Location | Mathlib | Notes |
|---|---|---|---|---|
| 11 | Valuations | Mathlib | M | `AbsoluteValue`, `Valuation` |
| 12 | Archimedean valuations | Mathlib / `ForMathlib/` | p | Ostrowski, archimedean completions |
| 13 | Non-archimedean valuations | Mathlib | M | |
| 14 | Prolongation of a complete valuation to a finite extension | Mathlib / `ForMathlib/` | p | spectral norm |
| 15 | Prolongation to a finite separable extension | `ForMathlib/` | p | |
| 16 | Discrete valuations | Mathlib | M | DVRs, adic valuations |
| 21 | Dedekind axioms | Mathlib | M | `IsDedekindDomain` |
| 22 | Ideal theory | Mathlib | M | fractional ideals, factorisation |
| 23 | Extension fields | Mathlib | M | ramification and inertia |
| 31 | Rational global fields | Mathlib | p | `ℚ`; `𝔽_q(t)` partial |
| 32 | Local fields | Mathlib / `ForMathlib/` | p | `ℚ_p`, `adicCompletion`; general local fields partial |
| 33 | Global fields | Mathlib / `ForMathlib/` | p | number fields, adèles, units, class group |

## Part Two: Abstract theory of quadratic forms

| § | Title | Location | Mathlib | Notes |
|---|---|---|---|---|
| 41 | Forms, matrices and spaces | Mathlib + `Foundations/Bridge.lean` | M | `QuadraticForm`, `BilinForm`, Gram matrices |
| 42 | Quadratic spaces | `Forms/Basic.lean`, `Forms/Witt.lean` | p | Witt's theorem and cancellation not in Mathlib (Hanke's repo has a start) |
| 43 | Special subgroups of `O_n(V)` | `OrthogonalGroup/Symmetries.lean` | p | symmetries, Cartan–Dieudonné, commutator subgroups |
| 51 | Tensor products | Mathlib | M | |
| 52 | Wedderburn's theorem on central simple algebras | Mathlib / `Algebras/CSA.lean` | p | |
| 53 | Extending the field of scalars | Mathlib | M | base change |
| 54 | The Clifford algebra | Mathlib | M | `CliffordAlgebra`, even subalgebra, conjugation |
| 55 | The spinor norm | `OrthogonalGroup/SpinorNorm.lean` | p | Mathlib has pin/spin groups |
| 56 | Special subgroups of `O_n(V)` | `OrthogonalGroup/SpinorNorm.lean` | — | `O'_n(V)` |
| 57 | Quaternion algebras | Mathlib / `Algebras/Quaternion.lean` | p | `QuaternionAlgebra`; splitting criteria |
| 58 | The Hasse algebra | `Algebras/HasseAlgebra.lean` | — | |

## Part Three: Arithmetic theory of quadratic forms over fields

| § | Title | Location | Mathlib | Notes |
|---|---|---|---|---|
| 61 | Complete archimedean fields | Mathlib | M | Sylvester's law of inertia |
| 62 | Finite fields | `Forms/FiniteField.lean` | p | Chevalley–Warning is in Mathlib; classification is not |
| 63 | Local fields | `Forms/LocalField.lean` | — | quadratic defect, local square theorem (63:1), Hilbert symbol, Hasse invariant, classification; over `ℚ_p` see lean-pool PR #513 |
| 64 | Global notation | `Forms/GlobalField.lean` | — | |
| 65 | Squares and norms in global fields | `ForMathlib/NumberTheory/`, `Forms/GlobalField.lean` | — | |
| 66 | Quadratic forms over global fields | `Forms/HasseMinkowski.lean` | — | Hasse–Minkowski; over `ℚ` in lean-pool |
| 71 | Proof of the reciprocity law | `Forms/HilbertReciprocity.lean` | — | over `ℚ` in lean-pool |
| 72 | Forms with prescribed local behaviour | `Forms/HilbertReciprocity.lean` | — | over `ℚ` in lean-pool |
| 73 | The quadratic reciprocity law | Mathlib | p | over `ℤ` in Mathlib; number fields not |

## Part Four: Arithmetic theory of quadratic forms over rings

| § | Title | Location | This project | Notes |
|---|---|---|---|---|
| 81 | Abstract lattices | `Foundations/AbstractLattice.lean` | ⬜ | Steinitz class, invariant factors, index ideals |
| 82 | Lattices in quadratic spaces | `Foundations/` | partly defined | scale, norm, dual, unimodular; 82:15a stated; volume ⬜ |
| 91 | Generalities (local) | `Local/Jordan.lean`, `Local/Maximal.lean` | ⬜ | Jordan splittings, maximal lattices (91:2, 91:3) |
| 92 | Non-dyadic classification | `Local/NonDyadic.lean` | ⬜ | |
| 93 | Dyadic classification | `Local/Dyadic.lean` | ⬜ | norm groups, weight ideals, 93:16, 93:28 — the largest single section |
| 94 | Effective determination of the invariants | `Local/Dyadic.lean` | ⬜ | |
| 95 | Special subgroups of `O_n(V)` (local, integral) | `OrthogonalGroup/Local.lean` | ⬜ | integral spinor norms |
| 101 | Orthogonal group over arithmetic fields | `OrthogonalGroup/Global.lean` | ⬜ | |
| 102 | Genus and spinor genus | `Global/Genus.lean`, `Global/SpinorGenus.lean` | genus defined | 102:5 (representation by the genus) |
| 103 | Finiteness of class number | `Global/ClassNumber.lean` | stated (103:4) | also via `Reduction/` |
| 104 | Class and spinor genus, indefinite case | `Global/SpinorGenus.lean` | ⬜ | strong approximation, 104:5 |
| 105 | Indecomposable splitting of a definite lattice | `Global/Eichler.lean` | stated (105:1) | |
| 106 | Definite unimodular lattices over `ℤ` | `Definite/UnimodularZ.lean` | ⬜ | `E₈`: see the sphere-packing project |
