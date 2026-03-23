---
type: content
title: "Dynamic Analysis Summary"
---

<div id="dyn-sum-diagram">
<svg viewBox="0 0 1050 400" style="width:100%; margin:0 auto; display:block;" xmlns="http://www.w3.org/2000/svg">

  <!-- All four context pills -->
  <rect x="15" y="10" width="240" height="40" rx="6" fill="#e3f2fd" stroke="#2196F3" stroke-width="2"/>
  <text x="135" y="35" font-size="13" font-weight="700" text-anchor="middle" fill="#1565C0" font-family="Inter, sans-serif">Coverage-Guided Fuzzing</text>

  <rect x="270" y="10" width="240" height="40" rx="6" fill="#fff3e0" stroke="#FF9800" stroke-width="2"/>
  <text x="390" y="35" font-size="13" font-weight="700" text-anchor="middle" fill="#E65100" font-family="Inter, sans-serif">Grammar-Based Fuzzing</text>

  <rect x="525" y="10" width="240" height="40" rx="6" fill="#e8f5e9" stroke="#4CAF50" stroke-width="2"/>
  <text x="645" y="35" font-size="13" font-weight="700" text-anchor="middle" fill="#2E7D32" font-family="Inter, sans-serif">LLM Seed Generation</text>

  <rect x="780" y="10" width="250" height="40" rx="6" fill="#fce4ec" stroke="#8C1D40" stroke-width="2"/>
  <text x="905" y="35" font-size="13" font-weight="700" text-anchor="middle" fill="#8C1D40" font-family="Inter, sans-serif">LLM-Directed Fuzzing</text>

  <!-- Summary panel -->
  <rect x="100" y="70" width="850" height="250" rx="12" fill="#fafafa" stroke="#333" stroke-width="2"/>
  <text x="525" y="105" font-size="20" font-weight="700" text-anchor="middle" fill="#333" font-family="Inter, sans-serif">Four Techniques, One Pipeline</text>

  <!-- Technique summary row -->
  <rect x="130" y="125" width="190" height="70" rx="6" fill="#e3f2fd" stroke="#2196F3" stroke-width="1.5"/>
  <text x="225" y="148" font-size="13" font-weight="600" text-anchor="middle" fill="#1565C0" font-family="Inter, sans-serif">Coverage-Guided</text>
  <text x="225" y="166" font-size="12" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">Fast, broad exploration</text>
  <text x="225" y="183" font-size="11" text-anchor="middle" fill="#999" font-family="Inter, sans-serif">AFL++, Jazzmine</text>

  <rect x="340" y="125" width="190" height="70" rx="6" fill="#fff3e0" stroke="#FF9800" stroke-width="1.5"/>
  <text x="435" y="148" font-size="13" font-weight="600" text-anchor="middle" fill="#E65100" font-family="Inter, sans-serif">Grammar-Based</text>
  <text x="435" y="166" font-size="12" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">Format-aware inputs</text>
  <text x="435" y="183" font-size="11" text-anchor="middle" fill="#999" font-family="Inter, sans-serif">GrammarGuy</text>

  <rect x="550" y="125" width="190" height="70" rx="6" fill="#e8f5e9" stroke="#4CAF50" stroke-width="1.5"/>
  <text x="645" y="148" font-size="13" font-weight="600" text-anchor="middle" fill="#2E7D32" font-family="Inter, sans-serif">LLM Seeds</text>
  <text x="645" y="166" font-size="12" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">Bootstrap both fuzzers</text>
  <text x="645" y="183" font-size="11" text-anchor="middle" fill="#999" font-family="Inter, sans-serif">QuickSeed + DiscoveryGuy</text>

  <rect x="760" y="125" width="160" height="70" rx="6" fill="#fce4ec" stroke="#8C1D40" stroke-width="1.5"/>
  <text x="840" y="148" font-size="13" font-weight="600" text-anchor="middle" fill="#8C1D40" font-family="Inter, sans-serif">LLM-Directed</text>
  <text x="840" y="166" font-size="12" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">Steer toward targets</text>
  <text x="840" y="183" font-size="11" text-anchor="middle" fill="#999" font-family="Inter, sans-serif">AIJON (35x speedup)</text>

  <!-- Key insight -->
  <rect x="150" y="220" width="750" height="50" rx="6" fill="#f5f5f5" stroke="#8C1D40" stroke-width="2"/>
  <text x="525" y="243" font-size="15" font-weight="700" text-anchor="middle" fill="#333" font-family="Inter, sans-serif">Each technique reaches different parts of the state space.</text>
  <text x="525" y="261" font-size="14" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">The combination finds what no single technique can find alone.</text>

  <!-- Data flow indicators -->
  <path d="M 645 195 Q 500 210 225 195" stroke="#4CAF50" stroke-width="1.5" fill="none" stroke-dasharray="4,3"/>
  <path d="M 645 195 Q 550 210 435 195" stroke="#4CAF50" stroke-width="1.5" fill="none" stroke-dasharray="4,3"/>

  <!-- Bottom stats line -->
  <line x1="100" y1="340" x2="950" y2="340" stroke="#e0e0e0" stroke-width="1"/>
  <text x="525" y="370" font-size="16" font-weight="600" text-anchor="middle" fill="#333" font-family="Inter, sans-serif">DiscoveryGuy: the unified fuzzing pipeline coordinating all four approaches</text>
  <text x="525" y="392" font-size="14" text-anchor="middle" fill="#888" font-family="Inter, sans-serif">Results feed into the Analysis Graph as confirmed vulnerabilities</text>

</svg>
</div>

???

Together, these four techniques cover different parts of the state space. Coverage-guided explores broadly. Grammar-based reaches structured code paths. LLM seeds bootstrap both. AIJON steers toward specific targets. The combination finds what no single technique can find alone.
