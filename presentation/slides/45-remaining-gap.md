---
type: content
title: "The Remaining Gap"
---

<svg viewBox="0 0 1050 420" style="width:100%; margin:0 auto; display:block;" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <marker id="gap-arrow" markerWidth="10" markerHeight="8" refX="9" refY="4" orient="auto">
      <polygon points="0 0, 10 4, 0 8" fill="#8C1D40"/>
    </marker>
  </defs>

  <!-- Mango Card (left) -->
  <rect x="40" y="20" width="390" height="200" rx="10" fill="#FFF8E1" stroke="#FF9800" stroke-width="2.5"/>
  <rect x="40" y="20" width="390" height="48" rx="10" fill="#FF9800"/>
  <rect x="40" y="58" width="390" height="10" fill="#FF9800"/>
  <text x="235" y="52" font-size="20" font-weight="700" text-anchor="middle" fill="white" font-family="Inter, sans-serif">Operation Mango</text>

  <!-- Mango: check -->
  <circle cx="85" cy="105" r="14" fill="#E8F5E9" stroke="#4CAF50" stroke-width="2"/>
  <text x="85" y="111" font-size="16" font-weight="bold" text-anchor="middle" fill="#2E7D32">✓</text>
  <text x="110" y="111" font-size="15" fill="#333" font-family="Inter, sans-serif">Scalable binary-only detection</text>

  <!-- Mango: X -->
  <circle cx="85" cy="155" r="14" fill="#FFEBEE" stroke="#D32F2F" stroke-width="2"/>
  <text x="85" y="161" font-size="16" font-weight="bold" text-anchor="middle" fill="#D32F2F">✗</text>
  <text x="110" y="161" font-size="15" fill="#333" font-family="Inter, sans-serif">Candidates unvalidated</text>

  <!-- Mango: stat -->
  <text x="235" y="205" font-size="13" text-anchor="middle" fill="#888" font-family="Inter, sans-serif">10,834 alerts, no proof of reachability</text>

  <!-- Artiphishell Card (right) -->
  <rect x="620" y="20" width="390" height="200" rx="10" fill="#F3E5F5" stroke="#7B1FA2" stroke-width="2.5"/>
  <rect x="620" y="20" width="390" height="48" rx="10" fill="#7B1FA2"/>
  <rect x="620" y="58" width="390" height="10" fill="#7B1FA2"/>
  <text x="815" y="52" font-size="20" font-weight="700" text-anchor="middle" fill="white" font-family="Inter, sans-serif">Artiphishell</text>

  <!-- Artiphishell: check -->
  <circle cx="665" cy="105" r="14" fill="#E8F5E9" stroke="#4CAF50" stroke-width="2"/>
  <text x="665" y="111" font-size="16" font-weight="bold" text-anchor="middle" fill="#2E7D32">✓</text>
  <text x="690" y="111" font-size="15" fill="#333" font-family="Inter, sans-serif">Autonomous full lifecycle</text>

  <!-- Artiphishell: X -->
  <circle cx="665" cy="155" r="14" fill="#FFEBEE" stroke="#D32F2F" stroke-width="2"/>
  <text x="665" y="161" font-size="16" font-weight="bold" text-anchor="middle" fill="#D32F2F">✗</text>
  <text x="690" y="161" font-size="15" fill="#333" font-family="Inter, sans-serif">Requires source code</text>

  <!-- Artiphishell: stat -->
  <text x="815" y="205" font-size="13" text-anchor="middle" fill="#888" font-family="Inter, sans-serif">Full pipeline, but only with symbols and types</text>

  <!-- Center gap visual -->
  <line x1="525" y1="50" x2="525" y2="195" stroke="#ccc" stroke-width="1.5" stroke-dasharray="6,4"/>
  <text x="525" y="250" font-size="14" font-weight="600" text-anchor="middle" fill="#999" font-family="Inter, sans-serif">THE GAP</text>

  <!-- Downward arrows from both cards converging -->
  <line x1="235" y1="225" x2="400" y2="295" stroke="#8C1D40" stroke-width="2.5" marker-end="url(#gap-arrow)"/>
  <line x1="815" y1="225" x2="650" y2="295" stroke="#8C1D40" stroke-width="2.5" marker-end="url(#gap-arrow)"/>

  <!-- Bridge box -->
  <rect x="225" y="300" width="600" height="70" rx="10" fill="#8C1D40"/>
  <text x="525" y="332" font-size="20" font-weight="700" text-anchor="middle" fill="white" font-family="Inter, sans-serif">PEACH</text>
  <text x="525" y="358" font-size="15" text-anchor="middle" fill="rgba(255,255,255,0.8)" font-family="Inter, sans-serif">Binary-only validation of static analysis candidates</text>

  <!-- Bottom annotation -->
  <text x="525" y="408" font-size="13" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">Validate Mango's alerts with concrete triggering inputs, no source code required</text>
</svg>

???

Look at the two cards. On the left, Mango gives us scalable detection but no proof of reachability. On the right, Artiphishell proves the full lifecycle works but only with source code. The gap sits between them: 10,834 binary-only alerts with no concrete evidence of exploitability. PEACH bridges that gap. It takes Mango's static candidates and validates them with concrete triggering inputs, operating directly on stripped binaries. No source code required.
