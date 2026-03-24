---
type: content
title: "Soundness and Completeness"
---

<svg viewBox="0 0 1000 355" style="width:100%; margin:0 auto; display:block;" xmlns="http://www.w3.org/2000/svg">

  <!-- Left Card: Soundness -->
  <g>
    <rect x="30" y="20" width="440" height="330" rx="8" fill="#fafafa" stroke="#ddd" stroke-width="1.5"/>

    <!-- Header -->
    <rect x="30" y="20" width="440" height="52" rx="8" fill="#8C1D40"/>
    <rect x="30" y="52" width="440" height="20" fill="#8C1D40"/>
    <text x="250" y="53" text-anchor="middle" font-size="19" font-weight="700" fill="white" font-family="Inter, sans-serif">Soundness</text>

    <!-- Definition -->
    <text x="250" y="100" text-anchor="middle" font-size="14" fill="#333" font-family="Inter, sans-serif">Find every real vulnerability in the target.</text>
    <text x="250" y="120" text-anchor="middle" font-size="14" fill="#333" font-family="Inter, sans-serif">Over-approximate all program behavior.</text>

    <!-- Visual: wide net catching everything (green real + red false) -->
    <g transform="translate(250, 200)">
      <circle cx="0" cy="0" r="60" fill="none" stroke="#8C1D40" stroke-width="2" stroke-dasharray="6,3" opacity="0.4"/>
      <!-- Real vulns (solid green) -->
      <circle cx="-30" cy="-25" r="8" fill="#2e7d32"/>
      <circle cx="15" cy="-35" r="8" fill="#2e7d32"/>
      <circle cx="35" cy="5" r="8" fill="#2e7d32"/>
      <circle cx="-10" cy="30" r="8" fill="#2e7d32"/>
      <circle cx="-40" cy="10" r="8" fill="#2e7d32"/>
      <!-- False positives (hollow red) -->
      <circle cx="5" cy="-10" r="8" fill="none" stroke="#c62828" stroke-width="2"/>
      <circle cx="-25" cy="20" r="8" fill="none" stroke="#c62828" stroke-width="2"/>
      <circle cx="25" cy="25" r="8" fill="none" stroke="#c62828" stroke-width="2"/>
    </g>

    <!-- Strength -->
    <text x="250" y="295" text-anchor="middle" font-size="14" font-weight="700" fill="#8C1D40" font-family="Inter, sans-serif">No real bugs left behind</text>
    <text x="250" y="320" text-anchor="middle" font-size="15" fill="#555" font-family="Inter, sans-serif">May include false positives</text>
  </g>

  <!-- Right Card: Completeness -->
  <g>
    <rect x="530" y="20" width="440" height="330" rx="8" fill="#fafafa" stroke="#ddd" stroke-width="1.5"/>

    <!-- Header -->
    <rect x="530" y="20" width="440" height="52" rx="8" fill="#333"/>
    <rect x="530" y="52" width="440" height="20" fill="#333"/>
    <text x="750" y="53" text-anchor="middle" font-size="19" font-weight="700" fill="white" font-family="Inter, sans-serif">Completeness</text>

    <!-- Definition -->
    <text x="750" y="100" text-anchor="middle" font-size="14" fill="#333" font-family="Inter, sans-serif">Every reported finding is a real vulnerability.</text>
    <text x="750" y="120" text-anchor="middle" font-size="14" fill="#333" font-family="Inter, sans-serif">Zero false positives.</text>

    <!-- Visual: tight cluster, only true positives -->
    <g transform="translate(750, 200)">
      <!-- Outer ring (what was filtered out) -->
      <circle cx="0" cy="0" r="60" fill="none" stroke="#ddd" stroke-width="1.5" opacity="0.4"/>
      <circle cx="0" cy="0" r="35" fill="none" stroke="#ddd" stroke-width="1.5" opacity="0.5"/>
      <!-- Tight inner ring -->
      <circle cx="0" cy="0" r="18" fill="none" stroke="#333" stroke-width="2"/>
      <!-- Only true positives -->
      <circle cx="-6" cy="-5" r="7" fill="#2e7d32"/>
      <circle cx="8" cy="5" r="7" fill="#2e7d32"/>
      <circle cx="-2" cy="10" r="7" fill="#2e7d32"/>
    </g>

    <!-- Strength -->
    <text x="750" y="295" text-anchor="middle" font-size="14" font-weight="700" fill="#333" font-family="Inter, sans-serif">Every report is trustworthy</text>
    <text x="750" y="320" text-anchor="middle" font-size="15" fill="#555" font-family="Inter, sans-serif">May miss real vulnerabilities</text>
  </g>

</svg>

???

Soundness and completeness sit on opposite ends of a spectrum. A sound analysis captures all program behavior: it guarantees no real vulnerability escapes, but the net catches false positives too. The dashed circle on the left holds everything, real bugs and noise alike. A complete analysis only reports confirmed vulnerabilities: every finding is real, but it may miss bugs that it cannot prove. The tight cluster on the right contains only true positives. Most practical analyses exist somewhere on this spectrum. Dynamic analysis leans toward completeness: if the fuzzer produced a crashing input, the bug is real. Static analysis leans toward soundness: it reasons about all possible paths, but some of those paths may be infeasible. The thesis argues that neither should be pursued in isolation. Instead, stage them: assign soundness to the early detection stage, then use subsequent stages to improve completeness.
