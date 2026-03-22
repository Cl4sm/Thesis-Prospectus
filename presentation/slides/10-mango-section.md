---
type: section
label: "Project 1"
title: "Operation Mango"
---

Scalable Discovery of Taint-Style Vulnerabilities in Binary Firmware Services

USENIX Security 2024

???

Mango was published at USENIX Security 2024. It directly addresses the first part of the thesis: scaling vulnerability detection. Where prior work analyzes a small fraction of a firmware image, Mango analyzes every binary. The core innovation is Rich Expressions, which track the full transformation history of values as they flow through code. This lets us reason precisely about data dependencies and attacker reachability. The numbers tell the story: 27 times more vulnerable binaries than prior work, 166 confirmed exploitable vulnerabilities, and practical runtime — eight minutes per binary on average.
