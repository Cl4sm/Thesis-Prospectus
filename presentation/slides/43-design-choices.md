---
type: content
title: "Three Key Design Choices"
---

<svg viewBox="0 0 1050 460" style="width:100%; display:block; margin: 0 auto;" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <marker id="dc-arr" markerWidth="8" markerHeight="8" refX="7" refY="3" orient="auto">
      <polygon points="0 0, 8 3, 0 6" fill="#555"/>
    </marker>
    <marker id="dc-arr-purple" markerWidth="8" markerHeight="8" refX="7" refY="3" orient="auto">
      <polygon points="0 0, 8 3, 0 6" fill="#7B1FA2"/>
    </marker>
  </defs>

  <!-- ===== PANEL 1: AIL-Level Execution ===== -->
  <rect x="15" y="10" width="320" height="440" rx="10" fill="#fafafa" stroke="#2196F3" stroke-width="2"/>
  <rect x="15" y="10" width="320" height="42" rx="10" fill="#e3f2fd"/>
  <rect x="15" y="42" width="320" height="10" fill="#e3f2fd"/>
  <text x="35" y="28" font-size="11" font-weight="800" fill="#1565C0" font-family="Inter, sans-serif">1</text>
  <circle cx="35" cy="23" r="12" fill="none" stroke="#1565C0" stroke-width="2"/>
  <text x="60" y="38" font-size="14" font-weight="700" fill="#1565C0" font-family="Inter, sans-serif">AIL-Level Execution</text>

  <!-- VEX side (complex) -->
  <text x="90" y="80" font-size="13" font-weight="600" fill="#999" text-anchor="middle" font-family="Inter, sans-serif">VEX (Low-Level)</text>
  <rect x="30" y="90" width="120" height="140" rx="4" fill="#1e1e1e"/>
  <text x="40" y="108" font-size="10" fill="#999" font-family="JetBrains Mono, monospace">t0 = GET:I32(16)</text>
  <text x="40" y="120" font-size="10" fill="#999" font-family="JetBrains Mono, monospace">t1 = Add32(t0,0x4)</text>
  <text x="40" y="132" font-size="10" fill="#999" font-family="JetBrains Mono, monospace">t2 = LDle:I32(t1)</text>
  <text x="40" y="144" font-size="10" fill="#999" font-family="JetBrains Mono, monospace">t3 = GET:I32(24)</text>
  <text x="40" y="156" font-size="10" fill="#999" font-family="JetBrains Mono, monospace">t4 = Shr32(t2,t3)</text>
  <text x="40" y="168" font-size="10" fill="#999" font-family="JetBrains Mono, monospace">t5 = And32(t4,0xff)</text>
  <text x="40" y="180" font-size="10" fill="#999" font-family="JetBrains Mono, monospace">PUT(0) = t5</text>
  <text x="40" y="192" font-size="10" fill="#999" font-family="JetBrains Mono, monospace">t6 = CmpEQ32(t5,0)</text>
  <text x="40" y="204" font-size="10" fill="#E53935" font-family="JetBrains Mono, monospace">... 40+ statements</text>
  <text x="40" y="218" font-size="10" fill="#E53935" font-family="JetBrains Mono, monospace">... per basic block</text>

  <!-- Arrow between -->
  <text x="175" y="165" font-size="22" fill="#2196F3" font-family="Inter, sans-serif">→</text>

  <!-- AIL side (clean) -->
  <text x="260" y="80" font-size="13" font-weight="600" fill="#1565C0" text-anchor="middle" font-family="Inter, sans-serif">AIL (Decompiler)</text>
  <rect x="195" y="90" width="120" height="140" rx="4" fill="#1e1e1e"/>
  <text x="205" y="112" font-size="11" fill="#4FC3F7" font-family="JetBrains Mono, monospace">char *name;</text>
  <text x="205" y="130" font-size="11" fill="#4FC3F7" font-family="JetBrains Mono, monospace">name = nvram_get(</text>
  <text x="205" y="144" font-size="11" fill="#81C784" font-family="JetBrains Mono, monospace">  "host_name");</text>
  <text x="205" y="166" font-size="11" fill="#4FC3F7" font-family="JetBrains Mono, monospace">if (name) {</text>
  <text x="205" y="184" font-size="11" fill="#4FC3F7" font-family="JetBrains Mono, monospace">  system(name);</text>
  <text x="205" y="202" font-size="11" fill="#4FC3F7" font-family="JetBrains Mono, monospace">}</text>

  <!-- Benefits -->
  <rect x="35" y="248" width="280" height="28" rx="4" fill="#e8f5e9"/>
  <text x="175" y="267" font-size="13" font-weight="600" text-anchor="middle" fill="#2E7D32" font-family="Inter, sans-serif">Recovered types + structured control flow</text>

  <rect x="35" y="284" width="280" height="28" rx="4" fill="#e8f5e9"/>
  <text x="175" y="303" font-size="13" font-weight="600" text-anchor="middle" fill="#2E7D32" font-family="Inter, sans-serif">Variable-level reasoning (not register-level)</text>

  <rect x="35" y="320" width="280" height="28" rx="4" fill="#e8f5e9"/>
  <text x="175" y="339" font-size="13" font-weight="600" text-anchor="middle" fill="#2E7D32" font-family="Inter, sans-serif">Tighter SMT constraints, fewer artifacts</text>

  <!-- ===== PANEL 2: Hybrid Concretization ===== -->
  <rect x="365" y="10" width="320" height="440" rx="10" fill="#fafafa" stroke="#FF9800" stroke-width="2"/>
  <rect x="365" y="10" width="320" height="42" rx="10" fill="#fff3e0"/>
  <rect x="365" y="42" width="320" height="10" fill="#fff3e0"/>
  <text x="385" y="28" font-size="11" font-weight="800" fill="#E65100" font-family="Inter, sans-serif">2</text>
  <circle cx="385" cy="23" r="12" fill="none" stroke="#E65100" stroke-width="2"/>
  <text x="410" y="38" font-size="14" font-weight="700" fill="#E65100" font-family="Inter, sans-serif">Hybrid Concretization</text>

  <!-- Static extraction box -->
  <rect x="385" y="70" width="130" height="100" rx="6" fill="#fff" stroke="#4CAF50" stroke-width="1.5"/>
  <text x="450" y="90" font-size="12" font-weight="700" text-anchor="middle" fill="#2E7D32" font-family="Inter, sans-serif">Static Extraction</text>
  <line x1="400" y1="97" x2="500" y2="97" stroke="#e0e0e0" stroke-width="1"/>
  <text x="400" y="115" font-size="12" fill="#555" font-family="Inter, sans-serif">NVRAM keys</text>
  <text x="400" y="130" font-size="12" fill="#555" font-family="Inter, sans-serif">HTTP params</text>
  <text x="400" y="145" font-size="12" fill="#555" font-family="Inter, sans-serif">Guard patterns</text>
  <text x="400" y="160" font-size="12" fill="#555" font-family="Inter, sans-serif">Constant strings</text>

  <!-- LLM recovery box -->
  <rect x="535" y="70" width="130" height="100" rx="6" fill="#fff" stroke="#9C27B0" stroke-width="1.5"/>
  <text x="600" y="90" font-size="12" font-weight="700" text-anchor="middle" fill="#7B1FA2" font-family="Inter, sans-serif">LLM Recovery</text>
  <line x1="550" y1="97" x2="650" y2="97" stroke="#e0e0e0" stroke-width="1"/>
  <text x="550" y="115" font-size="12" fill="#555" font-family="Inter, sans-serif">Missing values</text>
  <text x="550" y="130" font-size="12" fill="#555" font-family="Inter, sans-serif">Branch hints</text>
  <text x="550" y="145" font-size="12" fill="#555" font-family="Inter, sans-serif">Function stubs</text>
  <text x="550" y="160" font-size="12" fill="#555" font-family="Inter, sans-serif">Handler analysis</text>

  <!-- Merge arrows -->
  <line x1="450" y1="170" x2="525" y2="210" stroke="#555" stroke-width="1.5" marker-end="url(#dc-arr)"/>
  <line x1="600" y1="170" x2="525" y2="210" stroke="#555" stroke-width="1.5" marker-end="url(#dc-arr)"/>

  <!-- Merged PathPlan -->
  <rect x="420" y="215" width="210" height="50" rx="6" fill="#fff3e0" stroke="#FF9800" stroke-width="2"/>
  <text x="525" y="238" font-size="12" font-weight="700" text-anchor="middle" fill="#E65100" font-family="Inter, sans-serif">PathPlan</text>
  <text x="525" y="255" font-size="12" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">Merged configuration for execution</text>

  <!-- Benefits -->
  <rect x="385" y="290" width="280" height="28" rx="4" fill="#e8f5e9"/>
  <text x="525" y="309" font-size="13" font-weight="600" text-anchor="middle" fill="#2E7D32" font-family="Inter, sans-serif">Manageable search space</text>

  <rect x="385" y="326" width="280" height="28" rx="4" fill="#e8f5e9"/>
  <text x="525" y="345" font-size="13" font-weight="600" text-anchor="middle" fill="#2E7D32" font-family="Inter, sans-serif">Covers environmental preconditions</text>

  <rect x="385" y="362" width="280" height="28" rx="4" fill="#e8f5e9"/>
  <text x="525" y="381" font-size="13" font-weight="600" text-anchor="middle" fill="#2E7D32" font-family="Inter, sans-serif">LLM values verified against constraints</text>

  <!-- ===== PANEL 3: Cross-Binary Constraint Chaining ===== -->
  <rect x="715" y="10" width="320" height="440" rx="10" fill="#fafafa" stroke="#8C1D40" stroke-width="2"/>
  <rect x="715" y="10" width="320" height="42" rx="10" fill="#F8EEF1"/>
  <rect x="715" y="42" width="320" height="10" fill="#F8EEF1"/>
  <text x="735" y="28" font-size="11" font-weight="800" fill="#8C1D40" font-family="Inter, sans-serif">3</text>
  <circle cx="735" cy="23" r="12" fill="none" stroke="#8C1D40" stroke-width="2"/>
  <text x="760" y="38" font-size="14" font-weight="700" fill="#8C1D40" font-family="Inter, sans-serif">Cross-Binary Chaining</text>

  <!-- Binary A (setter) -->
  <rect x="745" y="70" width="120" height="90" rx="6" fill="#fff" stroke="#FF9800" stroke-width="1.5"/>
  <text x="805" y="90" font-size="13" font-weight="700" text-anchor="middle" fill="#E65100" font-family="Inter, sans-serif">httpd</text>
  <line x1="755" y1="97" x2="855" y2="97" stroke="#e0e0e0" stroke-width="1"/>
  <text x="805" y="118" font-size="12" text-anchor="middle" fill="#555" font-family="Inter, sans-serif">nvram_set(</text>
  <text x="805" y="133" font-size="12" text-anchor="middle" fill="#FF9800" font-weight="600" font-family="Inter, sans-serif">"wan_dns", input)</text>
  <text x="805" y="150" font-size="12" text-anchor="middle" fill="#999" font-family="Inter, sans-serif">captures symbolic state</text>

  <!-- NVRAM store (middle) -->
  <line x1="805" y1="160" x2="805" y2="195" stroke="#8C1D40" stroke-width="2" marker-end="url(#dc-arr)"/>

  <rect x="765" y="200" width="80" height="35" rx="4" fill="#F8EEF1" stroke="#8C1D40" stroke-width="1.5"/>
  <text x="805" y="222" font-size="12" font-weight="700" text-anchor="middle" fill="#8C1D40" font-family="Inter, sans-serif">NVRAM</text>

  <!-- Binary B (getter) -->
  <line x1="805" y1="235" x2="805" y2="270" stroke="#8C1D40" stroke-width="2" marker-end="url(#dc-arr)"/>

  <rect x="745" y="275" width="120" height="90" rx="6" fill="#fff" stroke="#2196F3" stroke-width="1.5"/>
  <text x="805" y="295" font-size="13" font-weight="700" text-anchor="middle" fill="#1565C0" font-family="Inter, sans-serif">dlnad</text>
  <line x1="755" y1="302" x2="855" y2="302" stroke="#e0e0e0" stroke-width="1"/>
  <text x="805" y="323" font-size="12" text-anchor="middle" fill="#555" font-family="Inter, sans-serif">dns = nvram_get(</text>
  <text x="805" y="338" font-size="12" text-anchor="middle" fill="#2196F3" font-weight="600" font-family="Inter, sans-serif">"wan_dns")</text>
  <text x="805" y="355" font-size="12" text-anchor="middle" fill="#999" font-family="Inter, sans-serif">chains setter constraints</text>

  <!-- Constraint chain arrow (dashed, wrapping) -->
  <path d="M 870 130 Q 920 130 920 218 Q 920 305 870 305" stroke="#9C27B0" stroke-width="2" stroke-dasharray="5,3" fill="none" marker-end="url(#dc-arr-purple)"/>
  <text x="940" y="218" font-size="12" font-weight="600" fill="#7B1FA2" font-family="Inter, sans-serif" transform="rotate(90 940 218)">constraints flow</text>

  <!-- Benefits -->
  <rect x="735" y="390" width="280" height="28" rx="4" fill="#e8f5e9"/>
  <text x="875" y="409" font-size="13" font-weight="600" text-anchor="middle" fill="#2E7D32" font-family="Inter, sans-serif">Constraints propagate across IPC boundaries</text>

