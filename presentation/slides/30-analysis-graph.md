---
type: content
title: "The Analysis Graph"
footnote: "Shared evidence accumulation across coordinated agents"
---

<svg id="ag-diagram" viewBox="0 0 1050 480" style="width:100%; display:block; margin: 0 auto; max-height: 72vh;" xmlns="http://www.w3.org/2000/svg">
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

  <!-- ===== Step 1: Agent boxes + empty Analysis Graph ===== -->
  <g id="ag-base" style="opacity:0;">
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

    <!-- Analysis Graph band (empty) -->
    <rect x="30" y="155" width="985" height="45" rx="6" fill="#F8EEF1" stroke="#8C1D40" stroke-width="2"/>
    <text x="525" y="183" font-size="16" font-weight="700" text-anchor="middle" fill="#8C1D40" font-family="Arial, sans-serif">Analysis Graph</text>
  </g>

  <!-- ===== Step 2: Scanner fires, POI Created ===== -->
  <g id="ag-step-scanner" style="opacity:0;">
    <!-- Scanner arrow -->
    <line x1="140" y1="90" x2="140" y2="148" stroke="#2196F3" stroke-width="2" marker-end="url(#ag-arr-blue)"/>
    <!-- Graph-to-POI arrow -->
    <line x1="140" y1="200" x2="140" y2="238" stroke="#999" stroke-width="1.5" marker-end="url(#ag-arr-gray)"/>

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
  </g>

  <!-- ===== Step 3: Fuzzer fires, POI Updated ===== -->
  <g id="ag-step-fuzzer" style="opacity:0;">
    <!-- Fuzzer arrow -->
    <line x1="395" y1="90" x2="395" y2="148" stroke="#FF9800" stroke-width="2" marker-end="url(#ag-arr-orange)"/>
    <!-- Graph-to-POI arrow -->
    <line x1="395" y1="200" x2="395" y2="238" stroke="#999" stroke-width="1.5" marker-end="url(#ag-arr-gray)"/>

    <!-- Horizontal arrow POI 1 -> POI 2 -->
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
  </g>

  <!-- ===== Step 4: RCA fires, POI Diagnosed ===== -->
  <g id="ag-step-rca" style="opacity:0;">
    <!-- RCA arrow -->
    <line x1="650" y1="90" x2="650" y2="148" stroke="#4CAF50" stroke-width="2" marker-end="url(#ag-arr-green)"/>
    <!-- Graph-to-POI arrow -->
    <line x1="650" y1="200" x2="650" y2="238" stroke="#999" stroke-width="1.5" marker-end="url(#ag-arr-gray)"/>

    <!-- Horizontal arrow POI 2 -> POI 3 -->
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
  </g>

  <!-- ===== Step 5: Patcher fires, POI Complete + insight text ===== -->
  <g id="ag-step-patcher" style="opacity:0;">
    <!-- Patcher arrow -->
    <line x1="905" y1="90" x2="905" y2="148" stroke="#8C1D40" stroke-width="2" marker-end="url(#ag-arr-maroon)"/>
    <!-- Graph-to-POI arrow -->
    <line x1="905" y1="200" x2="905" y2="238" stroke="#999" stroke-width="1.5" marker-end="url(#ag-arr-gray)"/>

    <!-- Horizontal arrow POI 3 -> POI 4 -->
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

    <!-- Bottom insight text -->
    <text x="525" y="420" font-size="15" text-anchor="middle" fill="#333" font-family="Arial, sans-serif">Each agent contributes evidence independently. The graph accumulates knowledge across techniques.</text>
    <text x="525" y="445" font-size="13" text-anchor="middle" fill="#888" font-family="Arial, sans-serif">Coordination through shared state, not explicit communication.</text>
  </g>

</svg>

<script>
window._animQueue.push(function() {
  var diagram = document.getElementById('ag-diagram');
  if (!diagram) return;
  var slideEl = diagram.closest('.slide');
  var slides = document.querySelectorAll('.slide');
  var idx = Array.from(slides).indexOf(slideEl);
  if (idx < 0) return;

  function getEl(id) { return document.getElementById(id); }

  function showIds(ids, instant) {
    ids.forEach(function(id) {
      var el = getEl(id);
      if (!el) return;
      el.style.opacity = '1';
      el.setAttribute('opacity', '1');
      if (!instant) {
        el.animate([
          { opacity: 0, transform: 'translateY(6px)' },
          { opacity: 1, transform: 'translateY(0)' }
        ], { duration: 300, easing: 'ease-out' });
      }
    });
  }

  function hideIds(ids) {
    ids.forEach(function(id) {
      var el = getEl(id);
      if (!el) return;
      el.getAnimations().forEach(function(a) { a.cancel(); });
      el.style.opacity = '0';
      el.setAttribute('opacity', '0');
    });
  }

  window.registerSlideAnimation(idx, {
    mode: 'step',
    steps: [
      // Step 1: Agent boxes + empty Analysis Graph
      {
        show: function(instant) { showIds(['ag-base'], instant); },
        hide: function() { hideIds(['ag-base']); }
      },
      // Step 2: Scanner fires, POI Created (25% confidence)
      {
        show: function(instant) { showIds(['ag-step-scanner'], instant); },
        hide: function() { hideIds(['ag-step-scanner']); }
      },
      // Step 3: Fuzzer fires, POI Updated (50% confidence)
      {
        show: function(instant) { showIds(['ag-step-fuzzer'], instant); },
        hide: function() { hideIds(['ag-step-fuzzer']); }
      },
      // Step 4: RCA fires, POI Diagnosed (75% confidence)
      {
        show: function(instant) { showIds(['ag-step-rca'], instant); },
        hide: function() { hideIds(['ag-step-rca']); }
      },
      // Step 5: Patcher fires, POI Complete (100%) + insight
      {
        show: function(instant) { showIds(['ag-step-patcher'], instant); },
        hide: function() { hideIds(['ag-step-patcher']); }
      }
    ]
  });
});
</script>

???

The Analysis Graph is the system's shared memory. [CLICK] [step 1] Four agents, each with a different technique: scanning, fuzzing, root-cause analysis, and patching. They all feed into a single shared structure: the Analysis Graph. [CLICK] [step 2] The scanner examines the code and identifies function X as suspicious. It creates a Point of Interest in the graph. One piece of evidence, low confidence. [CLICK] [step 3] The fuzzer is running in parallel. After hours of exploration, it triggers a crash in function X. The fuzzer doesn't know a scanner already flagged that location, but the Analysis Graph does. The fuzzer queries the graph, finds the existing POI, and links its crash to it. Now we have two independent pieces of evidence, and the confidence bar grows. [CLICK] [step 4] Root-cause analysis correlates the crash with source code and narrows the problem to a buffer overflow at line 42. Three pieces of evidence. The confidence bar fills further. [CLICK] [step 5] Finally, a patcher generates a fix and validates it against the test suite. Four pieces of evidence, full confidence. This is knowledge accumulation: each agent adds a piece, the graph coordinates that accumulation. No agent needs to understand what other agents do. They all read from and write to the same structure. Coordination through shared state, not explicit communication.
