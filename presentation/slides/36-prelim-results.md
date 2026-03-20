---
type: content
title: "Preliminary Results"
---

<svg viewBox="0 0 900 320" style="width:100%; margin:0.5rem auto; display:block;">
  <!-- Background -->
  <defs>
    <linearGradient id="grad1" x1="0%" y1="0%" x2="100%" y2="0%">
      <stop offset="0%" style="stop-color:#f5f5f5;stop-opacity:1" />
      <stop offset="100%" style="stop-color:#ffffff;stop-opacity:1" />
    </linearGradient>
    <filter id="shadow">
      <feDropShadow dx="0" dy="2" stdDeviation="3" flood-opacity="0.1"/>
    </filter>
  </defs>

  <!-- Title/Target -->
  <text x="750" y="25" font-size="12" fill="#666" font-weight="600" text-anchor="end">Netgear SR700S</text>

  <!-- Stage 1: Static Candidates -->
  <g filter="url(#shadow)">
    <rect x="80" y="50" width="760" height="60" rx="8" fill="#e8e8e8" stroke="#999" stroke-width="1.5"/>
    <text x="470" y="80" font-size="16" font-weight="700" fill="#333" text-anchor="middle">161 Static Candidates</text>
    <text x="470" y="100" font-size="11" fill="#666" text-anchor="middle">from MangoDFA detection</text>
  </g>

  <!-- Arrow/Flow -->
  <line x1="470" y1="110" x2="470" y2="135" stroke="#999" stroke-width="2" marker-end="url(#arrowhead)"/>
  <defs>
    <marker id="arrowhead" markerWidth="10" markerHeight="10" refX="5" refY="5" orient="auto">
      <polygon points="0 0, 10 5, 0 10" fill="#999"/>
    </marker>
  </defs>

  <!-- Stage 2: Confirmed Reachable -->
  <g filter="url(#shadow)">
    <rect x="170" y="135" width="600" height="60" rx="8" fill="#2196F3" stroke="#1565C0" stroke-width="1.5"/>
    <text x="470" y="162" font-size="16" font-weight="700" fill="#fff" text-anchor="middle">51 Possibly Reachable</text>
    <text x="470" y="180" font-size="12" fill="#fff" text-anchor="middle">(32% confirmation rate)</text>
  </g>

  <!-- Arrow/Flow -->
  <line x1="470" y1="195" x2="470" y2="220" stroke="#999" stroke-width="2" marker-end="url(#arrowhead)"/>

  <!-- Stage 3: PoC Exploits -->
  <g filter="url(#shadow)">
    <rect x="260" y="220" width="420" height="60" rx="8" fill="#4CAF50" stroke="#2E7D32" stroke-width="1.5"/>
    <text x="470" y="247" font-size="16" font-weight="700" fill="#fff" text-anchor="middle">1 PoC Exploit Synthesized</text>
    <text x="470" y="265" font-size="12" fill="#fff" text-anchor="middle">(2% of potentially reachable)</text>
  </g>

  <!-- Zero-Day Callout Badge -->
  <g filter="url(#shadow)">
    <!-- Badge background -->
    <rect x="700" y="225" width="180" height="50" rx="6" fill="#8C1D40" stroke="#5A1428" stroke-width="2"/>
    <!-- Star icon -->
    <text x="720" y="252" font-size="24" fill="#FFD700">★</text>
    <!-- Text -->
    <text x="750" y="248" font-size="13" font-weight="700" fill="#FFD700">1 Zero-Day</text>
    <text x="750" y="263" font-size="11" fill="#FFE082">Discovered</text>
  </g>


</svg>

???

The prototype already works. We tested on the Netgear R6400, a popular consumer router. Mango detected 161 command injection closures. We ran the validation system on those 161 candidates. Fifty-one of them were confirmed as reachable, meaning there exists a concrete input that satisfies all the path constraints. For each of those 51, we synthesized an actual PoC exploit. In the process, we identified one zero-day vulnerability that was previously unknown.

This is important because it shows the approach is sound and practical. We're not theorizing; we have a working implementation that validates real firmware.
