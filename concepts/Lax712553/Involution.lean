import Mathlib.Data.Finset.Card
import Mathlib.Algebra.Group.Even

/-!
---
title: A finite set with a fixed-point-free involution has even cardinality
type: theorem
---
Let `S` be a finite set and `f` a map with `f (f x) = x` and `f x ≠ x` for every
`x ∈ S`, and which sends `S` into itself. Then the elements of `S` come in pairs
`{x, f x}`, so `S` has an even number of elements. This is the elementary counting
principle behind parity arguments of the kind "the number of representations is
even because negating one coordinate is a fixed-point-free involution".
-/

namespace Lax712553.Involution

/-- A finite set carrying a fixed-point-free involution has even cardinality. -/
axiom even_card_of_fixedPointFree_involution {α : Type*} [DecidableEq α]
    (S : Finset α) (f : α → α) (hmaps : ∀ x ∈ S, f x ∈ S) (hinv : ∀ x ∈ S, f (f x) = x)
    (hfree : ∀ x ∈ S, f x ≠ x) : Even S.card

end Lax712553.Involution
