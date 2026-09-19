# Congruent number curves: the quadratic twist formula for a_p and the parity of Tunnell's representation counts

**Lax Lean Archive record [`lax-712553`](https://laxarchive.org/lax-712553/)** — registered, permanent and citable.
Every statement in `concepts/` is proved in `proofs/` with no assumptions: **3 of 3 statements proved**,
rebuilt by the archive on its own machines against a pinned Mathlib before registration.

The congruent number curves $E_n : y^2 = x^3 - n^2 x$ are the quadratic twists of $E_1 : y^2 = x^3 - x$ by $n$: for every prime $p$ not dividing $n$, the trace of Frobenius satisfies $a_p(E_n) = \left(\tfrac{n}{p}\right) a_p(E_1)$. This submission proves that identity at the level of the defining character sums $a_p(E_n) = -\sum_{x \in \mathbb{F}_p} \chi(x^3 - n^2 x)$, by the substitution $x = n t$.

It also proves the parity fact behind Tunnell's criterion: for even positive coefficients $a, c$ and odd $n$, the number of integer solutions of $a x^2 + y^2 + c z^2 = n$ is even, which covers the four representation counts $2x^2 + y^2 + 32z^2$, $2x^2 + y^2 + 8z^2$, $4x^2 + y^2 + 32z^2$ and $4x^2 + y^2 + 8z^2$ in Tunnell's theorem. The argument is the fixed-point-free involution $(x, y, z) \mapsto (x, -y, z)$, and the counting principle it rests on, that a finite set with a fixed-point-free involution has even cardinality, is stated and proved on its own.

Both results are classical; the contribution is their formal statement and kernel-checked proof, with the solution set of Tunnell's equations represented explicitly as a finite set so that the theorem is about the counts themselves.

## What is inside

| Concept | Type | Title | Proved / stated |
|---|---|---|---|
| `Involution` | theorem | A finite set with a fixed-point-free involution has even cardinality | 1 / 1 |
| `QuadraticTwist` | theorem | The congruent number curves are quadratic twists of y² = x³ − x | 1 / 1 |
| `TunnellParity` | theorem | Tunnell's representation counts are even | 1 / 1 |

Each concept file states its results as `axiom`s beside a natural-language description
(that is the archive's format: statements are separated from proofs); the proof of each
one lives in `proofs/` and is checked by the Lean kernel. `build-output.json` is the
archive's own build record for this source commit.

## How to cite

In LaTeX, cite the record id: `\cite{lax-712553}`. The archive resolves it to the exact
statements and proofs, and a registered record cannot change under the citation
(a correction would be a new record that supersedes this one).

```bibtex
@misc{lax712553,
  author = {Cruz Cabrera, Joel},
  title = {Congruent number curves: the quadratic twist formula for a_p and the parity of Tunnell's representation counts},
  year = {2026},
  howpublished = {Lax Lean Archive, record lax-712553},
  url = {https://laxarchive.org/lax-712553/}
}
```

Author: Joel Cruz Cabrera, ORCID [0009-0005-4048-1237](https://orcid.org/0009-0005-4048-1237).

## Rebuilding it

```bash
npm install -g lax-archive
lax build          # Lean v4.33.0, Mathlib db584cd6d46c
```

The pins are in `manifest.yaml`; the archive's build of this commit
(`ae927b4`) is recorded in `build-output.json`
(`archiveSha` `f8790c7cd4ae`).

## Related

- The four records and their live counts: https://kodamaseclabs.com/publications
- Preprint: *Computational Results on the Congruent Number Family*, doi:10.5281/zenodo.21535499.

## Use of AI

An AI tool (an agent running on the author's machine) wrote the Lean under the
author's direction; the author set the statements, reviewed every declaration
and checked the build before submitting. The archive then rebuilt everything
independently. What is proved is exactly what the kernel accepted, no more.

## License

Apache-2.0 (the archive's required license), see `LICENSE`.

<details><summary>BibTeX entries the record itself cites</summary>

```bibtex
@article{tunnell1983,
  author = {Tunnell, Jerrold B.},
  title = {A classical Diophantine problem and modular forms of weight 3/2},
  journal = {Inventiones Mathematicae},
  volume = {72},
  year = {1983},
  pages = {323--334}
}
@book{koblitz1993,
  author = {Koblitz, Neal},
  title = {Introduction to Elliptic Curves and Modular Forms},
  publisher = {Springer},
  series = {Graduate Texts in Mathematics},
  volume = {97},
  edition = {2},
  year = {1993}
}
```
</details>
