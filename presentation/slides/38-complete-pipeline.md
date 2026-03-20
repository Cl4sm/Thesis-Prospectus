---
type: content
title: "The Complete Pipeline"
---

<svg viewBox="0 0 1100 220" style="width: 100%; margin: 10px auto 20px auto; display: block;">
  <defs>
    <marker id="arrowPipe" markerWidth="10" markerHeight="10" refX="7" refY="3" orient="auto" markerUnits="strokeWidth">
      <path d="M0,0 L0,6 L9,3 z" fill="#555"/>
    </marker>
  </defs>

  <!-- Firmware input -->
  <rect x="20" y="60" width="130" height="80" fill="#f5f5f5" stroke="#333" stroke-width="2" rx="6"/>
  <text x="85" y="95" font-size="13" font-weight="bold" text-anchor="middle" fill="#333">Firmware</text>
  <text x="85" y="115" font-size="11" text-anchor="middle" fill="#666">1,698 images</text>

  <!-- Arrow -->
  <path d="M 150 100 L 200 100" stroke="#555" stroke-width="2.5" fill="none" marker-end="url(#arrowPipe)"/>

  <!-- Mango -->
  <rect x="205" y="50" width="180" height="100" fill="#fff3e0" stroke="#FF9800" stroke-width="2.5" rx="6"/>
  <text x="295" y="85" font-size="14" font-weight="bold" text-anchor="middle" fill="#333">Operation Mango</text>
  <text x="295" y="108" font-size="11" text-anchor="middle" fill="#666">Scalable detection</text>
  <text x="295" y="125" font-size="11" text-anchor="middle" fill="#666">Every binary analyzed</text>
  <text x="295" y="142" font-size="10" text-anchor="middle" fill="#FF9800" font-weight="bold">10,834 alerts</text>

  <!-- Arrow -->
  <path d="M 385 100 L 435 100" stroke="#555" stroke-width="2.5" fill="none" marker-end="url(#arrowPipe)"/>

  <!-- AIL SymEx -->
  <rect x="440" y="50" width="180" height="100" fill="#e3f2fd" stroke="#2196F3" stroke-width="2.5" rx="6"/>
  <text x="530" y="85" font-size="14" font-weight="bold" text-anchor="middle" fill="#333">AIL SymEx</text>
  <text x="530" y="108" font-size="11" text-anchor="middle" fill="#666">Formal validation</text>
  <text x="530" y="125" font-size="11" text-anchor="middle" fill="#666">Path feasibility proof</text>
  <text x="530" y="142" font-size="10" text-anchor="middle" fill="#2196F3" font-weight="bold">51 confirmed</text>

  <!-- Arrow -->
  <path d="M 620 100 L 670 100" stroke="#555" stroke-width="2.5" fill="none" marker-end="url(#arrowPipe)"/>

  <!-- Output -->
  <rect x="675" y="50" width="160" height="100" fill="#ffebee" stroke="#8C1D40" stroke-width="2.5" rx="6"/>
  <text x="755" y="85" font-size="14" font-weight="bold" text-anchor="middle" fill="#8C1D40">Concrete PoC</text>
  <text x="755" y="108" font-size="11" text-anchor="middle" fill="#666">Triggering inputs</text>
  <text x="755" y="125" font-size="11" text-anchor="middle" fill="#666">Vendor-ready reports</text>
  <text x="755" y="142" font-size="10" text-anchor="middle" fill="#8C1D40" font-weight="bold">166 exploitable</text>

  <!-- Artiphishell annotation below -->
  <rect x="295" y="175" width="280" height="30" fill="#f3e5f5" stroke="#9C27B0" stroke-width="1.5" rx="3"/>
  <text x="435" y="196" font-size="11" font-weight="bold" text-anchor="middle" fill="#7B1FA2">Artiphishell: autonomous lifecycle (source-available)</text>
  <path d="M 435 150 L 435 175" stroke="#9C27B0" stroke-width="1.5" stroke-dasharray="4,3" fill="none"/>
</svg>

**A vulnerability analysis pipeline that is simultaneously complete and scalable**

Three projects together close the gap between detection and confirmation

???

So here's the complete picture. We scan 1,698 firmware images. Mango runs across every binary and produces 10,834 alerts. These are statically-detected candidates.

[CLICK] Those candidates go into AIL SymEx for validation. We confirm 51 of them as reachable paths.

[CLICK] From those 51, we synthesize concrete PoC exploits with triggering inputs. That's what vendors actually need to issue a patch.

Now, Artiphishell sits alongside this. It demonstrates that the full vulnerability lifecycle, from detection through patch synthesis and verification, is automatable. But it works on source code. Mango works on binaries. AIL SymEx bridges that gap: it validates Mango's binary-only candidates with the same rigor Artiphishell applies to source.

Together, we have a pipeline that is both complete, covering the whole detection-to-confirmation cycle, and scalable, handling thousands of firmware images at once. That's what a modern vulnerability analysis system needs to achieve.
