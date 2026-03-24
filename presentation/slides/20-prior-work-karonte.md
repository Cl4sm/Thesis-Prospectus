---
type: content
title: "The Path Explosion Problem"
---

<div id="pathexp-diagram">
<svg viewBox="0 0 880 520" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid meet" style="max-height:88vh; width:100%; display:block; margin:0 auto;" id="pathexp-svg">
  <defs>
    <marker id="arrow-tree" markerWidth="8" markerHeight="6" refX="7" refY="3" orient="auto" markerUnits="strokeWidth">
      <polygon points="0 0, 8 3, 0 6" fill="#8C1D40"/>
    </marker>
    <marker id="arrow-tree-fade" markerWidth="8" markerHeight="6" refX="7" refY="3" orient="auto" markerUnits="strokeWidth">
      <polygon points="0 0, 8 3, 0 6" fill="#ccc"/>
    </marker>
  </defs>

  <!-- ===== Left side: Code snippet ===== -->
  <g id="pe-code" style="opacity:0;">
    <rect x="20" y="20" width="340" height="250" rx="8" fill="#1e1e2e" stroke="#444" stroke-width="1.5"/>
    <rect x="20" y="20" width="340" height="30" rx="8" fill="#333"/>
    <rect x="20" y="42" width="340" height="8" fill="#333"/>
    <circle cx="38" cy="35" r="5" fill="#E53935"/>
    <circle cx="54" cy="35" r="5" fill="#FF9800"/>
    <circle cx="70" cy="35" r="5" fill="#4CAF50"/>
    <text x="200" y="39" text-anchor="middle" font-size="12" fill="#888" font-family="'JetBrains Mono',monospace">firmware_binary.c</text>

    <text font-size="12.5" font-family="'JetBrains Mono',monospace" fill="#cdd6f4">
      <tspan x="36" y="68" fill="#89b4fa">void</tspan><tspan fill="#cdd6f4"> </tspan><tspan fill="#a6e3a1">handle_request</tspan><tspan fill="#cdd6f4">(req) {</tspan>
      <tspan x="36" y="87" fill="#6c7086">  // Branch 1: auth check</tspan>
      <tspan x="36" y="104"><tspan fill="#cba6f7">  if</tspan> (req.auth == ADMIN)</tspan>
      <tspan x="36" y="121" fill="#6c7086">    ...</tspan>
      <tspan x="36" y="140" fill="#6c7086">  // Branch 2: input type</tspan>
      <tspan x="36" y="157"><tspan fill="#cba6f7">  if</tspan> (req.type == JSON)</tspan>
      <tspan x="36" y="174" fill="#6c7086">    ...</tspan>
      <tspan x="36" y="193" fill="#6c7086">  // Branch 3: size check</tspan>
      <tspan x="36" y="210"><tspan fill="#cba6f7">  if</tspan> (req.len > MAX_BUF)</tspan>
      <tspan x="36" y="227" fill="#6c7086">    ...</tspan>
    </text>
    <!-- Loop code (revealed in step 5) -->
    <text id="pe-loop-code" font-size="12.5" font-family="'JetBrains Mono',monospace" fill="#cdd6f4" style="opacity:0;">
      <tspan x="36" y="248" fill="#E53935">  // Loop: parse packets</tspan>
      <tspan x="36" y="265"><tspan fill="#f38ba8">  while</tspan> (has_next(req))</tspan>
    </text>
  </g>

  <!-- ===== "Symbolic Execution" label ===== -->
  <g id="pe-label" style="opacity:0;">
    <text x="570" y="28" text-anchor="middle" font-size="15" font-weight="700" fill="#555" font-family="Inter,sans-serif" letter-spacing="0.5">SYMBOLIC EXECUTION TREE</text>
  </g>

  <!-- ===== Tree: Level 0 - Entry ===== -->
  <g id="pe-root" style="opacity:0;">
    <circle cx="570" cy="70" r="22" fill="#8C1D40" stroke="#5C1028" stroke-width="2"/>
    <text x="570" y="75" text-anchor="middle" font-size="12" font-weight="700" fill="white" font-family="Inter,sans-serif">entry</text>
  </g>

  <!-- ===== Tree: Level 1 - 2 paths (Branch 1) ===== -->
  <g id="pe-level1" style="opacity:0;">
    <!-- Edges -->
    <line x1="555" y1="90" x2="470" y2="145" stroke="#8C1D40" stroke-width="2"/>
    <line x1="585" y1="90" x2="670" y2="145" stroke="#8C1D40" stroke-width="2"/>
    <!-- Nodes -->
    <circle cx="470" cy="165" r="20" fill="#8C1D40" stroke="#5C1028" stroke-width="2"/>
    <text x="470" y="163" text-anchor="middle" font-size="10" fill="white" font-family="Inter,sans-serif">auth</text>
    <text x="470" y="175" text-anchor="middle" font-size="9" fill="#ddd" font-family="Inter,sans-serif">=ADMIN</text>
    <circle cx="670" cy="165" r="20" fill="#8C1D40" stroke="#5C1028" stroke-width="2"/>
    <text x="670" y="163" text-anchor="middle" font-size="10" fill="white" font-family="Inter,sans-serif">auth</text>
    <text x="670" y="175" text-anchor="middle" font-size="9" fill="#ddd" font-family="Inter,sans-serif">!=ADMIN</text>
    <!-- Count badge -->
    <rect x="780" y="152" width="90" height="26" rx="13" fill="#fff3e0" stroke="#FF9800" stroke-width="1.5"/>
    <text x="825" y="170" text-anchor="middle" font-size="13" font-weight="700" fill="#E65100" font-family="Inter,sans-serif">2 paths</text>
  </g>

  <!-- ===== Tree: Level 2 - 4 paths (Branch 2) ===== -->
  <g id="pe-level2" style="opacity:0;">
    <!-- Left subtree edges -->
    <line x1="458" y1="183" x2="420" y2="245" stroke="#8C1D40" stroke-width="1.8"/>
    <line x1="482" y1="183" x2="520" y2="245" stroke="#8C1D40" stroke-width="1.8"/>
    <!-- Right subtree edges -->
    <line x1="658" y1="183" x2="620" y2="245" stroke="#8C1D40" stroke-width="1.8"/>
    <line x1="682" y1="183" x2="720" y2="245" stroke="#8C1D40" stroke-width="1.8"/>
    <!-- Nodes -->
    <circle cx="420" cy="262" r="17" fill="#B05070" stroke="#8C1D40" stroke-width="1.5"/>
    <text x="420" y="266" text-anchor="middle" font-size="9" fill="white" font-family="Inter,sans-serif">JSON</text>
    <circle cx="520" cy="262" r="17" fill="#B05070" stroke="#8C1D40" stroke-width="1.5"/>
    <text x="520" y="266" text-anchor="middle" font-size="9" fill="white" font-family="Inter,sans-serif">!JSON</text>
    <circle cx="620" cy="262" r="17" fill="#B05070" stroke="#8C1D40" stroke-width="1.5"/>
    <text x="620" y="266" text-anchor="middle" font-size="9" fill="white" font-family="Inter,sans-serif">JSON</text>
    <circle cx="720" cy="262" r="17" fill="#B05070" stroke="#8C1D40" stroke-width="1.5"/>
    <text x="720" y="266" text-anchor="middle" font-size="9" fill="white" font-family="Inter,sans-serif">!JSON</text>
    <!-- Count badge -->
    <rect x="780" y="249" width="90" height="26" rx="13" fill="#fff3e0" stroke="#FF9800" stroke-width="1.5"/>
    <text x="825" y="267" text-anchor="middle" font-size="13" font-weight="700" fill="#E65100" font-family="Inter,sans-serif">4 paths</text>
  </g>

  <!-- ===== Tree: Level 3 - 8 paths (Branch 3) ===== -->
  <g id="pe-level3" style="opacity:0;">
    <!-- Edges from each level-2 node -->
    <line x1="412" y1="277" x2="395" y2="335" stroke="#B05070" stroke-width="1.5"/>
    <line x1="428" y1="277" x2="445" y2="335" stroke="#B05070" stroke-width="1.5"/>
    <line x1="512" y1="277" x2="495" y2="335" stroke="#B05070" stroke-width="1.5"/>
    <line x1="528" y1="277" x2="545" y2="335" stroke="#B05070" stroke-width="1.5"/>
    <line x1="612" y1="277" x2="595" y2="335" stroke="#B05070" stroke-width="1.5"/>
    <line x1="628" y1="277" x2="645" y2="335" stroke="#B05070" stroke-width="1.5"/>
    <line x1="712" y1="277" x2="695" y2="335" stroke="#B05070" stroke-width="1.5"/>
    <line x1="728" y1="277" x2="745" y2="335" stroke="#B05070" stroke-width="1.5"/>
    <!-- 8 leaf nodes -->
    <circle cx="395" cy="350" r="14" fill="#D4829A" stroke="#B05070" stroke-width="1.2"/>
    <circle cx="445" cy="350" r="14" fill="#D4829A" stroke="#B05070" stroke-width="1.2"/>
    <circle cx="495" cy="350" r="14" fill="#D4829A" stroke="#B05070" stroke-width="1.2"/>
    <circle cx="545" cy="350" r="14" fill="#D4829A" stroke="#B05070" stroke-width="1.2"/>
    <circle cx="595" cy="350" r="14" fill="#D4829A" stroke="#B05070" stroke-width="1.2"/>
    <circle cx="645" cy="350" r="14" fill="#D4829A" stroke="#B05070" stroke-width="1.2"/>
    <circle cx="695" cy="350" r="14" fill="#D4829A" stroke="#B05070" stroke-width="1.2"/>
    <circle cx="745" cy="350" r="14" fill="#D4829A" stroke="#B05070" stroke-width="1.2"/>
    <!-- Count badge -->
    <rect x="780" y="337" width="90" height="26" rx="13" fill="#fff3e0" stroke="#FF9800" stroke-width="1.5"/>
    <text x="825" y="355" text-anchor="middle" font-size="13" font-weight="700" fill="#E65100" font-family="Inter,sans-serif">8 paths</text>
  </g>

  <!-- ===== Explosion dots (suggesting more levels) ===== -->
  <g id="pe-dots" style="opacity:0;">
    <!-- Faint edges going down from leaf nodes -->
    <line x1="395" y1="364" x2="385" y2="395" stroke="#ddd" stroke-width="1" stroke-dasharray="3,3"/>
    <line x1="395" y1="364" x2="405" y2="395" stroke="#ddd" stroke-width="1" stroke-dasharray="3,3"/>
    <line x1="445" y1="364" x2="435" y2="395" stroke="#ddd" stroke-width="1" stroke-dasharray="3,3"/>
    <line x1="445" y1="364" x2="455" y2="395" stroke="#ddd" stroke-width="1" stroke-dasharray="3,3"/>
    <line x1="545" y1="364" x2="535" y2="395" stroke="#ddd" stroke-width="1" stroke-dasharray="3,3"/>
    <line x1="545" y1="364" x2="555" y2="395" stroke="#ddd" stroke-width="1" stroke-dasharray="3,3"/>
    <line x1="645" y1="364" x2="635" y2="395" stroke="#ddd" stroke-width="1" stroke-dasharray="3,3"/>
    <line x1="645" y1="364" x2="655" y2="395" stroke="#ddd" stroke-width="1" stroke-dasharray="3,3"/>
    <line x1="745" y1="364" x2="735" y2="395" stroke="#ddd" stroke-width="1" stroke-dasharray="3,3"/>
    <line x1="745" y1="364" x2="755" y2="395" stroke="#ddd" stroke-width="1" stroke-dasharray="3,3"/>
    <!-- Dots suggesting infinity -->
    <circle cx="385" cy="402" r="3" fill="#ccc"/>
    <circle cx="405" cy="402" r="3" fill="#ccc"/>
    <circle cx="435" cy="402" r="3" fill="#ccc"/>
    <circle cx="455" cy="402" r="3" fill="#ccc"/>
    <circle cx="535" cy="402" r="3" fill="#ccc"/>
    <circle cx="555" cy="402" r="3" fill="#ccc"/>
    <circle cx="635" cy="402" r="3" fill="#ccc"/>
    <circle cx="655" cy="402" r="3" fill="#ccc"/>
    <circle cx="735" cy="402" r="3" fill="#ccc"/>
    <circle cx="755" cy="402" r="3" fill="#ccc"/>
    <!-- More dots further down -->
    <text x="570" y="430" text-anchor="middle" font-size="22" fill="#bbb" font-family="Inter,sans-serif" letter-spacing="8">. . . . . . . . .</text>
  </g>

  <!-- ===== Explosion callout ===== -->
  <g id="pe-callout" style="opacity:0;">
    <rect x="20" y="300" width="340" height="160" rx="8" fill="#fff3cd" stroke="#ffb400" stroke-width="2"/>
    <text x="190" y="328" text-anchor="middle" font-size="15" font-weight="700" fill="#8C1D40" font-family="Inter,sans-serif">Path Explosion</text>
    <text font-size="13" fill="#333" font-family="Inter,sans-serif">
      <tspan x="40" y="352">n branches = 2</tspan><tspan font-size="10" baseline-shift="super">n</tspan><tspan> paths to explore</tspan>
      <tspan x="40" y="372">20 branches = 1,048,576 paths</tspan>
      <tspan x="40" y="392">40 branches = 1,099,511,627,776</tspan>
    </text>
    <line x1="40" y1="404" x2="340" y2="404" stroke="#ffb400" stroke-width="1"/>
    <text x="190" y="424" text-anchor="middle" font-size="12" font-weight="600" fill="#C62828" font-family="Inter,sans-serif">A single binary has thousands of branches.</text>
    <text x="190" y="442" text-anchor="middle" font-size="12" font-weight="600" fill="#C62828" font-family="Inter,sans-serif">Firmware has hundreds of binaries.</text>
    <text x="190" y="456" text-anchor="middle" font-size="11.5" fill="#C62828" font-family="Inter,sans-serif" font-weight="600">Exhaustive exploration: impossible.</text>
  </g>

  <!-- ===== Loop back-edges (step 5) ===== -->
  <g id="pe-loop" style="opacity:0;">
    <!-- Back-edge: curved arrow from leaf nodes back up to entry -->
    <!-- Left back-edge: from leftmost leaf up to root -->

    <!-- Right back-edge: from rightmost leaf up to root -->
    <path d="M 745 336 C 770 300, 770 140, 750 100 Q 740 80, 710 72" stroke="#E53935" stroke-width="2.5" fill="none" stroke-dasharray="6,4"/>
    <!-- Arrowhead for right back-edge -->
    <polygon points="712,66 702,72 712,78" fill="#E53935"/>

    <!-- Loop label -->
    <rect x="540" y="430" width="200" height="56" rx="8" fill="#ffebee" stroke="#E53935" stroke-width="2"/>
    <text x="640" y="453" text-anchor="middle" font-size="14" font-weight="700" fill="#C62828" font-family="Inter,sans-serif">Loops: 2<tspan font-size="10" baseline-shift="super">n·k</tspan> paths</text>
    <text x="640" y="473" text-anchor="middle" font-size="12" fill="#E53935" font-family="Inter,sans-serif">Unbounded k = infinite paths</text>

    <!-- Infinity symbols on the back-edges -->
    <text x="770" y="210" font-size="22" fill="#E53935" font-weight="700" font-family="Inter,sans-serif">∞</text>
  </g>


</svg>
</div>

<script>
window._animQueue.push(function() {
  var diagram = document.getElementById('pathexp-diagram');
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
      // Step 1: Code snippet + tree label + root node
      {
        show: function(instant) { showIds(['pe-code', 'pe-label', 'pe-root'], instant); },
        hide: function() { hideIds(['pe-code', 'pe-label', 'pe-root']); }
      },
      // Step 2: First branch - 2 paths
      {
        show: function(instant) { showIds(['pe-level1'], instant); },
        hide: function() { hideIds(['pe-level1']); }
      },
      // Step 3: Second branch - 4 paths
      {
        show: function(instant) { showIds(['pe-level2'], instant); },
        hide: function() { hideIds(['pe-level2']); }
      },
      // Step 4: Third branch - 8 paths + explosion dots
      {
        show: function(instant) { showIds(['pe-level3', 'pe-dots'], instant); },
        hide: function() { hideIds(['pe-level3', 'pe-dots']); }
      },
      // Step 5: Loop back-edges + loop code highlight
      {
        show: function(instant) {
          showIds(['pe-loop', 'pe-loop-code'], instant);
        },
        hide: function() {
          hideIds(['pe-loop', 'pe-loop-code']);
        }
      },
      // Step 6: Path explosion callout
      {
        show: function(instant) { showIds(['pe-callout'], instant); },
        hide: function() { hideIds(['pe-callout']); }
      }
    ]
  });
});
</script>

???

Symbolic execution explores every feasible path through a program. [CLICK] At each conditional branch, the execution forks. One path takes the true side, another the false side. Two paths after the first branch. [CLICK] Hit a second branch, each path forks again. Four paths. [CLICK] A third branch: eight paths. The growth is exponential. [CLICK] But branches are only half the problem. Add a loop, and the entire tree re-expands on every iteration. Each iteration multiplies the path count by the full branching factor again: 2 to the n becomes 2 to the n times k, where k is the number of loop iterations. If the loop bound depends on symbolic input, k is unbounded. Infinite paths. This is the fundamental wall that symbolic execution hits on real firmware. [CLICK] The concrete numbers: twenty branches produce over a million paths, before any loops. Forty branches: over a trillion. A single firmware binary can have thousands of branches and dozens of loops. The entire firmware image contains hundreds of binaries. Exhaustive symbolic exploration is impossible.
