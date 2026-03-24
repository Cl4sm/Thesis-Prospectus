---
type: content
title: "Dissertation Roadmap"
hidden: true
---

<svg viewBox="0 0 1050 280" style="width:100%; margin:0.5rem auto; display:block;">
  <defs>
    <marker id="arrRoad" markerWidth="10" markerHeight="10" refX="7" refY="3" orient="auto" markerUnits="strokeWidth">
      <path d="M0,0 L0,6 L9,3 z" fill="#555"/>
    </marker>
  </defs>

  <!-- Progression arrow background -->
  <rect x="30" y="240" width="990" height="28" fill="#f5f5f5" rx="14"/>
  <text x="160" y="259" text-anchor="middle" font-size="12" font-weight="700" fill="#FF9800">Detection</text>
  <text x="525" y="259" text-anchor="middle" font-size="12" font-weight="700" fill="#9C27B0">Coordination</text>
  <text x="880" y="259" text-anchor="middle" font-size="12" font-weight="700" fill="#2196F3">Complete Analysis</text>
  <path d="M 320 254 L 350 254" stroke="#888" stroke-width="2" fill="none" marker-end="url(#arrRoad)"/>
  <path d="M 680 254 L 710 254" stroke="#888" stroke-width="2" fill="none" marker-end="url(#arrRoad)"/>

  <!-- Project 1: Mango -->
  <rect x="30" y="30" width="290" height="180" fill="#fff3e0" stroke="#FF9800" stroke-width="2.5" rx="10"/>
  <rect x="30" y="30" width="290" height="36" fill="#FF9800" rx="10"/>
  <rect x="30" y="50" width="290" height="16" fill="#FF9800"/>
  <text x="175" y="54" text-anchor="middle" font-size="14" font-weight="700" fill="white">Operation Mango</text>
  <text x="175" y="90" text-anchor="middle" font-size="11" fill="#555">USENIX Security '24</text>
  <text x="175" y="120" text-anchor="middle" font-size="12" fill="#333">Scales detection to</text>
  <text x="175" y="138" text-anchor="middle" font-size="12" fill="#333">every binary in a</text>
  <text x="175" y="156" text-anchor="middle" font-size="12" fill="#333">firmware image</text>
  <text x="175" y="185" text-anchor="middle" font-size="11" fill="#FF9800" font-weight="600">770K binaries analyzed</text>

  <!-- Arrow 1→2 -->
  <path d="M 320 120 L 370 120" stroke="#555" stroke-width="2.5" fill="none" marker-end="url(#arrRoad)"/>

  <!-- Project 2: Artiphishell -->
  <rect x="375" y="30" width="290" height="180" fill="#f3e5f5" stroke="#9C27B0" stroke-width="2.5" rx="10"/>
  <rect x="375" y="30" width="290" height="36" fill="#9C27B0" rx="10"/>
  <rect x="375" y="50" width="290" height="16" fill="#9C27B0"/>
  <text x="520" y="54" text-anchor="middle" font-size="14" font-weight="700" fill="white">Artiphishell</text>
  <text x="520" y="90" text-anchor="middle" font-size="11" fill="#555">DEF CON '25 / DARPA AIxCC</text>
  <text x="520" y="120" text-anchor="middle" font-size="12" fill="#333">Coordinates multiple</text>
  <text x="520" y="138" text-anchor="middle" font-size="12" fill="#333">techniques for autonomous</text>
  <text x="520" y="156" text-anchor="middle" font-size="12" fill="#333">find-validate-patch</text>
  <text x="520" y="185" text-anchor="middle" font-size="11" fill="#9C27B0" font-weight="600">Multi-technique convergence</text>

  <!-- Arrow 2→3 -->
  <path d="M 665 120 L 715 120" stroke="#555" stroke-width="2.5" fill="none" marker-end="url(#arrRoad)"/>

  <!-- Project 3: PEACH -->
  <rect x="720" y="30" width="290" height="180" fill="#e3f2fd" stroke="#2196F3" stroke-width="2.5" rx="10"/>
  <rect x="720" y="30" width="290" height="36" fill="#2196F3" rx="10"/>
  <rect x="720" y="50" width="290" height="16" fill="#2196F3"/>
  <text x="865" y="54" text-anchor="middle" font-size="14" font-weight="700" fill="white">PEACH</text>
  <text x="865" y="90" text-anchor="middle" font-size="11" fill="#555">Proposed Work</text>
  <text x="865" y="120" text-anchor="middle" font-size="12" fill="#333">Verifies static</text>
  <text x="865" y="138" text-anchor="middle" font-size="12" fill="#333">candidates with concrete</text>
  <text x="865" y="156" text-anchor="middle" font-size="12" fill="#333">Proof-of-Concept inputs</text>
  <text x="865" y="185" text-anchor="middle" font-size="11" fill="#2196F3" font-weight="600">Concrete triggering inputs</text>
</svg>

???

These three projects map to the three evidence stages we just discussed. Mango handles detection. Artiphishell handles validation. PEACH handles confirmation.

Operation Mango, which was published at USENIX Security in 2024, scales detection to every binary in a firmware image. It analyzes 770,000 binaries and ranks candidates by confidence, improving accuracy without sacrificing scalability, but does not produce formal proof of exploitability.

Artiphishell, which is a completed submission to DEF CON and a DARPA AIxCC effort, coordinates multiple techniques for autonomous find-validate-patch. It uses fuzzing, static analysis, root-cause analysis, and program synthesis to converge on a realistic bug report and a patch. The computational cost is enormous: $50,000 in LLM credits and $80,000 in Azure credits for a single 143-hour run. It also requires source code, which limits applicability to firmware.

The third project, PEACH, which is proposed work, uses symbolic execution on angr's intermediate language to verify static analysis candidates with concrete proof-of-concept inputs.

Together they move us toward vulnerability analysis that is complete, accurate, and scalable.
