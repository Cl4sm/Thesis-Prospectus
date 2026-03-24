---
type: content
title: "The Symbolic Execution Gap"
hidden: true
---

<svg viewBox="0 0 1000 300" style="width:100%; margin:0.5rem auto 0.5rem auto; display:block;">
  <defs>
    <marker id="arrSymGap" markerWidth="10" markerHeight="10" refX="7" refY="3" orient="auto" markerUnits="strokeWidth">
      <path d="M0,0 L0,6 L9,3 z" fill="#888"/>
    </marker>
  </defs>

  <!-- Detection box -->
  <rect x="30" y="80" width="200" height="90" fill="#f3e5f5" stroke="#7B1FA2" stroke-width="2.5" rx="8"/>
  <text x="130" y="115" text-anchor="middle" font-size="14" font-weight="700" fill="#6A1B9A">Symbolic Executor</text>
  <text x="130" y="140" text-anchor="middle" font-size="11" fill="#555">"path to sink is</text>
  <text x="130" y="156" text-anchor="middle" font-size="11" fill="#555">satisfiable"</text>

  <!-- Arrow into gap -->
  <path d="M 230 125 L 290 125" stroke="#888" stroke-width="2.5" fill="none" marker-end="url(#arrSymGap)"/>

  <!-- Gap region with blockers -->
  <rect x="295" y="30" width="380" height="240" fill="#fff8e1" stroke="#FF9800" stroke-width="2" rx="10" stroke-dasharray="6,3"/>
  <text x="485" y="58" text-anchor="middle" font-size="14" font-weight="700" fill="#E65100">The Gap</text>

  <!-- Blocker items -->
  <rect x="320" y="75" width="330" height="38" fill="#ffebee" stroke="#E53935" stroke-width="1.5" rx="5"/>
  <text x="340" y="99" font-size="12" fill="#C62828" font-weight="600">Path explosion limits target coverage</text>

  <rect x="320" y="123" width="330" height="38" fill="#ffebee" stroke="#E53935" stroke-width="1.5" rx="5"/>
  <text x="340" y="147" font-size="12" fill="#C62828" font-weight="600">Environment interactions not modeled</text>

  <rect x="320" y="171" width="330" height="38" fill="#ffebee" stroke="#E53935" stroke-width="1.5" rx="5"/>
  <text x="340" y="195" font-size="12" fill="#C62828" font-weight="600">Constraint solving may time out</text>

  <rect x="320" y="219" width="330" height="38" fill="#ffebee" stroke="#E53935" stroke-width="1.5" rx="5"/>
  <text x="340" y="243" font-size="12" fill="#C62828" font-weight="600">Single-function scope misses context</text>

  <!-- Arrow out of gap -->
  <path d="M 675 125 L 735 125" stroke="#888" stroke-width="2.5" fill="none" marker-end="url(#arrSymGap)"/>

  <!-- Confirmation box -->
  <rect x="740" y="80" width="220" height="90" fill="#e8f5e9" stroke="#4CAF50" stroke-width="2.5" rx="8"/>
  <text x="850" y="115" text-anchor="middle" font-size="14" font-weight="700" fill="#2E7D32">Vendor-Ready Report</text>
  <text x="850" y="140" text-anchor="middle" font-size="11" fill="#555">Full-program proof</text>
  <text x="850" y="156" text-anchor="middle" font-size="11" fill="#555">+ scalable coverage</text>

  <!-- Bottom note -->
  <text x="485" y="290" text-anchor="middle" font-size="13" fill="#333" font-weight="600" font-style="italic">Sound proofs, but only for the paths you can reach</text>
</svg>

???

And then there is symbolic execution. The symbolic executor tells you that a path from user input to a dangerous sink is satisfiable. It can even generate a concrete input that triggers it. That is the gold standard of evidence. But the gap is on the other axis: scalability. Path explosion means the number of states grows exponentially with every branch. In practice, you can only explore a small fraction of the program before you exhaust your computational budget. In complex systems, modeling environment interactions symbolically is prohibitively difficult. Constraint solving itself can time out on complex arithmetic or nested loops. So symbolic execution gives you the strongest possible proof for the paths it reaches, but it cannot reach most of the program. The gap here is the inverse of static analysis: you have certainty without coverage. This is why no single technique solves the problem. Each one leaves a different part of the gap open.
