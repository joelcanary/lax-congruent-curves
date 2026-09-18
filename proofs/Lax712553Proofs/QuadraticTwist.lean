import Mathlib.Tactic
import Lax712553.QuadraticTwist

namespace Lax712553Proofs.QuadraticTwist

open Lax712553.QuadraticTwist

/--
---
conclusion: Lax712553.QuadraticTwist.a_p_twist
---
Substitute `x = n t` in the character sum (a bijection of `ZMod p` since `n` is a
unit), factor `χ(n³ (t³ − t)) = χ(n)³ χ(t³ − t)`, and use `χ(n)³ = χ(n)`.
-/
theorem a_p_twist (n : ℤ) (p : ℕ) [Fact p.Prime] (hn : (n : ZMod p) ≠ 0) :
    a_p n p = quadraticChar (ZMod p) (n : ZMod p) * a_p 1 p := by
  have hcube : quadraticChar (ZMod p) ((n : ZMod p) ^ 3) = quadraticChar (ZMod p) (n : ZMod p) := by
    have h3 : (n : ZMod p) ^ 3 = (n : ZMod p) * (n : ZMod p) * (n : ZMod p) := by ring
    rw [h3, map_mul, map_mul]
    rcases quadraticChar_dichotomy hn with h | h <;> rw [h] <;> ring
  unfold a_p
  have hbij : ∑ x : ZMod p, quadraticChar (ZMod p) (x ^ 3 - (n : ZMod p) ^ 2 * x)
      = ∑ t : ZMod p, quadraticChar (ZMod p)
          (((n : ZMod p) * t) ^ 3 - (n : ZMod p) ^ 2 * ((n : ZMod p) * t)) :=
    (Equiv.sum_comp (Equiv.mulLeft₀ (n : ZMod p) hn)
      (fun x => quadraticChar (ZMod p) (x ^ 3 - (n : ZMod p) ^ 2 * x))).symm
  rw [hbij]
  have hstep : ∀ t : ZMod p,
      quadraticChar (ZMod p) (((n : ZMod p) * t) ^ 3 - (n : ZMod p) ^ 2 * ((n : ZMod p) * t))
        = quadraticChar (ZMod p) (n : ZMod p) * quadraticChar (ZMod p) (t ^ 3 - t) := by
    intro t
    have heq : ((n : ZMod p) * t) ^ 3 - (n : ZMod p) ^ 2 * ((n : ZMod p) * t)
        = (n : ZMod p) ^ 3 * (t ^ 3 - t) := by ring
    rw [heq, map_mul, hcube]
  simp_rw [hstep]
  rw [← Finset.mul_sum]
  ring

end Lax712553Proofs.QuadraticTwist