</svg>

???

Our approach makes three key design choices that address these problems directly.

The first choice is to operate at the decompiler IR level, not the low level. Angr has two intermediate representations: VEX, which is very low level and mimics the CPU instruction set; and AIL, which is the decompiler's intermediate language. AIL is higher level. It recovers type information, preserves structured control flow like loops and conditionals as abstractions, and reasons at the variable level rather than at the instruction level. Working on AIL produces much tighter SMT constraints because there are fewer lifting artifacts, fewer unnecessary detail. The solver runs faster and more reliably.

The second choice is hybrid concretization. We can't model the entire environment symbolically. But we can extract known values statically. NVRAM key names appear in the firmware. HTTP parameter names are in the code. Guard patterns are recognizable. For anything we can't extract statically, we use LLM-directed recovery. The LLM looks at the code context and suggests likely values. It's not a black box; we verify the recovered values against the code. This hybrid approach keeps the search space manageable while covering the environmental preconditions.

The third choice is cross-binary constraint chaining. When a path crosses from one binary to another through NVRAM, we trace the SET operation in the setter binary, capture its symbolic state, and chain it into the GET operation in the getter binary. This way, constraints propagate across the boundary instead of treating it as a dead end.

These three choices together let us validate candidates that conventional SymEx can't handle.
