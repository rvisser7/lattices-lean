# Forms/ — quadratic forms over fields

Built on Mathlib's `QuadraticForm` (see `Foundations/Bridge.lean`).
Sources: [OMeara63] §§42, 61–66, 71–73; [Cassels78] Ch. 2–4, 6.

Planned files:
- `Basic.lean` — regular spaces, orthogonal splittings, isotropy, hyperbolic planes ([OMeara63, §42]; [Cassels78, 2.2, 2.6])
- `Witt.lean` — Witt's extension theorem and cancellation ([OMeara63, §42]; [Cassels78, 2.4])
- `WittGroup.lean` — Grothendieck–Witt and Witt groups; local and rational Witt groups ([Cassels78, 2.5, 4.3, 6.11])
- `FiniteField.lean` — classification over finite fields ([OMeara63, §62])
- `LocalField.lean` — quadratic defect, local square theorem (63:1), Hilbert symbol, Hasse invariant, classification ([OMeara63, §63]; [Cassels78, 3.2, Ch. 4])
- `GlobalField.lean` — squares and norms in global fields ([OMeara63, §§64–65])
- `HasseMinkowski.lean` — Hasse–Minkowski over global fields, Meyer, approximation ([OMeara63, §66]; [Cassels78, 6.2–6.6, 6.9]); the case `ℚ` exists in lean-pool (PR #513)
- `HilbertReciprocity.lean` — Hilbert reciprocity, forms with prescribed local behaviour ([OMeara63, §§71–72]; [Cassels78, 3.3, 6.7])
- `SmallSolutions.lean` — Cassels' bound on small zeros ([Cassels78, 6.8])
