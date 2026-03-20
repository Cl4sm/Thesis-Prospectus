---
type: content
title: "The Analysis Graph"
footnote: "Shared evidence accumulation across coordinated agents"
---

<svg viewBox="0 0 1050 480" style="width:100%; display:block; margin: 0 auto;" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <marker id="ag-arr" markerWidth="9" markerHeight="9" refX="8" refY="3" orient="auto">
      <polygon points="0 0, 9 3, 0 6" fill="#999"/>
    </marker>
    <marker id="ag-arr-blue" markerWidth="9" markerHeight="9" refX="8" refY="3" orient="auto">
      <polygon points="0 0, 9 3, 0 6" fill="#2196F3"/>
    </marker>
    <marker id="ag-arr-orange" markerWidth="9" markerHeight="9" refX="8" refY="3" orient="auto">
      <polygon points="0 0, 9 3, 0 6" fill="#FF9800"/>
    </marker>
    <marker id="ag-arr-green" markerWidth="9" markerHeight="9" refX="8" refY="3" orient="auto">
      <polygon points="0 0, 9 3, 0 6" fill="#4CAF50"/>
    </marker>
    <marker id="ag-arr-maroon" markerWidth="9" markerHeight="9" refX="8" refY="3" orient="auto">
      <polygon points="0 0, 9 3, 0 6" fill="#8C1D40"/>
    </marker>
    <marker id="ag-arr-gray" markerWidth="9" markerHeight="9" refX="8" refY="3" orient="auto">
      <polygon points="0 0, 9 3, 0 6" fill="#999"/>
    </marker>
  </defs>

  <!-- ===== TOP ROW: Agent boxes ===== -->

  <!-- Scanner -->
  <rect x="30" y="20" width="220" height="70" rx="6" fill="#f5f5f5" stroke="#2196F3" stroke-width="2.5"/>
  <text x="140" y="50" font-size="16" font-weight="bold" text-anchor="middle" fill="#1565C0" font-family="Arial, sans-serif">Scanner</text>
  <text x="140" y="72" font-size="12" text-anchor="middle" fill="#666" font-family="Arial, sans-serif">LLM + static analysis</text>

  <!-- Fuzzer -->
  <rect x="285" y="20" width="220" height="70" rx="6" fill="#f5f5f5" stroke="#FF9800" stroke-width="2.5"/>
  <text x="395" y="50" font-size="16" font-weight="bold" text-anchor="middle" fill="#E65100" font-family="Arial, sans-serif">Fuzzer</text>
  <text x="395" y="72" font-size="12" text-anchor="middle" fill="#666" font-family="Arial, sans-serif">Coverage + grammar-guided</text>

  <!-- RCA -->
  <rect x="540" y="20" width="220" height="70" rx="6" fill="#f5f5f5" stroke="#4CAF50" stroke-width="2.5"/>
  <text x="650" y="50" font-size="16" font-weight="bold" text-anchor="middle" fill="#2E7D32" font-family="Arial, sans-serif">Root Cause Analysis</text>
  <text x="650" y="72" font-size="12" text-anchor="middle" fill="#666" font-family="Arial, sans-serif">Crash-to-code correlation</text>

  <!-- Patcher -->
  <rect x="795" y="20" width="220" height="70" rx="6" fill="#f5f5f5" stroke="#8C1D40" stroke-width="2.5"/>
  <text x="905" y="50" font-size="16" font-weight="bold" text-anchor="middle" fill="#8C1D40" font-family="Arial, sans-serif">Patcher</text>
  <text x="905" y="72" font-size="12" text-anchor="middle" fill="#666" font-family="Arial, sans-serif">LLM-generated fix + validation</text>

  <!-- ===== ARROWS DOWN from agents to graph ===== -->
  <line x1="140" y1="90" x2="140" y2="148" stroke="#2196F3" stroke-width="2" marker-end="url(#ag-arr-blue)"/>
  <line x1="395" y1="90" x2="395" y2="148" stroke="#FF9800" stroke-width="2" marker-end="url(#ag-arr-orange)"/>
  <line x1="650" y1="90" x2="650" y2="148" stroke="#4CAF50" stroke-width="2" marker-end="url(#ag-arr-green)"/>
  <line x1="905" y1="90" x2="905" y2="148" stroke="#8C1D40" stroke-width="2" marker-end="url(#ag-arr-maroon)"/>

  <!-- ===== ANALYSIS GRAPH: central band ===== -->
  <rect x="30" y="155" width="985" height="45" rx="6" fill="#F8EEF1" stroke="#8C1D40" stroke-width="2"/>
  <text x="525" y="183" font-size="16" font-weight="700" text-anchor="middle" fill="#8C1D40" font-family="Arial, sans-serif">Analysis Graph</text>

  <!-- ===== ARROWS DOWN from graph to POI timeline ===== -->
  <line x1="140" y1="200" x2="140" y2="238" stroke="#999" stroke-width="1.5" marker-end="url(#ag-arr-gray)"/>
  <line x1="395" y1="200" x2="395" y2="238" stroke="#999" stroke-width="1.5" marker-end="url(#ag-arr-gray)"/>
  <line x1="650" y1="200" x2="650" y2="238" stroke="#999" stroke-width="1.5" marker-end="url(#ag-arr-gray)"/>
  <line x1="905" y1="200" x2="905" y2="238" stroke="#999" stroke-width="1.5" marker-end="url(#ag-arr-gray)"/>

  <!-- ===== POI CARDS: evidence accumulation ===== -->

  <!-- POI 1: Created -->
  <rect x="40" y="245" width="200" height="130" rx="6" fill="#fafafa" stroke="#2196F3" stroke-width="2"/>
  <rect x="40" y="245" width="200" height="28" rx="6" fill="#e3f2fd"/>
  <rect x="40" y="265" width="200" height="8" fill="#e3f2fd"/>
  <text x="140" y="265" font-size="13" font-weight="bold" text-anchor="middle" fill="#1565C0" font-family="Arial, sans-serif">POI Created</text>
  <text x="58" y="298" font-size="13" fill="#333" font-family="Arial, sans-serif">Function: X</text>
  <text x="58" y="318" font-size="13" fill="#333" font-family="Arial, sans-serif">Evidence: 1</text>
  <text x="58" y="342" font-size="13" fill="#2196F3" font-weight="600" font-family="Arial, sans-serif">Signal: suspicious</text>
  <!-- Confidence bar -->
  <rect x="58" y="354" width="164" height="8" rx="4" fill="#e0e0e0"/>
  <rect x="58" y="354" width="41" height="8" rx="4" fill="#2196F3"/>

  <!-- Arrow between POI cards -->
  <path d="M 240 310 L 285 310" stroke="#bbb" stroke-width="2" fill="none" marker-end="url(#ag-arr)"/>

  <!-- POI 2: Updated -->
  <rect x="295" y="245" width="200" height="130" rx="6" fill="#fafafa" stroke="#FF9800" stroke-width="2"/>
  <rect x="295" y="245" width="200" height="28" rx="6" fill="#fff3e0"/>
  <rect x="295" y="265" width="200" height="8" fill="#fff3e0"/>
  <text x="395" y="265" font-size="13" font-weight="bold" text-anchor="middle" fill="#E65100" font-family="Arial, sans-serif">POI Updated</text>
  <text x="313" y="298" font-size="13" fill="#333" font-family="Arial, sans-serif">Function: X</text>
  <text x="313" y="318" font-size="13" fill="#333" font-family="Arial, sans-serif">Evidence: 2</text>
  <text x="313" y="342" font-size="13" fill="#FF9800" font-weight="600" font-family="Arial, sans-serif">+ crash detected</text>
  <!-- Confidence bar -->
  <rect x="313" y="354" width="164" height="8" rx="4" fill="#e0e0e0"/>
  <rect x="313" y="354" width="82" height="8" rx="4" fill="#FF9800"/>

  <!-- Arrow between POI cards -->
  <path d="M 495 310 L 540 310" stroke="#bbb" stroke-width="2" fill="none" marker-end="url(#ag-arr)"/>

  <!-- POI 3: Diagnosed -->
  <rect x="550" y="245" width="200" height="130" rx="6" fill="#fafafa" stroke="#4CAF50" stroke-width="2"/>
  <rect x="550" y="245" width="200" height="28" rx="6" fill="#e8f5e9"/>
  <rect x="550" y="265" width="200" height="8" fill="#e8f5e9"/>
  <text x="650" y="265" font-size="13" font-weight="bold" text-anchor="middle" fill="#2E7D32" font-family="Arial, sans-serif">POI Diagnosed</text>
  <text x="568" y="298" font-size="13" fill="#333" font-family="Arial, sans-serif">Function: X</text>
  <text x="568" y="318" font-size="13" fill="#333" font-family="Arial, sans-serif">Evidence: 3</text>
  <text x="568" y="342" font-size="13" fill="#4CAF50" font-weight="600" font-family="Arial, sans-serif">+ buffer overflow L42</text>
  <!-- Confidence bar -->
  <rect x="568" y="354" width="164" height="8" rx="4" fill="#e0e0e0"/>
  <rect x="568" y="354" width="123" height="8" rx="4" fill="#4CAF50"/>

  <!-- Arrow between POI cards -->
  <path d="M 750 310 L 795 310" stroke="#bbb" stroke-width="2" fill="none" marker-end="url(#ag-arr)"/>

  <!-- POI 4: Complete -->
  <rect x="805" y="245" width="200" height="130" rx="6" fill="#fafafa" stroke="#8C1D40" stroke-width="2"/>
  <rect x="805" y="245" width="200" height="28" rx="6" fill="#fce4ec"/>
  <rect x="805" y="265" width="200" height="8" fill="#fce4ec"/>
  <text x="905" y="265" font-size="13" font-weight="bold" text-anchor="middle" fill="#8C1D40" font-family="Arial, sans-serif">POI Complete</text>
  <text x="823" y="298" font-size="13" fill="#333" font-family="Arial, sans-serif">Function: X</text>
  <text x="823" y="318" font-size="13" fill="#333" font-family="Arial, sans-serif">Evidence: 4</text>
  <text x="823" y="342" font-size="13" fill="#8C1D40" font-weight="600" font-family="Arial, sans-serif">+ patch validated</text>
  <!-- Confidence bar -->
  <rect x="823" y="354" width="164" height="8" rx="4" fill="#e0e0e0"/>
  <rect x="823" y="354" width="164" height="8" rx="4" fill="#8C1D40"/>

  <!-- ===== BOTTOM: Key insight ===== -->
  <text x="525" y="420" font-size="15" text-anchor="middle" fill="#333" font-family="Arial, sans-serif">Each agent contributes evidence independently. The graph accumulates knowledge across techniques.</text>
  <text x="525" y="445" font-size="13" text-anchor="middle" fill="#888" font-family="Arial, sans-serif">Coordination through shared state, not explicit communication.</text>

</svg>

???

The Analysis Graph is the system's shared memory. Walk through the lifecycle. A scanner examines the code and identifies function X as suspicious. It creates a Point of Interest in the graph. That POI contains what the scanner found and why. Next, the fuzzer is running in parallel. After hours of exploration, it triggers a crash in function X. The fuzzer doesn't know a scanner already flagged that location. But the Analysis Graph does. The fuzzer queries the graph, finds the existing POI, and links its crash to it. Now the POI has two independent pieces of evidence. Root-cause analysis runs next. It correlates the crash with source code and narrows the problem to a buffer overflow at line 42. The POI now has three pieces of evidence and a diagnosis. Finally, a patcher generates a fix. The fix is validated against the test suite. What you're seeing is knowledge accumulation. Each agent adds a piece. The graph coordinates that accumulation. No agent needs to understand what other agents do. They all read from and write to the same structure. That's coordination through shared state, not explicit communication.
