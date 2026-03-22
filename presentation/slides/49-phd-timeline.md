---
type: content
title: "PhD Timeline"
---

<svg viewBox="0 0 1100 440" style="width:100%; margin:0 auto; display:block;" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <marker id="tl-arr" markerWidth="9" markerHeight="9" refX="8" refY="3" orient="auto">
      <polygon points="0 0, 9 3, 0 6" fill="#999"/>
    </marker>
    <filter id="tl-shadow">
      <feDropShadow dx="0" dy="1" stdDeviation="2" flood-opacity="0.08"/>
    </filter>
    <style>
      .tl-year { font-family: Inter, sans-serif; font-size: 12px; fill: #888; font-weight: 500; }
      .tl-event { font-family: Inter, sans-serif; font-size: 11px; fill: #333; font-weight: 600; }
      .tl-detail { font-family: Inter, sans-serif; font-size: 10px; fill: #666; }
      .tl-bar-label { font-family: Inter, sans-serif; font-size: 12px; fill: white; font-weight: 700; }
      .tl-now { font-family: Inter, sans-serif; font-size: 12px; fill: #C41E3A; font-weight: 700; }
    </style>
  </defs>

  <!-- Title -->
  <text x="550" y="28" font-family="Inter, sans-serif" font-size="16" font-weight="700" text-anchor="middle" fill="#333">PhD Timeline: Summer 2020 — Summer 2026</text>

  <!-- ===== TIME AXIS ===== -->
  <!-- Year positions: '20=80, '21=220, '22=360, '23=500, '24=640, '25=780, '26=920  (140px/year, 70px/semester) -->
  <line x1="60" y1="70" x2="1060" y2="70" stroke="#ccc" stroke-width="2"/>

  <!-- Year tick marks -->
  <line x1="80" y1="63" x2="80" y2="77" stroke="#999" stroke-width="1.5"/>
  <text x="80" y="92" class="tl-year" text-anchor="middle">'20</text>

  <line x1="220" y1="63" x2="220" y2="77" stroke="#999" stroke-width="1.5"/>
  <text x="220" y="92" class="tl-year" text-anchor="middle">'21</text>

  <line x1="360" y1="63" x2="360" y2="77" stroke="#999" stroke-width="1.5"/>
  <text x="360" y="92" class="tl-year" text-anchor="middle">'22</text>

  <line x1="500" y1="63" x2="500" y2="77" stroke="#999" stroke-width="1.5"/>
  <text x="500" y="92" class="tl-year" text-anchor="middle">'23</text>

  <line x1="640" y1="63" x2="640" y2="77" stroke="#999" stroke-width="1.5"/>
  <text x="640" y="92" class="tl-year" text-anchor="middle">'24</text>

  <line x1="780" y1="63" x2="780" y2="77" stroke="#999" stroke-width="1.5"/>
  <text x="780" y="92" class="tl-year" text-anchor="middle">'25</text>

  <line x1="920" y1="63" x2="920" y2="77" stroke="#999" stroke-width="1.5"/>
  <text x="920" y="92" class="tl-year" text-anchor="middle">'26</text>

  <!-- Half-year (summer) subtle ticks -->
  <line x1="150" y1="66" x2="150" y2="74" stroke="#ddd" stroke-width="1"/>
  <line x1="290" y1="66" x2="290" y2="74" stroke="#ddd" stroke-width="1"/>
  <line x1="430" y1="66" x2="430" y2="74" stroke="#ddd" stroke-width="1"/>
  <line x1="570" y1="66" x2="570" y2="74" stroke="#ddd" stroke-width="1"/>
  <line x1="710" y1="66" x2="710" y2="74" stroke="#ddd" stroke-width="1"/>
  <line x1="850" y1="66" x2="850" y2="74" stroke="#ddd" stroke-width="1"/>
  <line x1="990" y1="66" x2="990" y2="74" stroke="#ddd" stroke-width="1"/>

  <!-- ===== NOW MARKER at S2026 (~940) ===== -->
  <line x1="940" y1="45" x2="940" y2="410" stroke="#C41E3A" stroke-width="2" stroke-dasharray="5,4" opacity="0.5"/>
  <circle cx="940" cy="70" r="5" fill="#C41E3A"/>
  <text x="940" y="40" class="tl-now" text-anchor="middle">NOW</text>

  <!-- ===== MILESTONE: Began PhD (Sum2020 → x=150) ===== -->
  <circle cx="150" cy="70" r="5" fill="#666" stroke="#333" stroke-width="1.5"/>
  <line x1="150" y1="75" x2="150" y2="110" stroke="#999" stroke-width="1" stroke-dasharray="3,2"/>
  <text x="150" y="124" class="tl-event" text-anchor="middle">Began PhD</text>
  <text x="150" y="138" class="tl-detail" text-anchor="middle">Sum 2020</text>

  <!-- ===== ROW 1 (y~155): Operation Mango bar ===== -->
  <rect x="240" y="155" width="280" height="32" rx="4" fill="#FF9800" filter="url(#tl-shadow)"/>
  <text x="380" y="176" class="tl-bar-label" text-anchor="middle">Operation Mango</text>
  <!-- Start label -->
  <line x1="240" y1="150" x2="240" y2="140" stroke="#FF9800" stroke-width="1.5"/>
  <text x="240" y="135" class="tl-detail" text-anchor="middle" fill="#E65100">S2021</text>
  <!-- End diamond: Mango Accepted -->
  <polygon points="520,148 529,160 520,172 511,160" fill="#FF9800" stroke="#E65100" stroke-width="1.5"/>
  <text x="520" y="198" class="tl-event" text-anchor="middle" fill="#E65100">Mango Accepted</text>
  <text x="520" y="212" class="tl-detail" text-anchor="middle">USENIX Sec '24</text>

  <!-- ===== ROW 2 (y~260): Artiphishell bar ===== -->
  <!-- Pushed down to y=260 so "USENIX Sec '24" text (y=212) has ~48px clearance -->
  <rect x="570" y="260" width="280" height="32" rx="4" fill="#7B1FA2" filter="url(#tl-shadow)"/>
  <text x="710" y="281" class="tl-bar-label" text-anchor="middle">Artiphishell / DARPA AIxCC</text>
  <!-- Start label -->
  <line x1="570" y1="256" x2="570" y2="240" stroke="#7B1FA2" stroke-width="1.5"/>
  <text x="570" y="234" class="tl-detail" text-anchor="middle" fill="#7B1FA2">F2023</text>
  <!-- End diamond: AIxCC End -->
  <polygon points="850,252 859,264 850,276 841,264" fill="#7B1FA2" stroke="#4A148C" stroke-width="1.5"/>
  <text x="850" y="306" class="tl-event" text-anchor="middle" fill="#7B1FA2">AIxCC End</text>
  <text x="850" y="320" class="tl-detail" text-anchor="middle">DEF CON '25</text>

  <!-- ===== ROW 3 (y~350): Bottom milestone row, spread horizontally ===== -->
  <!-- Comp Exam: F2025 → x=850, nudged left to 790 for spacing -->
  <polygon points="790,348 798,356 790,364 782,356" fill="#8C1D40" stroke="#5C0E1F" stroke-width="1.5"/>
  <text x="790" y="382" class="tl-event" text-anchor="middle" fill="#8C1D40">Comp Exam</text>
  <text x="790" y="396" class="tl-detail" text-anchor="middle">F2025</text>

  <!-- Thesis Prospectus: S2026 → x=940, placed at 880 -->
  <polygon points="880,348 888,356 880,364 872,356" fill="#8C1D40" stroke="#5C0E1F" stroke-width="2"/>
  <text x="880" y="382" class="tl-event" text-anchor="middle" fill="#8C1D40">Prospectus</text>
  <text x="880" y="396" class="tl-detail" text-anchor="middle">S2026</text>

  <!-- Peach Submission: S2026 → x=960 -->
  <circle cx="965" cy="356" r="5" fill="#2196F3" stroke="#0D47A1" stroke-width="1.5"/>
  <text x="965" y="382" class="tl-event" text-anchor="middle" fill="#2196F3">Peach Sub.</text>
  <text x="965" y="396" class="tl-detail" text-anchor="middle">S2026</text>

  <!-- Thesis Defense: Sum2026 → x=1045, future/dashed -->
  <polygon points="1045,348 1053,356 1045,364 1037,356" fill="none" stroke="#8C1D40" stroke-width="2" stroke-dasharray="4,2"/>
  <text x="1045" y="382" class="tl-event" text-anchor="middle" fill="#8C1D40">Defense</text>
  <text x="1045" y="396" class="tl-detail" text-anchor="middle">Sum 2026</text>

  <!-- ===== LEGEND ===== -->
  <g transform="translate(60, 428)">
    <rect x="-4" y="-6" width="16" height="12" rx="2" fill="#FF9800"/>
    <text x="18" y="4" class="tl-detail">Mango</text>

    <rect x="70" y="-6" width="16" height="12" rx="2" fill="#7B1FA2"/>
    <text x="92" y="4" class="tl-detail">AIxCC</text>

    <circle cx="146" cy="0" r="4" fill="#666"/>
    <text x="156" y="4" class="tl-detail">Completed</text>

    <polygon points="230,-4 236,0 230,4 224,0" fill="#8C1D40"/>
    <text x="244" y="4" class="tl-detail">Milestone</text>

    <polygon points="320,-4 326,0 320,4 314,0" fill="none" stroke="#8C1D40" stroke-width="1.5" stroke-dasharray="3,1"/>
    <text x="334" y="4" class="tl-detail">Future</text>

    <circle cx="390" cy="0" r="4" fill="#C41E3A"/>
    <text x="400" y="4" class="tl-detail">Now</text>
  </g>
</svg>

???

I started my PhD in Summer 2020. Through 2021, 2022, and into Spring 2023, I built Operation Mango, our scalable static dataflow analysis system for firmware vulnerability detection. The paper was accepted at USENIX Security '24.

In Fall 2023, I joined the DARPA AI Cyber Challenge as part of Team Atlanta, building Artiphishell, an autonomous CRS that handles the full vulnerability lifecycle: detection, triage, root cause analysis, patching, and verification. That work concluded at DEF CON 33 in August 2025.

I completed the comprehensive exam in Fall 2025.

We are now in Spring 2026, at the prospectus defense. This semester I will also submit the Princess Peach paper, our symbolic execution system for validating Mango's static analysis candidates.

The target for the final thesis defense is Summer 2026.
