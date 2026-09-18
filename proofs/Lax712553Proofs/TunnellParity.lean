import Mathlib.Tactic
import Lax712553.TunnellParity
import Lax712553Proofs.Involution

namespace Lax712553Proofs.TunnellParity

open Lax712553.TunnellParity

/--
---
conclusion: Lax712553.TunnellParity.even_card_solutions
---
The map `(x, y, z) ↦ (x, −y, z)` preserves the equation and the bounds; a fixed
point has `y = 0`, so `n = a x² + c z²` would be even.
-/
theorem even_card_solutions (a c n : ℤ) (ha : Even a) (hc : Even c) (hn : Odd n)
    (hn0 : 0 ≤ n) (ha_pos : 0 < a) (hc_pos : 0 < c) :
    Even (solutions a c n).card := by
  apply Lax712553Proofs.Involution.even_card_of_fixedPointFree_involution (solutions a c n) (fun p => (p.1, -p.2.1, p.2.2))
  · intro p hp
    simp only [solutions, Finset.mem_filter, Finset.mem_product, Finset.mem_Icc] at hp ⊢
    obtain ⟨⟨⟨hx1, hx2⟩, ⟨hy1, hy2⟩, ⟨hz1, hz2⟩⟩, heq⟩ := hp
    exact ⟨⟨⟨hx1, hx2⟩, ⟨by omega, by omega⟩, ⟨hz1, hz2⟩⟩, by rw [neg_sq]; exact heq⟩
  · intro p hp
    simp
  · intro p hp hcon
    simp only [solutions, Finset.mem_filter, Finset.mem_product, Finset.mem_Icc] at hp
    obtain ⟨_, heq⟩ := hp
    have hy0 : p.2.1 = 0 := by
      have heqp : (p.1, -p.2.1, p.2.2) = p := hcon
      have : -p.2.1 = p.2.1 := congrArg (fun q => q.2.1) heqp
      omega
    rw [hy0] at heq
    have heven : Even (a * p.1 ^ 2 + (0 : ℤ) ^ 2 + c * p.2.2 ^ 2) := by
      obtain ⟨k, hk⟩ := ha
      obtain ⟨j, hj⟩ := hc
      exact ⟨k * p.1 ^ 2 + 0 + j * p.2.2 ^ 2, by rw [hk, hj]; ring⟩
    rw [heq] at heven
    exact (Int.not_odd_iff_even.mpr heven) hn

end Lax712553Proofs.TunnellParity
