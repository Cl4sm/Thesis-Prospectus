---
type: section
title: "Operation Mango"
---

Scalable Discovery of Taint-Style Vulnerabilities in Binary Firmware Services

<div style="margin-top:12px; font-size:28px; color:#888; font-family:Inter,sans-serif;">Gibbs et al., USENIX Security '24</div>

???

Mango was published at USENIX Security 2024. It addresses the first stage: scaling vulnerability detection. Where prior work analyzes a small fraction of firmware binaries, Mango analyzes every one. We will walk through three key innovations: rich expressions for precise data-flow tracking, sink-to-source analysis for scope reduction, and assumed non-impact for aggressive pruning of irrelevant function calls.
