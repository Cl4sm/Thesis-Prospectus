---
type: content
title: "Why Conventional Symbolic Execution Fails"
---

<div id="ws-diagram">
<svg viewBox="0 0 1050 460" style="width:100%; display:block; margin: 0 auto;" xmlns="http://www.w3.org/2000/svg">

  <!-- ===== Step 1: Entry point (1 state) ===== -->
  <g id="ws-level0" style="opacity:0;">
    <circle cx="120" cy="40" r="16" fill="#2196F3" stroke="#1565C0" stroke-width="2"/>
    <text x="120" y="45" font-size="11" font-weight="700" text-anchor="middle" fill="#fff" font-family="Inter, sans-serif">EP</text>
    <text x="180" y="44" font-size="11" fill="#666" font-family="Inter, sans-serif">Entry point</text>
    <!-- State count -->
    <rect x="18" y="28" width="55" height="24" rx="4" fill="#E3F2FD" stroke="#2196F3" stroke-width="1"/>
    <text x="45" y="45" font-size="12" font-weight="700" text-anchor="middle" fill="#1565C0" font-family="Inter, sans-serif">1 state</text>
  </g>

  <!-- ===== Step 2: Level 1 (2 states) ===== -->
  <g id="ws-level1" style="opacity:0;">
    <line x1="120" y1="56" x2="70" y2="95" stroke="#999" stroke-width="1.5"/>
    <line x1="120" y1="56" x2="170" y2="95" stroke="#999" stroke-width="1.5"/>
    <circle cx="70" cy="100" r="10" fill="#42A5F5"/>
    <circle cx="170" cy="100" r="10" fill="#42A5F5"/>
    <rect x="18" y="88" width="38" height="24" rx="4" fill="#E3F2FD" stroke="#2196F3" stroke-width="1"/>
    <text x="37" y="105" font-size="12" font-weight="700" text-anchor="middle" fill="#1565C0" font-family="Inter, sans-serif">2</text>
  </g>

  <!-- ===== Step 3: Level 2 (4 states) ===== -->
  <g id="ws-level2" style="opacity:0;">
    <line x1="70" y1="110" x2="40" y2="145" stroke="#bbb" stroke-width="1.2"/>
    <line x1="70" y1="110" x2="100" y2="145" stroke="#bbb" stroke-width="1.2"/>
    <line x1="170" y1="110" x2="140" y2="145" stroke="#bbb" stroke-width="1.2"/>
    <line x1="170" y1="110" x2="200" y2="145" stroke="#bbb" stroke-width="1.2"/>
    <circle cx="40" cy="150" r="8" fill="#64B5F6"/>
    <circle cx="100" cy="150" r="8" fill="#64B5F6"/>
    <circle cx="140" cy="150" r="8" fill="#64B5F6"/>
    <circle cx="200" cy="150" r="8" fill="#64B5F6"/>
    <rect x="18" y="138" width="38" height="24" rx="4" fill="#E3F2FD" stroke="#2196F3" stroke-width="1"/>
    <text x="37" y="155" font-size="12" font-weight="700" text-anchor="middle" fill="#1565C0" font-family="Inter, sans-serif">4</text>
  </g>

  <!-- ===== Step 4: Level 3 (8 states) + explosion indicator + sink ===== -->
  <g id="ws-level3" style="opacity:0;">
    <line x1="40" y1="158" x2="25" y2="190" stroke="#ccc" stroke-width="1"/>
    <line x1="40" y1="158" x2="55" y2="190" stroke="#ccc" stroke-width="1"/>
    <line x1="100" y1="158" x2="85" y2="190" stroke="#ccc" stroke-width="1"/>
    <line x1="100" y1="158" x2="115" y2="190" stroke="#ccc" stroke-width="1"/>
    <line x1="140" y1="158" x2="125" y2="190" stroke="#ccc" stroke-width="1"/>
    <line x1="140" y1="158" x2="155" y2="190" stroke="#ccc" stroke-width="1"/>
    <line x1="200" y1="158" x2="185" y2="190" stroke="#ccc" stroke-width="1"/>
    <line x1="200" y1="158" x2="215" y2="190" stroke="#ccc" stroke-width="1"/>
    <circle cx="25" cy="194" r="5" fill="#90CAF9"/>
    <circle cx="55" cy="194" r="5" fill="#90CAF9"/>
    <circle cx="85" cy="194" r="5" fill="#90CAF9"/>
    <circle cx="115" cy="194" r="5" fill="#90CAF9"/>
    <circle cx="125" cy="194" r="5" fill="#90CAF9"/>
    <circle cx="155" cy="194" r="5" fill="#90CAF9"/>
    <circle cx="185" cy="194" r="5" fill="#90CAF9"/>
    <circle cx="215" cy="194" r="5" fill="#90CAF9"/>
    <rect x="18" y="182" width="38" height="24" rx="4" fill="#E3F2FD" stroke="#2196F3" stroke-width="1"/>
    <text x="37" y="199" font-size="12" font-weight="700" text-anchor="middle" fill="#1565C0" font-family="Inter, sans-serif">8</text>

    <!-- Continuation dots -->
    <text x="25" y="220" font-size="10" fill="#bbb" text-anchor="middle">...</text>
    <text x="55" y="220" font-size="10" fill="#bbb" text-anchor="middle">...</text>
    <text x="85" y="220" font-size="10" fill="#bbb" text-anchor="middle">...</text>
    <text x="115" y="220" font-size="10" fill="#bbb" text-anchor="middle">...</text>
    <text x="125" y="220" font-size="10" fill="#bbb" text-anchor="middle">...</text>
    <text x="155" y="220" font-size="10" fill="#bbb" text-anchor="middle">...</text>
    <text x="185" y="220" font-size="10" fill="#bbb" text-anchor="middle">...</text>
    <text x="215" y="220" font-size="10" fill="#bbb" text-anchor="middle">...</text>

    <!-- Explosion indicator -->
    <text x="120" y="255" font-size="22" font-weight="800" text-anchor="middle" fill="#E53935" font-family="Inter, sans-serif">2<tspan font-size="14" baseline-shift="super">n</tspan></text>
    <text x="120" y="278" font-size="11" text-anchor="middle" fill="#999" font-family="Inter, sans-serif">states at depth n</text>

    <!-- Sink buried deep -->
    <rect x="85" y="300" width="70" height="28" rx="4" fill="#ffebee" stroke="#8C1D40" stroke-width="1.5"/>
    <text x="120" y="319" font-size="10" font-weight="600" text-anchor="middle" fill="#8C1D40" font-family="Inter, sans-serif">SINK</text>
    <text x="120" y="345" font-size="10" text-anchor="middle" fill="#C62828" font-family="Inter, sans-serif">unreachable</text>
    <text x="120" y="360" font-size="10" text-anchor="middle" fill="#C62828" font-family="Inter, sans-serif">in practice</text>

    <!-- Connecting annotation to problem 1 -->
    <line x1="240" y1="150" x2="305" y2="140" stroke="#E53935" stroke-width="1.5" stroke-dasharray="4,3"/>
  </g>

  <!-- ===== Step 5: Five problem cards ===== -->
  <g id="ws-problems" style="opacity:0;">
    <!-- Problem 1 -->
    <rect x="310" y="20" width="700" height="70" rx="8" fill="#fafafa" stroke="#E53935" stroke-width="2"/>
    <rect x="310" y="20" width="50" height="70" rx="8" fill="#ffebee"/>
    <rect x="352" y="20" width="8" height="70" fill="#ffebee"/>
    <text x="335" y="62" font-size="22" font-weight="800" text-anchor="middle" fill="#E53935" font-family="Inter, sans-serif">1</text>
    <text x="380" y="48" font-size="14" font-weight="700" fill="#333" font-family="Inter, sans-serif">Path Explosion</text>
    <text x="380" y="70" font-size="12" fill="#666" font-family="Inter, sans-serif">Network daemons processing arbitrary input produce exponential branch states</text>

    <!-- Problem 2 -->
    <rect x="310" y="105" width="700" height="70" rx="8" fill="#fafafa" stroke="#FF9800" stroke-width="2"/>
    <rect x="310" y="105" width="50" height="70" rx="8" fill="#fff3e0"/>
    <rect x="352" y="105" width="8" height="70" fill="#fff3e0"/>
    <text x="335" y="147" font-size="22" font-weight="800" text-anchor="middle" fill="#FF9800" font-family="Inter, sans-serif">2</text>
    <text x="380" y="133" font-size="14" font-weight="700" fill="#333" font-family="Inter, sans-serif">Constraint Verbosity</text>
    <text x="380" y="155" font-size="12" fill="#666" font-family="Inter, sans-serif">Low-level VEX IR produces verbose SMT constraints that overwhelm the solver</text>

    <!-- Problem 3 -->
    <rect x="310" y="190" width="700" height="70" rx="8" fill="#fafafa" stroke="#9C27B0" stroke-width="2"/>
    <rect x="310" y="190" width="50" height="70" rx="8" fill="#f3e5f5"/>
    <rect x="352" y="190" width="8" height="70" fill="#f3e5f5"/>
    <text x="335" y="232" font-size="22" font-weight="800" text-anchor="middle" fill="#9C27B0" font-family="Inter, sans-serif">3</text>
    <text x="380" y="218" font-size="14" font-weight="700" fill="#333" font-family="Inter, sans-serif">Environmental Modeling</text>
    <text x="380" y="240" font-size="12" fill="#666" font-family="Inter, sans-serif">Firmware reads NVRAM, HTTP APIs, and kernel interfaces that cannot be modeled fully</text>

    <!-- Problem 4 -->
    <rect x="310" y="275" width="700" height="70" rx="8" fill="#fafafa" stroke="#2196F3" stroke-width="2"/>
    <rect x="310" y="275" width="50" height="70" rx="8" fill="#e3f2fd"/>
    <rect x="352" y="275" width="8" height="70" fill="#e3f2fd"/>
    <text x="335" y="317" font-size="22" font-weight="800" text-anchor="middle" fill="#2196F3" font-family="Inter, sans-serif">4</text>
    <text x="380" y="303" font-size="14" font-weight="700" fill="#333" font-family="Inter, sans-serif">Cross-Binary Dependencies</text>
    <text x="380" y="325" font-size="12" fill="#666" font-family="Inter, sans-serif">Vulnerability paths traverse multiple binaries through IPC, requiring cross-process reasoning</text>

    <!-- Problem 5 -->
    <rect x="310" y="360" width="700" height="70" rx="8" fill="#fafafa" stroke="#4CAF50" stroke-width="2"/>
    <rect x="310" y="360" width="50" height="70" rx="8" fill="#e8f5e9"/>
    <rect x="352" y="360" width="8" height="70" fill="#e8f5e9"/>
    <text x="335" y="402" font-size="22" font-weight="800" text-anchor="middle" fill="#4CAF50" font-family="Inter, sans-serif">5</text>
    <text x="380" y="388" font-size="14" font-weight="700" fill="#333" font-family="Inter, sans-serif">Entry-Point Preconditions</text>
    <text x="380" y="410" font-size="12" fill="#666" font-family="Inter, sans-serif">Authentication, format parsing, and permission checks must all be satisfied symbolically</text>
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
      // Step 1: Entry point (1 state)
      {
        show: function(instant) { showIds(['ws-level0'], instant); },
        hide: function() { hideIds(['ws-level0']); }
      },
      // Step 2: Level 1 branches (2 states)
      {
        show: function(instant) { showIds(['ws-level1'], instant); },
        hide: function() { hideIds(['ws-level1']); }
      },
      // Step 3: Level 2 branches (4 states)
      {
        show: function(instant) { showIds(['ws-level2'], instant); },
        hide: function() { hideIds(['ws-level2']); }
      },
      // Step 4: Level 3 (8 states) + explosion indicator + buried sink
      {
        show: function(instant) { showIds(['ws-level3'], instant); },
        hide: function() { hideIds(['ws-level3']); }
      },
      // Step 5: Five problem cards
      {
        show: function(instant) { showIds(['ws-problems'], instant); },
        hide: function() { hideIds(['ws-problems']); }
      }
    ]
  });
});
</script>

???

[step 1] Why not just use conventional symbolic execution? Start with the entry point. One state. [CLICK] [step 2] First branch: two states. [CLICK] [step 3] Two more branches: four states. [CLICK] [step 4] Eight states. And this keeps doubling. At depth n, you have 2^n states. The sink we're trying to reach is buried deep, practically unreachable through brute-force exploration. [CLICK] [step 5] This path explosion is just the first of five hard problems. Constraint verbosity: working at low-level VEX IR produces enormous SMT formulas. Environmental modeling: firmware reads NVRAM, HTTP APIs, kernel interfaces that can't be fully modeled. Cross-binary dependencies: vulnerability paths cross process boundaries through IPC. And entry-point preconditions: authentication, format parsing, permission checks all need to be satisfied symbolically before you can even reach the vulnerable code. This is why conventional SymEx doesn't work for real firmware validation. Our proposed work addresses each of these.
