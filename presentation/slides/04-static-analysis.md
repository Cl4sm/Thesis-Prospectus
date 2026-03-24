---
type: content
title: "Finding Vulnerabilities: Static Analysis"
---

<div style="display:flex; align-items:center; justify-content:center; height:82vh; gap:80px; padding:0 80px;">
  <img src="presentation/figures/comp/codeql.jpg" alt="CodeQL" style="height:390px;"/>
  <img src="presentation/figures/comp/semgrep.png" alt="Semgrep" style="height:140px;"/>
</div>

???

Static analysis can alleviate many of the issues with dynamic analysis. While you do not have the ability to directly confirm the existence of a vulnerability like dynamic analysis provides, static analysis is massively scalable. It can cover millions of lines of code efficiently across any architecture, without requiring the ability to run the target. Tools like CodeQL and Semgrep are widely used for source-level analysis. The limitation: imprecision. The undecidability problem means some results will be wrong, producing false positives. This dissertation focuses on applying static analysis principles to binaries, where source code is unavailable.
