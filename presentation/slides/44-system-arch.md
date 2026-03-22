---
type: content
title: "System Architecture"
---

<svg viewBox="0 0 1100 400" style="width: 100%; margin: 10px auto; display: block;">
  <defs>
    <marker id="arrowArch" markerWidth="10" markerHeight="10" refX="7" refY="3" orient="auto" markerUnits="strokeWidth">
      <path d="M0,0 L0,6 L9,3 z" fill="#666"/>
    </marker>
  </defs>

  <!-- Stage 1: Input -->
  <rect x="15" y="90" width="140" height="80" fill="#f5f5f5" stroke="#333" stroke-width="2" rx="4"/>
  <text x="85" y="120" font-size="12" font-weight="bold" text-anchor="middle" fill="#333">Static Traces</text>
  <text x="85" y="140" font-size="12" text-anchor="middle" fill="#666">Mango / SaTC</text>
  <text x="85" y="155" font-size="12" text-anchor="middle" fill="#666">Karonte</text>

  <!-- Arrow 1 -->
  <path d="M 155 130 L 195 130" stroke="#666" stroke-width="2" fill="none" marker-end="url(#arrowArch)"/>

  <!-- Stage 2: Normalization -->
  <rect x="200" y="90" width="140" height="80" fill="#e8f5e9" stroke="#4CAF50" stroke-width="2" rx="4"/>
  <text x="270" y="120" font-size="12" font-weight="bold" text-anchor="middle" fill="#333">Normalization</text>
  <text x="270" y="140" font-size="12" text-anchor="middle" fill="#666">Canonical path</text>
  <text x="270" y="155" font-size="12" text-anchor="middle" fill="#666">representation</text>

  <!-- Arrow 2 -->
  <path d="M 340 130 L 380 130" stroke="#666" stroke-width="2" fill="none" marker-end="url(#arrowArch)"/>

  <!-- Stage 3: AIL SymEx -->
  <rect x="385" y="80" width="160" height="100" fill="#fff3e0" stroke="#FF9800" stroke-width="2.5" rx="4"/>
  <text x="465" y="115" font-size="13" font-weight="bold" text-anchor="middle" fill="#333">AIL Symbolic</text>
  <text x="465" y="135" font-size="13" font-weight="bold" text-anchor="middle" fill="#333">Execution</text>
  <text x="465" y="160" font-size="12" text-anchor="middle" fill="#666">Decompiler-level IR</text>

  <!-- Arrow 3 -->
  <path d="M 545 130 L 585 130" stroke="#666" stroke-width="2" fill="none" marker-end="url(#arrowArch)"/>

  <!-- Stage 4: Hybrid Concretization -->
  <rect x="590" y="90" width="140" height="80" fill="#e3f2fd" stroke="#2196F3" stroke-width="2" rx="4"/>
  <text x="660" y="118" font-size="12" font-weight="bold" text-anchor="middle" fill="#333">Hybrid</text>
  <text x="660" y="136" font-size="12" font-weight="bold" text-anchor="middle" fill="#333">Concretization</text>
  <text x="660" y="157" font-size="12" text-anchor="middle" fill="#666">Static + LLM</text>

  <!-- Arrow 4 -->
  <path d="M 730 130 L 770 130" stroke="#666" stroke-width="2" fill="none" marker-end="url(#arrowArch)"/>

  <!-- Stage 5: Output -->
  <rect x="775" y="80" width="140" height="100" fill="#ffebee" stroke="#8C1D40" stroke-width="2.5" rx="4"/>
  <text x="845" y="115" font-size="12" font-weight="bold" text-anchor="middle" fill="#8C1D40">Verdict</text>
  <text x="845" y="140" font-size="12" text-anchor="middle" fill="#333">Reachable /</text>
  <text x="845" y="155" font-size="12" text-anchor="middle" fill="#333">Unreachable /</text>
  <text x="845" y="170" font-size="12" text-anchor="middle" fill="#333">Constant Sink</text>

  <!-- Cross-binary resolver label below -->
  <rect x="385" y="210" width="280" height="35" fill="#f3e5f5" stroke="#9C27B0" stroke-width="1.5" rx="3"/>
  <text x="525" y="233" font-size="13" font-weight="bold" text-anchor="middle" fill="#7B1FA2">Cross-Binary Constraint Resolver</text>
  <path d="M 465 180 L 465 210" stroke="#9C27B0" stroke-width="1.5" stroke-dasharray="4,3" fill="none"/>
  <path d="M 660 170 L 580 210" stroke="#9C27B0" stroke-width="1.5" stroke-dasharray="4,3" fill="none"/>

  <!-- PoC output arrow -->
  <path d="M 915 130 L 960 130" stroke="#8C1D40" stroke-width="2.5" fill="none" marker-end="url(#arrowArch)"/>
  <text x="970" y="125" font-size="13" font-weight="bold" text-anchor="start" fill="#8C1D40">PoC</text>

  <!-- ===== Bottom: Key properties ===== -->
  <line x1="50" y1="275" x2="1000" y2="275" stroke="#e0e0e0" stroke-width="1"/>

  <rect x="50" y="295" width="220" height="55" rx="6" fill="#f5f5f5" stroke="#ddd" stroke-width="1"/>
  <text x="160" y="315" font-size="12" font-weight="700" text-anchor="middle" fill="#333">Tool-Agnostic Input</text>
  <text x="160" y="335" font-size="12" text-anchor="middle" fill="#666">Accepts traces from any taint-style</text>
  <text x="160" y="348" font-size="12" text-anchor="middle" fill="#666">static analysis tool</text>

  <rect x="310" y="295" width="220" height="55" rx="6" fill="#f5f5f5" stroke="#ddd" stroke-width="1"/>
  <text x="420" y="315" font-size="12" font-weight="700" text-anchor="middle" fill="#333">Decompiler-Level IR</text>
  <text x="420" y="335" font-size="12" text-anchor="middle" fill="#666">Tighter constraints than VEX,</text>
  <text x="420" y="348" font-size="12" text-anchor="middle" fill="#666">variable-level reasoning</text>

  <rect x="570" y="295" width="220" height="55" rx="6" fill="#f5f5f5" stroke="#ddd" stroke-width="1"/>
  <text x="680" y="315" font-size="12" font-weight="700" text-anchor="middle" fill="#333">Hybrid Environment</text>
  <text x="680" y="335" font-size="12" text-anchor="middle" fill="#666">Static extraction + LLM for</text>
  <text x="680" y="348" font-size="12" text-anchor="middle" fill="#666">unresolvable preconditions</text>

  <rect x="830" y="295" width="220" height="55" rx="6" fill="#f5f5f5" stroke="#ddd" stroke-width="1"/>
  <text x="940" y="315" font-size="12" font-weight="700" text-anchor="middle" fill="#333">Concrete Output</text>
  <text x="940" y="335" font-size="12" text-anchor="middle" fill="#666">Triggering inputs for confirmed</text>
  <text x="940" y="348" font-size="12" text-anchor="middle" fill="#666">paths; vendor-ready PoC</text>
</svg>

???

Here's how it works. The system is designed to be tool-agnostic. It accepts traces from Mango, or from SaTC, Karonte, any taint-style static analyzer. The input flows through a normalization layer that converts tool-specific path representations into a canonical form: source, sink, the guards and checks in between.

[CLICK] This normalized path goes into AIL Symbolic Execution. We lift the relevant code regions into AIL, build the constraint system, and execute symbolically along the path.

[CLICK] When we hit preconditions that can't be resolved statically, the hybrid concretization layer kicks in. It tries static extraction first. NVRAM keys, HTTP parameters, known constants. If that's insufficient, the LLM suggests values, and we validate them against the constraints.

[CLICK] Finally, the cross-binary constraint resolver handles IPC. If the path crosses from one binary to another through NVRAM, we trace backwards to the setter, capture that symbolic state, and chain it in.

[CLICK] The output is a verdict: Reachable, Unreachable, or Constant Sink (value is hardcoded, so the sink can't actually be triggered). If reachable, we also synthesize concrete triggering inputs, the actual PoC exploit.
