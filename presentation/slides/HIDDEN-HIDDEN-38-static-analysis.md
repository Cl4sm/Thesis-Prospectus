---
type: content
title: "Static Analysis Pipeline"
hidden: true
---
<!-- DELETED PER REVISION PLAN C10 - replaced by new static analysis slide 31b -->

<div id="sa-diagram">
<svg viewBox="0 0 1000 300" style="width:100%; margin:0 auto; display:block;" xmlns="http://www.w3.org/2000/svg" id="sa-svg">
  <defs>
    <marker id="arrSA" markerWidth="10" markerHeight="10" refX="9" refY="3" orient="auto">
      <path d="M0,0 L0,6 L9,3 z" fill="#4CAF50"/>
    </marker>
  </defs>

  <!-- Step 1: CodeQL -->
  <g id="sa-step1" style="opacity:0;">
    <rect x="20" y="80" width="180" height="120" fill="#E3F2FD" stroke="#2196F3" stroke-width="2" rx="6"/>
    <text x="110" y="115" font-size="15" font-weight="bold" text-anchor="middle" fill="#1565C0">CodeQL</text>
    <text x="110" y="140" font-size="13" text-anchor="middle" fill="#444">Vulnerability detection</text>
    <text x="110" y="160" font-size="13" text-anchor="middle" fill="#444">across C and Java</text>
    <text x="110" y="185" font-size="12" text-anchor="middle" fill="#999">Buffer overflows, injections,</text>
    <text x="110" y="198" font-size="12" text-anchor="middle" fill="#999">use-after-free, etc.</text>
  </g>

  <!-- Step 2: Arrow + SAST Trimming -->
  <g id="sa-step2" style="opacity:0;">
    <line x1="200" y1="140" x2="250" y2="140" stroke="#4CAF50" stroke-width="2.5" marker-end="url(#arrSA)"/>
    <rect x="250" y="80" width="200" height="120" fill="#FFF3E0" stroke="#FF9800" stroke-width="2" rx="6"/>
    <text x="350" y="115" font-size="15" font-weight="bold" text-anchor="middle" fill="#E65100">SAST Trimming</text>
    <text x="350" y="140" font-size="13" text-anchor="middle" fill="#444">LLM validates warnings</text>
    <text x="350" y="160" font-size="13" text-anchor="middle" fill="#444">Filters false positives</text>
    <text x="350" y="185" font-size="12" text-anchor="middle" fill="#999">Checks surrounding code</text>
    <text x="350" y="198" font-size="12" text-anchor="middle" fill="#999">context for each warning</text>
  </g>

  <!-- Step 3: Arrow + Analysis Graph -->
  <g id="sa-step3" style="opacity:0;">
    <line x1="450" y1="140" x2="500" y2="140" stroke="#4CAF50" stroke-width="2.5" marker-end="url(#arrSA)"/>
    <rect x="500" y="80" width="200" height="120" fill="#E8F5E9" stroke="#4CAF50" stroke-width="2" rx="6"/>
    <text x="600" y="115" font-size="15" font-weight="bold" text-anchor="middle" fill="#2E7D32">Analysis Graph</text>
    <text x="600" y="140" font-size="13" text-anchor="middle" fill="#444">Confirmed warnings</text>
    <text x="600" y="160" font-size="13" text-anchor="middle" fill="#444">create POIs</text>
    <text x="600" y="185" font-size="12" text-anchor="middle" fill="#999">Points of Interest for</text>
    <text x="600" y="198" font-size="12" text-anchor="middle" fill="#999">cross-technique coordination</text>
  </g>

  <!-- Step 4: Arrow + Directed Fuzzing + Summary -->
  <g id="sa-step4" style="opacity:0;">
    <line x1="700" y1="140" x2="750" y2="140" stroke="#4CAF50" stroke-width="2.5" marker-end="url(#arrSA)"/>
    <rect x="750" y="80" width="220" height="120" fill="#FCE4EC" stroke="#8C1D40" stroke-width="2" rx="6"/>
    <text x="860" y="115" font-size="15" font-weight="bold" text-anchor="middle" fill="#8C1D40">Directed Fuzzing</text>
    <text x="860" y="140" font-size="13" text-anchor="middle" fill="#444">AIJON targets confirmed</text>
    <text x="860" y="160" font-size="13" text-anchor="middle" fill="#444">SAST locations</text>
    <text x="860" y="185" font-size="12" text-anchor="middle" fill="#999">Static tells fuzzer where;</text>
    <text x="860" y="198" font-size="12" text-anchor="middle" fill="#999">fuzzer confirms if real</text>

    <!-- Bottom summary -->
    <rect x="200" y="240" width="600" height="40" fill="#f5f5f5" stroke="#666" stroke-width="1" rx="4"/>
    <text x="500" y="266" font-size="14" font-weight="bold" text-anchor="middle" fill="#333">Static analysis guides fuzzing; fuzzing validates static findings</text>
  </g>

</svg>
</div>

<script>
window._animQueue.push(function() {
  var diagram = document.getElementById('sa-diagram');
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
        show: function(instant) { showIds(['sa-step1'], instant); },
        hide: function() { hideIds(['sa-step1']); }
      },
      {
        show: function(instant) { showIds(['sa-step2'], instant); },
        hide: function() { hideIds(['sa-step2']); }
      },
      {
        show: function(instant) { showIds(['sa-step3'], instant); },
        hide: function() { hideIds(['sa-step3']); }
      },
      {
        show: function(instant) { showIds(['sa-step4'], instant); },
        hide: function() { hideIds(['sa-step4']); }
      }
    ]
  });
});
</script>

???

[step 1] The static analysis pipeline uses CodeQL to scan the full codebase. CodeQL produces structured vulnerability reports covering buffer overflows, injection flaws, use-after-free patterns, and other CWE categories across both C and Java. [CLICK] [step 2] Raw CodeQL output is noisy. Many warnings are false positives. The SAST trimming layer uses an LLM to evaluate each warning against the surrounding code context and filter out likely false positives. [CLICK] [step 3] Surviving warnings feed into the Analysis Graph as Points of Interest. Those POIs coordinate across techniques: static analysis, dynamic fuzzing, root cause analysis. [CLICK] [step 4] When static analysis flags a suspicious function, AIJON generates targeted annotations to drive the fuzzer toward that code location. Static analysis tells the fuzzer where to look; the fuzzer confirms whether the warning is real and demonstrates how to trigger it. This feedback loop between static analysis and dynamic fuzzing prevents both the overfitting of static analysis and the inefficient exploration of undirected fuzzing.
