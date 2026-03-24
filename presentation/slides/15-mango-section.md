---
type: section
title: 'Operation Mango<sup style="font-size:0.4em; vertical-align:super; font-weight:400;">[1]</sup>'
textScale: 2
---

Scalable Discovery of Taint-Style Vulnerabilities in Binary Firmware Services

<div style="position:absolute; bottom:30px; left:60px; font-size:1.4rem; color:rgba(255,255,255,0.75); font-family:Inter,sans-serif;">[1] Gibbs et al., USENIX Security '24</div>

???

Mango was published at USENIX Security 2024. It addresses the first stage: scaling vulnerability detection. Where prior work analyzes a small fraction of firmware binaries, Mango analyzes every one. We will walk through three key innovations: rich expressions for precise data-flow tracking, sink-to-source analysis for scope reduction, and assumed non-impact for aggressive pruning of irrelevant function calls.
