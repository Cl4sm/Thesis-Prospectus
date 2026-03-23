---
type: content
title: "Scaling Fuzzing Alone Isn't Enough"
footnote: "Source: Gritti et al., 'SoK: DARPA's AI Cyber Challenge,' arXiv:2602.07666, 2025"
---

<svg viewBox="0 0 1000 320" style="width:100%; margin:0 auto; display:block;" xmlns="http://www.w3.org/2000/svg">
  <!-- LEFT SIDE: Stacked bar chart -->
  <text x="175" y="30" font-size="13" font-weight="bold" text-anchor="middle" font-family="Inter, sans-serif">Across All 7 CRS Teams</text>

  <!-- Bar background -->
  <rect x="30" y="50" width="330" height="55" fill="#f5f5f5" stroke="#333" stroke-width="1" rx="4"/>

  <!-- Fuzzing-only section (54%) -->
  <rect x="30" y="50" width="178.2" height="55" fill="#FF9800" rx="4"/>
  <text x="119" y="80" font-size="14" font-weight="bold" text-anchor="middle" fill="white" font-family="Inter, sans-serif">54%</text>
  <text x="119" y="96" font-size="11" text-anchor="middle" fill="white" font-family="Inter, sans-serif">Parallel Fuzzing</text>

  <!-- Multi-technique section (46%) -->
  <rect x="208.2" y="50" width="151.8" height="55" fill="#8C1D40" rx="4"/>
  <text x="284" y="80" font-size="14" font-weight="bold" text-anchor="middle" fill="white" font-family="Inter, sans-serif">46%</text>
  <text x="284" y="96" font-size="11" text-anchor="middle" fill="white" font-family="Inter, sans-serif">Multi-Technique</text>

  <!-- Arrow and label -->
  <text x="175" y="135" font-size="13" font-weight="bold" text-anchor="middle" fill="#8C1D40" font-family="Inter, sans-serif">Required Different Approaches</text>

  <!-- Concrete stat callout -->
  <rect x="40" y="155" width="310" height="65" rx="6" fill="#FFF3E0" stroke="#FF9800" stroke-width="2"/>
  <text x="195" y="180" font-size="13" font-weight="700" text-anchor="middle" fill="#E65100" font-family="Inter, sans-serif">Diminishing returns on CPU cores</text>
  <text x="195" y="200" font-size="12" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">More fuzzing time found zero additional bugs</text>
  <text x="195" y="215" font-size="11" text-anchor="middle" fill="#999" font-family="Inter, sans-serif">beyond what 24 hours already uncovered</text>

  <!-- Key insight -->
  <rect x="40" y="240" width="310" height="35" rx="4" fill="#8C1D40"/>
  <text x="195" y="263" font-size="12" font-weight="bold" text-anchor="middle" fill="white" font-family="Inter, sans-serif">More cores ≠ more bugs found</text>

  <!-- RIGHT SIDE: Examples of what 46% needed -->
  <text x="620" y="30" font-size="13" font-weight="bold" text-anchor="middle" font-family="Inter, sans-serif">Examples in 46%</text>

  <!-- Example 1 -->
  <rect x="480" y="55" width="260" height="65" fill="#f5f5f5" stroke="#8C1D40" stroke-width="1.5" rx="4"/>
  <text x="610" y="82" font-size="12" font-weight="bold" text-anchor="middle" font-family="Inter, sans-serif">LLM-directed Seed</text>
  <text x="610" y="104" font-size="11" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">Generation</text>

  <!-- Example 2 -->
  <rect x="480" y="135" width="260" height="65" fill="#f5f5f5" stroke="#8C1D40" stroke-width="1.5" rx="4"/>
  <text x="610" y="162" font-size="12" font-weight="bold" text-anchor="middle" font-family="Inter, sans-serif">Static Analysis +</text>
  <text x="610" y="184" font-size="11" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">Targeted Fuzzing</text>

  <!-- Example 3 -->
  <rect x="480" y="215" width="260" height="65" fill="#f5f5f5" stroke="#8C1D40" stroke-width="1.5" rx="4"/>
  <text x="610" y="242" font-size="12" font-weight="bold" text-anchor="middle" font-family="Inter, sans-serif">Grammar-aware Input</text>
  <text x="610" y="264" font-size="11" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">Generation</text>

  <!-- Bottom annotation -->
  <rect x="480" y="294" width="260" height="25" fill="#fff3e0" stroke="#FF9800" stroke-width="1" rx="3"/>
  <text x="610" y="312" font-size="11" font-weight="bold" text-anchor="middle" fill="#E65100" font-family="Inter, sans-serif">Bugs in regions mutation cannot reach</text>
</svg>

???

This is the critical finding. Across all seven finalist CRS teams, parallel fuzzing alone solved only 54% of the competition's vulnerabilities. The remaining 46% required fundamentally different approaches: LLM-directed seed generation, static analysis combined with targeted fuzzing, or grammar-aware input construction. Throwing more CPU cores at a coverage-guided fuzzer hits diminishing returns. The bugs that fuzzing misses are not bugs that exist deeper in the same search space. They exist in regions that random mutation cannot reach. A JSON parser needs structurally valid JSON. A protocol handler needs well-formed packets. A configuration file needs specific key-value pairs. No amount of random byte flipping produces those inputs at scale. That is why Artiphishell coordinates multiple techniques through the Analysis Graph. Each technique reaches different parts of the state space. The combination finds what no single technique can find alone.
