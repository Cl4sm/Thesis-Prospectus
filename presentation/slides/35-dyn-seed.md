---
type: content
title: "LLM Seed Generation"
---

<div id="dyn-seed-diagram">
<svg viewBox="0 0 1050 400" style="width:100%; margin:0 auto; display:block;" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <marker id="dyn-seed-arr" markerWidth="8" markerHeight="8" refX="7" refY="3" orient="auto">
      <polygon points="0 0, 8 3, 0 6" fill="#666"/>
    </marker>
  </defs>

  <!-- Context pills -->
  <rect x="15" y="10" width="240" height="40" rx="6" fill="#e3f2fd" stroke="#2196F3" stroke-width="2"/>
  <text x="135" y="35" font-size="13" font-weight="700" text-anchor="middle" fill="#1565C0" font-family="Inter, sans-serif">Coverage-Guided Fuzzing</text>

  <rect x="270" y="10" width="240" height="40" rx="6" fill="#fff3e0" stroke="#FF9800" stroke-width="2"/>
  <text x="390" y="35" font-size="13" font-weight="700" text-anchor="middle" fill="#E65100" font-family="Inter, sans-serif">Grammar-Based Fuzzing</text>

  <!-- Detail card -->
  <g id="dyn-seed-card">
    <rect x="100" y="70" width="850" height="280" rx="12" fill="#fafafa" stroke="#4CAF50" stroke-width="2.5"/>
    <rect x="100" y="70" width="850" height="50" rx="12" fill="#e8f5e9"/>
    <rect x="100" y="110" width="850" height="10" fill="#e8f5e9"/>
    <text x="525" y="103" font-size="22" font-weight="700" text-anchor="middle" fill="#2E7D32" font-family="Inter, sans-serif">LLM Seed Generation</text>
    <text x="850" y="103" font-size="14" fill="#999" font-family="Inter, sans-serif">(QuickSeed + DiscoveryGuy)</text>

    <rect x="150" y="145" width="160" height="80" rx="6" fill="#fff" stroke="#4CAF50" stroke-width="1.5"/>
    <text x="230" y="170" font-size="14" font-weight="600" text-anchor="middle" fill="#2E7D32" font-family="Inter, sans-serif">Source Code</text>
    <text x="230" y="190" font-size="12" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">Target codebase +</text>
    <text x="230" y="206" font-size="12" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">input format hints</text>

    <line x1="310" y1="185" x2="370" y2="185" stroke="#666" stroke-width="2" marker-end="url(#dyn-seed-arr)"/>

    <rect x="375" y="135" width="180" height="100" rx="6" fill="#e8f5e9" stroke="#4CAF50" stroke-width="2"/>
    <text x="465" y="163" font-size="14" font-weight="600" text-anchor="middle" fill="#2E7D32" font-family="Inter, sans-serif">LLM Analysis</text>
    <text x="465" y="185" font-size="12" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">Examines functions,</text>
    <text x="465" y="201" font-size="12" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">identifies input patterns,</text>
    <text x="465" y="217" font-size="12" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">generates valid instances</text>

    <line x1="555" y1="165" x2="615" y2="155" stroke="#666" stroke-width="2" marker-end="url(#dyn-seed-arr)"/>
    <line x1="555" y1="205" x2="615" y2="215" stroke="#666" stroke-width="2" marker-end="url(#dyn-seed-arr)"/>

    <rect x="620" y="130" width="160" height="45" rx="6" fill="#e3f2fd" stroke="#2196F3" stroke-width="1.5"/>
    <text x="700" y="158" font-size="13" font-weight="600" text-anchor="middle" fill="#1565C0" font-family="Inter, sans-serif">Coverage Fuzzer</text>

    <rect x="620" y="190" width="160" height="45" rx="6" fill="#fff3e0" stroke="#FF9800" stroke-width="1.5"/>
    <text x="700" y="218" font-size="13" font-weight="600" text-anchor="middle" fill="#E65100" font-family="Inter, sans-serif">Grammar Fuzzer</text>

    <rect x="200" y="280" width="650" height="40" rx="5" fill="#f5f5f5" stroke="#4CAF50" stroke-width="1"/>
    <text x="525" y="306" font-size="14" font-weight="600" text-anchor="middle" fill="#333" font-family="Inter, sans-serif">Bootstraps both fuzzers with structurally valid initial inputs</text>
  </g>

</svg>
</div>

???

LLM seed generation through QuickSeed and DiscoveryGuy. Both components examine the target codebase and produce initial inputs that exercise interesting functionality. Those seeds bootstrap the coverage-guided and grammar-based fuzzers.
