---
type: content
title: "LLM-Directed Fuzzing"
---

<div id="dyn-dir-diagram">
<svg viewBox="0 0 1050 400" style="width:100%; margin:0 auto; display:block;" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <marker id="dyn-dir-arr" markerWidth="8" markerHeight="8" refX="7" refY="3" orient="auto">
      <polygon points="0 0, 8 3, 0 6" fill="#666"/>
    </marker>
  </defs>

  <!-- Context pills -->
  <rect x="15" y="10" width="240" height="40" rx="6" fill="#e3f2fd" stroke="#2196F3" stroke-width="2"/>
  <text x="135" y="35" font-size="13" font-weight="700" text-anchor="middle" fill="#1565C0" font-family="Inter, sans-serif">Coverage-Guided Fuzzing</text>

  <rect x="270" y="10" width="240" height="40" rx="6" fill="#fff3e0" stroke="#FF9800" stroke-width="2"/>
  <text x="390" y="35" font-size="13" font-weight="700" text-anchor="middle" fill="#E65100" font-family="Inter, sans-serif">Grammar-Based Fuzzing</text>

  <rect x="525" y="10" width="240" height="40" rx="6" fill="#e8f5e9" stroke="#4CAF50" stroke-width="2"/>
  <text x="645" y="35" font-size="13" font-weight="700" text-anchor="middle" fill="#2E7D32" font-family="Inter, sans-serif">LLM Seed Generation</text>

  <!-- Detail card -->
  <g id="dyn-dir-card">
    <rect x="100" y="70" width="850" height="300" rx="12" fill="#fafafa" stroke="#8C1D40" stroke-width="2.5"/>
    <rect x="100" y="70" width="850" height="50" rx="12" fill="#fce4ec"/>
    <rect x="100" y="110" width="850" height="10" fill="#fce4ec"/>
    <text x="525" y="103" font-size="22" font-weight="700" text-anchor="middle" fill="#8C1D40" font-family="Inter, sans-serif">LLM-Directed Fuzzing</text>
    <text x="830" y="103" font-size="14" fill="#999" font-family="Inter, sans-serif">(AIJON)</text>

    <rect x="150" y="145" width="160" height="80" rx="6" fill="#fff" stroke="#8C1D40" stroke-width="1.5"/>
    <text x="230" y="170" font-size="14" font-weight="600" text-anchor="middle" fill="#8C1D40" font-family="Inter, sans-serif">Target Location</text>
    <text x="230" y="190" font-size="12" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">POI from Analysis</text>
    <text x="230" y="206" font-size="12" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">Graph or SAST</text>

    <line x1="310" y1="185" x2="370" y2="185" stroke="#666" stroke-width="2" marker-end="url(#dyn-dir-arr)"/>

    <rect x="375" y="135" width="180" height="100" rx="6" fill="#fce4ec" stroke="#8C1D40" stroke-width="2"/>
    <text x="465" y="163" font-size="14" font-weight="600" text-anchor="middle" fill="#8C1D40" font-family="Inter, sans-serif">LLM Annotation</text>
    <text x="465" y="185" font-size="12" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">Generates custom IJON</text>
    <text x="465" y="201" font-size="12" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">feedback signals that</text>
    <text x="465" y="217" font-size="12" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">guide fuzzer to location</text>

    <line x1="555" y1="185" x2="615" y2="185" stroke="#666" stroke-width="2" marker-end="url(#dyn-dir-arr)"/>

    <rect x="620" y="145" width="180" height="80" rx="6" fill="#fff" stroke="#8C1D40" stroke-width="1.5"/>
    <text x="710" y="170" font-size="14" font-weight="600" text-anchor="middle" fill="#8C1D40" font-family="Inter, sans-serif">Directed Fuzzer</text>
    <text x="710" y="190" font-size="12" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">Steered toward specific</text>
    <text x="710" y="206" font-size="12" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">code locations</text>

    <rect x="200" y="270" width="250" height="55" rx="6" fill="#fce4ec" stroke="#8C1D40" stroke-width="1.5"/>
    <text x="325" y="295" font-size="28" font-weight="bold" text-anchor="middle" fill="#8C1D40" font-family="Inter, sans-serif">35x</text>
    <text x="325" y="315" font-size="12" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">vs conventional directed fuzzers</text>

    <rect x="500" y="270" width="250" height="55" rx="6" fill="#fce4ec" stroke="#8C1D40" stroke-width="1.5"/>
    <text x="625" y="295" font-size="28" font-weight="bold" text-anchor="middle" fill="#8C1D40" font-family="Inter, sans-serif">100x</text>
    <text x="625" y="315" font-size="12" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">with high-quality seeds</text>
  </g>

</svg>
</div>

???

AIJON is the most novel component. It uses an LLM to automatically generate IJON annotations, custom feedback signals that guide the fuzzer toward specific program locations. Preliminary results show a 35x speedup over conventional directed fuzzers, and 100x faster with high-quality seeds. That acceleration is critical in a time-bounded competition.
