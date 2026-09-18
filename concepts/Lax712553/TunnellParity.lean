import Mathlib.Data.Finset.Prod
import Mathlib.Order.Interval.Finset.Int
import Mathlib.Algebra.Ring.Parity

/-!
---
title: Tunnell's representation counts are even
type: theorem
---
Tunnell's theorem expresses the congruent number property of a squarefree $n$
through the numbers of integer solutions of
$2x^2 + y^2 + 32z^2 = n$, $2x^2 + y^2 + 8z^2 = n$ ($n$ odd) and
$4x^2 + y^2 + 32z^2 = m$, $4x^2 + y^2 + 8z^2 = m$ ($n = 2m$). In all four the
coefficients of $x^2$ and $z^2$ are even and positive.

This concept defines the solution set of $a x^2 + y^2 + c z^2 = n$ as the finite
set of integer triples with all coordinates in $[-n, n]$ (for $a, c > 0$ and
$n \ge 0$ this contains every solution, since each square is at most $n$), and
states that for even $a$ and $c$ and odd $n$ its cardinality is even. The
reason is the fixed-point-free involution $(x, y, z) \mapsto (x, -y, z)$: a fixed
point would have $y = 0$, hence $n = a x^2 + c z^2$ even.

The positivity hypotheses on $a$ and $c$ are not needed for the parity argument;
they are what makes the bounded set equal to the full solution set, so that the
statement is about Tunnell's counts and not about a truncation of them.
-/

namespace Lax712553.TunnellParity

/-- The integer solutions of `a x² + y² + c z² = n` with coordinates in `[-n, n]`. -/
noncomputable def solutions (a c n : ℤ) : Finset (ℤ × ℤ × ℤ) :=
  ((Finset.Icc (-n) n) ×ˢ (Finset.Icc (-n) n) ×ˢ (Finset.Icc (-n) n)).filter
    (fun p => a * p.1 ^ 2 + p.2.1 ^ 2 + c * p.2.2 ^ 2 = n)

/-- For even positive `a`, `c` and odd `n ≥ 0`, the number of solutions is even. -/
axiom even_card_solutions (a c n : ℤ) (ha : Even a) (hc : Even c) (hn : Odd n)
    (hn0 : 0 ≤ n) (ha_pos : 0 < a) (hc_pos : 0 < c) :
    Even (solutions a c n).card

end Lax712553.TunnellParity
