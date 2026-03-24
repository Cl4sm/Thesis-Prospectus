---
type: content
title: "Why Conventional Symbolic Execution Fails"
---

<div id="ws-diagram">
<svg viewBox="0 0 1050 430" style="width:100%; display:block; margin: 0 auto;" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <marker id="ws-arrow" markerWidth="7" markerHeight="5" refX="6" refY="2.5" orient="auto">
      <polygon points="0 0, 7 2.5, 0 5" fill="#8C1D40"/>
    </marker>
  </defs>

  <!-- ===== RIGHT: Compact path explosion tree ===== -->
  <!-- Label -->
  <g id="ws-tree-label" style="opacity:0;">
    <text x="840" y="22" text-anchor="middle" font-size="13" font-weight="700" fill="#555" font-family="Inter,sans-serif" letter-spacing="0.3">SYMBOLIC EXECUTION TREE</text>
  </g>

  <!-- Level 0: root -->
  <g id="ws-tree-root" style="opacity:0;">
    <circle cx="840" cy="58" r="18" fill="#8C1D40" stroke="#5C1028" stroke-width="1.5"/>
    <text x="840" y="63" text-anchor="middle" font-size="10" font-weight="700" fill="white" font-family="Inter,sans-serif">entry</text>
  </g>

  <!-- Level 1: 2 paths -->
  <g id="ws-tree-l1" style="opacity:0;">
    <line x1="828" y1="74" x2="770" y2="118" stroke="#8C1D40" stroke-width="1.5"/>
    <line x1="852" y1="74" x2="910" y2="118" stroke="#8C1D40" stroke-width="1.5"/>
    <circle cx="770" cy="132" r="15" fill="#8C1D40" stroke="#5C1028" stroke-width="1.2"/>
    <text x="770" y="136" text-anchor="middle" font-size="9" fill="white" font-family="Inter,sans-serif">T</text>
    <circle cx="910" cy="132" r="15" fill="#8C1D40" stroke="#5C1028" stroke-width="1.2"/>
    <text x="910" y="136" text-anchor="middle" font-size="9" fill="white" font-family="Inter,sans-serif">F</text>
    <rect x="945" y="122" width="68" height="20" rx="10" fill="#fff3e0" stroke="#FF9800" stroke-width="1"/>
    <text x="979" y="136" text-anchor="middle" font-size="11" font-weight="700" fill="#E65100" font-family="Inter,sans-serif">2 paths</text>
  </g>

  <!-- Level 2: 4 paths -->
  <g id="ws-tree-l2" style="opacity:0;">
    <line x1="762" y1="146" x2="740" y2="192" stroke="#8C1D40" stroke-width="1.3"/>
    <line x1="778" y1="146" x2="800" y2="192" stroke="#8C1D40" stroke-width="1.3"/>
    <line x1="902" y1="146" x2="880" y2="192" stroke="#8C1D40" stroke-width="1.3"/>
    <line x1="918" y1="146" x2="940" y2="192" stroke="#8C1D40" stroke-width="1.3"/>
    <circle cx="740" cy="205" r="13" fill="#B05070" stroke="#8C1D40" stroke-width="1"/>
    <circle cx="800" cy="205" r="13" fill="#B05070" stroke="#8C1D40" stroke-width="1"/>
    <circle cx="880" cy="205" r="13" fill="#B05070" stroke="#8C1D40" stroke-width="1"/>
    <circle cx="940" cy="205" r="13" fill="#B05070" stroke="#8C1D40" stroke-width="1"/>
    <rect x="945" y="195" width="68" height="20" rx="10" fill="#fff3e0" stroke="#FF9800" stroke-width="1"/>
    <text x="979" y="209" text-anchor="middle" font-size="11" font-weight="700" fill="#E65100" font-family="Inter,sans-serif">4 paths</text>
  </g>

  <!-- Level 3: 8 paths -->
  <g id="ws-tree-l3" style="opacity:0;">
    <line x1="735" y1="217" x2="722" y2="256" stroke="#B05070" stroke-width="1.1"/>
    <line x1="745" y1="217" x2="758" y2="256" stroke="#B05070" stroke-width="1.1"/>
    <line x1="795" y1="217" x2="782" y2="256" stroke="#B05070" stroke-width="1.1"/>
    <line x1="805" y1="217" x2="818" y2="256" stroke="#B05070" stroke-width="1.1"/>
    <line x1="875" y1="217" x2="862" y2="256" stroke="#B05070" stroke-width="1.1"/>
    <line x1="885" y1="217" x2="898" y2="256" stroke="#B05070" stroke-width="1.1"/>
    <line x1="935" y1="217" x2="922" y2="256" stroke="#B05070" stroke-width="1.1"/>
    <line x1="945" y1="217" x2="958" y2="256" stroke="#B05070" stroke-width="1.1"/>
    <circle cx="722" cy="268" r="10" fill="#D4829A" stroke="#B05070" stroke-width="1"/>
    <circle cx="758" cy="268" r="10" fill="#D4829A" stroke="#B05070" stroke-width="1"/>
    <circle cx="782" cy="268" r="10" fill="#D4829A" stroke="#B05070" stroke-width="1"/>
    <circle cx="818" cy="268" r="10" fill="#D4829A" stroke="#B05070" stroke-width="1"/>
    <circle cx="862" cy="268" r="10" fill="#D4829A" stroke="#B05070" stroke-width="1"/>
    <circle cx="898" cy="268" r="10" fill="#D4829A" stroke="#B05070" stroke-width="1"/>
    <circle cx="922" cy="268" r="10" fill="#D4829A" stroke="#B05070" stroke-width="1"/>
    <circle cx="958" cy="268" r="10" fill="#D4829A" stroke="#B05070" stroke-width="1"/>
    <rect x="945" y="258" width="68" height="20" rx="10" fill="#fff3e0" stroke="#FF9800" stroke-width="1"/>
    <text x="979" y="272" text-anchor="middle" font-size="11" font-weight="700" fill="#E65100" font-family="Inter,sans-serif">8 paths</text>
  </g>

  <!-- Explosion dots -->
  <g id="ws-tree-dots" style="opacity:0;">
    <line x1="722" y1="278" x2="715" y2="298" stroke="#ddd" stroke-width="1" stroke-dasharray="2,2"/>
    <line x1="722" y1="278" x2="729" y2="298" stroke="#ddd" stroke-width="1" stroke-dasharray="2,2"/>
    <line x1="818" y1="278" x2="811" y2="298" stroke="#ddd" stroke-width="1" stroke-dasharray="2,2"/>
    <line x1="818" y1="278" x2="825" y2="298" stroke="#ddd" stroke-width="1" stroke-dasharray="2,2"/>
    <line x1="898" y1="278" x2="891" y2="298" stroke="#ddd" stroke-width="1" stroke-dasharray="2,2"/>
    <line x1="898" y1="278" x2="905" y2="298" stroke="#ddd" stroke-width="1" stroke-dasharray="2,2"/>
    <line x1="958" y1="278" x2="951" y2="298" stroke="#ddd" stroke-width="1" stroke-dasharray="2,2"/>
    <line x1="958" y1="278" x2="965" y2="298" stroke="#ddd" stroke-width="1" stroke-dasharray="2,2"/>
    <circle cx="715" cy="304" r="2.5" fill="#ccc"/>
    <circle cx="729" cy="304" r="2.5" fill="#ccc"/>
    <circle cx="811" cy="304" r="2.5" fill="#ccc"/>
    <circle cx="825" cy="304" r="2.5" fill="#ccc"/>
    <circle cx="891" cy="304" r="2.5" fill="#ccc"/>
    <circle cx="905" cy="304" r="2.5" fill="#ccc"/>
    <circle cx="951" cy="304" r="2.5" fill="#ccc"/>
    <circle cx="965" cy="304" r="2.5" fill="#ccc"/>
    <text x="840" y="328" text-anchor="middle" font-size="16" fill="#bbb" font-family="Inter,sans-serif" letter-spacing="5">. . . . . .</text>

    <!-- Explosion callout under tree -->
    <rect x="740" y="340" width="200" height="44" rx="6" fill="#fff3cd" stroke="#ffb400" stroke-width="1.5"/>
    <text x="840" y="358" text-anchor="middle" font-size="12" font-weight="700" fill="#8C1D40" font-family="Inter,sans-serif">n branches = 2<tspan font-size="9" baseline-shift="super">n</tspan> paths</text>
    <text x="840" y="376" text-anchor="middle" font-size="11" fill="#C62828" font-family="Inter,sans-serif">Exhaustive exploration: impossible</text>
  </g>

  <!-- ===== LEFT: Five problem cards (narrower) ===== -->
  <g id="ws-problems" style="opacity:0;">
    <!-- Problem 1: Path Explosion -->
    <rect x="20" y="15" width="44" height="64" rx="8" fill="#ffebee"/>
    <rect x="57" y="15" width="7" height="64" fill="#ffebee"/>
    <rect x="20" y="15" width="660" height="64" rx="8" fill="#fafafa00" stroke="#E53935" stroke-width="2"/>
    <text x="42" y="53" font-size="22" font-weight="800" text-anchor="middle" fill="#E53935" font-family="Inter, sans-serif">1</text>
    <text x="80" y="40" font-size="15" font-weight="700" fill="#333" font-family="Inter, sans-serif">Path Explosion</text>
    <text x="80" y="60" font-size="12.5" fill="#666" font-family="Inter, sans-serif">Exponential branch states from arbitrary network input</text>

    <!-- Problem 2: Constraint Verbosity -->
    <rect x="20" y="92" width="44" height="64" rx="8" fill="#fff3e0"/>
    <rect x="57" y="92" width="7" height="64" fill="#fff3e0"/>
    <rect x="20" y="92" width="660" height="64" rx="8" fill="#fafafa00" stroke="#FF9800" stroke-width="2"/>
    <text x="42" y="130" font-size="22" font-weight="800" text-anchor="middle" fill="#FF9800" font-family="Inter, sans-serif">2</text>
    <text x="80" y="117" font-size="15" font-weight="700" fill="#333" font-family="Inter, sans-serif">Constraint Verbosity</text>
    <text x="80" y="137" font-size="12.5" fill="#666" font-family="Inter, sans-serif">Low-level VEX IR produces verbose SMT constraints</text>

    <!-- Problem 3: Environmental Modeling -->
    <rect x="20" y="169" width="44" height="64" rx="8" fill="#f3e5f5"/>
    <rect x="57" y="169" width="7" height="64" fill="#f3e5f5"/>
    <rect x="20" y="169" width="660" height="64" rx="8" fill="#fafafa00" stroke="#9C27B0" stroke-width="2"/>
    <text x="42" y="207" font-size="22" font-weight="800" text-anchor="middle" fill="#9C27B0" font-family="Inter, sans-serif">3</text>
    <text x="80" y="194" font-size="15" font-weight="700" fill="#333" font-family="Inter, sans-serif">Environmental Modeling</text>
    <text x="80" y="214" font-size="12.5" fill="#666" font-family="Inter, sans-serif">NVRAM, HTTP APIs, kernel interfaces resist symbolic abstraction</text>

    <!-- Problem 4: Cross-Binary Dependencies -->
    <rect x="20" y="246" width="44" height="64" rx="8" fill="#e3f2fd"/>
    <rect x="57" y="246" width="7" height="64" fill="#e3f2fd"/>
    <rect x="20" y="246" width="660" height="64" rx="8" fill="#fafafa00" stroke="#2196F3" stroke-width="2"/>
    <text x="42" y="284" font-size="22" font-weight="800" text-anchor="middle" fill="#2196F3" font-family="Inter, sans-serif">4</text>
    <text x="80" y="271" font-size="15" font-weight="700" fill="#333" font-family="Inter, sans-serif">Cross-Binary Dependencies</text>
    <text x="80" y="291" font-size="12.5" fill="#666" font-family="Inter, sans-serif">Vulnerability paths traverse IPC boundaries between processes</text>

    <!-- Problem 5: Entry-Point Preconditions -->
    <rect x="20" y="323" width="44" height="64" rx="8" fill="#e8f5e9"/>
    <rect x="57" y="323" width="7" height="64" fill="#e8f5e9"/>
    <rect x="20" y="323" width="660" height="64" rx="8" fill="#fafafa00" stroke="#4CAF50" stroke-width="2"/>
    <text x="42" y="361" font-size="22" font-weight="800" text-anchor="middle" fill="#4CAF50" font-family="Inter, sans-serif">5</text>
    <text x="80" y="348" font-size="15" font-weight="700" fill="#333" font-family="Inter, sans-serif">Entry-Point Preconditions</text>
    <text x="80" y="368" font-size="12.5" fill="#666" font-family="Inter, sans-serif">Auth, format parsing, and permission checks must be satisfied symbolically</text>
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
      // Step 1: Tree label + root
      {
        show: function(instant) { showIds(['ws-tree-label', 'ws-tree-root'], instant); },
        hide: function() { hideIds(['ws-tree-label', 'ws-tree-root']); }
      },
      // Step 2: First branch - 2 paths
      {
        show: function(instant) { showIds(['ws-tree-l1'], instant); },
        hide: function() { hideIds(['ws-tree-l1']); }
      },
      // Step 3: Second branch - 4 paths
      {
        show: function(instant) { showIds(['ws-tree-l2'], instant); },
        hide: function() { hideIds(['ws-tree-l2']); }
      },
      // Step 4: Third branch - 8 paths + explosion
      {
        show: function(instant) { showIds(['ws-tree-l3', 'ws-tree-dots'], instant); },
        hide: function() { hideIds(['ws-tree-l3', 'ws-tree-dots']); }
      },
      // Step 5: Five problem cards + bottom note
      {
        show: function(instant) { showIds(['ws-problems', 'ws-note'], instant); },
        hide: function() { hideIds(['ws-problems', 'ws-note']); }
      }
    ]
  });
});
</script>

???

[step 1] Conventional symbolic execution starts at the entry point. One state. [CLICK] [step 2] First branch: two states. [CLICK] [step 3] Four states. [CLICK] [step 4] Eight. The growth is exponential. The sink is buried deep, practically unreachable through brute-force exploration. You all know this story. [CLICK] [step 5] But path explosion is only one of five problems specific to firmware. Constraint verbosity: VEX IR produces enormous SMT formulas because it models every register and flag. Environmental modeling: firmware reads NVRAM keys, HTTP parameters, kernel interfaces that resist symbolic abstraction. Cross-binary dependencies: vulnerability paths cross process boundaries through shared state. Entry-point preconditions: authentication, format parsing, and permission checks all need to be satisfied before you reach the vulnerable code. Our proposed work addresses each of these with three targeted design choices.
