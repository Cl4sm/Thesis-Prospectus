---
type: content
title: "Static Analysis Pipeline"
---

<svg viewBox="0 0 1000 300" style="width:100%; margin:0 auto; display:block;" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <marker id="arrSA" markerWidth="10" markerHeight="10" refX="9" refY="3" orient="auto">
      <path d="M0,0 L0,6 L9,3 z" fill="#4CAF50"/>
    </marker>
  </defs>

  <!-- Step 1: CodeQL -->
  <rect x="20" y="80" width="180" height="120" fill="#E3F2FD" stroke="#2196F3" stroke-width="2" rx="6"/>
  <text x="110" y="115" font-size="15" font-weight="bold" text-anchor="middle" fill="#1565C0">CodeQL</text>
  <text x="110" y="140" font-size="11" text-anchor="middle" fill="#444">Vulnerability detection</text>
  <text x="110" y="160" font-size="11" text-anchor="middle" fill="#444">across C and Java</text>
  <text x="110" y="185" font-size="10" text-anchor="middle" fill="#999">Buffer overflows, injections,</text>
  <text x="110" y="198" font-size="10" text-anchor="middle" fill="#999">use-after-free, etc.</text>

  <line x1="200" y1="140" x2="250" y2="140" stroke="#4CAF50" stroke-width="2.5" marker-end="url(#arrSA)"/>

  <!-- Step 2: SAST Trimming -->
  <rect x="250" y="80" width="200" height="120" fill="#FFF3E0" stroke="#FF9800" stroke-width="2" rx="6"/>
  <text x="350" y="115" font-size="15" font-weight="bold" text-anchor="middle" fill="#E65100">SAST Trimming</text>
  <text x="350" y="140" font-size="11" text-anchor="middle" fill="#444">LLM validates warnings</text>
  <text x="350" y="160" font-size="11" text-anchor="middle" fill="#444">Filters false positives</text>
  <text x="350" y="185" font-size="10" text-anchor="middle" fill="#999">Checks surrounding code</text>
  <text x="350" y="198" font-size="10" text-anchor="middle" fill="#999">context for each warning</text>

  <line x1="450" y1="140" x2="500" y2="140" stroke="#4CAF50" stroke-width="2.5" marker-end="url(#arrSA)"/>

  <!-- Step 3: Analysis Graph -->
  <rect x="500" y="80" width="200" height="120" fill="#E8F5E9" stroke="#4CAF50" stroke-width="2" rx="6"/>
  <text x="600" y="115" font-size="15" font-weight="bold" text-anchor="middle" fill="#2E7D32">Analysis Graph</text>
  <text x="600" y="140" font-size="11" text-anchor="middle" fill="#444">Confirmed warnings</text>
  <text x="600" y="160" font-size="11" text-anchor="middle" fill="#444">create POIs</text>
  <text x="600" y="185" font-size="10" text-anchor="middle" fill="#999">Points of Interest for</text>
  <text x="600" y="198" font-size="10" text-anchor="middle" fill="#999">cross-technique coordination</text>

  <line x1="700" y1="140" x2="750" y2="140" stroke="#4CAF50" stroke-width="2.5" marker-end="url(#arrSA)"/>

  <!-- Step 4: Directed Fuzzing -->
  <rect x="750" y="80" width="220" height="120" fill="#FCE4EC" stroke="#8C1D40" stroke-width="2" rx="6"/>
  <text x="860" y="115" font-size="15" font-weight="bold" text-anchor="middle" fill="#8C1D40">Directed Fuzzing</text>
  <text x="860" y="140" font-size="11" text-anchor="middle" fill="#444">AIJON targets confirmed</text>
  <text x="860" y="160" font-size="11" text-anchor="middle" fill="#444">SAST locations</text>
  <text x="860" y="185" font-size="10" text-anchor="middle" fill="#999">Static tells fuzzer where;</text>
  <text x="860" y="198" font-size="10" text-anchor="middle" fill="#999">fuzzer confirms if real</text>

  <!-- Bottom summary -->
  <rect x="200" y="240" width="600" height="40" fill="#f5f5f5" stroke="#666" stroke-width="1" rx="4"/>
  <text x="500" y="266" font-size="12" font-weight="bold" text-anchor="middle" fill="#333">Static analysis guides fuzzing; fuzzing validates static findings</text>
</svg>

???

The static analysis pipeline uses CodeQL to scan the full codebase. CodeQL produces structured vulnerability reports covering buffer overflows, injection flaws, use-after-free patterns, and other CWE categories across both C and Java. Raw CodeQL output is noisy. Many warnings are false positives. Patterns that look dangerous at first reading turn out to be protected by invariants or preconditions the analyzer did not understand. The SAST trimming layer uses an LLM to evaluate each warning against the surrounding code context and filter out likely false positives. Surviving warnings feed into the Analysis Graph as Points of Interest. Those POIs then guide the directed fuzzing pipeline. When static analysis flags a suspicious function, AIJON generates targeted annotations to drive the fuzzer toward that code location. Static analysis tells the fuzzer where to look; the fuzzer confirms whether the warning is real and demonstrates how to trigger it. This feedback loop between static analysis and dynamic fuzzing prevents both the overfitting of static analysis and the inefficient exploration of undirected fuzzing.
