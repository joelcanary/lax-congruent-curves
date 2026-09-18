import Mathlib.Tactic
import Lax712553.Involution

namespace Lax712553Proofs.Involution

/--
---
conclusion: Lax712553.Involution.even_card_of_fixedPointFree_involution
---
Strong induction on the cardinality, removing a pair `{x, f x}` at each step;
the restriction of `f` to what remains is again a fixed-point-free involution.
-/
theorem even_card_of_fixedPointFree_involution {α : Type*} [DecidableEq α]
    (S : Finset α) (f : α → α) (hmaps : ∀ x ∈ S, f x ∈ S) (hinv : ∀ x ∈ S, f (f x) = x)
    (hfree : ∀ x ∈ S, f x ≠ x) : Even S.card := by
  revert f
  induction S using Finset.strongInduction with
  | _ S ih =>
    intro f hmaps hinv hfree
    rcases S.eq_empty_or_nonempty with hemp | ⟨x, hx⟩
    · simp [hemp]
    · set y := f x with hydef
      have hy : y ∈ S := hmaps x hx
      have hxy : x ≠ y := (hfree x hx).symm
      set S' := (S.erase x).erase y with hS'def
      have hxS' : x ∉ S' := by simp [hS'def]
      have hyS' : y ∉ S' := by simp [hS'def]
      have hss : S' ⊂ S := by
        apply Finset.ssubset_iff_of_subset (by
          intro a ha
          simp only [hS'def, Finset.mem_erase] at ha
          exact ha.2.2) |>.mpr
        exact ⟨x, hx, hxS'⟩
      have hcard : S.card = S'.card + 2 := by
        have h1 : (S.erase x).card = S.card - 1 := Finset.card_erase_of_mem hx
        have hyS_erase : y ∈ S.erase x := Finset.mem_erase.mpr ⟨Ne.symm hxy, hy⟩
        have h2 : S'.card = (S.erase x).card - 1 := Finset.card_erase_of_mem hyS_erase
        have hSpos : 1 ≤ S.card := Finset.card_pos.mpr ⟨x, hx⟩
        have hSpos2 : 1 ≤ (S.erase x).card := Finset.card_pos.mpr ⟨y, hyS_erase⟩
        omega
      have hfinj : ∀ a ∈ S, ∀ b ∈ S, f a = f b → a = b := by
        intro a ha b hb hab
        have := hinv a ha
        rw [hab, hinv b hb] at this
        exact this.symm
      have hmaps' : ∀ z ∈ S', f z ∈ S' := by
        intro z hz
        have hzS : z ∈ S := by
          simp only [hS'def, Finset.mem_erase] at hz
          exact hz.2.2
        have hzx : z ≠ x := by
          simp only [hS'def, Finset.mem_erase] at hz
          exact hz.2.1
        have hzy : z ≠ y := by
          simp only [hS'def, Finset.mem_erase] at hz
          exact hz.1
        have hfz : f z ∈ S := hmaps z hzS
        have hfzx : f z ≠ x := by
          intro hcon
          apply hzy
          have hfyx : f y = x := by rw [hydef]; exact hinv x hx
          have heq : f z = f y := hcon.trans hfyx.symm
          exact hfinj z hzS y hy heq
        have hfzy : f z ≠ y := by
          intro hcon
          apply hzx
          have heq : f z = f x := hcon.trans hydef
          exact hfinj z hzS x hx heq
        simp only [hS'def, Finset.mem_erase]
        exact ⟨hfzy, hfzx, hfz⟩
      have hinv' : ∀ z ∈ S', f (f z) = z := by
        intro z hz
        have hzS : z ∈ S := by
          simp only [hS'def, Finset.mem_erase] at hz; exact hz.2.2
        exact hinv z hzS
      have hfree' : ∀ z ∈ S', f z ≠ z := by
        intro z hz
        have hzS : z ∈ S := by
          simp only [hS'def, Finset.mem_erase] at hz; exact hz.2.2
        exact hfree z hzS
      obtain ⟨k, hk⟩ := ih S' hss f hmaps' hinv' hfree'
      exact ⟨k + 1, by omega⟩

end Lax712553Proofs.Involution
