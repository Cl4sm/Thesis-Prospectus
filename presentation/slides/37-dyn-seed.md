---
type: content
title: "LLM Seed Generation"
---

<div id="dyn-seed-diagram">
<svg viewBox="0 -50 1050 466" style="width:100%; margin:0 auto; display:block;" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <marker id="dyn-seed-arr" markerWidth="8" markerHeight="8" refX="7" refY="3" orient="auto">
      <polygon points="0 0, 8 3, 0 6" fill="#666"/>
    </marker>
  </defs>

  <!-- All four context pills -->
  <rect x="15" y="10" width="240" height="40" rx="6" fill="#e8f5e9" stroke="#4CAF50" stroke-width="2"/>
  <text x="135" y="35" font-size="15.2" font-weight="700" text-anchor="middle" fill="#2E7D32" font-family="Inter, sans-serif">LLM Seed Generation</text>

  <rect x="270" y="10" width="240" height="40" rx="6" fill="#f5f5f5" stroke="#999" stroke-width="1.5"/>
  <text x="390" y="35" font-size="15.2" font-weight="700" text-anchor="middle" fill="#999" font-family="Inter, sans-serif">Coverage-Guided Fuzzing</text>

  <rect x="525" y="10" width="240" height="40" rx="6" fill="#f5f5f5" stroke="#999" stroke-width="1.5"/>
  <text x="645" y="35" font-size="15.2" font-weight="700" text-anchor="middle" fill="#999" font-family="Inter, sans-serif">Grammar-Based Fuzzing</text>

  <rect x="780" y="10" width="250" height="40" rx="6" fill="#f5f5f5" stroke="#999" stroke-width="1.5"/>
  <text x="905" y="35" font-size="15.2" font-weight="700" text-anchor="middle" fill="#999" font-family="Inter, sans-serif">LLM-Directed Fuzzing</text>

  <!-- Detail card -->
  <g id="dyn-seed-card">
    <rect x="100" y="70" width="850" height="50" rx="12" fill="#e8f5e9"/>
    <rect x="100" y="110" width="850" height="10" fill="#e8f5e9"/>
    <rect x="100" y="70" width="850" height="280" rx="12" fill="#fafafa00" stroke="#4CAF50" stroke-width="2.5"/>
    <text x="525" y="103" font-size="25.7" font-weight="700" text-anchor="middle" fill="#2E7D32" font-family="Inter, sans-serif">LLM Seed Generation</text>
    <text x="720" y="103" font-size="16.3" fill="#999" font-family="Inter, sans-serif">(QuickSeed + DiscoveryGuy)</text>

    <rect x="210" y="175" width="160" height="80" rx="6" fill="#fff" stroke="#4CAF50" stroke-width="1.5"/>
    <text x="290" y="200" font-size="16.3" font-weight="600" text-anchor="middle" fill="#2E7D32" font-family="Inter, sans-serif">Source Code</text>
    <text x="290" y="220" font-size="13" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">Target codebase +</text>
    <text x="290" y="236" font-size="13" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">input format hints</text>

    <line x1="370" y1="215" x2="430" y2="215" stroke="#666" stroke-width="2" marker-end="url(#dyn-seed-arr)"/>

    <rect x="435" y="165" width="180" height="100" rx="6" fill="#e8f5e9" stroke="#4CAF50" stroke-width="2"/>
    <text x="525" y="193" font-size="16.3" font-weight="600" text-anchor="middle" fill="#2E7D32" font-family="Inter, sans-serif">LLM Analysis</text>
    <text x="525" y="213" font-size="13" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">Examines functions,</text>
    <text x="525" y="229" font-size="13" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">identifies input patterns,</text>
    <text x="525" y="245" font-size="13" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">generates valid instances</text>

    <line x1="615" y1="195" x2="675" y2="185" stroke="#666" stroke-width="2" marker-end="url(#dyn-seed-arr)"/>
    <line x1="615" y1="235" x2="675" y2="245" stroke="#666" stroke-width="2" marker-end="url(#dyn-seed-arr)"/>

    <rect x="680" y="160" width="160" height="45" rx="6" fill="#e3f2fd" stroke="#2196F3" stroke-width="1.5"/>
    <text x="760" y="188" font-size="15.2" font-weight="600" text-anchor="middle" fill="#1565C0" font-family="Inter, sans-serif">Coverage Fuzzer</text>

    <rect x="680" y="220" width="160" height="45" rx="6" fill="#fff3e0" stroke="#FF9800" stroke-width="1.5"/>
    <text x="760" y="248" font-size="15.2" font-weight="600" text-anchor="middle" fill="#E65100" font-family="Inter, sans-serif">Grammar Fuzzer</text>

    <rect x="200" y="295" width="650" height="40" rx="5" fill="#f5f5f5" stroke="#4CAF50" stroke-width="1"/>
    <text x="525" y="321" font-size="16.3" font-weight="600" text-anchor="middle" fill="#333" font-family="Inter, sans-serif">Bootstraps both fuzzers with structurally valid initial inputs</text>
  </g>

</svg>
</div>

???

LLM seed generation through QuickSeed and DiscoveryGuy. Both components examine the target codebase and produce initial inputs that exercise interesting functionality. Those seeds bootstrap the coverage-guided and grammar-based fuzzers.
