---
type: content
title: "Scaling Fuzzing Alone Isn't Enough"
footnote: "Source: Gritti et al., 'SoK: DARPA's AI Cyber Challenge,' arXiv:2602.07666, 2025"
---

<svg viewBox="0 0 1000 320" style="width:100%; margin:0 auto; display:block;" xmlns="http://www.w3.org/2000/svg">
  <!-- LEFT SIDE: Stacked bar chart -->
  <text x="150" y="30" font-size="13" font-weight="bold" text-anchor="middle">Across All 7 CRS Teams</text>

  <!-- Bar background -->
  <rect x="30" y="50" width="280" height="50" fill="#f5f5f5" stroke="#333" stroke-width="1" rx="4"/>

  <!-- Fuzzing-only section (54%) -->
  <rect x="30" y="50" width="151.2" height="50" fill="#FF9800" rx="4"/>
  <text x="105" y="81" font-size="11" font-weight="bold" text-anchor="middle" fill="white">54%</text>
  <text x="105" y="95" font-size="10" text-anchor="middle" fill="white">Parallel Fuzzing</text>

  <!-- Multi-technique section (46%) -->
  <rect x="181.2" y="50" width="128.8" height="50" fill="#8C1D40" rx="4"/>
  <text x="245" y="81" font-size="11" font-weight="bold" text-anchor="middle" fill="white">46%</text>
  <text x="245" y="95" font-size="10" text-anchor="middle" fill="white">Multi-Technique</text>

  <!-- Arrow and label -->
  <text x="150" y="130" font-size="12" font-weight="bold" text-anchor="middle" fill="#8C1D40">Required Different Approaches</text>

  <!-- RIGHT SIDE: Examples of what 46% needed -->
  <text x="600" y="30" font-size="13" font-weight="bold" text-anchor="middle">Examples in 46%</text>

  <!-- Example 1 -->
  <rect x="480" y="60" width="240" height="60" fill="#f5f5f5" stroke="#8C1D40" stroke-width="1.5" rx="4"/>
  <text x="600" y="85" font-size="11" font-weight="bold" text-anchor="middle">LLM-directed Seed</text>
  <text x="600" y="105" font-size="10" text-anchor="middle" fill="#666">Generation</text>

  <!-- Example 2 -->
  <rect x="480" y="135" width="240" height="60" fill="#f5f5f5" stroke="#8C1D40" stroke-width="1.5" rx="4"/>
  <text x="600" y="160" font-size="11" font-weight="bold" text-anchor="middle">Static Analysis +</text>
  <text x="600" y="180" font-size="10" text-anchor="middle" fill="#666">Targeted Fuzzing</text>

  <!-- Example 3 -->
  <rect x="480" y="210" width="240" height="60" fill="#f5f5f5" stroke="#8C1D40" stroke-width="1.5" rx="4"/>
  <text x="600" y="235" font-size="11" font-weight="bold" text-anchor="middle">Grammar-aware Input</text>
  <text x="600" y="255" font-size="10" text-anchor="middle" fill="#666">Generation</text>

  <!-- Key insight annotation -->
  <rect x="480" y="285" width="240" height="30" fill="#fff3e0" stroke="#FF9800" stroke-width="1" rx="3"/>
  <text x="600" y="305" font-size="11" font-weight="bold" text-anchor="middle" fill="#E65100">More CPU cores ≠ more bugs found</text>
</svg>

???

This is the critical finding. Across all seven finalist CRS teams, parallel fuzzing alone solved only 54% of the competition's vulnerabilities. The remaining 46% required fundamentally different approaches: LLM-directed seed generation, static analysis combined with targeted fuzzing, or grammar-aware input construction. Throwing more CPU cores at a coverage-guided fuzzer hits diminishing returns. The bugs that fuzzing misses are not bugs that exist deeper in the same search space. They exist in regions that random mutation cannot reach. A JSON parser needs structurally valid JSON. A protocol handler needs well-formed packets. A configuration file needs specific key-value pairs. No amount of random byte flipping produces those inputs at scale. That is why Artiphishell coordinates multiple techniques through the Analysis Graph. Each technique reaches different parts of the state space. The combination finds what no single technique can find alone.
