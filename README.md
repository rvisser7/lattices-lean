# lattices-lean

Formalising the arithmetic theory of quadratic lattices over rings of integers
(`𝓞 K`-lattices) in Lean 4 with Mathlib: foundations following O'Meara's
*Introduction to Quadratic Forms*, local and global theory, reduction theory,
local–global principles, universality, and results from our papers.

**Status:** skeleton. Files contain definitions and theorem *statements*; `sorry`
marks results still to be proved. See [`ROADMAP.md`](ROADMAP.md).

## Setting up

1. Install VS Code, the **Lean 4** extension, and `git`.
2. Create a fresh Mathlib project (this pins matching Lean and Mathlib versions):
   ```bash
   lake +leanprover-community/mathlib4:lean-toolchain new lattices-lean math
   cd lattices-lean
   ```
3. Copy the contents of this archive into that folder, **overwriting** `lakefile.toml` and
   `LatticesLean.lean`, and delete the generated `LatticesLean/Basic.lean`.
   (The provided `lakefile.toml` adds the `LatticesCounterexamples` library; Mathlib's version is pinned
   in `lake-manifest.json`, which `lake new` created.)
4. Download precompiled Mathlib and build:
   ```bash
   lake exe cache get
   lake build
   ```
5. Push to GitHub. `.github/workflows/ci.yml` builds everything on every push and lists the
   remaining `sorry`s on the run's summary page.

The files were written without being compiled. Expect a few small errors from Mathlib API
names; fix them (or ask on Zulip) before adding new material.

## Layout

The library is organised by **mathematical subject**, not by source.

| Folder | Contents |
|---|---|
| `LatticesLean/ForMathlib/` | General lemmas that belong in Mathlib, mirroring Mathlib's paths and namespaces (valuations, number theory, geometry of numbers, Dickson's lemma, Euler transform, …) |
| `LatticesLean/Foundations/` | Quadratic spaces and lattices over a Dedekind domain: scale, norm, dual, unimodularity, representations, isometries, orthogonal splittings; bridge to Mathlib's `QuadraticForm` |
| `LatticesLean/Forms/` | Quadratic forms over fields: Witt's theorem, Witt groups, finite/local/global fields, Hilbert symbol and reciprocity, Hasse–Minkowski |
| `LatticesLean/Algebras/` | Central simple, quaternion and Hasse algebras (Clifford algebras are in Mathlib) |
| `LatticesLean/OrthogonalGroup/` | Symmetries, spinor norm, local and global orthogonal groups, strong approximation |
| `LatticesLean/Local/` | Lattices over `𝓞_𝔭`: Jordan splittings, maximal lattices, non-dyadic and dyadic classification, value sets |
| `LatticesLean/Global/` | Genus, spinor genus, class numbers, neighbours, Eichler's decomposition, mass |
| `LatticesLean/Definite/` | Positive definite lattices over totally real fields (`PDLattice`), representation of numbers, local representation, minima, volumes; unimodular `ℤ`-lattices |
| `LatticesLean/Indefinite/` | Hermite reduction, automorphs and unit groups of indefinite forms |
| `LatticesLean/Binary/` | Binary quadratic forms: composition, genera, Pell |
| `LatticesLean/Reduction/` | Reduction theory of definite forms (Minkowski, Humbert), Siegel domains |
| `LatticesLean/Representation/` | Local–global principles: Tartakowsky, Hsia–Kitaoka–Kneser, effective versions |
| `LatticesLean/Universality/` | `n`-universal lattices, criterion sets, the minimal rank `U_{𝓞_K}(n)` |
| `LatticesLean/Analytic/` | Local densities, Siegel's mass formula, Tamagawa numbers, theta series |
| `LatticesLean/Applications/` | Applications outside lattice theory (Bruck–Ryser–Chowla) |
| `LatticesLean/Papers/` | Front doors: each paper's main results under the paper's numbering, as aliases of library theorems |
| `LatticesCounterexamples/` | Separate library of counterexamples (e.g. to steps in published proofs); not named `Counterexamples`, which would clash with Mathlib's own library of that name |
| `docs/references.bib` | Bibliography; docstrings cite keys such as `[HKK78, Theorem 3]` |
| `docs/coverage/` | Section-by-section integration maps for the textbooks ([`OMeara.md`](docs/coverage/OMeara.md), [`Cassels.md`](docs/coverage/Cassels.md)) |
| `scripts/coverage.py` | Generates per-source progress tables from docstring citations |

Folders without Lean files yet contain a `README.md` listing the planned files and their sources.

## Textbooks

A long-term goal is to formalise O'Meara's *Introduction to Quadratic Forms* and Cassels'
*Rational Quadratic Forms*. Their sections are mapped to folders in `docs/coverage/`. The books
are not mirrored as folders: their results go into the thematic folders like everything else,
cited by section, e.g. `**[OMeara63, 82:15a]**` or `**[Cassels78, Lemma 9.3.1]**`.
Where Cassels' statement is the `K = ℚ` case of O'Meara's, prove the general version and derive
Cassels' as a one-line corollary next to it. Results already in Mathlib are not repeated.

Progress is tracked automatically: `python3 scripts/coverage.py` scans docstring citations and
writes `docs/coverage/generated/<KEY>.md`, listing every cited result with its Lean name and
status (proved / stated / defined / alias). CI prints the summary on each run.

## Conventions

* **Where results go.** Results others would cite (classical theorems, and results of our papers
  once stable) go in the thematic folders under descriptive names, with the source cited in the
  docstring in the form `[KEY, locator]`, e.g. `**[HKK78, Theorem 3]**`, so that
  `scripts/coverage.py` can find it. `Papers/` files only restate results in the paper's
  numbering via `alias`, plus genuinely paper-specific material. A new paper may be developed
  inside `Papers/` while in flux, then moved into the thematic folders once stable.
* **`ForMathlib/`** uses Mathlib's namespaces (e.g. `Nat.eulerTransform`), so files can be
  upstreamed with minimal changes.
* **Names** follow Mathlib's naming conventions: they describe the statement
  (`exists_bound_degree_discr_of_minRankNUniversal_lt`), not its number.
* A quadratic space is `(V, B)` with `B` a **symmetric bilinear form** and `Q x = B x x`
  (O'Meara's convention). We do not use Mathlib's `QuadraticForm` directly, whose associated
  bilinear form differs by a factor of 2.
* Lattices are `Submodule R V` and are **not** assumed free.
* "All lattices of rank `n`" is realised as `PDLattice K n`: a form and a lattice on `K^n`.
* Local representation is defined by congruences modulo `𝔭^k` for all `k` (equivalent to
  representation over `𝓞_𝔭` for integral lattices); proving the equivalence is on the roadmap.
* Deep literature results we do not (yet) prove enter as explicitly named hypotheses, never as
  silent `axiom`s.

## Contributing

* Work on a branch and open a pull request; CI must pass.
* Replace `sorry`s one at a time. `exact?`, `apply?`, and
  [Loogle](https://loogle.lean-lang.org) help find Mathlib lemmas.
* Questions: the Lean Zulip (`#new members`, `#number theory`).
