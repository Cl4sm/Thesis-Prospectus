---
type: content
title: "Thesis Contributions"
---

<svg viewBox="0 0 1050 380" style="width:100%; margin:0 auto; display:block;" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <marker id="arrContrib" markerWidth="10" markerHeight="10" refX="7" refY="3" orient="auto" markerUnits="strokeWidth">
      <path d="M0,0 L0,6 L9,3 z" fill="#555"/>
    </marker>
  </defs>

  <!-- Project 1: Mango -->
  <rect x="20" y="20" width="310" height="230" fill="#fff3e0" stroke="#FF9800" stroke-width="2.5" rx="10"/>
  <rect x="20" y="20" width="310" height="42" fill="#FF9800" rx="10"/>
  <rect x="20" y="46" width="310" height="16" fill="#FF9800"/>
  <text x="175" y="48" text-anchor="middle" font-size="19.8" font-weight="700" fill="white">Operation Mango</text>
  <text x="175" y="86" text-anchor="middle" font-size="14" fill="#888">USENIX Security '24</text>
  <text x="175" y="118" text-anchor="middle" font-size="16.3" fill="#333" font-weight="600">Scales firmware vulnerability</text>
  <text x="175" y="138" text-anchor="middle" font-size="16.3" fill="#333" font-weight="600">detection to every binary</text>
  <text x="175" y="170" text-anchor="middle" font-size="25.7" fill="#FF9800" font-weight="700">22x</text>
  <text x="175" y="190" text-anchor="middle" font-size="14" fill="#666">more binaries than prior work</text>
  <text x="175" y="220" text-anchor="middle" font-size="15.2" fill="#FF9800" font-weight="600">166 exploitable vulnerabilities</text>

  <!-- Arrow 1→2 -->
  <path d="M 330 135 L 360 135" stroke="#555" stroke-width="2.5" fill="none" marker-end="url(#arrContrib)"/>

  <!-- Project 2: Artiphishell -->
  <rect x="365" y="20" width="310" height="230" fill="#f3e5f5" stroke="#9C27B0" stroke-width="2.5" rx="10"/>
  <rect x="365" y="20" width="310" height="42" fill="#9C27B0" rx="10"/>
  <rect x="365" y="46" width="310" height="16" fill="#9C27B0"/>
  <text x="520" y="48" text-anchor="middle" font-size="19.8" font-weight="700" fill="white">Artiphishell</text>
  <text x="520" y="86" text-anchor="middle" font-size="14" fill="#888">DEF CON '25 · DARPA AIxCC</text>
  <text x="520" y="118" text-anchor="middle" font-size="16.3" fill="#333" font-weight="600">Full autonomous vulnerability</text>
  <text x="520" y="138" text-anchor="middle" font-size="16.3" fill="#333" font-weight="600">lifecycle on real software</text>
  <text x="520" y="170" text-anchor="middle" font-size="25.7" fill="#9C27B0" font-weight="700">7 Zero-Days</text>
  <text x="520" y="190" text-anchor="middle" font-size="14" fill="#666">in real open-source projects</text>
  <text x="520" y="220" text-anchor="middle" font-size="15.2" fill="#9C27B0" font-weight="600">143 hours, zero human input</text>

  <!-- Arrow 2→3 -->
  <path d="M 675 135 L 705 135" stroke="#555" stroke-width="2.5" fill="none" marker-end="url(#arrContrib)"/>

  <!-- Project 3: PEACH -->
  <rect x="710" y="20" width="310" height="230" fill="#e3f2fd" stroke="#2196F3" stroke-width="2.5" rx="10"/>
  <rect x="710" y="20" width="310" height="42" fill="#2196F3" rx="10"/>
  <rect x="710" y="46" width="310" height="16" fill="#2196F3"/>
  <text x="865" y="48" text-anchor="middle" font-size="19.8" font-weight="700" fill="white">PEACH</text>
  <text x="865" y="86" text-anchor="middle" font-size="14" fill="#888">Proposed Work</text>
  <text x="865" y="118" text-anchor="middle" font-size="16.3" fill="#333" font-weight="600">Bridges the detection gap</text>
  <text x="865" y="138" text-anchor="middle" font-size="16.3" fill="#333" font-weight="600">with concrete triggering inputs</text>
  <!-- <text x="865" y="170" text-anchor="middle" font-size="25.7" fill="#2196F3" font-weight="700">1 Zero-Day</text> -->
  <!-- <text x="865" y="190" text-anchor="middle" font-size="14" fill="#666">already discovered (preliminary)</text> -->
  <text x="865" y="220" text-anchor="middle" font-size="15.2" fill="#2196F3" font-weight="600">Formal validation of static alerts</text>

  <!-- Progression bar -->
  <rect x="20" y="280" width="1000" height="36" fill="#f5f5f5" rx="18"/>
  <rect x="20" y="280" width="330" height="36" fill="#FFF3E0" rx="18"/>
  <rect x="350" y="280" width="330" height="36" fill="#F3E5F5"/>
  <rect x="680" y="280" width="340" height="36" fill="#E3F2FD" rx="18"/>

  <text x="185" y="303" text-anchor="middle" font-size="15.2" font-weight="700" fill="#E65100">Scale Analysis</text>
  <text x="515" y="303" text-anchor="middle" font-size="15.2" font-weight="700" fill="#7B1FA2">Coordinate techniques</text>
  <text x="850" y="303" text-anchor="middle" font-size="15.2" font-weight="700" fill="#1565C0">Prove exploitability</text>

  <path d="M 340 298 L 360 298" stroke="#888" stroke-width="2.5" fill="none" marker-end="url(#arrContrib)"/>
  <path d="M 670 298 L 690 298" stroke="#888" stroke-width="2.5" fill="none" marker-end="url(#arrContrib)"/>

</svg>

???

Let me summarize the three contributions. Operation Mango scales firmware vulnerability detection to every binary in a firmware image, achieving 27 times better coverage than prior work, with 166 exploitable vulnerabilities found. It's published and peer-reviewed at USENIX Security.

Artiphishell demonstrates that the full vulnerability lifecycle is automatable: detection, root cause analysis, patch synthesis, and verification all working together autonomously for 143 hours with zero human intervention. It found 7 zero-day vulnerabilities in real open-source software.

The proposed work, PEACH, bridges the detection-confirmation gap. It takes Mango's static candidates and validates them with concrete triggering inputs, providing the formal proof vendors require. Preliminary results have already produced one zero-day.

Together, these three projects cover the full detection-to-confirmation cycle. Scan everything. Coordinate techniques. Prove exploitability.
