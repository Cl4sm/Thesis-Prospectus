---
type: content
title: "PhD Timeline"
---

<svg viewBox="0 0 1100 380" style="width:100%; margin:0 auto; display:block;">
  <!-- Define patterns for future work -->
  <defs>
    <pattern id="diagonalHatch" x="4" y="4" width="8" height="8" patternUnits="userSpaceOnUse">
      <path d="M -2,2 l 4,-4 M 0,8 l 8,-8 M 6,10 l 4,-4" stroke="#999" stroke-width="1"/>
    </pattern>
    <style>
      .timeline-label { font-family: sans-serif; font-size: 12px; font-weight: 500; }
      .semester-label { font-family: sans-serif; font-size: 11px; fill: #555; }
      .milestone-label { font-family: sans-serif; font-size: 11px; font-weight: 600; }
      .phase-label { font-family: sans-serif; font-size: 12px; font-weight: 600; fill: white; }
      .now-label { font-family: sans-serif; font-size: 11px; font-weight: bold; fill: #C41E3A; }
    </style>
  </defs>

  <!-- Background -->
  <rect width="1100" height="380" fill="#f9f9f9"/>

  <!-- Title -->
  <text x="550" y="25" class="timeline-label" text-anchor="middle" font-size="16" font-weight="bold">
    PhD Timeline: Fall 2021 — Spring 2027
  </text>

  <!-- Time axis (semesters) -->
  <g id="time-axis">
    <!-- Horizontal line -->
    <line x1="80" y1="60" x2="1050" y2="60" stroke="#ccc" stroke-width="2"/>

    <!-- Semester markers and labels -->
    <!-- Each semester = ~80px width -->
    <!-- F21 (0), S22 (80), F22 (160), S23 (240), F23 (320), S24 (400), F24 (480), S25 (560), F25 (640), S26 (720), F26 (800), S27 (880) -->

    <line x1="80" y1="55" x2="80" y2="65" stroke="#666" stroke-width="1.5"/>
    <text x="80" y="75" class="semester-label" text-anchor="middle">F21</text>

    <line x1="160" y1="55" x2="160" y2="65" stroke="#666" stroke-width="1.5"/>
    <text x="160" y="75" class="semester-label" text-anchor="middle">S22</text>

    <line x1="240" y1="55" x2="240" y2="65" stroke="#666" stroke-width="1.5"/>
    <text x="240" y="75" class="semester-label" text-anchor="middle">F22</text>

    <line x1="320" y1="55" x2="320" y2="65" stroke="#666" stroke-width="1.5"/>
    <text x="320" y="75" class="semester-label" text-anchor="middle">S23</text>

    <line x1="400" y1="55" x2="400" y2="65" stroke="#666" stroke-width="1.5"/>
    <text x="400" y="75" class="semester-label" text-anchor="middle">F23</text>

    <line x1="480" y1="55" x2="480" y2="65" stroke="#666" stroke-width="1.5"/>
    <text x="480" y="75" class="semester-label" text-anchor="middle">S24</text>

    <line x1="560" y1="55" x2="560" y2="65" stroke="#666" stroke-width="1.5"/>
    <text x="560" y="75" class="semester-label" text-anchor="middle">F24</text>

    <line x1="640" y1="55" x2="640" y2="65" stroke="#666" stroke-width="1.5"/>
    <text x="640" y="75" class="semester-label" text-anchor="middle">S25</text>

    <line x1="720" y1="55" x2="720" y2="65" stroke="#666" stroke-width="1.5"/>
    <text x="720" y="75" class="semester-label" text-anchor="middle">F25</text>

    <line x1="800" y1="55" x2="800" y2="65" stroke="#666" stroke-width="1.5"/>
    <text x="800" y="75" class="semester-label" text-anchor="middle">S26</text>

    <line x1="880" y1="55" x2="880" y2="65" stroke="#666" stroke-width="1.5"/>
    <text x="880" y="75" class="semester-label" text-anchor="middle">F26</text>

    <line x1="960" y1="55" x2="960" y2="65" stroke="#666" stroke-width="1.5"/>
    <text x="960" y="75" class="semester-label" text-anchor="middle">S27</text>
  </g>

  <!-- NOW marker (March 2026, at start of S26 ~800px) -->
  <line x1="800" y1="60" x2="800" y2="360" stroke="#C41E3A" stroke-width="2.5" stroke-dasharray="4,4" opacity="0.7"/>
  <circle cx="800" cy="60" r="5" fill="#C41E3A" opacity="0.7"/>
  <text x="800" y="42" class="now-label" text-anchor="middle">NOW</text>

  <!-- Timeline bars and labels -->

  <!-- Row 1: Coursework (Fall 2021 - Spring 2022) -->
  <rect x="80" y="110" width="160" height="32" fill="#999999" rx="3"/>
  <text x="160" y="132" class="phase-label" text-anchor="middle">Coursework + SEFCOM Onboarding</text>

  <!-- Row 2: Operation Mango (Fall 2022 - Summer 2023, ~320px) -->
  <rect x="240" y="160" width="240" height="32" fill="#FF9800" rx="3"/>
  <text x="360" y="182" class="phase-label" text-anchor="middle">Operation Mango Development</text>

  <!-- Comprehensive Exam milestone (Spring 2023, ~320px) -->
  <g>
    <polygon points="320,150 327,160 320,170 313,160" fill="#FF9800" stroke="#333" stroke-width="1.5"/>
    <text x="320" y="188" class="milestone-label" text-anchor="middle" font-size="10">Comp Exam</text>
  </g>

  <!-- USENIX Security '24 milestone (August 2024, ~480px) -->
  <g>
    <circle cx="480" cy="160" r="6" fill="#FF9800" stroke="#333" stroke-width="1.5"/>
    <text x="480" y="205" class="milestone-label" text-anchor="middle" font-size="10">USENIX '24</text>
  </g>

  <!-- Row 3: Artiphishell / DARPA AIxCC (Fall 2024 - Summer 2025, ~240px) -->
  <rect x="560" y="220" width="160" height="32" fill="#7B1FA2" rx="3"/>
  <text x="640" y="242" class="phase-label" text-anchor="middle">Artiphishell / DARPA AIxCC</text>

  <!-- DEF CON '25 milestone (August 2025, ~720px) -->
  <g>
    <circle cx="720" cy="210" r="6" fill="#7B1FA2" stroke="#333" stroke-width="1.5"/>
    <text x="720" y="255" class="milestone-label" text-anchor="middle" font-size="10">DEF CON '25</text>
  </g>

  <!-- Row 4: Prospectus Defense (March 2026, ~800px) - MILESTONE -->
  <g>
    <polygon points="800,120 810,130 800,140 790,130" fill="#8C1D40" stroke="#333" stroke-width="2"/>
    <text x="800" y="155" class="milestone-label" text-anchor="middle" font-size="11" fill="#8C1D40">Prospectus</text>
  </g>

  <!-- Row 5: AIL SymEx Evaluation (Spring-Summer 2026, ~200px, future) -->
  <rect x="800" y="280" width="160" height="32" fill="none" stroke="#2196F3" stroke-width="2" stroke-dasharray="5,3" rx="3"/>
  <text x="880" y="302" class="phase-label" text-anchor="middle" font-size="12" fill="#2196F3" font-weight="600">AIL SymEx Evaluation</text>

  <!-- Paper Submission milestone (Fall 2026, ~880px, future) -->
  <g>
    <circle cx="880" cy="270" r="6" fill="none" stroke="#2196F3" stroke-width="2" stroke-dasharray="3,2"/>
    <text x="880" y="315" class="milestone-label" text-anchor="middle" font-size="10" fill="#2196F3">Paper Submission</text>
  </g>

  <!-- Row 6: Dissertation Writing (Fall 2026 - Winter 2027, ~160px, future) -->
  <rect x="880" y="330" width="160" height="32" fill="none" stroke="#8C1D40" stroke-width="2" stroke-dasharray="5,3" rx="3"/>
  <text x="960" y="352" class="phase-label" text-anchor="middle" font-size="12" fill="#8C1D40" font-weight="600">Dissertation Writing</text>

  <!-- Dissertation Defense milestone (Spring 2027, ~960px, future) -->
  <g>
    <polygon points="960,240 975,260 960,280 945,260" fill="none" stroke="#8C1D40" stroke-width="2" stroke-dasharray="3,2"/>
    <text x="960" y="305" class="milestone-label" text-anchor="middle" font-size="11" fill="#8C1D40">Final Defense</text>
  </g>

  <!-- Legend -->
  <g id="legend" transform="translate(80, 370)">
    <circle cx="0" cy="0" r="3" fill="#999999"/>
    <text x="10" y="4" class="semester-label" font-size="10">Completed</text>

    <circle cx="90" cy="0" r="3" fill="none" stroke="#2196F3" stroke-width="1.5"/>
    <text x="100" y="4" class="semester-label" font-size="10">Future</text>
  </g>
</svg>

???

I started my PhD in Fall 2021. Through 2022 and 2023, I built Operation Mango and completed the comprehensive exam. Mango was published at USENIX Security '24, which was a major milestone.

For the next year and a half, I focused on Artiphishell and DARPA's AI Cyber Challenge. That work was presented at DEF CON 33 in August 2025, proving that full-lifecycle automation is feasible.

We are now in March 2026, at the prospectus defense.

Looking forward: Spring and Summer 2026 will be dedicated to expanding the AIL SymEx evaluation. I'll test on multiple firmware sets from different vendors, run the baseline comparisons, and complete the ablation studies. That takes us to the end of summer.

In Fall 2026, I'll write and submit the paper to either USENIX Security '27 or S&P '27, and simultaneously begin the dissertation. Through the fall and winter, the dissertation work continues.

Spring 2027 is the target for the final defense.

This timeline is aggressive but feasible. I have a working prototype, peer-reviewed publications already, and a clear roadmap.
