---
type: content
title: "The Validation Gap"
---

<svg viewBox="0 0 1050 470" style="width:100%; display:block; margin: 0 auto;" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <marker id="vg-arr" markerWidth="9" markerHeight="9" refX="8" refY="3" orient="auto">
      <polygon points="0 0, 9 3, 0 6" fill="#555"/>
    </marker>
    <marker id="vg-arr-red" markerWidth="9" markerHeight="9" refX="8" refY="3" orient="auto">
      <polygon points="0 0, 9 3, 0 6" fill="#E53935"/>
    </marker>
    <marker id="vg-arr-green" markerWidth="9" markerHeight="9" refX="8" refY="3" orient="auto">
      <polygon points="0 0, 9 3, 0 6" fill="#2E7D32"/>
    </marker>
  </defs>

  <!-- ===== TOP: Static candidate path with guard barriers ===== -->
  <text x="525" y="28" font-size="16.3" font-weight="600" text-anchor="middle" fill="#555" font-family="Inter, sans-serif">A static candidate from Mango:</text>

  <!-- Source node -->
  <rect x="30" y="50" width="120" height="50" rx="6" fill="#fff3e0" stroke="#FF9800" stroke-width="2"/>
  <text x="90" y="72" font-size="15.2" font-weight="700" text-anchor="middle" fill="#E65100" font-family="Inter, sans-serif">Source</text>
  <text x="90" y="89" font-size="14" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">nvram_get("cmd")</text>

  <!-- Arrow -->
  <line x1="150" y1="75" x2="205" y2="75" stroke="#555" stroke-width="2" marker-end="url(#vg-arr)"/>

  <!-- Guard 1: NVRAM flag -->
  <rect x="210" y="45" width="160" height="60" rx="6" fill="#fff" stroke="#E53935" stroke-width="2" stroke-dasharray="6,3"/>
  <text x="290" y="70" font-size="14" font-weight="600" text-anchor="middle" fill="#E53935" font-family="Inter, sans-serif">NVRAM Flag Check</text>
  <text x="290" y="88" font-size="14" text-anchor="middle" fill="#888" font-family="Inter, sans-serif">nvram_match("enable","1")</text>
  <!-- Question mark badge -->
  <circle cx="355" cy="50" r="12" fill="#E53935"/>
  <text x="355" y="55" font-size="16.3" font-weight="800" text-anchor="middle" fill="#fff" font-family="Inter, sans-serif">?</text>

  <!-- Arrow -->
  <line x1="370" y1="75" x2="420" y2="75" stroke="#555" stroke-width="2" marker-end="url(#vg-arr)"/>

  <!-- Guard 2: String compare -->
  <rect x="425" y="45" width="160" height="60" rx="6" fill="#fff" stroke="#E53935" stroke-width="2" stroke-dasharray="6,3"/>
  <text x="505" y="70" font-size="14" font-weight="600" text-anchor="middle" fill="#E53935" font-family="Inter, sans-serif">Input Sanitization</text>
  <text x="505" y="88" font-size="14" text-anchor="middle" fill="#888" font-family="Inter, sans-serif">validate_name(input)</text>
  <!-- Question mark badge -->
  <circle cx="570" cy="50" r="12" fill="#E53935"/>
  <text x="570" y="55" font-size="16.3" font-weight="800" text-anchor="middle" fill="#fff" font-family="Inter, sans-serif">?</text>

  <!-- Arrow -->
  <line x1="585" y1="75" x2="635" y2="75" stroke="#555" stroke-width="2" marker-end="url(#vg-arr)"/>

  <!-- Guard 3: Cross-binary -->
  <rect x="640" y="45" width="175" height="60" rx="6" fill="#fff" stroke="#E53935" stroke-width="2" stroke-dasharray="6,3"/>
  <text x="727" y="70" font-size="14" font-weight="600" text-anchor="middle" fill="#E53935" font-family="Inter, sans-serif">Cross-Binary IPC</text>
  <text x="727" y="88" font-size="14" text-anchor="middle" fill="#888" font-family="Inter, sans-serif">precondition in httpd</text>
  <!-- Question mark badge -->
  <circle cx="800" cy="50" r="12" fill="#E53935"/>
  <text x="800" y="55" font-size="16.3" font-weight="800" text-anchor="middle" fill="#fff" font-family="Inter, sans-serif">?</text>

  <!-- Arrow -->
  <line x1="815" y1="75" x2="875" y2="75" stroke="#555" stroke-width="2" marker-end="url(#vg-arr)"/>

  <!-- Sink node -->
  <rect x="880" y="50" width="130" height="50" rx="6" fill="#ffebee" stroke="#8C1D40" stroke-width="2"/>
  <text x="945" y="72" font-size="15.2" font-weight="700" text-anchor="middle" fill="#8C1D40" font-family="Inter, sans-serif">Sink</text>
  <text x="945" y="89" font-size="14" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">system(cmd)</text>

  <!-- ===== DIVIDER ===== -->
  <line x1="50" y1="135" x2="1000" y2="135" stroke="#ddd" stroke-width="1"/>
  <text x="525" y="160" font-size="15.2" font-weight="600" text-anchor="middle" fill="#555" font-family="Inter, sans-serif">The path exists in the CFG, but is it actually feasible?</text>

  <!-- ===== BOTTOM: Two outcomes side by side ===== -->

  <!-- Left: Without proof -->
  <rect x="60" y="185" width="420" height="240" rx="10" fill="#fafafa" stroke="#E53935" stroke-width="2"/>
  <rect x="60" y="185" width="420" height="40" rx="10" fill="#ffebee"/>
  <rect x="60" y="215" width="420" height="10" fill="#ffebee"/>
  <text x="270" y="212" font-size="17.5" font-weight="700" text-anchor="middle" fill="#C62828" font-family="Inter, sans-serif">Without Proof of Feasibility</text>

  <!-- Report card -->
  <rect x="100" y="245" width="340" height="50" rx="6" fill="#fff" stroke="#ddd" stroke-width="1.5"/>
  <text x="120" y="270" font-size="15.2" fill="#333" font-family="Inter, sans-serif">Vulnerability Report: command injection in dlnad</text>
  <text x="120" y="286" font-size="14" fill="#999" font-family="Inter, sans-serif">Evidence: static dataflow trace (no PoC)</text>

  <!-- Arrow down to rejection -->
  <line x1="270" y1="295" x2="270" y2="325" stroke="#E53935" stroke-width="2" marker-end="url(#vg-arr-red)"/>

  <!-- Rejection -->
  <rect x="140" y="330" width="260" height="45" rx="6" fill="#E53935" stroke="#C62828" stroke-width="1.5"/>
  <text x="270" y="350" font-size="16.3" font-weight="700" text-anchor="middle" fill="#fff" font-family="Inter, sans-serif">VENDOR REJECTS</text>
  <text x="270" y="367" font-size="15.2" text-anchor="middle" fill="#ffcdd2" font-family="Inter, sans-serif">"PoC required for triage"</text>

  <!-- Right: With proof -->
  <rect x="560" y="185" width="420" height="240" rx="10" fill="#fafafa" stroke="#2E7D32" stroke-width="2"/>
  <rect x="560" y="185" width="420" height="40" rx="10" fill="#e8f5e9"/>
  <rect x="560" y="215" width="420" height="10" fill="#e8f5e9"/>
  <text x="770" y="212" font-size="17.5" font-weight="700" text-anchor="middle" fill="#2E7D32" font-family="Inter, sans-serif">With Concrete Triggering Input</text>

  <!-- Report card -->
  <rect x="600" y="245" width="340" height="50" rx="6" fill="#fff" stroke="#ddd" stroke-width="1.5"/>
  <text x="620" y="270" font-size="15.2" fill="#333" font-family="Inter, sans-serif">Vulnerability Report: command injection in dlnad</text>
  <text x="620" y="286" font-size="14" fill="#2E7D32" font-weight="600" font-family="Inter, sans-serif">Evidence: concrete PoC exploit attached</text>

  <!-- Arrow down to acceptance -->
  <line x1="770" y1="295" x2="770" y2="325" stroke="#2E7D32" stroke-width="2" marker-end="url(#vg-arr-green)"/>

  <!-- Acceptance -->
  <rect x="640" y="330" width="260" height="45" rx="6" fill="#2E7D32" stroke="#1B5E20" stroke-width="1.5"/>
  <text x="770" y="350" font-size="16.3" font-weight="700" text-anchor="middle" fill="#fff" font-family="Inter, sans-serif">CVE ASSIGNED</text>
  <text x="770" y="367" font-size="15.2" text-anchor="middle" fill="#c8e6c9" font-family="Inter, sans-serif">Patch issued, disclosure coordinated</text>

  <!-- Key question -->
  <text x="770" y="410" font-size="15.2" text-anchor="middle" fill="#999" font-family="Inter, sans-serif">Requires automated path feasibility reasoning</text>

  <!-- ===== BOTTOM KEY QUESTION ===== -->
  <text x="525" y="452" font-size="17.5" font-weight="700" text-anchor="middle" fill="#8C1D40" font-family="Inter, sans-serif">Can we validate path feasibility at scale?</text>

</svg>

???

A single analysis technique leaves gaps. Static analysis flags paths but cannot prove they execute. Fuzzing proves execution but only for paths it reaches. Symbolic execution proves reachability but collapses at scale.

Path explosion illustrates the fundamental problem. Symbolic execution explores both branches at every conditional, creating exponential growth in the number of paths: one state becomes two, then four, then eight. With binaries as complex as firmware, the sink is buried deep in the state space, practically unreachable through brute-force exploration. The question: can we combine directed symbolic execution with static analysis results to validate candidates efficiently?
