---
type: content
title: "Grammar-Based Fuzzing"
---

<div id="dyn-gram-diagram">
<svg viewBox="0 0 1050 400" style="width:100%; margin:0 auto; display:block;" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <marker id="dyn-gram-arr" markerWidth="8" markerHeight="8" refX="7" refY="3" orient="auto">
      <polygon points="0 0, 8 3, 0 6" fill="#666"/>
    </marker>
  </defs>

  <!-- Context pill: Coverage-Guided -->
  <rect x="15" y="10" width="240" height="40" rx="6" fill="#e3f2fd" stroke="#2196F3" stroke-width="2"/>
  <text x="135" y="35" font-size="13" font-weight="700" text-anchor="middle" fill="#1565C0" font-family="Inter, sans-serif">Coverage-Guided Fuzzing</text>

  <!-- Detail card -->
  <g id="dyn-gram-card">
    <rect x="100" y="70" width="850" height="280" rx="12" fill="#fafafa" stroke="#FF9800" stroke-width="2.5"/>
    <rect x="100" y="70" width="850" height="50" rx="12" fill="#fff3e0"/>
    <rect x="100" y="110" width="850" height="10" fill="#fff3e0"/>
    <text x="525" y="103" font-size="22" font-weight="700" text-anchor="middle" fill="#E65100" font-family="Inter, sans-serif">Grammar-Based Fuzzing</text>
    <text x="825" y="103" font-size="14" fill="#999" font-family="Inter, sans-serif">(GrammarGuy)</text>

    <rect x="150" y="145" width="200" height="90" rx="6" fill="#fff" stroke="#FF9800" stroke-width="1.5"/>
    <text x="250" y="168" font-size="14" font-weight="600" text-anchor="middle" fill="#E65100" font-family="Inter, sans-serif">Grammar Rules</text>
    <text x="250" y="190" font-size="12" text-anchor="middle" fill="#666" font-family="monospace">{"key": &lt;string&gt;,</text>
    <text x="250" y="206" font-size="12" text-anchor="middle" fill="#666" font-family="monospace"> "val": &lt;number&gt;}</text>
    <text x="250" y="225" font-size="11" text-anchor="middle" fill="#999" font-family="Inter, sans-serif">extracted from target code</text>

    <line x1="350" y1="190" x2="420" y2="190" stroke="#666" stroke-width="2" marker-end="url(#dyn-gram-arr)"/>

    <rect x="425" y="145" width="200" height="90" rx="6" fill="#fff3e0" stroke="#FF9800" stroke-width="2"/>
    <text x="525" y="168" font-size="14" font-weight="600" text-anchor="middle" fill="#E65100" font-family="Inter, sans-serif">GrammarGuy Engine</text>
    <text x="525" y="190" font-size="12" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">Generates syntactically</text>
    <text x="525" y="206" font-size="12" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">valid test cases</text>
    <text x="525" y="225" font-size="11" text-anchor="middle" fill="#999" font-family="Inter, sans-serif">grammar composition + mutation</text>

    <line x1="625" y1="190" x2="695" y2="190" stroke="#666" stroke-width="2" marker-end="url(#dyn-gram-arr)"/>

    <rect x="700" y="145" width="200" height="90" rx="6" fill="#fff" stroke="#FF9800" stroke-width="1.5"/>
    <text x="800" y="168" font-size="14" font-weight="600" text-anchor="middle" fill="#E65100" font-family="Inter, sans-serif">Target Parser</text>
    <text x="800" y="190" font-size="12" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">JSON, SQL, XML, protocol</text>
    <text x="800" y="206" font-size="12" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">handlers accept valid</text>
    <text x="800" y="225" font-size="11" text-anchor="middle" fill="#999" font-family="Inter, sans-serif">inputs and process deeply</text>

    <rect x="200" y="280" width="650" height="40" rx="5" fill="#f5f5f5" stroke="#FF9800" stroke-width="1"/>
    <text x="525" y="306" font-size="14" font-weight="600" text-anchor="middle" fill="#333" font-family="Inter, sans-serif">Reaches code paths that random mutation cannot: format-aware exploration</text>
  </g>

</svg>
</div>

???

Grammar-based fuzzing solves the structured input problem. GrammarGuy understands input structure and generates syntactically valid test cases for JSON, SQL, XML parsers. It reaches code paths that random mutation cannot.
