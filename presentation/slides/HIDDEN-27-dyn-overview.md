---
type: content
title: "Dynamic Analysis: Four Approaches"
hidden: True
---

<svg viewBox="0 0 1050 534" style="width:100%; margin:0 auto; display:block;" xmlns="http://www.w3.org/2000/svg">
  <!-- Title -->
  <text x="525" y="50" font-size="40.7" font-weight="bold" text-anchor="middle" fill="#333" font-family="Inter, sans-serif">Four Complementary Techniques</text>

  <!-- Card 1: Seed Generation -->
  <rect x="50" y="90" width="220" height="280" rx="10" fill="#fafafa" stroke="#4CAF50" stroke-width="2.5"/>
  <rect x="50" y="90" width="220" height="50" rx="10" fill="#e8f5e9"/>
  <text x="160" y="125" font-size="20.4" font-weight="bold" text-anchor="middle" fill="#2E7D32" font-family="Inter, sans-serif">1. LLM Seed Generation</text>

  <circle cx="160" cy="165" r="6" fill="#4CAF50"/>
  <text x="175" y="170" font-size="16.5" fill="#333" font-family="Inter, sans-serif">Generates valid initial</text>
  <text x="175" y="188" font-size="16.5" fill="#333" font-family="Inter, sans-serif">test inputs from source</text>
  <text x="175" y="206" font-size="16.5" fill="#333" font-family="Inter, sans-serif">code analysis</text>

  <rect x="70" y="240" width="180" height="110" rx="6" fill="#f5f5f5" stroke="#4CAF50" stroke-width="1"/>
  <text x="160" y="260" font-size="15.3" font-weight="600" text-anchor="middle" fill="#333" font-family="Inter, sans-serif">QuickSeed + DiscoveryGuy</text>
  <text x="160" y="280" font-size="14" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">Bootstrap fuzzers with</text>
  <text x="160" y="296" font-size="14" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">structurally valid inputs</text>
  <text x="160" y="312" font-size="14" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">to reach interesting code</text>
  <text x="160" y="328" font-size="14" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">paths quickly</text>

  <!-- Card 2: Coverage-Guided Fuzzing -->
  <rect x="290" y="90" width="220" height="280" rx="10" fill="#fafafa" stroke="#2196F3" stroke-width="2.5"/>
  <rect x="290" y="90" width="220" height="50" rx="10" fill="#e3f2fd"/>
  <text x="400" y="125" font-size="20.4" font-weight="bold" text-anchor="middle" fill="#1565C0" font-family="Inter, sans-serif">2. Coverage-Guided</text>

  <circle cx="400" cy="165" r="6" fill="#2196F3"/>
  <text x="415" y="170" font-size="16.5" fill="#333" font-family="Inter, sans-serif">Explores state space by</text>
  <text x="415" y="188" font-size="16.5" fill="#333" font-family="Inter, sans-serif">maximizing code coverage</text>
  <text x="415" y="206" font-size="16.5" fill="#333" font-family="Inter, sans-serif">with mutation</text>

  <rect x="310" y="240" width="180" height="110" rx="6" fill="#f5f5f5" stroke="#2196F3" stroke-width="1"/>
  <text x="400" y="260" font-size="15.3" font-weight="600" text-anchor="middle" fill="#333" font-family="Inter, sans-serif">AFL++, Jazzer, libfuzzer</text>
  <text x="400" y="280" font-size="14" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">Fast for unstructured input,</text>
  <text x="400" y="296" font-size="14" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">struggles with format</text>
  <text x="400" y="312" font-size="14" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">constraints (JSON, SQL,</text>
  <text x="400" y="328" font-size="14" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">XML)</text>

  <!-- Card 3: Grammar-Based Fuzzing -->
  <rect x="530" y="90" width="220" height="280" rx="10" fill="#fafafa" stroke="#FF9800" stroke-width="2.5"/>
  <rect x="530" y="90" width="220" height="50" rx="10" fill="#fff3e0"/>
  <text x="640" y="125" font-size="20.4" font-weight="bold" text-anchor="middle" fill="#E65100" font-family="Inter, sans-serif">3. Grammar-Based</text>

  <circle cx="640" cy="165" r="6" fill="#FF9800"/>
  <text x="655" y="170" font-size="16.5" fill="#333" font-family="Inter, sans-serif">Generates syntactically</text>
  <text x="655" y="188" font-size="16.5" fill="#333" font-family="Inter, sans-serif">valid inputs matching</text>
  <text x="655" y="206" font-size="16.5" fill="#333" font-family="Inter, sans-serif">input format rules</text>

  <rect x="550" y="240" width="180" height="110" rx="6" fill="#f5f5f5" stroke="#FF9800" stroke-width="1"/>
  <text x="640" y="260" font-size="15.3" font-weight="600" text-anchor="middle" fill="#333" font-family="Inter, sans-serif">GrammarGuy</text>
  <text x="640" y="280" font-size="14" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">Reaches structured-input</text>
  <text x="640" y="296" font-size="14" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">code paths that random</text>
  <text x="640" y="312" font-size="14" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">mutation cannot. Format-</text>
  <text x="640" y="328" font-size="14" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">aware exploration</text>

  <!-- Card 4: Directed Fuzzing -->
  <rect x="770" y="90" width="220" height="280" rx="10" fill="#fafafa" stroke="#8C1D40" stroke-width="2.5"/>
  <rect x="770" y="90" width="220" height="50" rx="10" fill="#fce4ec"/>
  <text x="880" y="125" font-size="20.4" font-weight="bold" text-anchor="middle" fill="#8C1D40" font-family="Inter, sans-serif">4. Directed Fuzzing</text>

  <circle cx="880" cy="165" r="6" fill="#8C1D40"/>
  <text x="895" y="170" font-size="16.5" fill="#333" font-family="Inter, sans-serif">Steers fuzzing toward</text>
  <text x="895" y="188" font-size="16.5" fill="#333" font-family="Inter, sans-serif">suspicious code locations</text>
  <text x="895" y="206" font-size="16.5" fill="#333" font-family="Inter, sans-serif">identified by analysis</text>

  <rect x="790" y="240" width="180" height="110" rx="6" fill="#f5f5f5" stroke="#8C1D40" stroke-width="1"/>
  <text x="880" y="260" font-size="15.3" font-weight="600" text-anchor="middle" fill="#333" font-family="Inter, sans-serif">AIJON</text>
  <text x="880" y="280" font-size="14" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">LLM generates custom IJON</text>
  <text x="880" y="296" font-size="14" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">feedback signals. 35x speedup,</text>
  <text x="880" y="312" font-size="14" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">100x with high-quality</text>
  <text x="880" y="328" font-size="14" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">seeds</text>

</svg>

???

Dynamic analysis uses four complementary approaches, each solving a different bottleneck. LLM seed generation bootstraps both coverage-guided and grammar-based fuzzers with valid initial inputs that exercise interesting functionality. Coverage-guided fuzzing rapidly explores the state space by tracking which code paths have been reached, but it struggles with structured formats like JSON or SQL. Grammar-based fuzzing solves that by generating inputs that match the target's expected format, allowing the parser to accept the input and process deeper. Directed fuzzing with AIJON takes static analysis findings and steers the fuzzer toward those specific locations, dramatically accelerating the search for bugs that static analysis flags as suspicious.
