import Mathlib

/-!
# A prime not dividing `N`, of size at most `2N`

Used for the auxiliary prime `q` in [EffTart, Theorem 8.13].
-/

/-- For `N ≥ 1` there is a prime `p ∤ N` with `p ≤ 2N` (Bertrand's postulate).
With `N = 2|d_F| D` this gives `q ≤ 4|d_F| D` as in [EffTart, Theorem 8.13]. -/
theorem Nat.exists_prime_not_dvd_le_two_mul (N : ℕ) (hN : N ≠ 0) :
    ∃ p, p.Prime ∧ ¬ p ∣ N ∧ p ≤ 2 * N := by
  obtain ⟨p, hp, hNp, hp2⟩ := Nat.exists_prime_lt_and_le_two_mul N hN
  exact ⟨p, hp, Nat.not_dvd_of_pos_of_lt (Nat.pos_of_ne_zero hN) hNp, hp2⟩
