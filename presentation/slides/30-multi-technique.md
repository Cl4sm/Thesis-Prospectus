---
type: content
title: "Why Multi-Technique Coordination Matters"
---

<svg id="venn-conv" viewBox="0 0 1050 400" style="width:100%; margin:0 auto; display:block;" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <marker id="arrConv" markerWidth="10" markerHeight="10" refX="7" refY="3" orient="auto" markerUnits="strokeWidth">
      <path d="M0,0 L0,6 L9,3 z" fill="#8C1D40"/>
    </marker>
  </defs>

  <!-- ===== VENN DIAGRAM (left/center) ===== -->

  <!-- Fuzzer circle (orange) -->
  <g id="vc-fuzzer" opacity="0">
    <circle cx="260" cy="145" r="115" fill="#FF9800" opacity="0.15" stroke="#FF9800" stroke-width="2.5"/>
    <text x="195" y="95" font-size="16" font-weight="700" fill="#E65100">Fuzzer</text>
    <text x="195" y="115" font-size="12" fill="#666">crash in function X</text>
    <text x="195" y="132" font-size="11" fill="#999" font-style="italic">execution trace</text>
  </g>

  <!-- LLM Scanner circle (blue) -->
  <g id="vc-scanner" opacity="0">
    <circle cx="380" cy="145" r="115" fill="#2196F3" opacity="0.15" stroke="#2196F3" stroke-width="2.5"/>
    <text x="410" y="95" font-size="16" font-weight="700" fill="#1565C0">LLM Scanner</text>
    <text x="410" y="115" font-size="12" fill="#666">pattern match in X</text>
    <text x="410" y="132" font-size="11" fill="#999" font-style="italic">source-level signal</text>
  </g>

  <!-- Root Cause circle (green) -->
  <g id="vc-rootcause" opacity="0">
    <circle cx="320" cy="240" r="115" fill="#4CAF50" opacity="0.15" stroke="#4CAF50" stroke-width="2.5"/>
    <text x="240" y="310" font-size="16" font-weight="700" fill="#2E7D32">Root Cause</text>
    <text x="240" y="330" font-size="12" fill="#666">buffer overflow, line 42</text>
    <text x="240" y="347" font-size="11" fill="#999" font-style="italic">diagnostic detail</text>
  </g>

  <!-- Convergent overlap highlight -->
  <g id="vc-overlap" opacity="0">
    <!-- Highlight the triple overlap region -->
    <circle cx="320" cy="175" r="45" fill="#8C1D40" opacity="0.25" stroke="#8C1D40" stroke-width="3"/>
    <text x="320" y="170" font-size="13" font-weight="700" text-anchor="middle" fill="#8C1D40">Convergent</text>
    <text x="320" y="187" font-size="13" font-weight="700" text-anchor="middle" fill="#8C1D40">Evidence</text>
  </g>

  <!-- ===== RESULT (right side) ===== -->
  <g id="vc-result" opacity="0">
    <!-- Arrow from overlap to result -->
    <path d="M 365 175 L 560 175" stroke="#8C1D40" stroke-width="3.5" fill="none" marker-end="url(#arrConv)"/>

    <!-- Result card -->
    <rect x="570" y="100" width="440" height="150" rx="10" fill="#fafafa" stroke="#8C1D40" stroke-width="2.5"/>
    <rect x="570" y="100" width="440" height="42" rx="10" fill="#8C1D40"/>
    <rect x="570" y="126" width="440" height="16" fill="#8C1D40"/>
    <text x="790" y="128" text-anchor="middle" font-size="16" font-weight="700" fill="white">High Confidence Finding</text>

    <text x="600" y="168" font-size="14" fill="#333" font-weight="600">CWE-122: Heap Buffer Overflow</text>
    <text x="600" y="190" font-size="13" fill="#666">Location: parse_input() line 42</text>
    <text x="600" y="212" font-size="13" fill="#666">Evidence: 3 independent techniques agree</text>
    <text x="600" y="234" font-size="12" fill="#4CAF50" font-weight="600">Confidence: HIGH (convergent)</text>
  </g>

  <!-- Bottom annotation -->
  <g id="vc-annotation" opacity="0">
    <text x="525" y="385" font-size="13" text-anchor="middle" fill="#666" font-style="italic">This mirrors how human security teams cross-reference independent findings</text>
  </g>
</svg>

<script>
window._animQueue.push(function() {
  var el = document.getElementById('venn-conv');
  if (!el) return;
  var slideEl = el.closest('.slide');
  var slides = document.querySelectorAll('.slide');
  var idx = Array.from(slides).indexOf(slideEl);
  if (idx < 0) return;

  window.registerSlideAnimation(idx, {
    mode: 'step',
    steps: [
      // Step 1: Fuzzer finds crash
      makeStep(['vc-fuzzer']),
      // Step 2: Scanner flags pattern
      makeStep(['vc-scanner']),
      // Step 3: Root cause analysis confirms
      makeStep(['vc-rootcause']),
      // Step 4: Convergent evidence + result
      makeStep(['vc-overlap', 'vc-result', 'vc-annotation'])
    ]
  });
});
</script>

???

Let me walk through a concrete scenario. [CLICK] [step 1] A fuzzer runs for hours and produces a crash in function X. That's a signal, but incomplete: an execution trace with no explanation. [CLICK] [step 2] Separately, an LLM scanner examines the code and flags function X because it matches a known vulnerability pattern. Another signal, but possibly a false positive. [CLICK] [step 3] Root cause analysis steps in and confirms: heap buffer overflow at line 42. Diagnostic detail that pinpoints the exact defect. [CLICK] [step 4] When you link these findings, something changes. You have convergent evidence from three independent analyses, all pointing at the same location. A human analyst would cross-reference these immediately; she would recognize the convergence and prioritize this candidate. Artiphishell automates that cross-referencing through the Analysis Graph. Three independent signals become one high-confidence finding. That's how analytical confidence gets constructed.
