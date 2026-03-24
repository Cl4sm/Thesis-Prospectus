---
type: content
title: "Finding Vulnerabilities: Manual Analysis"
---

<div style="display:flex; align-items:center; justify-content:center; height:82vh; gap:60px; padding:0 60px;">
  <img src="presentation/figures/comp/ida-pro.jpg" alt="IDA Pro" style="height:510px; border-radius:12px;"/>
  <img src="presentation/figures/comp/binary-magnifier.jpg" alt="Binary analysis" style="height:510px; border-radius:12px; box-shadow:0 6px 20px rgba(0,0,0,0.15);"/>
  <img src="presentation/figures/comp/gdb.jpg" alt="GDB" style="height:360px;"/>
</div>

???

There are plenty of ways to find vulnerabilities in modern-day software. Manual analysis is the gold standard: a researcher spends weeks or months reverse-engineering a single binary, recovering symbols and semantics, tracing data flows, and identifying bugs. Tools like IDA Pro and GDB are the workhorses. The results are high-confidence, but the approach collapses when you have thousands of targets. One person, one target, weeks of effort.
