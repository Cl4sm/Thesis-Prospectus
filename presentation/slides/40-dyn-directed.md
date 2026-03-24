---
type: content
title: "AIJON"
---

<div id="dyn-dir-diagram">
<svg viewBox="0 -50 1050 466" style="width:100%; margin:0 auto; display:block;" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <marker id="dyn-dir-arr" markerWidth="8" markerHeight="8" refX="7" refY="3" orient="auto">
      <polygon points="0 0, 8 3, 0 6" fill="#666"/>
    </marker>
  </defs>


  <!-- All four context pills -->
  <rect x="15" y="10" width="240" height="40" rx="6" fill="#f5f5f5" stroke="#999" stroke-width="1.5"/>
  <text x="135" y="35" font-size="15.2" font-weight="700" text-anchor="middle" fill="#999" font-family="Inter, sans-serif">LLM Seed Generation</text>

  <rect x="270" y="10" width="240" height="40" rx="6" fill="#f5f5f5" stroke="#999" stroke-width="2"/>
  <text x="390" y="35" font-size="15.2" font-weight="700" text-anchor="middle" fill="#999" font-family="Inter, sans-serif">Coverage-Guided Fuzzing</text>

  <rect x="525" y="10" width="240" height="40" rx="6" fill="#f5f5f5" stroke="#999" stroke-width="1.5"/>
  <text x="645" y="35" font-size="15.2" font-weight="700" text-anchor="middle" fill="#999" font-family="Inter, sans-serif">Grammar-Based Fuzzing</text>

  <rect x="780" y="10" width="250" height="40" rx="6" fill="#fce4ec" stroke="#8C1D40" stroke-width="2"/>
  <text x="905" y="35" font-size="15.2" font-weight="700" text-anchor="middle" fill="#8C1D40" font-family="Inter, sans-serif">LLM-Directed Fuzzing</text>



  <!-- Detail card -->
  <g id="dyn-dir-card">
    <rect x="100" y="70" width="850" height="50" rx="12" fill="#fce4ec"/>
    <rect x="100" y="110" width="850" height="10" fill="#fce4ec"/>
    <rect x="100" y="70" width="850" height="300" rx="12" fill="#fafafa00" stroke="#8C1D40" stroke-width="2.5"/>
    <text x="525" y="103" font-size="25.7" font-weight="700" text-anchor="middle" fill="#8C1D40" font-family="Inter, sans-serif">LLM-Directed Fuzzing</text>
    <text x="750" y="103" font-size="16.3" fill="#999" font-family="Inter, sans-serif">(AIJON)</text>

    <rect x="170" y="155" width="160" height="80" rx="6" fill="#fff" stroke="#8C1D40" stroke-width="1.5"/>
    <text x="250" y="180" font-size="15" font-weight="600" text-anchor="middle" fill="#8C1D40" font-family="Inter, sans-serif">Target Location</text>
    <text x="250" y="200" font-size="13" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">POI from Analysis</text>
    <text x="250" y="216" font-size="13" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">Graph or SAST</text>

    <line x1="330" y1="195" x2="420" y2="195" stroke="#666" stroke-width="2" marker-end="url(#dyn-dir-arr)"/>

    <rect x="425" y="145" width="180" height="100" rx="6" fill="#fce4ec" stroke="#8C1D40" stroke-width="2"/>
    <text x="515" y="173" font-size="15" font-weight="600" text-anchor="middle" fill="#8C1D40" font-family="Inter, sans-serif">LLM Annotation</text>
    <text x="515" y="195" font-size="13" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">Generates custom IJON</text>
    <text x="515" y="211" font-size="13" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">feedback signals that</text>
    <text x="515" y="227" font-size="13" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">guide fuzzer to location</text>

    <line x1="605" y1="195" x2="685" y2="195" stroke="#666" stroke-width="2" marker-end="url(#dyn-dir-arr)"/>

    <rect x="690" y="155" width="180" height="80" rx="6" fill="#fff" stroke="#8C1D40" stroke-width="1.5"/>
    <text x="780" y="180" font-size="15" font-weight="600" text-anchor="middle" fill="#8C1D40" font-family="Inter, sans-serif">Directed Fuzzer</text>
    <text x="780" y="200" font-size="13" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">Steered toward specific</text>
    <text x="780" y="216" font-size="13" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">code locations</text>

    <rect x="245" y="280" width="250" height="55" rx="6" fill="#fce4ec" stroke="#8C1D40" stroke-width="1.5"/>
    <text x="370" y="310" font-size="32.7" font-weight="bold" text-anchor="middle" fill="#8C1D40" font-family="Inter, sans-serif">35x</text>
    <text x="370" y="325" font-size="13" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">vs conventional directed fuzzers</text>

    <rect x="545" y="280" width="250" height="55" rx="6" fill="#fce4ec" stroke="#8C1D40" stroke-width="1.5"/>
    <text x="670" y="310" font-size="32.7" font-weight="bold" text-anchor="middle" fill="#8C1D40" font-family="Inter, sans-serif">100x</text>
    <text x="670" y="325" font-size="13" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">with high-quality seeds</text>
  </g>

</svg>
</div>

???

AIJON uses an LLM to automatically generate IJON annotations, custom feedback signals that guide the fuzzer toward specific program locations. Preliminary results show a 35x speedup over conventional directed fuzzers, and 100x faster with high-quality seeds. That acceleration is critical in a time-bounded competition.
