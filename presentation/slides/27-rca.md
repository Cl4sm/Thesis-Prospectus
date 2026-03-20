---
type: content
title: "Root Cause Analysis: DyVA"
---

<svg viewBox="0 0 1050 480" style="width:100%; display:block; margin: 0 auto;" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <marker id="dyva-arr" markerWidth="9" markerHeight="9" refX="8" refY="3" orient="auto">
      <polygon points="0 0, 9 3, 0 6" fill="#4CAF50"/>
    </marker>
    <marker id="dyva-arr-gray" markerWidth="9" markerHeight="9" refX="8" refY="3" orient="auto">
      <polygon points="0 0, 9 3, 0 6" fill="#999"/>
    </marker>
    <marker id="dyva-arr-maroon" markerWidth="9" markerHeight="9" refX="8" refY="3" orient="auto">
      <polygon points="0 0, 9 3, 0 6" fill="#8C1D40"/>
    </marker>
  </defs>

  <!-- ===== INPUT: Crash Report + POI (left) ===== -->
  <rect x="30" y="160" width="175" height="110" rx="10" fill="#fff3e0" stroke="#FF9800" stroke-width="2.5"/>
  <text x="117" y="200" font-size="17" font-weight="bold" text-anchor="middle" fill="#E65100" font-family="Arial, sans-serif">Crash Report</text>
  <text x="117" y="225" font-size="15" text-anchor="middle" fill="#E65100" font-family="Arial, sans-serif">+ POI from Graph</text>
  <text x="117" y="250" font-size="13" text-anchor="middle" fill="#999" font-family="Arial, sans-serif">crashing input + context</text>

  <!-- Arrow from input to triage agent (angled up) -->
  <path d="M 205 195 L 295 120" stroke="#4CAF50" stroke-width="2.5" fill="none" marker-end="url(#dyva-arr)"/>

  <!-- ===== CENTRAL: TRIAGE AGENT (LLM) ===== -->
  <rect x="300" y="60" width="210" height="80" rx="10" fill="#4CAF50" stroke="#2E7D32" stroke-width="3"/>
  <text x="405" y="95" font-size="20" font-weight="bold" text-anchor="middle" fill="white" font-family="Arial, sans-serif">Triage Agent</text>
  <text x="405" y="120" font-size="13" text-anchor="middle" fill="#c8e6c9" font-family="Arial, sans-serif">LLM-directed debugging</text>

  <!-- ===== ITERATIVE LOOP: Tools below agent ===== -->
  <!-- Tool 1: Debugger -->
  <rect x="230" y="205" width="160" height="65" rx="8" fill="#e8f5e9" stroke="#4CAF50" stroke-width="2"/>
  <text x="248" y="229" font-size="22" fill="#2E7D32" font-family="Arial, sans-serif">&#9654;</text>
  <text x="275" y="232" font-size="15" font-weight="600" fill="#333" font-family="Arial, sans-serif">GDB / JDB</text>
  <text x="248" y="255" font-size="13" fill="#666" font-family="Arial, sans-serif">Set breakpoints, step,</text>
  <text x="248" y="268" font-size="13" fill="#666" font-family="Arial, sans-serif">inspect registers</text>

  <!-- Tool 2: Source Code -->
  <rect x="420" y="205" width="160" height="65" rx="8" fill="#e8f5e9" stroke="#4CAF50" stroke-width="2"/>
  <text x="438" y="229" font-size="22" fill="#2E7D32" font-family="Arial, sans-serif">&#128196;</text>
  <text x="465" y="232" font-size="15" font-weight="600" fill="#333" font-family="Arial, sans-serif">Source Code</text>
  <text x="438" y="255" font-size="13" fill="#666" font-family="Arial, sans-serif">Read functions, trace</text>
  <text x="438" y="268" font-size="13" fill="#666" font-family="Arial, sans-serif">call chains</text>

  <!-- Tool 3: Variable Inspector -->
  <rect x="325" y="295" width="160" height="65" rx="8" fill="#e8f5e9" stroke="#4CAF50" stroke-width="2"/>
  <text x="343" y="319" font-size="22" fill="#2E7D32" font-family="Arial, sans-serif">&#128270;</text>
  <text x="370" y="322" font-size="15" font-weight="600" fill="#333" font-family="Arial, sans-serif">Variables</text>
  <text x="343" y="345" font-size="13" fill="#666" font-family="Arial, sans-serif">Inspect values, heap,</text>
  <text x="343" y="358" font-size="13" fill="#666" font-family="Arial, sans-serif">stack frames</text>

  <!-- Arrows: Agent ↔ Tools (bidirectional, showing iterative loop) -->
  <!-- Agent → Debugger -->
  <path d="M 350 140 L 310 203" stroke="#4CAF50" stroke-width="2" fill="none" marker-end="url(#dyva-arr)"/>
  <!-- Debugger → Agent -->
  <path d="M 330 205 L 370 142" stroke="#4CAF50" stroke-width="1.5" fill="none" stroke-dasharray="4,4" marker-end="url(#dyva-arr)"/>

  <!-- Agent → Source -->
  <path d="M 460 140 L 500 203" stroke="#4CAF50" stroke-width="2" fill="none" marker-end="url(#dyva-arr)"/>
  <!-- Source → Agent -->
  <path d="M 480 205 L 440 142" stroke="#4CAF50" stroke-width="1.5" fill="none" stroke-dasharray="4,4" marker-end="url(#dyva-arr)"/>

  <!-- Agent → Variables -->
  <path d="M 405 140 L 405 293" stroke="#4CAF50" stroke-width="2" fill="none" marker-end="url(#dyva-arr)"/>
  <!-- Variables → Agent (curve around) -->
  <path d="M 485 320 Q 560 200 480 140" stroke="#4CAF50" stroke-width="1.5" fill="none" stroke-dasharray="4,4" marker-end="url(#dyva-arr)"/>

  <!-- Iteration loop label -->
  <text x="580" y="182" font-size="13" fill="#4CAF50" font-weight="600" font-style="italic" font-family="Arial, sans-serif">inspect → hypothesize</text>
  <text x="580" y="200" font-size="13" fill="#4CAF50" font-weight="600" font-style="italic" font-family="Arial, sans-serif">→ test → refine</text>

  <!-- ===== OUTPUT: Root Cause Report (right) ===== -->
  <rect x="700" y="90" width="310" height="295" rx="10" fill="#fafafa" stroke="#8C1D40" stroke-width="2.5"/>

  <!-- Header -->
  <rect x="700" y="90" width="310" height="45" rx="10" fill="#8C1D40"/>
  <rect x="700" y="120" width="310" height="15" rx="0" fill="#8C1D40"/>
  <text x="855" y="120" font-size="18" font-weight="bold" text-anchor="middle" fill="white" font-family="Arial, sans-serif">Root Cause Report</text>

  <!-- Report content -->
  <text x="725" y="165" font-size="14" font-weight="600" fill="#8C1D40" font-family="Arial, sans-serif">Vulnerability Type</text>
  <text x="725" y="185" font-size="15" fill="#333" font-family="Arial, sans-serif">CWE-122: Heap Buffer Overflow</text>

  <line x1="720" y1="198" x2="990" y2="198" stroke="#e0e0e0" stroke-width="1"/>

  <text x="725" y="220" font-size="14" font-weight="600" fill="#8C1D40" font-family="Arial, sans-serif">Location</text>
  <text x="725" y="240" font-size="15" fill="#333" font-family="monospace">parse_input() line 42</text>

  <line x1="720" y1="253" x2="990" y2="253" stroke="#e0e0e0" stroke-width="1"/>

  <text x="725" y="275" font-size="14" font-weight="600" fill="#8C1D40" font-family="Arial, sans-serif">Root Cause</text>
  <text x="725" y="295" font-size="14" fill="#333" font-family="Arial, sans-serif">Unchecked memcpy with attacker-</text>
  <text x="725" y="313" font-size="14" fill="#333" font-family="Arial, sans-serif">controlled length parameter</text>

  <line x1="720" y1="326" x2="990" y2="326" stroke="#e0e0e0" stroke-width="1"/>

  <text x="725" y="348" font-size="14" font-weight="600" fill="#8C1D40" font-family="Arial, sans-serif">Affected Variables</text>
  <text x="725" y="370" font-size="14" fill="#333" font-family="monospace">buf, input_len, src_data</text>

  <!-- Arrow from agent to output (angled) -->
  <path d="M 510 100 L 698 115" stroke="#8C1D40" stroke-width="2.5" fill="none" marker-end="url(#dyva-arr-maroon)"/>

  <!-- Bottom note -->
  <text x="855" y="420" font-size="14" fill="#888" text-anchor="middle" font-family="Arial, sans-serif" font-style="italic">Feeds directly into patching pipeline</text>

</svg>

???

Once a fuzzer produces a crashing input, you need to know why it crashed. DyVA performs root-cause analysis through LLM-directed debugging. The triage agent receives a crash report and a set of Points of Interest from the Analysis Graph. It then interacts with a debugger, GDB for C targets, JDB for Java, to inspect variable values, set breakpoints, and trace execution. The key is the iterative loop. The LLM inspects a point of interest, forms a hypothesis about the cause, then tests that hypothesis by requesting additional information: reading source code, checking variable values, setting new breakpoints. This mirrors how a human security analyst debugs: pick a point of interest, inspect the state, form a hypothesis, test it, refine. DyVA produces a structured root cause report: the vulnerability type with CWE classification, exact location in source, the root cause mechanism, and affected variables. That report feeds directly into the patching pipeline, where patchers can generate targeted fixes because they know exactly what needs to be fixed and why.
