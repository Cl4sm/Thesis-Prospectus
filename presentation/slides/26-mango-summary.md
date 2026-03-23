---
type: content
title: "Mango: Summary"
---

<svg viewBox="0 0 1050 420" style="width:100%; margin:0 auto; display:block;" xmlns="http://www.w3.org/2000/svg">

  <!-- Stat cards row -->
  <!-- Card 1: 27x -->
  <rect x="25" y="10" width="230" height="100" rx="8" fill="#fff3e0" stroke="#FF9800" stroke-width="2"/>
  <text x="140" y="52" font-size="36" font-weight="bold" text-anchor="middle" fill="#E65100" font-family="Inter, sans-serif">27×</text>
  <text x="140" y="78" font-size="13" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">more binaries than SaTC</text>
  <text x="140" y="98" font-size="11" text-anchor="middle" fill="#999" font-family="Inter, sans-serif">Every binary analyzed</text>

  <!-- Card 2: 8 min -->
  <rect x="275" y="10" width="230" height="100" rx="8" fill="#fff3e0" stroke="#FF9800" stroke-width="2"/>
  <text x="390" y="52" font-size="36" font-weight="bold" text-anchor="middle" fill="#E65100" font-family="Inter, sans-serif">8 min</text>
  <text x="390" y="78" font-size="13" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">average per binary</text>
  <text x="390" y="98" font-size="11" text-anchor="middle" fill="#999" font-family="Inter, sans-serif">Practical at scale</text>

  <!-- Card 3: 70% -->
  <rect x="525" y="10" width="230" height="100" rx="8" fill="#E8F5E9" stroke="#4CAF50" stroke-width="2.5"/>
  <text x="640" y="52" font-size="36" font-weight="bold" text-anchor="middle" fill="#2E7D32" font-family="Inter, sans-serif">70%</text>
  <text x="640" y="78" font-size="13" text-anchor="middle" fill="#555" font-family="Inter, sans-serif">true positive rate</text>
  <text x="640" y="98" font-size="11" text-anchor="middle" fill="#888" font-family="Inter, sans-serif">Vendors accept findings</text>

  <!-- Card 4: 166 -->
  <rect x="775" y="10" width="230" height="100" rx="8" fill="#FFEBEE" stroke="#D32F2F" stroke-width="2"/>
  <text x="890" y="52" font-size="36" font-weight="bold" text-anchor="middle" fill="#C62828" font-family="Inter, sans-serif">166</text>
  <text x="890" y="78" font-size="13" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">exploitable vulnerabilities</text>
  <text x="890" y="98" font-size="11" text-anchor="middle" fill="#999" font-family="Inter, sans-serif">Confirmed in real firmware</text>

  <!-- Transition arrow -->
  <text x="525" y="150" font-size="14" text-anchor="middle" fill="#aaa" font-family="Inter, sans-serif">▼</text>

  <!-- What Remains box -->
  <rect x="100" y="170" width="850" height="170" rx="10" fill="#fce4ec" stroke="#8C1D40" stroke-width="3"/>
  <rect x="100" y="170" width="8" height="170" rx="4" fill="#8C1D40"/>

  <text x="525" y="205" font-size="20" font-weight="700" text-anchor="middle" fill="#8C1D40" font-family="Inter, sans-serif">What Remains</text>

  <!-- Problem 1 -->
  <circle cx="200" cy="250" r="10" fill="#FFEBEE" stroke="#D32F2F" stroke-width="1.5"/>
  <text x="200" y="255" font-size="13" font-weight="bold" text-anchor="middle" fill="#D32F2F">✗</text>
  <text x="220" y="255" font-size="16" fill="#333" font-family="Inter, sans-serif">Candidates lack concrete Proof-of-Concept</text>

  <!-- Problem 2 -->
  <circle cx="200" cy="290" r="10" fill="#FFEBEE" stroke="#D32F2F" stroke-width="1.5"/>
  <text x="200" y="295" font-size="13" font-weight="bold" text-anchor="middle" fill="#D32F2F">?</text>
  <text x="220" y="295" font-size="16" fill="#333" font-family="Inter, sans-serif">Path feasibility unknown: is it reachable?</text>

  <!-- Bridge statement -->
  <text x="525" y="330" font-size="14" font-weight="600" text-anchor="middle" fill="#8C1D40" font-family="Inter, sans-serif">Mango scales detection. Next: confirm these findings.</text>

  <!-- Bottom summary -->
  <text x="525" y="400" font-size="13" text-anchor="middle" fill="#888" font-family="Inter, sans-serif">10,834 alerts across 1,698 firmware images, but which ones are real?</text>

</svg>

???

Mango delivers scalable, precise vulnerability detection. We analyze every binary, not just border binaries or frontend-matched ones. Rich Expressions track full transformation history, reducing false positives. Eight minutes per binary makes this practical at scale. Environment Resolution links cross-binary NVRAM flows. We found 166 exploitable vulnerabilities with a 70 percent true positive rate. These are real bugs in real firmware. But Mango stops at static analysis. A Mango alert says: attacker input flows from source X through transformations Y to sink Z. We have high confidence in that path. What we don't know: is that path actually reachable? Can an attacker actually trigger it? Mango candidates are hypotheses. Vendors ask for PoCs, concrete triggering inputs that demonstrate the vulnerability. Static analysis alone cannot provide that. Before we tackle that validation problem on binaries, we need to ask a different question: if we had source code and full toolchain access, could we automate the entire vulnerability lifecycle? Detection, validation, patching, all of it. That question is what Artiphishell answers.
