import LatticesLean.Reduction.Humbert

/-!
# Humbert's reduction theory

* [Hu40] P. Humbert, Comment. Math. Helv. 12 (1939/40), 263–306 (thesis, "T");
* [Hu49] P. Humbert, Comment. Math. Helv. 23 (1949), 50–63.

Front door. The library versions live in `Reduction/Humbert.lean`.
-/

namespace LatticesLean.Papers.Humbert

/-- [Hu40, Théorèmes 1, 4] (first transformation into `R(c)`). -/
alias thesis_thm_1_4 := LatticesLean.Reduction.exists_reducing_matrix

/-- [Hu49, Théorème 1]. -/
alias thm_1 := LatticesLean.Reduction.transition_matrix_bounded

/-- [Hu49, Théorème 2]. -/
alias thm_2 := LatticesLean.Reduction.inv_reverse_inDomain

/-- [Hu49, Théorème 5] (quadratic case). -/
alias thm_5 := LatticesLean.Reduction.finite_classes_symm_matrix

end LatticesLean.Papers.Humbert
