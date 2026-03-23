---
type: content
title: "Completeness-Scalability Progression"
---

<svg viewBox="0 0 900 400" style="width:100%; margin:0.5rem auto; display:block;">
  <!-- Axes -->
  <line x1="120" y1="350" x2="850" y2="350" stroke="#333" stroke-width="2"/>
  <line x1="120" y1="350" x2="120" y2="30" stroke="#333" stroke-width="2"/>
  <!-- Axis labels -->
  <text x="485" y="390" text-anchor="middle" font-size="15" font-weight="700" fill="#333">Scalability</text>
  <text x="45" y="190" text-anchor="middle" font-size="15" font-weight="700" fill="#333" transform="rotate(-90,45,190)">Completeness</text>
  <!-- Axis ticks -->
  <text x="170" y="372" font-size="11" fill="#888">Low</text>
  <text x="800" y="372" font-size="11" fill="#888">High</text>
  <text x="105" y="330" font-size="11" fill="#888" text-anchor="end">Low</text>
  <text x="105" y="55" font-size="11" fill="#888" text-anchor="end">High</text>

  <!-- Quadrant shading -->
  <rect x="121" y="31" width="364" height="159" fill="#ffebee" opacity="0.3" rx="4"/>
  <rect x="486" y="31" width="363" height="159" fill="#e8f5e9" opacity="0.4" rx="4"/>
  <rect x="121" y="191" width="364" height="158" fill="#fff3e0" opacity="0.3" rx="4"/>
  <rect x="486" y="191" width="363" height="158" fill="#e3f2fd" opacity="0.3" rx="4"/>

  <defs>
    <marker id="arrProg" markerWidth="10" markerHeight="10" refX="7" refY="3" orient="auto" markerUnits="strokeWidth">
      <path d="M0,0 L0,6 L9,3 z" fill="#8C1D40"/>
    </marker>
  </defs>

  <!-- Mango bubble (high scalability, low completeness) -->
  <circle cx="740" cy="280" r="55" fill="#FF9800" opacity="0.18" stroke="#FF9800" stroke-width="2.5"/>
  <text x="740" y="285" text-anchor="middle" font-size="14" font-weight="700" fill="#E65100">Mango</text>

  <!-- Arrow: Mango → Artiphishell -->
  <path d="M 695 255 C 620 230, 560 210, 520 195" stroke="#8C1D40" stroke-width="3" fill="none" marker-end="url(#arrProg)"/>

  <!-- Artiphishell bubble (medium scalability, medium completeness) -->
  <circle cx="470" cy="170" r="55" fill="#9C27B0" opacity="0.15" stroke="#9C27B0" stroke-width="2.5"/>
  <text x="470" y="175" text-anchor="middle" font-size="14" font-weight="700" fill="#7B1FA2">Artiphishell</text>

  <!-- Arrow: Artiphishell → PEACH -->
  <path d="M 520 148 C 580 125, 630 105, 680 90" stroke="#8C1D40" stroke-width="3" fill="none" marker-end="url(#arrProg)"/>

  <!-- PEACH bubble (high scalability, high completeness) -->
  <circle cx="730" cy="80" r="55" fill="#2196F3" opacity="0.15" stroke="#2196F3" stroke-width="2.5"/>
  <text x="730" y="85" text-anchor="middle" font-size="14" font-weight="700" fill="#1565C0">PEACH</text>
</svg>

???

Let me show how these three projects position themselves on the completeness-scalability matrix. Mango achieves high scalability: it processes 770,000 binaries from a real-world firmware image. But the evidence is partial. You get ranked candidates, not proof. Artiphishell trades some scalability for completeness. It works on real open-source projects, not massive firmware, but it converges evidence through multiple independent techniques, which is stronger than any single method. PEACH uses directed scalability: it does not validate every candidate, but it validates specific paths that Mango has flagged, and it produces formal evidence in the form of concrete inputs that trigger the bug. The three projects together form a pipeline. Detection is highly scalable. Coordination is convergent. Complete analysis is formal. Taken as a whole, the pipeline achieves what no single technique could alone: both completeness and scalability. This is the unifying thread that connects the three projects and resolves the fundamental tension we started with. Let me now walk through each project in detail, beginning with Mango.
