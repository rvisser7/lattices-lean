# Cassels, *Rational Quadratic Forms* — integration map

Key: `[Cassels78, Lemma 9.3.1]` (chapter.section.number) in docstrings. For per-theorem progress,
run `python3 scripts/coverage.py` and see `docs/coverage/generated/Cassels78.md`.

Cassels works over `ℚ`, `ℚ_p` and `ℤ`, whereas O'Meara works over general global and local
fields. Where a result is the `K = ℚ` case of an O'Meara result, prove the general version and
derive Cassels' statement from it (one line, in the same file). The main material that is not in
O'Meara is geometry of numbers and reduction (Ch. 5, 12), automorphs of indefinite forms (Ch. 13),
binary forms (Ch. 14) and analytic methods (App. B).

**Mathlib column**: as in `OMeara.md` — **M** largely in Mathlib · **p** partially · **—** not;
to be checked before starting a section.

| § | Title | Location | Mathlib | Notes |
|---|---|---|---|---|
| 1.1–1.3 | Introduction, basic notions | `Foundations/`, `Forms/Basic.lean` | p | |
| 2.2 | Isotropic spaces | `Forms/Basic.lean` | p | `QuadraticMap.Anisotropic` exists |
| 2.3 | Normal bases | Mathlib | M | diagonalisation (`equivalent_weightedSumSquares`) |
| 2.4 | Isometries and autometries | `Forms/Witt.lean`, `OrthogonalGroup/` | p | Witt's theorem |
| 2.5 | Grothendieck and Witt groups | `Forms/WittGroup.lean` | — | |
| 2.6 | Singular forms | `Forms/Basic.lean` | p | radical |
| 3.1 | `p`-adic numbers | Mathlib | M | |
| 3.2 | Norm residue symbol | `Forms/LocalField.lean` | — | Hilbert symbol; over `ℚ_p` in lean-pool |
| 3.3 | Local and global | `Forms/HilbertReciprocity.lean` | — | product formula for the Hilbert symbol |
| 3.4 | Hensel's lemma | Mathlib | M | |
| 4.1–4.2 | Forms over local fields | `Forms/LocalField.lean` | — | = [OMeara63, §63] over `ℚ_p` |
| 4.3 | The Witt group (local) | `Forms/WittGroup.lean` | — | |
| 5.1–5.3 | Tools from the geometry of numbers | Mathlib / `ForMathlib/` | p | Minkowski's convex body theorem is in Mathlib |
| 6.2 | Weak Hasse principle | `Forms/HasseMinkowski.lean` | — | lean-pool (over `ℚ`) |
| 6.3–6.6 | Strong Hasse principle, `n ≤ 2, 3, 4, ≥ 5` | `Forms/HasseMinkowski.lean` | — | lean-pool (over `ℚ`) |
| 6.7 | An existence theorem | `Forms/HilbertReciprocity.lean` | — | = [OMeara63, 72:1] over `ℚ` |
| 6.8 | Size of solutions | `Forms/SmallSolutions.lean` | — | Cassels' bound |
| 6.9 | An approximation theorem | `Forms/HasseMinkowski.lean` | — | |
| 6.10 | Finite projective planes | `Applications/BruckRyserChowla.lean` | — | Bruck–Ryser–Chowla |
| 6.11 | The Witt group of `ℚ` | `Forms/WittGroup.lean` | — | |
| 7.1–7.4 | Forms over integral domains, lattices | `Foundations/` | — | |
| 8.2 | Bases of `ℤ_pⁿ` | `Local/` | p | |
| 8.3 | Canonical forms | `Local/NonDyadic.lean`, `Local/Jordan.lean` | — | |
| 8.4 | Canonical forms, `p = 2` | `Local/Dyadic.lean` | — | the `𝓞 = ℤ₂` case of [OMeara63, §93] |
| 8.5 | Approximation theorems | `Local/` | — | |
| 9.2 | Bases of `ℤⁿ` | Mathlib / `ForMathlib/` | p | Smith normal form |
| 9.3 | The finiteness theorem | `Global/ClassNumber.lean`, `Reduction/` | — | |
| 9.4–9.5 | Genera; existence of genera, representations | `Global/Genus.lean` | — | |
| 9.6 | Quantitative study of representations | `Global/Genus.lean`, `Analytic/` | — | |
| 9.7 | Semi-equivalence | `Global/Genus.lean` | — | |
| 9.8 | Representation by individual forms | `Representation/` | — | |
| 10.2 | The Clifford algebra | Mathlib | M | |
| 10.3 | Spinor norm and the spin group | `OrthogonalGroup/SpinorNorm.lean` | p | |
| 10.4–10.6 | Lattices over integral domains; topology; change of rings | `OrthogonalGroup/` | — | |
| 10.7 | The strong approximation theorem | `OrthogonalGroup/StrongApproximation.lean` | — | for the spin group; needed for [OMeara63, 104:5] |
| 11.1–11.6 | Spinor genera, localisation, number of spinor genera | `Global/SpinorGenus.lean` | — | |
| 11.7–11.8 | Representation by spinor genera; generalised strong approximation | `Global/SpinorGenus.lean` | — | Hsia's theorem ([EffTart, Prop. 6.7]) |
| 11.9 | Representation by definite forms | `Representation/Asymptotic.lean` | — | Tartakowsky-type results |
| 12.2 | Successive minima | `Reduction/Minkowski.lean` | — | |
| 12.3–12.4 | Reduced forms and Siegel domains | `Reduction/Minkowski.lean` | — | |
| 12.5–12.7 | Geometry of definite and reduced forms | `Reduction/Minkowski.lean` | — | |
| 13.2, 13.11 | Hermite reduction (anisotropic, isotropic) | `Indefinite/HermiteReduction.lean` | — | shares ideas with [Hu49, §§2–4] |
| 13.3–13.10 | Automorphs: binary, ternary, quaternary, real automorphs | `Indefinite/Automorphs.lean` | — | 13.8 proves Cassels' Theorem 6.1 |
| 13.12 | Effectiveness | `Indefinite/` | — | |
| 14.2–14.7 | Composition of binary forms, genera, ambiguous classes, Pell | `Binary/` | p | Mathlib has `ℤ√d` and class groups; Gauss composition is not |
| A.2 | Orthogonal decompositions (definite) | `Global/Eichler.lean` | — | = [OMeara63, §105] over `ℤ` |
| A.3 | Class numbers of genera and spinor genera | `Global/SpinorGenus.lean` | — | |
| A.4 | Representations of integers by definite forms | `Representation/` | — | |
| B.2 | Binary forms (analytic) | `Analytic/` | — | Dirichlet class number formula |
| B.3 | Siegel's formulae | `Analytic/SiegelMass.lean` | — | see `ROADMAP.md`, §8 |
| B.4 | Tamagawa numbers | `Analytic/Tamagawa.lean` | — | |
| B.5 | Modular forms | `Analytic/Theta.lean` | p | Mathlib has modular forms and Eisenstein series; theta series of lattices not |
