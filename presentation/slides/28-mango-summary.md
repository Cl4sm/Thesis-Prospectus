---
type: content
title: "Mango: Summary"
---

<svg viewBox="0 0 1050 420" style="width:100%; margin:0 auto; display:block;" xmlns="http://www.w3.org/2000/svg">

  <!-- Stat cards row (centered: 3 × 230px cards, 50px gaps) -->
  <!-- Card 1: 27x -->
  <rect x="130" y="10" width="230" height="100" rx="8" fill="#fff3e0" stroke="#FF9800" stroke-width="2"/>
  <text x="245" y="52" font-size="38.8" font-weight="bold" text-anchor="middle" fill="#E65100" font-family="Inter, sans-serif">22×</text>
  <text x="245" y="78" font-size="14" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">more binaries than SaTC</text>
  <text x="245" y="98" font-size="14" text-anchor="middle" fill="#999" font-family="Inter, sans-serif">Every binary analyzed</text>

  <!-- Card 2: 8 min (maroon theme) -->
  <rect x="410" y="10" width="230" height="100" rx="8" fill="#f9e8ed" stroke="#8C1D40" stroke-width="2"/>
  <text x="525" y="52" font-size="38.8" font-weight="bold" text-anchor="middle" fill="#8C1D40" font-family="Inter, sans-serif">8 min</text>
  <text x="525" y="78" font-size="14" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">average per binary</text>
  <text x="525" y="98" font-size="14" text-anchor="middle" fill="#999" font-family="Inter, sans-serif">vs. 6.56 hrs for SaTC</text>

  <!-- Card 3: 166 (emphasized) -->
  <rect x="690" y="10" width="230" height="100" rx="8" fill="#FFEBEE" stroke="#D32F2F" stroke-width="2.5"/>
  <text x="805" y="52" font-size="43.1" font-weight="bold" text-anchor="middle" fill="#C62828" font-family="Inter, sans-serif">166</text>
  <text x="805" y="78" font-size="14" text-anchor="middle" fill="#555" font-family="Inter, sans-serif">exploitable vulnerabilities</text>
  <text x="805" y="98" font-size="14" text-anchor="middle" fill="#888" font-family="Inter, sans-serif">Confirmed in real firmware</text>

  <!-- Transition arrow -->
  <text x="525" y="150" font-size="15.1" text-anchor="middle" fill="#aaa" font-family="Inter, sans-serif">▼</text>

  <!-- What Remains box -->
  <rect x="100" y="170" width="850" height="170" rx="10" fill="#fce4ec" stroke="#8C1D40" stroke-width="3"/>
  <rect x="100" y="170" width="8" height="170" rx="4" fill="#8C1D40"/>

  <text x="525" y="205" font-size="21.5" font-weight="700" text-anchor="middle" fill="#8C1D40" font-family="Inter, sans-serif">What Remains</text>

  <!-- Problem 1 -->
  <circle cx="200" cy="250" r="10" fill="#FFEBEE" stroke="#D32F2F" stroke-width="1.5"/>
  <text x="200" y="255" font-size="14" font-weight="bold" text-anchor="middle" fill="#D32F2F">✗</text>
  <text x="220" y="255" font-size="17.2" fill="#333" font-family="Inter, sans-serif">Candidates lack concrete Proof-of-Concept</text>

  <!-- Problem 2 -->
  <circle cx="200" cy="290" r="10" fill="#FFEBEE" stroke="#D32F2F" stroke-width="1.5"/>
  <text x="200" y="295" font-size="14" font-weight="bold" text-anchor="middle" fill="#D32F2F">?</text>
  <text x="220" y="295" font-size="17.2" fill="#333" font-family="Inter, sans-serif">Path feasibility unknown: is it reachable?</text>

  <!-- Bridge statement -->
  <text x="525" y="330" font-size="15.1" font-weight="600" text-anchor="middle" fill="#8C1D40" font-family="Inter, sans-serif">Mango scales soundness, but not completeness.</text>

</svg>

???

Mango delivers scalable vulnerability detection: 27 times more binaries analyzed than prior work. Rich Expressions track full transformation history, making alerts precise and actionable. Four-point-five minutes per binary on average. We found 166 exploitable vulnerabilities in real firmware. But Mango stops at static analysis. A Mango alert says: attacker input flows from source X through transformations Y to sink Z. We have high confidence in that path. What we don't know: is that path actually reachable? Can an attacker actually trigger it? Mango candidates are hypotheses. Vendors ask for PoCs, concrete triggering inputs that demonstrate the vulnerability. Static analysis alone cannot provide that. Before we tackle that validation problem on binaries, we need to ask a different question: if we had source code and full toolchain access, could we automate the entire vulnerability lifecycle? Detection, validation, patching, all of it. That question is what Artiphishell answers.
