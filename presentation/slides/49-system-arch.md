---
type: content
title: "System Architecture"
---

<svg viewBox="0 0 1100 370" style="width: 100%; margin: 10px auto; display: block;">
  <defs>
    <marker id="arrowArch" markerWidth="10" markerHeight="10" refX="7" refY="3" orient="auto" markerUnits="strokeWidth">
      <path d="M0,0 L0,6 L9,3 z" fill="#666"/>
    </marker>
    <marker id="arrowPurple" markerWidth="10" markerHeight="10" refX="7" refY="3" orient="auto" markerUnits="strokeWidth">
      <path d="M0,0 L0,6 L9,3 z" fill="#7B1FA2"/>
    </marker>
  </defs>

  <!-- ===== PEACH system dashed border ===== -->
  <rect x="198" y="55" width="770" height="160" fill="none" stroke="#9C27B0" stroke-width="2" stroke-dasharray="5,4" rx="8" opacity="0.5"/>
  <text x="215" y="50" font-size="14" fill="#9C27B0" font-style="italic" font-weight="600">PEACH system</text>

  <!-- ===== Stage 0: Input (external) ===== -->
  <rect x="40" y="82" width="130" height="85" fill="#f5f5f5" stroke="#333" stroke-width="2" rx="4"/>
  <text x="105" y="115" font-size="13.5" font-weight="bold" text-anchor="middle" fill="#333">Static Traces</text>
  <text x="105" y="133" font-size="12" text-anchor="middle" fill="#666">Mango / SaTC</text>
  <text x="105" y="148" font-size="12" text-anchor="middle" fill="#666">Karonte</text>

  <!-- Arrow 0→1 -->
  <path d="M 170 124 L 208 124" stroke="#666" stroke-width="2" fill="none" marker-end="url(#arrowArch)"/>

  <!-- ===== Stage 1: Normalization (internal, uniform) ===== -->
  <rect x="215" y="82" width="155" height="85" fill="#e8f5e9" stroke="#4CAF50" stroke-width="2" rx="4"/>
  <text x="292" y="115" font-size="13.5" font-weight="bold" text-anchor="middle" fill="#333">Normalization</text>
  <text x="292" y="133" font-size="12" text-anchor="middle" fill="#666">Canonical path</text>
  <text x="292" y="148" font-size="12" text-anchor="middle" fill="#666">representation</text>

  <!-- Arrow 1→2 -->
  <path d="M 370 124 L 408 124" stroke="#666" stroke-width="2" fill="none" marker-end="url(#arrowArch)"/>

  <!-- ===== Stage 2: PEACH core (internal, uniform) ===== -->
  <rect x="415" y="82" width="155" height="85" fill="#fff3e0" stroke="#FF9800" stroke-width="2.5" rx="4"/>
  <text x="492" y="112" font-size="15" font-weight="bold" text-anchor="middle" fill="#333">PEACH</text>
  <text x="492" y="130" font-size="11.5" text-anchor="middle" fill="#666">AIL Symbolic Execution</text>
  <text x="492" y="146" font-size="11.5" text-anchor="middle" fill="#666">Decompiler-level IR</text>

  <!-- Arrow 2→3 -->
  <path d="M 570 124 L 608 124" stroke="#666" stroke-width="2" fill="none" marker-end="url(#arrowArch)"/>

  <!-- ===== Stage 3: Hybrid Concretization (internal, uniform) ===== -->
  <rect x="615" y="82" width="155" height="85" fill="#e3f2fd" stroke="#2196F3" stroke-width="2" rx="4"/>
  <text x="692" y="112" font-size="13.5" font-weight="bold" text-anchor="middle" fill="#333">Hybrid</text>
  <text x="692" y="129" font-size="13.5" font-weight="bold" text-anchor="middle" fill="#333">Concretization</text>
  <text x="692" y="150" font-size="12" text-anchor="middle" fill="#666">Static + LLM</text>

  <!-- Arrow 3→4 -->
  <path d="M 770 124 L 808 124" stroke="#666" stroke-width="2" fill="none" marker-end="url(#arrowArch)"/>

  <!-- ===== Stage 4: Verdict (internal, uniform) ===== -->
  <rect x="815" y="82" width="155" height="85" fill="#ffebee" stroke="#8C1D40" stroke-width="2.5" rx="4"/>
  <text x="892" y="108" font-size="13.5" font-weight="bold" text-anchor="middle" fill="#8C1D40">Verdict</text>
  <text x="892" y="128" font-size="12" text-anchor="middle" fill="#333">Reachable /</text>
  <text x="892" y="143" font-size="12" text-anchor="middle" fill="#333">Unreachable /</text>
  <text x="892" y="158" font-size="12" text-anchor="middle" fill="#333">Constant Sink</text>

  <!-- ===== PoC output arrow ===== -->
  <path d="M 970 124 L 1010 124" stroke="#8C1D40" stroke-width="2.5" fill="none" marker-end="url(#arrowArch)"/>
  <text x="1020" y="129" font-size="15" font-weight="bold" text-anchor="start" fill="#8C1D40">PoC</text>

  <!-- ===== Cross-Binary Constraint Resolver ===== -->
  <rect x="420" y="240" width="260" height="35" fill="#f3e5f5" stroke="#9C27B0" stroke-width="1.5" rx="3"/>
  <text x="550" y="263" font-size="13.5" font-weight="bold" text-anchor="middle" fill="#7B1FA2">Cross-Binary Constraint Resolver</text>

  <!-- Arrow: PEACH → Resolver -->
  <path d="M 492 167 L 492 240" stroke="#7B1FA2" stroke-width="1.5" stroke-dasharray="4,3" fill="none" marker-end="url(#arrowPurple)"/>
  <text x="502" y="210" font-size="12" fill="#7B1FA2" font-style="italic">path constraints</text>

  <!-- Arrow: Resolver → Hybrid Concretization -->
  <path d="M 620 240 L 692 167" stroke="#7B1FA2" stroke-width="1.5" stroke-dasharray="4,3" fill="none" marker-end="url(#arrowPurple)"/>
  <text x="648" y="210" font-size="12" fill="#7B1FA2" font-style="italic">cross-binary state</text>

  <!-- ===== Bottom: Key properties ===== -->
  <line x1="50" y1="290" x2="1050" y2="290" stroke="#e0e0e0" stroke-width="1"/>

  <rect x="55" y="305" width="220" height="50" rx="6" fill="#f5f5f5" stroke="#ddd" stroke-width="1"/>
  <text x="165" y="323" font-size="12.5" font-weight="700" text-anchor="middle" fill="#333">Tool-Agnostic Input</text>
  <text x="165" y="339" font-size="11.5" text-anchor="middle" fill="#666">Accepts traces from any taint-style</text>
  <text x="165" y="352" font-size="11.5" text-anchor="middle" fill="#666">static analysis tool</text>

  <rect x="305" y="305" width="220" height="50" rx="6" fill="#f5f5f5" stroke="#ddd" stroke-width="1"/>
  <text x="415" y="323" font-size="12.5" font-weight="700" text-anchor="middle" fill="#333">Decompiler-Level IR</text>
  <text x="415" y="339" font-size="11.5" text-anchor="middle" fill="#666">Tighter constraints than VEX,</text>
  <text x="415" y="352" font-size="11.5" text-anchor="middle" fill="#666">variable-level reasoning</text>

  <rect x="555" y="305" width="220" height="50" rx="6" fill="#f5f5f5" stroke="#ddd" stroke-width="1"/>
  <text x="665" y="323" font-size="12.5" font-weight="700" text-anchor="middle" fill="#333">Hybrid Environment</text>
  <text x="665" y="339" font-size="11.5" text-anchor="middle" fill="#666">Static extraction + LLM for</text>
  <text x="665" y="352" font-size="11.5" text-anchor="middle" fill="#666">unresolvable preconditions</text>

  <rect x="805" y="305" width="220" height="50" rx="6" fill="#f5f5f5" stroke="#ddd" stroke-width="1"/>
  <text x="915" y="323" font-size="12.5" font-weight="700" text-anchor="middle" fill="#333">Concrete Output</text>
  <text x="915" y="339" font-size="11.5" text-anchor="middle" fill="#666">Triggering inputs for confirmed</text>
  <text x="915" y="352" font-size="11.5" text-anchor="middle" fill="#666">paths; vendor-ready PoC</text>
</svg>

???

Here's how it works. The system is designed to be tool-agnostic. It accepts traces from Mango, or from SaTC, Karonte, any taint-style static analyzer. The input flows through a normalization layer that converts tool-specific path representations into a canonical form: source, sink, the guards and checks in between.

[CLICK] This normalized path goes into PEACH. We lift the relevant code regions into AIL, build the constraint system, and execute symbolically along the path.

[CLICK] When we hit preconditions that can't be resolved statically, the hybrid concretization layer kicks in. It tries static extraction first. NVRAM keys, HTTP parameters, known constants. If that's insufficient, the LLM suggests values, and we validate them against the constraints.

[CLICK] Finally, the cross-binary constraint resolver handles IPC. If the path crosses from one binary to another through NVRAM, we trace backwards to the setter, capture that symbolic state, and chain it in.

[CLICK] The output is a verdict: Reachable, Unreachable, or Constant Sink (value is hardcoded, so the sink can't actually be triggered). If reachable, we also synthesize concrete triggering inputs, the actual PoC exploit.
