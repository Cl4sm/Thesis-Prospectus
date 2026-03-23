---
type: content
title: "Coverage-Guided Fuzzing"
---

<div id="dyn-cov-diagram">
<svg viewBox="0 0 1050 400" style="width:100%; margin:0 auto; display:block;" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <marker id="dyn-cov-arr" markerWidth="8" markerHeight="8" refX="7" refY="3" orient="auto">
      <polygon points="0 0, 8 3, 0 6" fill="#666"/>
    </marker>
  </defs>

  <!-- Detail card -->
  <g id="dyn-cov-card">
    <rect x="100" y="20" width="850" height="300" rx="12" fill="#fafafa" stroke="#2196F3" stroke-width="2.5"/>
    <rect x="100" y="20" width="850" height="50" rx="12" fill="#e3f2fd"/>
    <rect x="100" y="60" width="850" height="10" fill="#e3f2fd"/>
    <text x="525" y="53" font-size="22" font-weight="700" text-anchor="middle" fill="#1565C0" font-family="Inter, sans-serif">Coverage-Guided Fuzzing</text>
    <text x="810" y="53" font-size="14" fill="#999" font-family="Inter, sans-serif">(AFL++, Jazzmine)</text>

    <rect x="150" y="110" width="120" height="55" rx="6" fill="#fff" stroke="#2196F3" stroke-width="1.5"/>
    <text x="210" y="135" font-size="14" font-weight="600" text-anchor="middle" fill="#1565C0" font-family="Inter, sans-serif">Seed Input</text>
    <text x="210" y="152" font-size="12" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">corpus queue</text>

    <line x1="270" y1="137" x2="320" y2="137" stroke="#666" stroke-width="2" marker-end="url(#dyn-cov-arr)"/>

    <rect x="325" y="110" width="120" height="55" rx="6" fill="#fff" stroke="#2196F3" stroke-width="1.5"/>
    <text x="385" y="135" font-size="14" font-weight="600" text-anchor="middle" fill="#1565C0" font-family="Inter, sans-serif">Mutate</text>
    <text x="385" y="152" font-size="12" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">bit flip, splice, etc.</text>

    <line x1="445" y1="137" x2="495" y2="137" stroke="#666" stroke-width="2" marker-end="url(#dyn-cov-arr)"/>

    <rect x="500" y="110" width="120" height="55" rx="6" fill="#fff" stroke="#2196F3" stroke-width="1.5"/>
    <text x="560" y="135" font-size="14" font-weight="600" text-anchor="middle" fill="#1565C0" font-family="Inter, sans-serif">Execute</text>
    <text x="560" y="152" font-size="12" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">instrumented binary</text>

    <line x1="620" y1="137" x2="670" y2="137" stroke="#666" stroke-width="2" marker-end="url(#dyn-cov-arr)"/>

    <rect x="675" y="110" width="140" height="55" rx="6" fill="#e3f2fd" stroke="#2196F3" stroke-width="2"/>
    <text x="745" y="135" font-size="14" font-weight="600" text-anchor="middle" fill="#1565C0" font-family="Inter, sans-serif">New Coverage?</text>
    <text x="745" y="152" font-size="12" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">edge bitmap check</text>

    <path d="M 745,165 Q 745,205 445,205 Q 150,205 150,165" stroke="#2196F3" stroke-width="1.5" fill="none" stroke-dasharray="5,4" marker-end="url(#dyn-cov-arr)"/>
    <text x="445" y="223" font-size="12" fill="#2196F3" font-weight="600" text-anchor="middle" font-family="Inter, sans-serif">keep interesting inputs, mutate again</text>

    <rect x="200" y="255" width="650" height="40" rx="5" fill="#f5f5f5" stroke="#2196F3" stroke-width="1"/>
    <text x="525" y="281" font-size="14" font-weight="600" text-anchor="middle" fill="#333" font-family="Inter, sans-serif">Fast state-space exploration; struggles with structured inputs (JSON, SQL, XML)</text>
  </g>

</svg>
</div>

???

DiscoveryGuy is the fuzzing pipeline. It combines four approaches. Coverage-guided fuzzing with AFL++ and Jazzmine. Mutate inputs, execute the instrumented binary, check if we hit new code paths. Fast and thorough for unstructured input, but when the target expects a specific format, random byte mutations rarely produce valid inputs.
