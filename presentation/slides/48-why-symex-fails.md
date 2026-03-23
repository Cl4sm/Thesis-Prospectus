---
type: content
title: "Why Conventional Symbolic Execution Fails"
---

<div id="ws-diagram">
<svg viewBox="0 0 1050 460" style="width:100%; display:block; margin: 0 auto;" xmlns="http://www.w3.org/2000/svg">

  <!-- ===== Five problem cards (full width) ===== -->
  <g id="ws-problems" style="opacity:0;">
    <!-- Problem 1: Path Explosion -->
    <rect x="40" y="20" width="970" height="70" rx="8" fill="#fafafa" stroke="#E53935" stroke-width="2"/>
    <rect x="40" y="20" width="50" height="70" rx="8" fill="#ffebee"/>
    <rect x="82" y="20" width="8" height="70" fill="#ffebee"/>
    <text x="65" y="62" font-size="22" font-weight="800" text-anchor="middle" fill="#E53935" font-family="Inter, sans-serif">1</text>
    <text x="110" y="48" font-size="14" font-weight="700" fill="#333" font-family="Inter, sans-serif">Path Explosion</text>
    <text x="110" y="70" font-size="12" fill="#666" font-family="Inter, sans-serif">Network daemons processing arbitrary input produce exponential branch states</text>
    <!-- AIL tag for Problem 1 -->
    <rect x="920" y="35" width="80" height="24" rx="4" fill="#E3F2FD" stroke="#2196F3" stroke-width="1"/>
    <text x="960" y="51" font-size="11" font-weight="600" text-anchor="middle" fill="#2196F3" font-family="Inter, sans-serif">AIL: sink-guided</text>

    <!-- Problem 2: Constraint Verbosity -->
    <rect x="40" y="105" width="970" height="70" rx="8" fill="#fafafa" stroke="#FF9800" stroke-width="2"/>
    <rect x="40" y="105" width="50" height="70" rx="8" fill="#fff3e0"/>
    <rect x="82" y="105" width="8" height="70" fill="#fff3e0"/>
    <text x="65" y="147" font-size="22" font-weight="800" text-anchor="middle" fill="#FF9800" font-family="Inter, sans-serif">2</text>
    <text x="110" y="133" font-size="14" font-weight="700" fill="#333" font-family="Inter, sans-serif">Constraint Verbosity</text>
    <text x="110" y="155" font-size="12" fill="#666" font-family="Inter, sans-serif">Low-level VEX IR produces verbose SMT constraints that overwhelm the solver</text>

    <!-- Problem 3: Environmental Modeling -->
    <rect x="40" y="190" width="970" height="70" rx="8" fill="#fafafa" stroke="#9C27B0" stroke-width="2"/>
    <rect x="40" y="190" width="50" height="70" rx="8" fill="#f3e5f5"/>
    <rect x="82" y="190" width="8" height="70" fill="#f3e5f5"/>
    <text x="65" y="232" font-size="22" font-weight="800" text-anchor="middle" fill="#9C27B0" font-family="Inter, sans-serif">3</text>
    <text x="110" y="218" font-size="14" font-weight="700" fill="#333" font-family="Inter, sans-serif">Environmental Modeling</text>
    <text x="110" y="240" font-size="12" fill="#666" font-family="Inter, sans-serif">Firmware reads NVRAM, HTTP APIs, and kernel interfaces that cannot be modeled fully</text>

    <!-- Problem 4: Cross-Binary Dependencies -->
    <rect x="40" y="275" width="970" height="70" rx="8" fill="#fafafa" stroke="#2196F3" stroke-width="2"/>
    <rect x="40" y="275" width="50" height="70" rx="8" fill="#e3f2fd"/>
    <rect x="82" y="275" width="8" height="70" fill="#e3f2fd"/>
    <text x="65" y="317" font-size="22" font-weight="800" text-anchor="middle" fill="#2196F3" font-family="Inter, sans-serif">4</text>
    <text x="110" y="303" font-size="14" font-weight="700" fill="#333" font-family="Inter, sans-serif">Cross-Binary Dependencies</text>
    <text x="110" y="325" font-size="12" fill="#666" font-family="Inter, sans-serif">Vulnerability paths traverse multiple binaries through IPC, requiring cross-process reasoning</text>
    <!-- AIL tag for Problem 4 -->
    <rect x="920" y="290" width="80" height="24" rx="4" fill="#E3F2FD" stroke="#2196F3" stroke-width="1"/>
    <text x="960" y="306" font-size="11" font-weight="600" text-anchor="middle" fill="#2196F3" font-family="Inter, sans-serif">AIL: constraint</text>

    <!-- Problem 5: Entry-Point Preconditions -->
    <rect x="40" y="360" width="970" height="70" rx="8" fill="#fafafa" stroke="#4CAF50" stroke-width="2"/>
    <rect x="40" y="360" width="50" height="70" rx="8" fill="#e8f5e9"/>
    <rect x="82" y="360" width="8" height="70" fill="#e8f5e9"/>
    <text x="65" y="402" font-size="22" font-weight="800" text-anchor="middle" fill="#4CAF50" font-family="Inter, sans-serif">5</text>
    <text x="110" y="388" font-size="14" font-weight="700" fill="#333" font-family="Inter, sans-serif">Entry-Point Preconditions</text>
    <text x="110" y="410" font-size="12" fill="#666" font-family="Inter, sans-serif">Authentication, format parsing, and permission checks must all be satisfied symbolically</text>
    <!-- AIL tag for Problem 5 -->
    <rect x="920" y="375" width="80" height="24" rx="4" fill="#E3F2FD" stroke="#2196F3" stroke-width="1"/>
    <text x="960" y="391" font-size="11" font-weight="600" text-anchor="middle" fill="#2196F3" font-family="Inter, sans-serif">AIL: hybrid</text>
  </g>

</svg>
</div>

<script>
window._animQueue.push(function() {
  var diagram = document.getElementById('ws-diagram');
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
      // Step 1: Five problem cards
      {
        show: function(instant) { showIds(['ws-problems'], instant); },
        hide: function() { hideIds(['ws-problems']); }
      }
    ]
  });
});
</script>

???

[step 1] Conventional symbolic execution starts at the entry point. One state. [CLICK] [step 2] First branch: two states. [CLICK] [step 3] Four states. [CLICK] [step 4] Eight. The growth is exponential. The sink is buried deep, practically unreachable through brute-force exploration. You all know this story. [CLICK] [step 5] But path explosion is only one of five problems specific to firmware. Constraint verbosity: VEX IR produces enormous SMT formulas because it models every register and flag. Environmental modeling: firmware reads NVRAM keys, HTTP parameters, kernel interfaces that resist symbolic abstraction. Cross-binary dependencies: vulnerability paths cross process boundaries through shared state. Entry-point preconditions: authentication, format parsing, and permission checks all need to be satisfied before you reach the vulnerable code. Our proposed work addresses each of these with three targeted design choices.
