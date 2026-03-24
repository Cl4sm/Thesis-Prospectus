---
type: content
title: "Coverage-Guided Fuzzing"
---

<div id="dyn-cov-diagram">
<svg viewBox="0 -50 1050 466" style="width:100%; margin:0 auto; display:block;" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <marker id="dyn-cov-arr" markerWidth="8" markerHeight="8" refX="7" refY="3" orient="auto">
      <polygon points="0 0, 8 3, 0 6" fill="#666"/>
    </marker>
  </defs>

  <!-- All four context pills -->
  <rect x="15" y="10" width="240" height="40" rx="6" fill="#f5f5f5" stroke="#999" stroke-width="1.5"/>
  <text x="135" y="35" font-size="15.2" font-weight="700" text-anchor="middle" fill="#999" font-family="Inter, sans-serif">LLM Seed Generation</text>

  <rect x="270" y="10" width="240" height="40" rx="6" fill="#e3f2fd" stroke="#2196F3" stroke-width="2"/>
  <text x="390" y="35" font-size="15.2" font-weight="700" text-anchor="middle" fill="#1565C0" font-family="Inter, sans-serif">Coverage-Guided Fuzzing</text>

  <rect x="525" y="10" width="240" height="40" rx="6" fill="#f5f5f5" stroke="#999" stroke-width="1.5"/>
  <text x="645" y="35" font-size="15.2" font-weight="700" text-anchor="middle" fill="#999" font-family="Inter, sans-serif">Grammar-Based Fuzzing</text>

  <rect x="780" y="10" width="250" height="40" rx="6" fill="#f5f5f5" stroke="#999" stroke-width="1.5"/>
  <text x="905" y="35" font-size="15.2" font-weight="700" text-anchor="middle" fill="#999" font-family="Inter, sans-serif">LLM-Directed Fuzzing</text>

  <!-- Detail card -->
  <g id="dyn-cov-card">
    <rect x="100" y="70" width="850" height="50" rx="12" fill="#e3f2fd"/>
    <rect x="100" y="110" width="850" height="10" fill="#e3f2fd"/>
    <rect x="100" y="70" width="850" height="300" rx="12" fill="#fafafa00" stroke="#2196F3" stroke-width="2.5"/>
    <text x="525" y="103" font-size="25.7" font-weight="700" text-anchor="middle" fill="#1565C0" font-family="Inter, sans-serif">Coverage-Guided Fuzzing</text>
    <text x="750" y="103" font-size="16.3" fill="#999" font-family="Inter, sans-serif">(AFL++, Jazzer, libfuzzer)</text>

    <rect x="188" y="170" width="125" height="55" rx="6" fill="#fff" stroke="#2196F3" stroke-width="1.5"/>
    <text x="250" y="195" font-size="15" font-weight="600" text-anchor="middle" fill="#1565C0" font-family="Inter, sans-serif">Seed Input</text>
    <text x="250" y="212" font-size="12" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">corpus queue</text>

    <line x1="313" y1="197" x2="358" y2="197" stroke="#666" stroke-width="2" marker-end="url(#dyn-cov-arr)"/>

    <rect x="363" y="170" width="125" height="55" rx="6" fill="#fff" stroke="#2196F3" stroke-width="1.5"/>
    <text x="425" y="195" font-size="15" font-weight="600" text-anchor="middle" fill="#1565C0" font-family="Inter, sans-serif">Mutate</text>
    <text x="425" y="212" font-size="12" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">bit flip, splice, etc.</text>

    <line x1="488" y1="197" x2="533" y2="197" stroke="#666" stroke-width="2" marker-end="url(#dyn-cov-arr)"/>

    <rect x="538" y="170" width="130" height="55" rx="6" fill="#fff" stroke="#2196F3" stroke-width="1.5"/>
    <text x="603" y="195" font-size="15" font-weight="600" text-anchor="middle" fill="#1565C0" font-family="Inter, sans-serif">Execute</text>
    <text x="603" y="212" font-size="12" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">instrumented binary</text>

    <line x1="668" y1="197" x2="713" y2="197" stroke="#666" stroke-width="2" marker-end="url(#dyn-cov-arr)"/>

    <rect x="718" y="170" width="145" height="55" rx="6" fill="#e3f2fd" stroke="#2196F3" stroke-width="2"/>
    <text x="790" y="195" font-size="15" font-weight="600" text-anchor="middle" fill="#1565C0" font-family="Inter, sans-serif">New Coverage?</text>
    <text x="790" y="212" font-size="12" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">edge bitmap check</text>

    <path d="M 790,225 Q 790,265 490,265 Q 188,265 188,225" stroke="#2196F3" stroke-width="1.5" fill="none" stroke-dasharray="5,4" marker-end="url(#dyn-cov-arr)"/>
    <text x="490" y="283" font-size="13" fill="#2196F3" font-weight="600" text-anchor="middle" font-family="Inter, sans-serif">keep interesting inputs, mutate again</text>

    <rect x="200" y="305" width="650" height="40" rx="5" fill="#f5f5f5" stroke="#2196F3" stroke-width="1"/>
    <text x="525" y="331" font-size="16.3" font-weight="600" text-anchor="middle" fill="#333" font-family="Inter, sans-serif">Fast state-space exploration; struggles with structured inputs (JSON, SQL, XML)</text>
  </g>

</svg>
</div>

???

Coverage-guided fuzzing with AFL++, Jazzer, and libfuzzer. Mutate inputs, execute the instrumented binary, check if we hit new code paths. Fast and thorough for unstructured input, but when the target expects a specific format, random byte mutations rarely produce valid inputs.
