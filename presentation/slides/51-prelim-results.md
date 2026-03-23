---
type: content
title: "Preliminary Results"
---

<svg id="funnel-prelim" viewBox="0 0 1050 420" style="width:100%; margin:0 auto; display:block;" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <marker id="arrFunnel" markerWidth="10" markerHeight="10" refX="5" refY="5" orient="auto">
      <polygon points="0 0, 10 5, 0 10" fill="#888"/>
    </marker>
  </defs>

  <!-- Target label -->
  <text x="525" y="25" font-size="13" fill="#888" text-anchor="middle" font-weight="600">Netgear R6400 · Single Firmware Target</text>

  <!-- Stage 1: Static Candidates (wide, grey) -->
  <g id="fn-stage1" opacity="0">
    <rect x="50" y="45" width="950" height="75" rx="10" fill="#e8e8e8" stroke="#999" stroke-width="1.5"/>
    <text x="525" y="78" font-size="22" font-weight="700" fill="#333" text-anchor="middle">161 Static Candidates</text>
    <text x="525" y="103" font-size="13" fill="#666" text-anchor="middle">from MangoDFA detection (command injection closures)</text>
  </g>

  <!-- Filter label 1 -->
  <g id="fn-filter1" opacity="0">
    <line x1="525" y1="120" x2="525" y2="155" stroke="#888" stroke-width="2" marker-end="url(#arrFunnel)"/>
    <rect x="380" y="128" width="290" height="22" rx="4" fill="white" stroke="#aaa" stroke-width="1"/>
    <text x="525" y="143" font-size="12" text-anchor="middle" fill="#666" font-weight="600">PEACH path feasibility check</text>
  </g>

  <!-- Stage 2: Possibly Reachable (medium, green) -->
  <g id="fn-stage2" opacity="0">
    <rect x="175" y="160" width="700" height="75" rx="10" fill="#4CAF50" stroke="#2E7D32" stroke-width="2"/>
    <text x="525" y="193" font-size="22" font-weight="700" fill="white" text-anchor="middle">51 Possibly Reachable</text>
    <text x="525" y="218" font-size="14" fill="#E8F5E9" text-anchor="middle">32% confirmation rate</text>
    <!-- Percentage callout -->
    <rect x="890" y="172" width="120" height="50" rx="8" fill="white" stroke="#2E7D32" stroke-width="1.5"/>
    <text x="950" y="195" font-size="22" font-weight="700" text-anchor="middle" fill="#2E7D32">32%</text>
    <text x="950" y="213" font-size="11" text-anchor="middle" fill="#666">confirmed</text>
  </g>

  <!-- Filter label 2 -->
  <g id="fn-filter2" opacity="0">
    <line x1="525" y1="235" x2="525" y2="270" stroke="#888" stroke-width="2" marker-end="url(#arrFunnel)"/>
    <rect x="390" y="243" width="270" height="22" rx="4" fill="white" stroke="#aaa" stroke-width="1"/>
    <text x="525" y="258" font-size="12" text-anchor="middle" fill="#666" font-weight="600">Concrete PoC exploit synthesis</text>
  </g>

  <!-- Stage 3: PoC Exploit (narrow, maroon) -->
  <g id="fn-stage3" opacity="0">
    <rect x="300" y="275" width="450" height="75" rx="10" fill="#8C1D40" stroke="#5A1428" stroke-width="2.5"/>
    <text x="525" y="308" font-size="22" font-weight="700" fill="white" text-anchor="middle">1 PoC Exploit Synthesized</text>
    <text x="525" y="333" font-size="14" fill="#E8B4C8" text-anchor="middle">2% of potentially reachable</text>

    <!-- Zero-Day callout -->
    <rect x="770" y="280" width="230" height="65" rx="10" fill="#8C1D40" stroke="#FFD700" stroke-width="2.5"/>
    <text x="885" y="307" font-size="24" fill="#FFD700" text-anchor="middle" font-weight="700">1 Zero-Day</text>
    <text x="885" y="330" font-size="13" fill="#FFE082" text-anchor="middle">Previously unknown vulnerability</text>
  </g>

  <!-- Bottom insight -->
  <g id="fn-insight" opacity="0">
    <rect x="150" y="370" width="750" height="40" rx="8" fill="#FFF3E0" stroke="#FF9800" stroke-width="1.5"/>
    <text x="525" y="395" font-size="14" text-anchor="middle" fill="#E65100" font-weight="600">Working prototype validates real firmware: detection → feasibility → exploit</text>
  </g>
</svg>

<script>
window._animQueue.push(function() {
  var el = document.getElementById('funnel-prelim');
  if (!el) return;
  var slideEl = el.closest('.slide');
  var slides = document.querySelectorAll('.slide');
  var idx = Array.from(slides).indexOf(slideEl);
  if (idx < 0) return;

  window.registerSlideAnimation(idx, {
    mode: 'step',
    steps: [
      // Step 1: Show static candidates
      makeStep(['fn-stage1']),
      // Step 2: Filter + possibly reachable
      makeStep(['fn-filter1', 'fn-stage2']),
      // Step 3: Filter + PoC + zero-day + insight
      makeStep(['fn-filter2', 'fn-stage3', 'fn-insight'])
    ]
  });
});
</script>

???

The prototype already works. We tested on the Netgear R6400, a popular consumer router. [CLICK] [step 1] Mango detected 161 command injection closures across the firmware's binaries. These are static candidates: paths from source to sink that might be exploitable. [CLICK] [step 2] We ran PEACH on those 161 candidates for path feasibility checking. 51 of them, about 32%, were confirmed as possibly reachable, meaning the path constraints are satisfiable. [CLICK] [step 3] For the confirmed candidates, we attempted concrete PoC exploit synthesis. One candidate produced a working exploit, and it turned out to be a previously unknown zero-day vulnerability. The funnel narrows from 161 to 51 to 1, but that 1 is real: a concrete triggering input that proves exploitability. This shows the approach is sound and practical on real firmware.
