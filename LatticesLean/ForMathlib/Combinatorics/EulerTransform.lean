import Mathlib

/-!
# The Euler transform

If there are `a k` distinct "indecomposable" objects of size `k`, then the number of
multisets of them of total size `n` is the *Euler transform*
`b n = ∑_{partitions p of n} ∏_{i} multichoose (a i) (multiplicity of i in p)`,
equivalently `∏_{k ≥ 1} (1 - X^k)^{-a k} = ∑ b n X^n`.

In lattice theory ([PVYY, §4]): for unimodular lattices over a totally real field,
`b n` = number of rank-`n` classes and
`a k` = number of indecomposable rank-`k` classes (by Eichler's theorem).

Independent of the lattice files: a good place to start proving things.
-/

namespace Nat

/-- The Euler transform of `a`. -/
def eulerTransform (a : ℕ → ℕ) (n : ℕ) : ℕ :=
  ∑ p : n.Partition, ∏ i ∈ p.parts.toFinset, Nat.multichoose (a i) (p.parts.count i)

-- Sanity check: with `a = 1` we should get the partition numbers 1, 1, 2, 3, 5, 7, 11, 15.
-- #eval (List.range 8).map (eulerTransform fun _ => 1)

/-- `c k = ∑_{d ∣ k} d * a d`, which appears in the standard recursion. -/
def eulerC (a : ℕ → ℕ) (k : ℕ) : ℕ :=
  ∑ d ∈ k.divisors, d * a d

/-- The standard recursion `n b_n = ∑_{k=1}^n c_k b_{n-k}` (see e.g. [SP95, p. 20]). -/
theorem eulerTransform_recursion (a : ℕ → ℕ) (n : ℕ) :
    n * eulerTransform a n =
      ∑ k ∈ Finset.Icc 1 n, eulerC a k * eulerTransform a (n - k) := by
  sorry

/-- The Euler transform is monotone in `a`.

Hint: `Finset.sum_le_sum`, `Finset.prod_le_prod`, and monotonicity of `Nat.multichoose`
in its first argument (via `Nat.multichoose_eq` and `Nat.choose_le_choose`). -/
theorem eulerTransform_mono {a a' : ℕ → ℕ} (h : ∀ k, a k ≤ a' k) (n : ℕ) :
    eulerTransform a n ≤ eulerTransform a' n := by
  sorry

/-- **[PVYY, Theorem 9.1]**, in the form `b_n ≤ C^n (n!)^2` where `C ≥ max(a_1, …, a_n)`.

Proof idea: by monotonicity reduce to `a = C` constant on `1..n`; then each partition
contributes at most `C^n`, and there are at most `n!` (indeed `≤ 2^n`) partitions. -/
theorem eulerTransform_le_pow_mul_factorial_sq (a : ℕ → ℕ) (n C : ℕ) (hC : 1 ≤ C)
    (ha : ∀ k, 1 ≤ k → k ≤ n → a k ≤ C) :
    eulerTransform a n ≤ C ^ n * n.factorial ^ 2 := by
  sorry

end Nat
