---
type: content
title: "Scaling Fuzzing Alone Isn't Enough"
footnote: "Source: Zhang et al., 'SoK: DARPA's AI Cyber Challenge,' arXiv:2602.07666, 2025"
---

<svg viewBox="0 0 1000 420" style="width:100%; margin:0 auto; display:block;" xmlns="http://www.w3.org/2000/svg">
  <!-- LEFT SIDE: Stacked bar chart -->
  <text x="280" y="35" font-size="21" font-weight="bold" text-anchor="middle" font-family="Inter, sans-serif">Across All 7 CRS Teams</text>

  <!-- Bar background -->
  <rect x="70" y="55" width="430" height="80" fill="#f5f5f5" stroke="#333" stroke-width="1" rx="4"/>

  <!-- Fuzzing-only section (54%) — rounded left corners, square right corners -->
  <path d="M 74 55 L 302 55 L 302 135 L 74 135 A 4 4 0 0 1 70 131 L 70 59 A 4 4 0 0 1 74 55 Z" fill="#FF9800"/>
  <text x="186" y="90" font-size="22" font-weight="bold" text-anchor="middle" fill="white" font-family="Inter, sans-serif">54%</text>
  <text x="186" y="115" font-size="19" text-anchor="middle" fill="white" font-family="Inter, sans-serif">Parallel Fuzzing</text>

  <!-- Multi-technique section (46%) — square left corners, rounded right corners -->
  <path d="M 302 55 L 496 55 A 4 4 0 0 1 500 59 L 500 131 A 4 4 0 0 1 496 135 L 302 135 Z" fill="#8C1D40"/>
  <text x="401" y="90" font-size="22" font-weight="bold" text-anchor="middle" fill="white" font-family="Inter, sans-serif">46%</text>
  <text x="401" y="115" font-size="19" text-anchor="middle" fill="white" font-family="Inter, sans-serif">Multi-Technique</text>

  <!-- Arrow and label -->
  <text x="280" y="170" font-size="21" font-weight="bold" text-anchor="middle" fill="#8C1D40" font-family="Inter, sans-serif">Required Different Approaches</text>

  <!-- Concrete stat callout -->
  <rect x="65" y="190" width="440" height="110" rx="6" fill="#FFF3E0" stroke="#FF9800" stroke-width="2"/>
  <text x="285" y="222" font-size="21" font-weight="700" text-anchor="middle" fill="#E65100" font-family="Inter, sans-serif">Diminishing returns on CPU cores</text>
  <text x="285" y="252" font-size="18" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">More fuzzing time found zero additional bugs</text>
  <text x="285" y="278" font-size="18" text-anchor="middle" fill="#999" font-family="Inter, sans-serif">beyond what 24 hours already uncovered</text>

  <!-- Key insight -->
  <rect x="65" y="318" width="440" height="50" rx="4" fill="#8C1D40"/>
  <text x="285" y="351" font-size="19" font-weight="bold" text-anchor="middle" fill="white" font-family="Inter, sans-serif">More cores ≠ more bugs found</text>

  <!-- RIGHT SIDE: Examples -->
  <text x="740" y="35" font-size="21" font-weight="bold" text-anchor="middle" font-family="Inter, sans-serif">Examples in 46%</text>

  <!-- Example 1 -->
  <rect x="565" y="60" width="350" height="75" fill="#f5f5f5" stroke="#8C1D40" stroke-width="1.5" rx="4"/>
  <text x="740" y="90" font-size="19" font-weight="bold" text-anchor="middle" font-family="Inter, sans-serif">LLM-directed Seed</text>
  <text x="740" y="115" font-size="19" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">Generation</text>

  <!-- Example 2 -->
  <rect x="565" y="150" width="350" height="75" fill="#f5f5f5" stroke="#8C1D40" stroke-width="1.5" rx="4"/>
  <text x="740" y="180" font-size="19" font-weight="bold" text-anchor="middle" font-family="Inter, sans-serif">Static Analysis +</text>
  <text x="740" y="205" font-size="19" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">Targeted Fuzzing</text>

  <!-- Example 3 -->
  <rect x="565" y="240" width="350" height="75" fill="#f5f5f5" stroke="#8C1D40" stroke-width="1.5" rx="4"/>
  <text x="740" y="270" font-size="19" font-weight="bold" text-anchor="middle" font-family="Inter, sans-serif">Grammar-aware Input</text>
  <text x="740" y="295" font-size="19" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">Generation</text>

  <!-- Bottom annotation -->
  <rect x="565" y="335" width="350" height="48" fill="#fff3e0" stroke="#FF9800" stroke-width="1" rx="3"/>
  <text x="740" y="366" font-size="18" font-weight="bold" text-anchor="middle" fill="#E65100" font-family="Inter, sans-serif">Bugs in regions mutation cannot reach</text>
</svg>

???

This is the critical finding. Across all seven finalist CRS teams, parallel fuzzing alone solved only 54% of the competition's vulnerabilities. The remaining 46% required fundamentally different approaches: LLM-directed seed generation, static analysis combined with targeted fuzzing, or grammar-aware input construction. Throwing more CPU cores at a coverage-guided fuzzer hits diminishing returns. The bugs that fuzzing misses are not bugs that exist deeper in the same search space. They exist in regions that random mutation cannot reach. A JSON parser needs structurally valid JSON. A protocol handler needs well-formed packets. A configuration file needs specific key-value pairs. No amount of random byte flipping produces those inputs at scale. That is why Artiphishell coordinates multiple techniques through the Analysis Graph. Each technique reaches different parts of the state space. The combination finds what no single technique can find alone.
