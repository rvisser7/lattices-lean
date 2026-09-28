# Roadmap

Legend: ✅ proved · 📝 stated (`sorry`) · ⬜ not started

Library theorems have descriptive names and live in the thematic folders; the paper numbering
(`thm_1_2`, `cor_1_4`, …) is available through the front-door files in `Papers/`.
References are in `docs/references.bib`.

## 0. Textbooks

O'Meara's *Introduction to Quadratic Forms* and Cassels' *Rational Quadratic Forms* are mapped
section by section in [`docs/coverage/OMeara.md`](docs/coverage/OMeara.md) and
[`docs/coverage/Cassels.md`](docs/coverage/Cassels.md), with target folders and Mathlib status.
Per-theorem progress: `python3 scripts/coverage.py`. The sections below track the parts needed
for our papers first.

## 1. Foundations (O'Meara Ch. VIII, §81–82)

| Item | Lean | Status |
|---|---|---|
| Lattices in / on `V`, rank | `IsLattice`, `IsLatticeOn`, `latticeRank` | defined |
| Scale `𝔰L`, norm `𝔫L`, integral lattices | `scaleIdeal`, `normIdeal`, `IsIntegralLattice` | defined |
| Volume `𝔳L` | | ⬜ (needs fractional ideals / determinants for non-free `L`) |
| Dual lattice, unimodular | `dual`, `IsUnimodular` | defined |
| `𝔞`-modular lattices | | ⬜ |
| Representations, isometries | `IsRepresentedBy`, `IsIsometric` | defined; refl/trans ✅ (to be checked by compiling) |
| Orthogonal splittings, indecomposables | `IsOrthSplit`, `IsIndecomposable`, `IsIndecompDecomp` | defined |
| 81:14 (lattices with prescribed localisations) | | ⬜ |
| 82:15a (unimodular sublattices split) | `IsUnimodular.isComponent` | 📝 |
| Equivalence of `L^# = L` with O'Meara's `𝔳L = 𝔰L = R` | | ⬜ |

## 2. Local theory (O'Meara Ch. VI, IX)

| Item | Status |
|---|---|
| Quadratic defect; 63:1 (local square theorem), 63:2, 63:4, 63:5 | ⬜ |
| Jordan splittings (§91) | ⬜ |
| Non-dyadic classification (§92) | ⬜ |
| Dyadic: norm groups, weight ideals, 93:4, 93:16 | ⬜ |
| Local lemmas of PVYY §3 (Lemmas 3.2–3.5, Prop. 3.6) | ⬜ |

