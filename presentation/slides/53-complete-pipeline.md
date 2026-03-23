---
type: content
title: "The Complete Pipeline"
---

<div id="pipe-diagram">
<svg viewBox="0 0 1200 480" style="width: 100%; margin: 0 auto; display: block;" id="pipe-svg">
  <defs>
    <marker id="arrowPipe" markerWidth="10" markerHeight="10" refX="7" refY="3" orient="auto" markerUnits="strokeWidth">
      <path d="M0,0 L0,6 L9,3 z" fill="#555"/>
    </marker>
  </defs>

  <!-- Step 1: Firmware input -->
  <g id="pipe-fw" style="opacity:0;">
    <rect x="20" y="80" width="170" height="200" fill="#f5f5f5" stroke="#999" stroke-width="2.5" rx="8"/>
    <text x="105" y="165" font-size="18" font-weight="bold" text-anchor="middle" fill="#333" font-family="Inter, sans-serif">Firmware</text>
    <text x="105" y="190" font-size="14" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">Images</text>
    <!-- Large stat number -->
    <text x="105" y="255" font-size="42" font-weight="900" text-anchor="middle" fill="#333" font-family="Inter, sans-serif">1,698</text>
  </g>

  <!-- Flow arrow 1 with label -->
  <g id="pipe-flow1" style="opacity:0;">
    <path d="M 190 180 L 250 180" stroke="#666" stroke-width="4" fill="none" marker-end="url(#arrowPipe)"/>
    <text x="220" y="165" font-size="13" font-weight="600" text-anchor="middle" fill="#555" font-family="Inter, sans-serif">detect</text>
  </g>

  <!-- Step 2: Mango -->
  <g id="pipe-mango" style="opacity:0;">
    <rect x="260" y="50" width="280" height="230" fill="#fff3e0" stroke="#FF9800" stroke-width="3" rx="8"/>
    <!-- Color bar -->
    <rect x="260" y="50" width="280" height="50" rx="8" fill="#FF9800"/>
    <text x="400" y="90" font-size="20" font-weight="700" text-anchor="middle" fill="white" font-family="Inter, sans-serif">Operation Mango</text>
    <text x="400" y="140" font-size="14" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">Scalable detection</text>
    <text x="400" y="160" font-size="14" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">Value-level reasoning</text>
    <!-- Large stat number -->
    <text x="400" y="245" font-size="48" font-weight="900" text-anchor="middle" fill="#FF9800" font-family="Inter, sans-serif">10,834</text>
    <text x="400" y="268" font-size="13" font-weight="600" text-anchor="middle" fill="#FF9800" font-family="Inter, sans-serif">alerts</text>
  </g>

  <!-- Flow arrow 2 with label -->
  <g id="pipe-flow2" style="opacity:0;">
    <path d="M 540 165 L 610 165" stroke="#666" stroke-width="4" fill="none" marker-end="url(#arrowPipe)"/>
    <text x="575" y="150" font-size="13" font-weight="600" text-anchor="middle" fill="#555" font-family="Inter, sans-serif">validate</text>
  </g>

  <!-- Step 3: PEACH -->
  <g id="pipe-ail" style="opacity:0;">
    <rect x="620" y="70" width="240" height="210" fill="#e3f2fd" stroke="#2196F3" stroke-width="3" rx="8"/>
    <!-- Color bar -->
    <rect x="620" y="70" width="240" height="50" rx="8" fill="#2196F3"/>
    <text x="740" y="108" font-size="19" font-weight="700" text-anchor="middle" fill="white" font-family="Inter, sans-serif">PEACH</text>
    <text x="740" y="155" font-size="14" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">Formal validation</text>
    <text x="740" y="175" font-size="14" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">Path feasibility proof</text>
    <!-- Large stat number -->
    <text x="740" y="245" font-size="48" font-weight="900" text-anchor="middle" fill="#2196F3" font-family="Inter, sans-serif">51</text>
    <text x="740" y="268" font-size="13" font-weight="600" text-anchor="middle" fill="#2196F3" font-family="Inter, sans-serif">confirmed</text>
  </g>

  <!-- Flow arrow 3 with label -->
  <g id="pipe-flow3" style="opacity:0;">
    <path d="M 860 155 L 920 155" stroke="#666" stroke-width="4" fill="none" marker-end="url(#arrowPipe)"/>
    <text x="890" y="140" font-size="13" font-weight="600" text-anchor="middle" fill="#555" font-family="Inter, sans-serif">exploit</text>
  </g>

  <!-- Step 4: Output -->
  <g id="pipe-output" style="opacity:0;">
    <rect x="930" y="90" width="220" height="190" fill="#fce4ec" stroke="#8C1D40" stroke-width="3" rx="8"/>
    <!-- Color bar -->
    <rect x="930" y="90" width="220" height="50" rx="8" fill="#8C1D40"/>
    <text x="1040" y="128" font-size="18" font-weight="700" text-anchor="middle" fill="white" font-family="Inter, sans-serif">Concrete PoC</text>
    <text x="1040" y="168" font-size="14" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">Triggering inputs</text>
    <!-- Large stat number -->
    <text x="1040" y="245" font-size="48" font-weight="900" text-anchor="middle" fill="#8C1D40" font-family="Inter, sans-serif">166</text>
    <text x="1040" y="268" font-size="13" font-weight="600" text-anchor="middle" fill="#8C1D40" font-family="Inter, sans-serif">exploitable</text>
  </g>

  <!-- Artiphishell annotation (stays below as supporting element) -->
  <g id="pipe-artiphishell" style="opacity:0;">
    <rect x="280" y="320" width="400" height="40" fill="#f3e5f5" stroke="#9C27B0" stroke-width="2" rx="6"/>
    <text x="480" y="348" font-size="13" font-weight="600" text-anchor="middle" fill="#7B1FA2" font-family="Inter, sans-serif">Artiphishell: autonomous lifecycle validated on source-available firmware</text>
    <!-- Connector to middle stages -->
    <path d="M 480 320 L 480 300" stroke="#9C27B0" stroke-width="2" stroke-dasharray="4,4" fill="none"/>
  </g>

  <!-- Summary line at bottom (bolder) -->
  <g id="pipe-summary" style="opacity:0;">
    <text x="600" y="410" font-size="19" font-weight="800" text-anchor="middle" fill="#1a1a1a" font-family="Inter, sans-serif">A vulnerability analysis pipeline that is simultaneously complete and scalable</text>
  </g>

