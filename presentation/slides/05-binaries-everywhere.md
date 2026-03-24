---
type: content
title: "Finding Vulnerabilities: Symbolic Execution"
---

<div style="display:flex; align-items:center; justify-content:center; height:82vh; gap:80px; padding:0 80px;">
  <img src="presentation/figures/klee.svg" alt="KLEE" style="height:200px;"/>
  <img src="presentation/figures/angry_face.png" alt="Love-hate with symex" style="height:280px; border-radius:12px;"/>
</div>

???

Symbolic execution is the third leg. Instead of running concrete inputs like a fuzzer, it treats inputs as symbols and tracks the constraints that accumulate along each path. When it reaches a sink, it asks an SMT solver: is there any concrete input satisfying all these constraints? If yes, you get a proof of reachability, an actual triggering input. KLEE is the canonical academic tool.

The problem is that symbolic execution is simultaneously the most powerful and the most frustrating technique in program analysis. It gives you mathematical certainty, but at brutal cost. Path explosion means the state space doubles at every branch. Environmental dependencies, like file systems, network sockets, NVRAM stores, require manual modeling. And for firmware binaries specifically, you need to lift the code into an intermediate representation, recover types, and handle calling conventions, all before you can even begin exploring.

The result: symbolic execution works brilliantly on small programs, but has never scaled to full firmware images. This dissertation proposes a way to change that, by combining static analysis candidates with directed symbolic execution on a decompiler-level IR.
