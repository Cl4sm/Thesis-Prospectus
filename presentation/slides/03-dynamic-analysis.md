---
type: content
title: "Finding Vulnerabilities: Dynamic Analysis"
---

<div style="display:flex; align-items:center; justify-content:center; height:82vh; padding:0 80px;">
  <img src="presentation/figures/comp/aflpp.png" alt="AFL++" style="max-height:720px; max-width:90%; border-radius:12px; box-shadow:0 6px 20px rgba(0,0,0,0.15);"/>
</div>

???

When codebases grow large, it becomes intractable for a single person to truly understand every path and execution context. That's where fuzzers come in. AFL++ generates inputs via mutation algorithms at incredible speeds, dynamically exhausting execution paths. If the program crashes, the bug is real: concrete proof. But dynamic analysis requires running the target, which means you need the right libraries, peripheral devices, and architecture. Firmware on embedded devices often cannot be executed outside its hardware. And even when fuzzing works, it misses paths guarded by hard-to-satisfy constraints.
