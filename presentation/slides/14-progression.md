---
type: content
title: "Dissertation Roadmap"
---

<svg viewBox="0 0 1050 280" style="width:100%; margin:0.5rem auto; display:block;" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <marker id="arrRoad" markerWidth="10" markerHeight="10" refX="7" refY="3" orient="auto" markerUnits="strokeWidth">
      <path d="M0,0 L0,6 L9,3 z" fill="#555"/>
    </marker>
  </defs>

  <!-- Project 1: Mango (orange) -->
  <rect x="30" y="30" width="290" height="180" fill="#fff3e0" stroke="#FF9800" stroke-width="2.5" rx="10"/>
  <rect x="30" y="30" width="290" height="42" fill="#FF9800" rx="10"/>
  <rect x="30" y="56" width="290" height="16" fill="#FF9800"/>
  <text x="175" y="57" text-anchor="middle" font-size="15" font-weight="700" fill="white" font-family="Inter, sans-serif">Operation Mango</text>
  <text x="175" y="92" text-anchor="middle" font-size="14" fill="#888" font-family="Inter, sans-serif">USENIX Security '24</text>
  <text x="175" y="120" text-anchor="middle" font-size="14" fill="#333" font-family="Inter, sans-serif">Scales detection to</text>
  <text x="175" y="138" text-anchor="middle" font-size="14" fill="#333" font-family="Inter, sans-serif">every binary in a</text>
  <text x="175" y="156" text-anchor="middle" font-size="14" fill="#333" font-family="Inter, sans-serif">firmware image</text>
  <text x="175" y="185" text-anchor="middle" font-size="14" fill="#E65100" font-weight="600" font-family="Inter, sans-serif">770K binaries analyzed</text>

  <!-- Arrow 1→2 -->
  <path d="M 320 120 L 370 120" stroke="#555" stroke-width="2.5" fill="none" marker-end="url(#arrRoad)"/>

  <!-- Project 2: Artiphishell (purple) -->
  <rect x="375" y="30" width="290" height="180" fill="#f3e5f5" stroke="#9C27B0" stroke-width="2.5" rx="10"/>
  <rect x="375" y="30" width="290" height="42" fill="#9C27B0" rx="10"/>
  <rect x="375" y="56" width="290" height="16" fill="#9C27B0"/>
  <text x="520" y="57" text-anchor="middle" font-size="15" font-weight="700" fill="white" font-family="Inter, sans-serif">Artiphishell</text>
  <text x="520" y="92" text-anchor="middle" font-size="14" fill="#888" font-family="Inter, sans-serif">DEF CON '25 / DARPA AIxCC</text>
  <text x="520" y="120" text-anchor="middle" font-size="14" fill="#333" font-family="Inter, sans-serif">Coordinates multiple</text>
  <text x="520" y="138" text-anchor="middle" font-size="14" fill="#333" font-family="Inter, sans-serif">techniques for autonomous</text>
  <text x="520" y="156" text-anchor="middle" font-size="14" fill="#333" font-family="Inter, sans-serif">find-validate-patch</text>
  <text x="520" y="185" text-anchor="middle" font-size="14" fill="#7B1FA2" font-weight="600" font-family="Inter, sans-serif">Multi-technique convergence</text>

  <!-- Arrow 2→3 -->
  <path d="M 665 120 L 715 120" stroke="#555" stroke-width="2.5" fill="none" marker-end="url(#arrRoad)"/>

  <!-- Project 3: PEACH (blue) -->
  <rect x="720" y="30" width="290" height="180" fill="#e3f2fd" stroke="#2196F3" stroke-width="2.5" rx="10"/>
  <rect x="720" y="30" width="290" height="42" fill="#2196F3" rx="10"/>
  <rect x="720" y="56" width="290" height="16" fill="#2196F3"/>
  <text x="865" y="57" text-anchor="middle" font-size="15" font-weight="700" fill="white" font-family="Inter, sans-serif">PEACH</text>
  <text x="865" y="92" text-anchor="middle" font-size="14" fill="#888" font-family="Inter, sans-serif">Proposed Work</text>
  <text x="865" y="120" text-anchor="middle" font-size="14" fill="#333" font-family="Inter, sans-serif">Verifies static</text>
  <text x="865" y="138" text-anchor="middle" font-size="14" fill="#333" font-family="Inter, sans-serif">candidates with concrete</text>
  <text x="865" y="156" text-anchor="middle" font-size="14" fill="#333" font-family="Inter, sans-serif">Proof-of-Concept inputs</text>
  <text x="865" y="185" text-anchor="middle" font-size="14" fill="#1565C0" font-weight="600" font-family="Inter, sans-serif">Concrete triggering inputs</text>

  <!-- Progression bar -->
  <rect x="30" y="240" width="990" height="28" fill="#f5f5f5" rx="14"/>
  <rect x="30" y="240" width="310" height="28" fill="#FFF3E0" rx="14"/>
  <rect x="340" y="240" width="330" height="28" fill="#F3E5F5"/>
  <rect x="670" y="240" width="350" height="28" fill="#E3F2FD" rx="14"/>

  <text x="185" y="259" text-anchor="middle" font-size="14" font-weight="700" fill="#E65100" font-family="Inter, sans-serif">Detection</text>
  <text x="505" y="259" text-anchor="middle" font-size="14" font-weight="700" fill="#7B1FA2" font-family="Inter, sans-serif">Validation</text>
  <text x="845" y="259" text-anchor="middle" font-size="14" font-weight="700" fill="#1565C0" font-family="Inter, sans-serif">Confirmation</text>

  <path d="M 330 254 L 350 254" stroke="#888" stroke-width="2" fill="none" marker-end="url(#arrRoad)"/>
  <path d="M 660 254 L 680 254" stroke="#888" stroke-width="2" fill="none" marker-end="url(#arrRoad)"/>
</svg>

???

These three projects map to the three evidence stages. Mango handles detection: it scales static analysis to every binary in a firmware image, analyzing 770,000 binaries. But it produces ranked candidates, not proof.

Artiphishell handles validation: it coordinates fuzzing, static analysis, root-cause analysis, and patching to converge on confirmed bug reports. The computational cost is significant ($130K for a single competition run), and it requires source code.

PEACH, the proposed work, handles confirmation: it verifies static analysis candidates with concrete proof-of-concept inputs through symbolic execution on angr's AIL intermediate language.

Together, they compose a pipeline that achieves soundness, completeness, and scalability. No single technique could do all three.
