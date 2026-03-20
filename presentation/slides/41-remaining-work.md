---
type: content
title: "Remaining Work"
---

- Apr–May 2026: Multi-firmware expansion (TP-Link, D-Link, etc.)
- Jun–Jul 2026: Baseline comparisons (SaTC, Karonte normalization)
- Aug–Sep 2026: LLM ablation study, buffer overflow extension
- Oct 2026: Paper submission (USENIX Security '27 or S&P '27)
- Nov 2026 – Feb 2027: Dissertation writing
- Spring 2027: Dissertation defense

*Feasibility: working prototype already validates 32% of candidates*

???

Let's break down the remaining work month by month. In April and May, I expand the evaluation to multiple firmware sets: TP-Link routers, D-Link devices, other architectures and vendors. This is not starting from scratch; the infrastructure is in place.

June and July are for baseline comparisons. I take the same firmware and run normalization on candidates from SaTC and Karonte, not just Mango. This shows the system generalizes.

August and September, the LLM ablation study. I disable the LLM layer and re-run the validation on the full dataset to measure the impact. Then I extend the approach beyond command injection to buffer overflows.

October is paper submission. All the experimental results go into a research paper, and we submit to either USENIX Security '27 or S&P '27.

November through February, dissertation writing. I synthesize all three projects into a coherent narrative and write the formal dissertation document.

Spring 2027, the final defense.

Why is this feasible? The working prototype already validates 32% of candidates on the R6400. Each planned experiment builds incrementally on existing code and infrastructure. I'm not building from zero; I'm extending and evaluating a system that already works.
