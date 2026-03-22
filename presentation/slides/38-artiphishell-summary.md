---
type: content
title: "Artiphishell Summary"
---

<svg viewBox="0 0 1000 320" style="width:100%; margin:0 auto; display:block;" xmlns="http://www.w3.org/2000/svg">
  <!-- Main finding -->
  <rect x="30" y="10" width="940" height="55" fill="#E8F5E9" stroke="#4CAF50" stroke-width="2" rx="6"/>
  <text x="500" y="45" font-size="16" font-weight="bold" text-anchor="middle" fill="#2E7D32">The full vulnerability lifecycle (find, validate, patch) CAN be automated on real software</text>

  <!-- Stats row -->
  <rect x="30" y="85" width="220" height="70" fill="#f5f5f5" stroke="#1976D2" stroke-width="1.5" rx="4"/>
  <text x="140" y="115" font-size="24" font-weight="bold" text-anchor="middle" fill="#1976D2">23 CPVs</text>
  <text x="140" y="140" font-size="11" text-anchor="middle" fill="#666">across 28 repositories</text>

  <rect x="270" y="85" width="220" height="70" fill="#f5f5f5" stroke="#D32F2F" stroke-width="1.5" rx="4"/>
  <text x="380" y="115" font-size="24" font-weight="bold" text-anchor="middle" fill="#D32F2F">7 Zero-Days</text>
  <text x="380" y="140" font-size="11" text-anchor="middle" fill="#666">in real OSS projects</text>

  <rect x="510" y="85" width="220" height="70" fill="#f5f5f5" stroke="#4CAF50" stroke-width="1.5" rx="4"/>
  <text x="620" y="115" font-size="24" font-weight="bold" text-anchor="middle" fill="#4CAF50">100% Patching</text>
  <text x="620" y="140" font-size="11" text-anchor="middle" fill="#666">highest of all 7 CRS teams</text>

  <rect x="750" y="85" width="220" height="70" fill="#FFF3E0" stroke="#FF9800" stroke-width="1.5" rx="4"/>
  <text x="860" y="115" font-size="24" font-weight="bold" text-anchor="middle" fill="#E65100">46%</text>
  <text x="860" y="140" font-size="11" text-anchor="middle" fill="#666">required multi-technique</text>

  <!-- Limitation -->
  <rect x="30" y="180" width="455" height="60" fill="#f5f5f5" stroke="#666" stroke-width="1.5" rx="4"/>
  <text x="50" y="205" font-size="13" font-weight="bold" fill="#333">Limitation</text>
  <text x="50" y="228" font-size="12" fill="#555">AIxCC provided source code and immense resources</text>

  <!-- Gap/transition -->
  <rect x="515" y="180" width="455" height="60" fill="#FCE4EC" stroke="#8C1D40" stroke-width="2" rx="4"/>
  <text x="535" y="205" font-size="13" font-weight="bold" fill="#8C1D40">Gap</text>
  <text x="535" y="228" font-size="12" fill="#555">How to produce triggering inputs for binary-only candidates?</text>

  <!-- Transition arrow -->
  <rect x="250" y="270" width="500" height="40" fill="#8C1D40" rx="6"/>
  <text x="500" y="296" font-size="14" font-weight="bold" text-anchor="middle" fill="white">This gap motivates the proposed work</text>
</svg>

???

Artiphishell demonstrates that the full vulnerability lifecycle can be automated on real software. Find, validate, patch. Across 28 repositories, the system discovered 23 challenge project vulnerabilities and 7 zero-days, with patch accuracy exceeding 95%. The critical lesson for this thesis: multi-technique coordination found the 46% of bugs that scaling fuzzing alone could not reach. Independent analyses, when coordinated through a shared reasoning structure like the Analysis Graph, produce both broader coverage and higher confidence than any single technique. But there is a gap. AIxCC provides source code. We had symbols, type information, call graphs. Real firmware is binary only. You don't get that structure. How do you produce concrete triggering inputs when your only view of the program is stripped machine code? That is what the proposed work addresses.
