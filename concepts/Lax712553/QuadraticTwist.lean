import Mathlib.NumberTheory.LegendreSymbol.QuadraticChar.Basic

/-!
---
title: The congruent number curves are quadratic twists of y² = x³ − x
type: theorem
---
The congruent number curve of $n$ is $E_n : y^2 = x^3 - n^2 x$. For a prime $p$,
the trace of Frobenius $a_p(E_n) = p + 1 - \#E_n(\mathbb{F}_p)$ is the character
sum $-\sum_{x \in \mathbb{F}_p} \chi(x^3 - n^2 x)$, where $\chi$ is the quadratic
character of $\mathbb{F}_p$ with $\chi(0) = 0$: each $x$ contributes $1 + \chi(f(x))$
points. This concept defines $a_p$ by that sum.

The statement is the quadratic twist formula: for every prime $p$ and every
integer $n$ not divisible by $p$,

$$a_p(E_n) = \chi(n)\, a_p(E_1),$$

so every $E_n$ is the quadratic twist of $E_1 : y^2 = x^3 - x$ by $n$. The
identity is exact at the level of character sums; it is the substitution
$x = n t$, a bijection of $\mathbb{F}_p$ because $n$ is invertible, together with
$\chi(n^3) = \chi(n)$.
-/

namespace Lax712553.QuadraticTwist

/-- The trace of Frobenius of `E_n : y² = x³ − n² x` at the prime `p`, as the
character sum `−∑_x χ(x³ − n² x)`. -/
noncomputable def a_p (n : ℤ) (p : ℕ) [Fact p.Prime] : ℤ :=
  -∑ x : ZMod p, quadraticChar (ZMod p) (x ^ 3 - (n : ZMod p) ^ 2 * x)

/-- The quadratic twist formula `a_p(E_n) = χ(n) a_p(E_1)` for `p ∤ n`. -/
axiom a_p_twist (n : ℤ) (p : ℕ) [Fact p.Prime] (hn : (n : ZMod p) ≠ 0) :
    a_p n p = quadraticChar (ZMod p) (n : ZMod p) * a_p 1 p

end Lax712553.QuadraticTwist
