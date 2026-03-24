---
type: content
title: "PhD Timeline"
---

<svg viewBox="0 0 1100 475" style="width:100%; margin:0 auto; display:block;" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <marker id="tl-arr" markerWidth="9" markerHeight="9" refX="8" refY="3" orient="auto">
      <polygon points="0 0, 9 3, 0 6" fill="#999"/>
    </marker>
    <filter id="tl-shadow">
      <feDropShadow dx="0" dy="1" stdDeviation="2" flood-opacity="0.08"/>
    </filter>
    <style>
      .tl-year { font-family: Inter, sans-serif; font-size: 16px; fill: #888; font-weight: 500; }
      .tl-event { font-family: Inter, sans-serif; font-size: 15px; fill: #333; font-weight: 600; }
      .tl-detail { font-family: Inter, sans-serif; font-size: 14px; fill: #666; }
      .tl-bar-label { font-family: Inter, sans-serif; font-size: 15px; fill: white; font-weight: 700; }
      .tl-now { font-family: Inter, sans-serif; font-size: 16px; fill: #C41E3A; font-weight: 700; }
    </style>
  </defs>

  <!-- Title -->
  <text x="550" y="28" font-family="Inter, sans-serif" font-size="16" font-weight="700" text-anchor="middle" fill="#333">PhD Timeline: Summer 2020 to Summer 2026</text>

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
  <line x1="940" y1="45" x2="940" y2="440" stroke="#C41E3A" stroke-width="2" stroke-dasharray="5,4" opacity="0.5"/>
  <circle cx="940" cy="70" r="5" fill="#C41E3A"/>
  <text x="940" y="40" class="tl-now" text-anchor="middle">NOW</text>

  <!-- ===== MILESTONE: Began PhD (Sum2020 → x=150) ===== -->
  <circle cx="150" cy="70" r="5" fill="#666" stroke="#333" stroke-width="1.5"/>
  <line x1="150" y1="75" x2="150" y2="110" stroke="#999" stroke-width="1" stroke-dasharray="3,2"/>
  <text x="150" y="124" class="tl-event" text-anchor="middle">Began PhD</text>
  <text x="150" y="138" class="tl-detail" text-anchor="middle">Sum 2020</text>

  <!-- ===== ROW 1 (y~155): Operation Mango bar ===== -->
  <!-- S2021 (x=290) to S2024 (x=650) -->
  <rect x="290" y="155" width="360" height="32" rx="4" fill="#FF9800" filter="url(#tl-shadow)"/>
  <text x="470" y="176" class="tl-bar-label" text-anchor="middle">Operation Mango</text>
  <!-- Start label -->
  <line x1="290" y1="150" x2="290" y2="140" stroke="#FF9800" stroke-width="1.5"/>
  <text x="290" y="135" class="tl-detail" text-anchor="middle" fill="#E65100">Sum 2021</text>
  <!-- Submitted marker: F2023 → x=590 -->
  <circle cx="590" cy="171" r="4.5" fill="#FF9800" stroke="#E65100" stroke-width="1.5"/>
  <line x1="590" y1="155" x2="590" y2="140" stroke="#E65100" stroke-width="1" stroke-dasharray="3,2"/>
  <text x="590" y="135" class="tl-detail" text-anchor="middle" fill="#E65100">Submitted</text>
  <!-- Acceptance diamond: USENIX Sec '24 notification ~Feb 2024, x≈650 -->
  <polygon points="650,148 659,160 650,172 641,160" fill="#FF9800" stroke="#E65100" stroke-width="1.5"/>
  <text x="650" y="198" class="tl-event" text-anchor="middle" fill="#E65100">USENIX Sec '24</text>

  <!-- ===== ROW 2 (y~230): Artiphishell bar ===== -->
  <!-- F2023 (x=570) to Sum2025 (x=850) -->
  <rect x="570" y="230" width="280" height="32" rx="4" fill="#7B1FA2" filter="url(#tl-shadow)"/>
  <text x="710" y="251" class="tl-bar-label" text-anchor="middle">Artiphishell / AIxCC</text>
  <!-- Start label -->
  <line x1="570" y1="226" x2="570" y2="213" stroke="#7B1FA2" stroke-width="1.5"/>
  <text x="570" y="210" class="tl-detail" text-anchor="middle" fill="#7B1FA2">F2023</text>
  <!-- End diamond: DEF CON '25 (Aug 2025 → x=850) -->
  <polygon points="850,223 859,235 850,247 841,235" fill="#7B1FA2" stroke="#4A148C" stroke-width="1.5"/>
  <text x="850" y="275" class="tl-event" text-anchor="middle" fill="#7B1FA2">DEF CON '25</text>
  <!-- Future extension: paper submission Spring 2026 -->
  <rect x="850" y="230" width="100" height="32" rx="4" fill="#7B1FA2" opacity="0.3" stroke="#7B1FA2" stroke-width="2" stroke-dasharray="4,3"/>
  <circle cx="950" cy="246" r="4.5" fill="#7B1FA2" stroke="#4A148C" stroke-width="1.5"/>
  <text x="950" y="275" class="tl-detail" text-anchor="middle" fill="#7B1FA2">Submit</text>

  <!-- ===== ROW 3 (y~305): PEACH bar ===== -->
  <!-- F2025 (x=850) to Sum2026 (x=990) - split at NOW marker (x=940) -->
  <!-- Past portion: x=850 to x=940 -->
  <rect x="850" y="305" width="90" height="32" rx="4" fill="#2196F3" filter="url(#tl-shadow)"/>
  <!-- Future portion: x=940 to x=990 -->
  <rect x="940" y="305" width="50" height="32" rx="4" fill="#2196F3" opacity="0.4" stroke="#2196F3" stroke-width="2" stroke-dasharray="4,3" filter="url(#tl-shadow)"/>
  <text x="920" y="326" class="tl-bar-label" text-anchor="middle">PEACH</text>
  <!-- Start label: moved right to avoid overlap with DEF CON '25 -->
  <line x1="850" y1="301" x2="850" y2="291" stroke="#2196F3" stroke-width="1.5"/>
  <text x="895" y="296" class="tl-detail" text-anchor="middle" fill="#1565C0">F2025</text>
  <!-- Submission target: S2026 → x=960 -->
  <circle cx="960" cy="321" r="5" fill="#2196F3" stroke="#0D47A1" stroke-width="1.5"/>
  <text x="960" y="354" class="tl-detail" text-anchor="middle" fill="#1565C0">Submit</text>

  <!-- ===== ROW 4 (y~385): PhD Milestones (Prospectus, Defense) ===== -->
  <text x="80" y="412" class="tl-detail" font-weight="600" fill="#8C1D40">Milestones</text>

  <!-- Comp Exam: F2025 → x=815, milestone row -->
  <polygon points="815,383 823,391 815,399 807,391" fill="#8C1D40" stroke="#5C0E1F" stroke-width="1.5"/>
  <line x1="815" y1="399" x2="815" y2="410" stroke="#8C1D40" stroke-width="1" stroke-dasharray="2,1"/>
  <text x="815" y="424" class="tl-event" text-anchor="middle" fill="#8C1D40">Comp Exam</text>
  <text x="815" y="438" class="tl-detail" text-anchor="middle">F2025</text>

  <!-- Thesis Prospectus: S2026 → x=930 (nudged left to give Defense room) -->
  <polygon points="930,383 938,391 930,399 922,391" fill="#8C1D40" stroke="#5C0E1F" stroke-width="2"/>
  <line x1="930" y1="399" x2="930" y2="410" stroke="#8C1D40" stroke-width="1" stroke-dasharray="2,1"/>
  <text x="930" y="424" class="tl-event" text-anchor="middle" fill="#8C1D40">Prospectus</text>
  <text x="930" y="438" class="tl-detail" text-anchor="middle">S2026</text>

  <!-- Thesis Defense: Sum2026 → x=1040 (pushed right, staggered higher) -->
  <polygon points="1040,383 1048,391 1040,399 1032,391" fill="none" stroke="#8C1D40" stroke-width="2" stroke-dasharray="4,2"/>
  <line x1="1040" y1="399" x2="1040" y2="410" stroke="#8C1D40" stroke-width="1" stroke-dasharray="2,1"/>
  <text x="1040" y="424" class="tl-event" text-anchor="middle" fill="#8C1D40">Defense</text>
  <text x="1040" y="438" class="tl-detail" text-anchor="middle">Sum 2026</text>

  <!-- ===== LEGEND ===== -->
  <g transform="translate(60, 467)">
    <rect x="-4" y="-6" width="16" height="12" rx="2" fill="#FF9800"/>
    <text x="18" y="4" class="tl-detail">Mango</text>

    <rect x="70" y="-6" width="16" height="12" rx="2" fill="#7B1FA2"/>
    <text x="92" y="4" class="tl-detail">AIxCC</text>

    <rect x="140" y="-6" width="16" height="12" rx="2" fill="#2196F3"/>
    <text x="162" y="4" class="tl-detail">PEACH</text>

    <polygon points="230,-4 236,0 230,4 224,0" fill="#FF9800"/>
    <text x="244" y="4" class="tl-detail">Accepted</text>

    <circle cx="330" cy="0" r="3.5" fill="#2196F3" stroke="#0D47A1" stroke-width="1.5"/>
    <text x="340" y="4" class="tl-detail">Submission</text>

    <polygon points="480,-4 486,0 480,4 474,0" fill="none" stroke="#8C1D40" stroke-width="1.5" stroke-dasharray="3,1"/>
    <text x="494" y="4" class="tl-detail">Future</text>

    <circle cx="590" cy="0" r="4" fill="#C41E3A"/>
    <text x="600" y="4" class="tl-detail">Now</text>
  </g>
</svg>

???

I started my PhD in Summer 2020. Through 2021, 2022, and into 2024, I built Operation Mango. The paper was accepted at USENIX Security 2024.

In Fall 2023, I joined the DARPA AI Cyber Challenge as part of Team Shellphish, building Artiphishell. That work concluded at DEF CON 33 in August 2025.

Starting Fall 2025, I began work on PEACH, the symbolic execution system for validating Mango's static analysis candidates. The target submission is Spring 2026.

I completed the comprehensive exam in Fall 2025. We are now at the prospectus defense. The target for the final thesis defense is Summer 2026.
