---
type: content
title: "Ablation Study"
---

<svg viewBox="0 0 1150 560" style="width:100%; margin:0 auto; display:block;" xmlns="http://www.w3.org/2000/svg">
  <defs>
  </defs>

  <!-- Y-axis title -->
  <text x="85" y="62" font-size="21" font-weight="700" text-anchor="middle" fill="#333" font-family="Inter, sans-serif">Optimization</text>

  <!-- X-axis title -->
  <text x="600" y="460" font-size="21" font-weight="700" text-anchor="middle" fill="#333" font-family="Inter, sans-serif">Analysis Time per Binary (seconds)</text>

  <!-- Y-axis -->
  <line x1="170" y1="80" x2="170" y2="400" stroke="#ddd" stroke-width="1.5"/>
  <!-- X-axis -->
  <line x1="170" y1="400" x2="1060" y2="400" stroke="#ddd" stroke-width="1.5"/>

  <!-- Grid lines -->
  <line x1="170" y1="320" x2="1060" y2="320" stroke="#f0f0f0" stroke-width="0.8"/>
  <line x1="170" y1="240" x2="1060" y2="240" stroke="#f0f0f0" stroke-width="0.8"/>
  <line x1="170" y1="160" x2="1060" y2="160" stroke="#f0f0f0" stroke-width="0.8"/>

  <!-- X-axis ticks -->
  <line x1="170" y1="400" x2="170" y2="410" stroke="#999" stroke-width="1"/>
  <text x="170" y="425" font-size="15.2" text-anchor="middle" fill="#888" font-family="Inter, sans-serif">0</text>

  <line x1="420" y1="400" x2="420" y2="410" stroke="#999" stroke-width="1"/>
  <text x="420" y="425" font-size="15.2" text-anchor="middle" fill="#888" font-family="Inter, sans-serif">400</text>

  <line x1="670" y1="400" x2="670" y2="410" stroke="#999" stroke-width="1"/>
  <text x="670" y="425" font-size="15.2" text-anchor="middle" fill="#888" font-family="Inter, sans-serif">800</text>

  <line x1="920" y1="400" x2="920" y2="410" stroke="#999" stroke-width="1"/>
  <text x="920" y="425" font-size="15.2" text-anchor="middle" fill="#888" font-family="Inter, sans-serif">1,200</text>

  <!-- Bar 1: No Modifications (1,575s) -->
  <g>
    <text x="160" y="365" font-size="17.5" font-weight="600" text-anchor="end" fill="#333" font-family="Inter, sans-serif">No Modifications</text>
    <rect x="170" y="340" width="890" height="55" fill="#8C1D40" opacity="0.35" rx="4"/>
    <rect x="170" y="340" width="890" height="55" fill="none" stroke="#8C1D40" stroke-width="1.5" rx="4"/>
    <text x="1070" y="374" font-size="17.5" font-weight="700" fill="#8C1D40" font-family="Inter, sans-serif">1,575s</text>
  </g>

  <!-- Bar 2: Sink-to-Source Only (632s) -->
  <g>
    <text x="160" y="285" font-size="17.5" font-weight="600" text-anchor="end" fill="#333" font-family="Inter, sans-serif">Sink-to-Source</text>
    <rect x="170" y="260" width="357" height="55" fill="#8C1D40" opacity="0.55" rx="4"/>
    <rect x="170" y="260" width="357" height="55" fill="none" stroke="#8C1D40" stroke-width="1.5" rx="4"/>
    <text x="537" y="294" font-size="17.5" font-weight="700" fill="#8C1D40" font-family="Inter, sans-serif">632s</text>
    <text x="537" y="312" font-size="14" fill="#999" font-family="Inter, sans-serif">60% reduction</text>
  </g>

  <!-- Bar 3: Assumed Nonimpact Only (345s) -->
  <g>
    <text x="160" y="205" font-size="17.5" font-weight="600" text-anchor="end" fill="#333" font-family="Inter, sans-serif">Assumed Nonimpact</text>
    <rect x="170" y="180" width="195" height="55" fill="#8C1D40" opacity="0.75" rx="4"/>
    <rect x="170" y="180" width="195" height="55" fill="none" stroke="#8C1D40" stroke-width="1.5" rx="4"/>
    <text x="375" y="214" font-size="17.5" font-weight="700" fill="#8C1D40" font-family="Inter, sans-serif">345s</text>
    <text x="375" y="232" font-size="14" fill="#999" font-family="Inter, sans-serif">78% reduction</text>
  </g>

  <!-- Bar 4: Both Optimizations (275s) -->
  <g>
    <text x="160" y="125" font-size="17.5" font-weight="600" text-anchor="end" fill="#333" font-family="Inter, sans-serif">Both</text>
    <rect x="170" y="100" width="155" height="55" fill="#8C1D40" rx="4"/>
    <rect x="170" y="100" width="155" height="55" fill="none" stroke="#8C1D40" stroke-width="2" rx="4"/>
    <text x="335" y="134" font-size="17.5" font-weight="700" fill="#8C1D40" font-family="Inter, sans-serif">275s</text>
    <text x="335" y="152" font-size="15.2" fill="#8C1D40" font-weight="600" font-family="Inter, sans-serif">(4.5 min avg)</text>
    <text x="440" y="152" font-size="14" fill="#999" font-family="Inter, sans-serif">83% reduction</text>
  </g>

</svg>

???

The ablation study shows each optimization's contribution. Without modifications, average analysis time is 1,575 seconds per binary. Sink-to-source cuts that by 60%. Assumed nonimpact reduces it further. Combined, average per-binary time drops to 275 seconds, about 4.5 minutes. Both optimizations are necessary; neither alone is sufficient.
