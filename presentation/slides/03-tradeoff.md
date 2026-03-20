---
type: content
title: "The Scalability vs. Completeness Trade-Off"
---

<svg viewBox="0 0 900 420" style="width:100%; margin:0.5rem auto; display:block;">
  <!-- Axes -->
  <line x1="120" y1="370" x2="850" y2="370" stroke="#333" stroke-width="2"/>
  <line x1="120" y1="370" x2="120" y2="40" stroke="#333" stroke-width="2"/>
  <!-- Axis labels -->
  <text x="485" y="410" text-anchor="middle" font-size="15" font-weight="700" fill="#333">Scalability</text>
  <text x="45" y="205" text-anchor="middle" font-size="15" font-weight="700" fill="#333" transform="rotate(-90,45,205)">Completeness</text>
  <!-- Axis ticks -->
  <text x="170" y="392" font-size="11" fill="#888">Low</text>
  <text x="800" y="392" font-size="11" fill="#888">High</text>
  <text x="105" y="350" font-size="11" fill="#888" text-anchor="end">Low</text>
  <text x="105" y="65" font-size="11" fill="#888" text-anchor="end">High</text>

  <!-- Quadrant shading -->
  <rect x="121" y="41" width="364" height="164" fill="#ffebee" opacity="0.3" rx="4"/>
  <rect x="486" y="41" width="363" height="164" fill="#e8f5e9" opacity="0.4" rx="4"/>
  <rect x="121" y="206" width="364" height="163" fill="#fff3e0" opacity="0.3" rx="4"/>
  <rect x="486" y="206" width="363" height="163" fill="#e3f2fd" opacity="0.3" rx="4"/>

  <!-- Ideal analysis: dashed circle in the goal quadrant -->
  <circle cx="680" cy="110" r="60" fill="none" stroke="#8C1D40" stroke-width="3" stroke-dasharray="10,5"/>
  <text x="680" y="105" text-anchor="middle" font-size="14" font-weight="700" fill="#8C1D40">Ideal</text>
  <text x="680" y="123" text-anchor="middle" font-size="14" font-weight="700" fill="#8C1D40">Analysis</text>

  <!-- Symbolic Execution bubble -->
  <circle cx="250" cy="130" r="50" fill="#7B1FA2" opacity="0.15" stroke="#7B1FA2" stroke-width="2.5"/>
  <text x="250" y="125" text-anchor="middle" font-size="14" font-weight="700" fill="#7B1FA2">Symbolic</text>
  <text x="250" y="143" text-anchor="middle" font-size="14" font-weight="700" fill="#7B1FA2">Execution</text>

  <!-- Fuzzing bubble -->
  <circle cx="470" cy="230" r="50" fill="#FF9800" opacity="0.15" stroke="#FF9800" stroke-width="2.5"/>
  <text x="470" y="235" text-anchor="middle" font-size="14" font-weight="700" fill="#E65100">Fuzzing</text>

  <!-- Static Analysis bubble -->
  <circle cx="720" cy="300" r="50" fill="#2196F3" opacity="0.15" stroke="#2196F3" stroke-width="2.5"/>
  <text x="720" y="305" text-anchor="middle" font-size="14" font-weight="700" fill="#1565C0">Static Analysis</text>

</svg>

???

The existing approaches to vulnerability detection each embody a fundamental tradeoff. Static analysis scales beautifully. You can point a static analyzer at firmware containing thousands of binaries and flag data flows that look suspicious. But those flows are unconfirmed. You don't know whether the flagged code path is actually reachable, or whether some guard will block the attack. Symbolic execution solves that problem. It proves whether a path is reachable. It gives you certainty. But path explosion limits its scalability. The search space grows exponentially with code complexity, and you can only validate a handful of paths before computational budgets exhausted. Fuzzing bridges some of that gap. It finds real crashes, which is the strongest evidence there is. But coverage is opportunistic. You discover vulnerabilities by luck of random input generation, not by systematic exploration. None of these approaches, alone, gives you what we need: the ability to scan at scale while maintaining confidence in the evidence. The thesis is that we can achieve both by building a system that starts with detection, then progressively adds richer validation evidence as we move through corroboration and formal proof.
