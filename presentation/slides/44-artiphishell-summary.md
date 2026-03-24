---
type: content
title: "Artiphishell Summary"
---

<svg viewBox="0 0 1000 280" style="width:100%; margin:0 auto; display:block;" xmlns="http://www.w3.org/2000/svg">
  <!-- Main finding -->
  <rect x="30" y="10" width="940" height="55" fill="#E8F5E9" stroke="#4CAF50" stroke-width="2" rx="6"/>
  <text x="500" y="45" font-size="18.7" font-weight="bold" text-anchor="middle" fill="#2E7D32" font-family="Inter, sans-serif">The full vulnerability lifecycle (find, validate, patch) CAN be automated on real software</text>

  <!-- Stats row (larger) -->
  <rect x="30" y="85" width="220" height="85" fill="#f5f5f5" stroke="#1976D2" stroke-width="2" rx="6"/>
  <text x="140" y="120" font-size="32.7" font-weight="bold" text-anchor="middle" fill="#1976D2" font-family="Inter, sans-serif">23 CPVs</text>
  <text x="140" y="148" font-size="14" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">across 28 repositories</text>

  <rect x="270" y="85" width="220" height="85" fill="#f5f5f5" stroke="#D32F2F" stroke-width="2" rx="6"/>
  <text x="380" y="120" font-size="32.7" font-weight="bold" text-anchor="middle" fill="#D32F2F" font-family="Inter, sans-serif">7 Zero-Days</text>
  <text x="380" y="148" font-size="14" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">in real OSS projects</text>

  <rect x="510" y="85" width="220" height="85" fill="#f5f5f5" stroke="#4CAF50" stroke-width="2" rx="6"/>
  <text x="620" y="120" font-size="32.7" font-weight="bold" text-anchor="middle" fill="#4CAF50" font-family="Inter, sans-serif">100%</text>
  <text x="620" y="148" font-size="14" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">patching accuracy (highest)</text>

  <rect x="750" y="85" width="220" height="85" fill="#FFF3E0" stroke="#FF9800" stroke-width="2" rx="6"/>
  <text x="860" y="120" font-size="32.7" font-weight="bold" text-anchor="middle" fill="#E65100" font-family="Inter, sans-serif">46%</text>
  <text x="860" y="148" font-size="14" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">required multi-technique</text>

  <!-- Limitation (smaller, muted) -->
  <rect x="30" y="200" width="430" height="55" fill="#f5f5f5" stroke="#999" stroke-width="1.5" rx="4"/>
  <text x="50" y="225" font-size="15.2" font-weight="bold" fill="#666" font-family="Inter, sans-serif">Limitation</text>
  <text x="50" y="245" font-size="14" fill="#888" font-family="Inter, sans-serif">AIxCC provided source code and immense resources</text>

  <!-- Gap/transition (larger, prominent) -->
  <rect x="490" y="190" width="480" height="75" fill="#8C1D40" rx="8"/>
  <text x="730" y="220" font-size="19.8" font-weight="bold" text-anchor="middle" fill="white" font-family="Inter, sans-serif">The Gap</text>
  <text x="730" y="248" font-size="16.3" text-anchor="middle" fill="rgba(255,255,255,0.85)" font-family="Inter, sans-serif">How to produce fully validated vulnerabilities economically</text>

</svg>

???

Artiphishell demonstrates that the full vulnerability lifecycle can be automated on real software. Find, validate, patch. Across 28 repositories, the system discovered 23 challenge project vulnerabilities and 7 zero-days, with patch accuracy exceeding 95%. Multi-technique coordination found the 46% of bugs that scaling fuzzing alone could not reach. Independent analyses, when coordinated through a shared reasoning structure like the Analysis Graph, produce broader coverage and higher confidence than any single technique. But there is a gap. AIxCC provided source code, symbols, type information, and call graphs. Real firmware is binary only. You don't get that structure. How do you produce concrete triggering inputs when your only view of the program is stripped machine code? Even with $50,000 in LLM credits and $80,000 in Azure compute, we found 23 bugs and 7 zero-days. The full lifecycle works on source code. How do we scale this to binary-only firmware without that resource overhead?