</svg>
</div>

<script>
window._animQueue.push(function() {
  var diagram = document.getElementById('pipe-diagram');
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
      {
        show: function(instant) { showIds(['pipe-fw', 'pipe-flow1'], instant); },
        hide: function() { hideIds(['pipe-fw', 'pipe-flow1']); }
      },
      {
        show: function(instant) { showIds(['pipe-mango', 'pipe-flow2'], instant); },
        hide: function() { hideIds(['pipe-mango', 'pipe-flow2']); }
      },
      {
        show: function(instant) { showIds(['pipe-ail', 'pipe-flow3'], instant); },
        hide: function() { hideIds(['pipe-ail', 'pipe-flow3']); }
      },
      {
        show: function(instant) { showIds(['pipe-output', 'pipe-artiphishell'], instant); },
        hide: function() { hideIds(['pipe-output', 'pipe-artiphishell']); }
      },
      {
        show: function(instant) { showIds(['pipe-summary'], instant); },
        hide: function() { hideIds(['pipe-summary']); }
      }
    ]
  });
});
</script>

???

So here's the complete picture. [CLICK] We scan 1,698 firmware images. [CLICK] Mango runs across every binary and produces 10,834 alerts. These are statically detected candidates encoding value-level reasoning about data flows. Manual audit of a sample confirms a 70% true positive rate, which gives us 166 likely exploitable vulnerabilities. But "likely" is not proof. [CLICK] Those candidates feed into PEACH for formal validation. On the R6400 alone, 161 candidates went in and 51 came out confirmed reachable (about 32%). If that ratio holds across the full dataset, we expect thousands of validated paths. [CLICK] For each reachable path, we synthesize a concrete triggering input: the PoC exploit that vendors need before they act.

Artiphishell sits alongside this pipeline. It demonstrates that the full vulnerability lifecycle (detection through patch synthesis and verification) is automatable when you have source code. Mango works on binaries. PEACH bridges that gap: it validates Mango's binary-only candidates with formal evidence.

[CLICK] Together, the three projects cover the entire detection-to-confirmation cycle at firmware scale.
