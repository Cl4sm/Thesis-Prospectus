# Chapter 3: Operation Mango

**Status:** Drafted (~64k chars, longest chapter)
**File:** `prospectus/chapters/03-mango.tex`
**Source:** `mango_usenix24.pdf` (USENIX Security '24)
**Target length:** 25-30 pages

## This Is Your Paper

You wrote this. You can restructure, expand, and adapt freely. The dissertation chapter format gives you room the conference paper didn't.

## Current Structure
1. Introduction — IoT vulnerability landscape, Karonte/SaTC limitations
2. Background — Firmware types, vulnerability analysis approaches, threat model
3. Challenges — Why existing tools fail at scale
4. Approach Overview — MangoDFA pipeline
5. MangoDFA Details — [[Rich Expressions]], inter-function analysis, [[Function Summaries]]
6. [[Sink-to-Source Analysis]]
7. [[Assumed Nonimpact]]
8. Alert Ranking ([[TruPoCs]])
9. [[Environment Resolution]]
10. Implementation
11. Evaluation — Karonte dataset, SaTC dataset, ablation study, large-scale
12. Discussion & Limitations

## Adaptation Notes

Things you can expand now that you're not page-limited:
- **More examples:** Walk through a complete vulnerability trace end-to-end
- **Rich Expressions in depth:** The value domain is Mango's core innovation; give it room to breathe
- **Ablation study details:** Add the data tables that got cut from the conference paper
- **Large-scale findings:** 10,834 TruPoCs across 770,374 binaries from 9 vendors; characterize the vulnerability landscape
- **Limitations section:** Be more candid about where Assumed Nonimpact breaks down (struct handling, global variable resolution)

## Key Results (for cross-referencing)
- 27x more binaries analyzed than SaTC on Karonte dataset
- 22x faster per-binary analysis time (8 min vs 6.5 hrs)
- 56 true positives SaTC missed
- 203 true positives Karonte missed
- Large-scale: 1,698 firmware, 770,374 binaries, 10,834 TruPoCs
- 166 exploitable vulnerabilities verified in manual audit subset

## Connections Forward
- Rich Expressions → motivation for [[AIL Symbolic Execution]] (RE tracks transformations but not path feasibility)
- Sink-to-Source → guides symbolic exploration in proposed work
- Limitations → directly motivate precision improvement via symex
- angr dependency → shared infrastructure with AIL-SE

## Related
- [[MangoDFA]]
- [[Mango Chapter Adaptation]]
- [[Operation Mango]] (project overview)
