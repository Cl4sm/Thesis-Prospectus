---
type: content
title: "Competition Results"
---

<svg viewBox="0 0 1000 300" style="width:100%; margin:0 auto; display:block;" xmlns="http://www.w3.org/2000/svg">
  <!-- Stat Box 1: 23 CPVs -->
  <rect x="20" y="20" width="220" height="140" fill="#f5f5f5" stroke="#1976D2" stroke-width="2" rx="8"/>
  <text x="130" y="70" font-size="48" font-weight="bold" text-anchor="middle" fill="#1976D2">23</text>
  <text x="130" y="100" font-size="13" font-weight="bold" text-anchor="middle">CPVs Discovered</text>
  <text x="130" y="120" font-size="11" text-anchor="middle" fill="#666">out of 63 total</text>

  <!-- Stat Box 2: 7 Zero-Days -->
  <rect x="270" y="20" width="220" height="140" fill="#f5f5f5" stroke="#D32F2F" stroke-width="2" rx="8"/>
  <text x="380" y="70" font-size="48" font-weight="bold" text-anchor="middle" fill="#D32F2F">7</text>
  <text x="380" y="100" font-size="13" font-weight="bold" text-anchor="middle">Zero-Day Vulnerabilities</text>
  <text x="380" y="120" font-size="11" text-anchor="middle" fill="#666">in real OSS projects</text>

  <!-- Stat Box 3: 95%+ Accuracy -->
  <rect x="520" y="20" width="220" height="140" fill="#f5f5f5" stroke="#4CAF50" stroke-width="2" rx="8"/>
  <text x="630" y="70" font-size="48" font-weight="bold" text-anchor="middle" fill="#4CAF50">95%+</text>
  <text x="630" y="100" font-size="13" font-weight="bold" text-anchor="middle">Patch Accuracy</text>
  <text x="630" y="120" font-size="11" text-anchor="middle" fill="#666">highest of all 7 CRS teams</text>

  <!-- Stat Box 4: 5th Place -->
  <rect x="770" y="20" width="210" height="140" fill="#f5f5f5" stroke="#666" stroke-width="2" rx="8"/>
  <text x="875" y="70" font-size="48" font-weight="bold" text-anchor="middle" fill="#666">5th</text>
  <text x="875" y="100" font-size="13" font-weight="bold" text-anchor="middle">Overall Placement</text>
  <text x="875" y="120" font-size="10" text-anchor="middle" fill="#666">infrastructure issues</text>

  <!-- Post-mortem section -->
  <rect x="20" y="180" width="960" height="100" fill="#fff3e0" stroke="#FF9800" stroke-width="1.5" rx="6"/>
  <text x="500" y="200" font-size="12" font-weight="bold" text-anchor="middle" fill="#E65100">Post-mortem: Infrastructure Constraints</text>

  <text x="30" y="225" font-size="11" fill="#333">Grammar agent budget hardcoded to $10 for entire 143-hour competition</text>
  <text x="30" y="245" font-size="11" fill="#333">Out-of-memory kills terminated processing on largest targets</text>
  <text x="30" y="265" font-size="11" fill="#333">Function resolver crashed without recovery of cached data</text>
</svg>

???

The results. Artiphishell discovered 23 of the 63 injected challenge project vulnerabilities. That is across C and Java targets, across different vulnerability classes, across projects ranging from a few kilobytes to over 20 gigabytes. Seven of those discoveries were zero-day vulnerabilities in real open-source software, bugs that existed before DARPA injected anything. Those are real vulnerabilities that affect real users. Our patch accuracy exceeded 95%, the highest among all seven finalist CRS teams. That matters because of the fourth-power penalty. Teams that submitted inaccurate patches saw their scores collapse. We prioritized getting it right over getting it fast. Overall, we placed fifth. The honest accounting: infrastructure failures cost us significant scoring opportunities. A grammar agent budget was hardcoded to 10 dollars for the entire 143-hour competition. Out-of-memory kills took down our largest targets. The function resolver crashed and never recovered its cached data. The techniques worked; the infrastructure had growing pains.