Mathlib already has `p`-adic fields, valuations, local fields, the Legendre symbol and
quadratic reciprocity. Hasse–Minkowski over ℚ (Hilbert symbol, reciprocity) exists
sorry-free in the `lean-pool` repository (PR #513), not yet in Mathlib.

## 3. Global theory (O'Meara Ch. X)

| Item | Lean | Status |
|---|---|---|
| Genus (via local isometry in congruence form), classes, `#O(L)`, class number, mass | `SameGenus`, `autCard`, `genusClasses`, `classNumber`, `mass` | defined |
| Finiteness of the class number of a genus (103:4) | `genusClasses_finite` | 📝 |
| Representation by the genus (locally represented ⇒ represented by some lattice in the genus) | | ⬜ |
| 105:1 Eichler's unique decomposition | `indecompDecomp_unique` | 📝 |
| Siegel mass formula; Körner's formula for `mass(I_n)` | | see §8 |

## 4. Universality and criterion sets

| Item | Lean | Status |
|---|---|---|
| `n`-universal lattices, `U_{𝓞_K}(n)` | `PDLattice.IsNUniversal`, `minRankNUniversal` | defined |
| Existence of `n`-universal lattices (Chan–Oh) | `exists_nUniversal` | 📝 |
| Criterion sets, minimal criterion sets | `IsCriterionSet`, `IsMinCriterionSet` | defined |
| Existence of finite criterion sets (Chan–Oh) | `exists_criterionSet` | 📝 |
| Lagrange four squares over ℤ | `Nat.sum_four_squares` (Mathlib) | ✅ |
| 15 theorem, 290 theorem | | ⬜ |

## 5. Park–Visser–Yatsyna–Yoon (`Universality/`; front door `Papers/PVYY.lean`)

| Item | Lean | Status |
|---|---|---|
| Theorem 9.1 (Euler transform bound) | `Nat.eulerTransform_le_pow_mul_factorial_sq` | 📝 ← **good first target** |
| Euler transform monotonicity, recursion | `Nat.eulerTransform_mono`, `Nat.eulerTransform_recursion` | 📝 |
| Lemma 4.1 (bounds on `U(n)` via indecomposables) | | ⬜ |
| Lemma 11.1, Prop. 11.2 (criterion sets) | | ⬜ |
| Theorems 1.1–1.4 | `log_minRankNUniversal_isBigO`, `exists_bound_…_of_minRankNUniversal_…` (`Universality/MinimalRank.lean`) | 📝 (existence forms) |
| Theorems 1.5–1.6 | `exists_bound_degree_discr_of_criterionSet_ncard_lt`, `exists_infinite_minCriterionSets` (`Universality/CriterionSet.lean`) | 📝 |
| Explicit bounds (3)–(5) | | ⬜ |
| Literature inputs as named hypotheses (Körner, Siegel, Odlyzko, Stark, Louboutin, Collins, Friedland, Wright, Bell) | | ⬜ |

## 6. Asymptotic local–global principle (effective Tartakowsky)

Papers: [HKK78] Hsia–Kitaoka–Kneser (Crelle 1978) · [HI99] Hsia–Icaza (Acta Arith. 1999) ·
[EffTart] our effective Tartakowsky theorem over totally real fields.
Files: `Definite/Represent.lean`, `Representation/Asymptotic.lean`, `Representation/Effective.lean`,
`Local/Jordan.lean`, `ForMathlib/…`, `LatticesCounterexamples/HsiaIcaza.lean`; front doors in `Papers/`.

**Design decision.** Local representation is *defined* by congruences modulo `𝔭^k` for all `k`
(`RepresentsNumAt`, `IsRepresentedByAt`), which for integral lattices is equivalent to
representation over `𝓞_𝔭` and needs no completions. Proving that equivalence is a TODO.

### 6a. Shared infrastructure

| Item | Used in | Status |
|---|---|---|
| Representation of numbers and lattices; local representation (congruence form) | all | defined |
| Trace minimum `μ(N)`; volume norm `N(𝔳M) = [M^# : M]` | HKK, EffTart | defined |
| Local lattices `M_𝔭` (via `HeightOneSpectrum.adicCompletionIntegers`) + equivalence with congruence form | all | ⬜ |
| Local square theorem (63:1) | EffTart 3.1, 5.1, 6.4, 7.8 | ⬜ |
| Jordan splittings into blocks of rank ≤ 2 (§91C); scale exponents | HKK 1.5; EffTart 3.3–3.5 | ⬜ |
| `𝔞`-maximal lattices: existence (82:18), one class (91:2), `Q(L) = 𝔞` in dim ≥ 4 (91:3) | HKK 1.1; EffTart 4.1–4.4 | ⬜ |
| Non-dyadic unimodular lattices (92:1, 92:1b) | EffTart 4.6, 4.7, 6.1, 6.4 | ⬜ |
| Universality of local spaces of dim ≥ 4 (63:18) | EffTart 4.1 | ⬜ |
| Hasse–Minkowski over number fields | EffTart 6.9 | ⬜ (over ℚ: lean-pool PR #513) |
| Genus, spinor genus, spinor norms (§§101–102, 91:6, 92:5) | HKK 1.2; EffTart 6.5–6.7 | ⬜ |
| `cls⁺ = spn⁺` over `𝓞_S` for indefinite `S` (104:5, strong approximation) | HKK 1.2; EffTart 6.10, 8.8 | ⬜ (hard) |
| Finiteness of the class number (103:4) | EffTart 6.10, 8.11 | ⬜ |
| Representation by the genus (102:5) | HKK 1.2 | ⬜ |
| Kneser neighbours along a hyperbolic plane | EffTart 8.3–8.11 | ⬜ |
| Humbert reduction | HKK §3; HI §6; EffTart 7.6 | ⬜ (hard: state as a hypothesis first) |
| Minkowski's second theorem; covering radius (Scherk) | EffTart 7.1, 7.2, 7.4 | ⬜ (first theorem is in Mathlib) |
| Covering radius of the unit lattice; Schinzel's bound | EffTart 7.3 | ⬜ (unit theorem, regulator in Mathlib) |
| Primes of degree one in ray classes | HKK 1.6 | ⬜ (hard; HKK's Remark: a weaker version suffices) |

### 6b. [HKK78]

| Item | Lean | Status |
|---|---|---|
| Lemma 1.4 (Dickson) | `Set.finite_setOf_minimal_fin_nat` | 📝 ← good first target |
| Lemmas 1.1–1.3, 1.5–1.7 | | ⬜ |
| Theorem 3 (Theorem 1 = case `K = ℚ`) | `PDLattice.exists_isRepresentedBy_of_traceMin` | 📝 |
| Tartakowsky over `K` (case `n = 1`, norm form) | `PDLattice.exists_representsNum_of_norm_gt` | 📝 |
| §2 (congruence conditions, primitive representations) | | ⬜ (lower priority) |

### 6c. [HI99]

| Item | Lean | Status |
|---|---|---|
| Counterexample to the application of Lemma 2.5(ii) (= EffTart Remark 6.2), mod 9 | `LatticesCounterexamples.HsiaIcaza.remark_6_2_mod_nine` | proved by `decide` (to be checked by compiling) |
| Same, over `ℤ₃` | `LatticesCounterexamples.HsiaIcaza.remark_6_2` | 📝 |
| Proposition 5.1 (value sets at unramified dyadic primes) | | ⬜ optional (sharper constants, EffTart Remark 4.5) |
| Theorem 3.1, Corollary 3.1, Theorem 6.1 | | covered by EffTart (corrected exponents) |

### 6d. [EffTart]

| Section | Content | Main dependencies | Status |
|---|---|---|---|
| §3 | Lemmas 3.1–3.6: local square theorem, Jordan splittings, scale exponents | 63:1, §91 | Lemma 3.5 📝 (`Local.sub_three_mul_le_sum`) |
| §4 | Lemma 4.1–Prop. 4.7: lower bounds for local value sets | maximal lattices, 92:1 | ⬜ |
| §5 | Prop. 5.1, Cor. 5.2: exact dyadic square-class covering | §4, 63:1 | ⬜ |
| §6 | Lemmas 6.1–6.10: odd primes, `q`, spinor genera, Hsia's theorem | 91:6, 92:5, 104:5, 103:4 | ⬜ |
| §7 | Theorems 7.1–7.9: global assembly and explicit constants | §§4–6, Humbert, Minkowski II | ⬜ |
| §8 | Lemma 8.1–Cor. 8.14: neighbours, explicit bound for `r` | §7, 104:5 | Lemma 8.1 📝 (`NumberField.card_setOf_abs_conj_le`) |
| Thm 8.13 | Bound on the auxiliary prime `q ≤ 4|d_F|D` | Bertrand | proved (`Nat.exists_prime_not_dvd_le_two_mul`) |
| Cor. 1.4 | Fully explicit threshold | everything | 📝 (`PDLattice.representsNum_of_norm_gt_effectiveTartakowskyBound`) |

### Suggested order

1. **Elementary lemmas**: Lemma 3.5, Dickson (HKK 1.4), Lemma 8.1, the ℤ₃ counterexample.
2. **Local theory over `𝓞_𝔭`** (§§3–5 of EffTart, Lemmas 8.4–8.7): local square theorem, Jordan
   splittings, maximal lattices, then Propositions 4.4, 4.7, 5.1. Purely local and self-contained;
   good candidates for upstreaming to Mathlib.
3. **Conditional global assembly** (§7 of EffTart): state 104:5, 103:4, Humbert reduction and
   Minkowski's second theorem as named hypotheses, and prove Theorem 7.8 and Corollary 7.9 from
   them. This is where the explicit constants live, and where a formalisation adds most value.
4. **Discharge hypotheses** one at a time (neighbours in §8 first; strong approximation last).

## 7. Reduction theory (Humbert)

Papers: [Hu40] Humbert's thesis, Comment. Math. Helv. 12 (1939/40), 263–306 ("T");
[Hu49] Humbert, Comment. Math. Helv. 23 (1949), 50–63. File: `Reduction/Humbert.lean`; front door `Papers/Humbert.lean`.

[Hu49] builds on [Hu40] throughout (existence of reduced systems, the domain `R₀`, T Théorèmes 1, 4, 6),
so formalising [Hu49] means formalising the relevant parts of [Hu40] too. Both work with *matrices*,
i.e. free lattices; passing to non-free lattices uses Steinitz + Minkowski's bound
([EffTart, Lemma 7.5]).

| Item | Lean | Status |
|---|---|---|
| Systems of positive forms (totally real case), action `S ↦ S[A]` | `System`, `IsPosSystem`, `transform` | defined |
| Domain `R(c₁, c₂, c₃)`, [Hu49, (2)–(4)] | `InDomain` | defined (check against the paper) |
| Fischer-type inequality `|𝔖| ≤ |𝔖₁||𝔖₂|⋯` ([Hu49, (1)]); `R_m(c)` is stable under truncation | | ⬜ (Mathlib has `Matrix.PosDef`; Hadamard/Fischer may need adding) |
| First transformation into `R(c)` with bounded index ([Hu40, Th. 1, 4]; EffTart Prop. 7.6) | `exists_reducing_matrix` | 📝 (the statement used downstream) |
| Explicit constants `c₁ = c_H²`, `c₃(n)`, `c₀(n)` (EffTart Remark 7.7) | | ⬜ |
| [Hu49, Théorème 1] (boundedness of transition matrices) | `Reduction.transition_matrix_bounded` | 📝 |
| [Hu49, Théorème 2] (inverse system reversed lies in `R(c')`) | `Reduction.inv_reverse_inDomain` | 📝 |
| §2: Hermite majorants (varieties `H` of positive forms attached to an indefinite form); Théorème 3 (simultaneous diagonalisation, hermitian case) | | ⬜ |
| §3–4: reduced indefinite forms; Théorème 4 (finitely many reduced forms of given determinant norm) | | ⬜ |
| Théorème 5 (finite class number, definite and indefinite, quadratic case) | `Reduction.finite_classes_symm_matrix` | 📝 |
| Théorème 5, hermitian case | | ⬜ |
| §5: unit groups of indefinite forms are finitely generated | | ⬜ (the paper only sketches the fundamental domain) |
| Complex places (hermitian components of systems) | | ⬜ |

**A shortcut for the definite case.** For totally positive lattices over a totally real field, finiteness
of the class number can also be obtained via the trace form `Tr_{K/ℚ} ∘ B`, a positive definite
`ℤ`-lattice of rank `dn`: Hermite/Minkowski reduction over `ℤ` bounds the `ℤ`-lattice, and the
`𝓞_K`-structure is pinned down by the (bounded) images of short vectors. This avoids [Hu40] for
`genusClasses_finite`. It does not give the per-embedding inequalities of `InDomain` that
[EffTart, §7] uses, so Humbert is still needed for the explicit constants there (unless §7 is
redone with a trace-form substitute, which would change the constants).

## 8. Siegel's mass formula

Papers: C. L. Siegel, *Über die analytische Theorie der quadratischen Formen* I (Ann. of Math. 36,
1935, definite over `ℤ`), II (1936, indefinite), III (Ann. of Math. 38, 1937, number fields).
Downstream use: Körner's explicit formula for `mass(I_n)` and the local densities in PVYY §5.

| Stage | Content | Status |
|---|---|---|
| Definitions | genus, `#O(L)`, class number, mass | defined (`Global/Genus.lean`); the analytic stages below go in `Analytic/` |
| Local densities | `α_𝔭(L, L)` as a limit of counts modulo `𝔭^k`; stabilisation for `k > 2·ord(4 d_L)` ([Sie35, Hilfssatz 13]) | ⬜ |
| Good primes | `|O_n(𝔽_q)|` and Hensel lifting ⇒ `α_𝔭` for unimodular `L` at odd `𝔭` ([Sie37, Hilfssatz 56]) | ⬜ ← self-contained, good target |
| Dyadic primes | Pfeuffer's decomposition, bounds used in PVYY Thm 5.9 | ⬜ |
| Real density | `α_∞` via volumes of spheres / Gamma functions | ⬜ (Mathlib has `Real.Gamma`, volumes of balls) |
| Volume of `SL_n(ℤ)\SL_n(ℝ)` (Minkowski–Siegel: `ζ(2)⋯ζ(n)`) | via Minkowski reduction and induction, or Siegel's mean value theorem | ⬜ (large) |
| Mass formula over `ℤ` | Siegel I | ⬜ (large) |
| Mass formula over totally real `K` | Siegel III, needs a reduction theory over `K` (§7) | ⬜ (large) |
| Körner's explicit `mass_K(I_n)` | from the above + local densities | ⬜ |
| Sanity check of the formula side | Körner at `K = ℚ`, `n = 3, 4` gives `1/48`, `1/384` (uses `ζ(2) = π²/6`, in Mathlib) | ⬜ ← small target |

Two routes: Siegel's original argument (reduction theory, volumes of fundamental domains, a limiting
process with local densities), which shares Humbert's reduction theory with §7; or Weil's
Tamagawa-number route (`τ(SO) = 2`), which needs adelic Haar measures and Poisson summation
(Mathlib has adèles, Haar measure and Fourier analysis, but not Tamagawa measures). Either is a
multi-year effort; until then the mass formula enters as a named hypothesis.

## 9. Other papers

Add a file `Papers/<Name>.lean` per paper, with statements first.
