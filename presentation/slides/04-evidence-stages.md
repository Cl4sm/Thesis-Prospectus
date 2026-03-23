---
type: content
title: "Staged Evidence: Achieving Both"
---

<svg viewBox="0 0 1000 420" style="width:100%; margin:0.5rem auto; display:block;" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <marker id="arrStage" markerWidth="10" markerHeight="10" refX="8" refY="3" orient="auto" markerUnits="strokeWidth">
      <path d="M0,0 L0,6 L9,3 z" fill="#8C1D40"/>
    </marker>
  </defs>

  <!-- Stage 1: Detection -->
  <g>
    <!-- Card -->
    <rect x="20" y="50" width="290" height="280" rx="10" fill="#e3f2fd" stroke="#2196F3" stroke-width="2.5"/>
    <!-- Header bar -->
    <rect x="20" y="50" width="290" height="45" rx="10" fill="#2196F3"/>
    <rect x="20" y="75" width="290" height="20" fill="#2196F3"/>
    <text x="165" y="80" text-anchor="middle" font-size="17" font-weight="700" fill="white" font-family="Inter, sans-serif">DETECTION</text>
    <!-- Goal -->
    <text x="165" y="120" text-anchor="middle" font-size="13" font-weight="600" fill="#1565C0" font-family="Inter, sans-serif">Goal: Capture all candidates</text>
    <!-- Dots: many, mixed colors (true + false positives) -->
    <g transform="translate(55, 140)">
      <!-- True positives (green) -->
      <circle cx="15" cy="10" r="8" fill="#4CAF50" opacity="0.7"/>
      <circle cx="55" cy="25" r="8" fill="#4CAF50" opacity="0.7"/>
      <circle cx="130" cy="15" r="8" fill="#4CAF50" opacity="0.7"/>
      <circle cx="95" cy="55" r="8" fill="#4CAF50" opacity="0.7"/>
      <circle cx="170" cy="50" r="8" fill="#4CAF50" opacity="0.7"/>
      <!-- False positives (red) -->
      <circle cx="40" cy="10" r="8" fill="#E53935" opacity="0.5"/>
      <circle cx="80" cy="20" r="8" fill="#E53935" opacity="0.5"/>
      <circle cx="155" cy="35" r="8" fill="#E53935" opacity="0.5"/>
      <circle cx="25" cy="45" r="8" fill="#E53935" opacity="0.5"/>
      <circle cx="110" cy="40" r="8" fill="#E53935" opacity="0.5"/>
      <circle cx="60" cy="55" r="8" fill="#E53935" opacity="0.5"/>
      <circle cx="140" cy="55" r="8" fill="#E53935" opacity="0.5"/>
      <circle cx="195" cy="20" r="8" fill="#E53935" opacity="0.5"/>
      <circle cx="195" cy="50" r="8" fill="#E53935" opacity="0.5"/>
    </g>
    <!-- Metric -->
    <rect x="50" y="265" width="210" height="40" rx="6" fill="white" stroke="#2196F3" stroke-width="1.5"/>
    <text x="165" y="282" text-anchor="middle" font-size="12" font-weight="700" fill="#1565C0" font-family="Inter, sans-serif">Recall (Completeness)</text>
    <text x="165" y="298" text-anchor="middle" font-size="11" fill="#555" font-family="Inter, sans-serif">Tolerate false positives to miss nothing</text>
  </g>

  <!-- Arrow 1→2 -->
  <path d="M 310 190 L 350 190" stroke="#8C1D40" stroke-width="3" fill="none" marker-end="url(#arrStage)"/>

  <!-- Stage 2: Validation -->
  <g>
    <!-- Card -->
    <rect x="355" y="50" width="290" height="280" rx="10" fill="#fff3e0" stroke="#FF9800" stroke-width="2.5"/>
    <!-- Header bar -->
    <rect x="355" y="50" width="290" height="45" rx="10" fill="#FF9800"/>
    <rect x="355" y="75" width="290" height="20" fill="#FF9800"/>
    <text x="500" y="80" text-anchor="middle" font-size="17" font-weight="700" fill="white" font-family="Inter, sans-serif">VALIDATION</text>
    <!-- Goal -->
    <text x="500" y="120" text-anchor="middle" font-size="13" font-weight="600" fill="#E65100" font-family="Inter, sans-serif">Goal: Eliminate false alarms</text>
    <!-- Dots: fewer, mostly green, some red being crossed out -->
    <g transform="translate(390, 140)">
      <!-- True positives (green, kept) -->
      <circle cx="30" cy="20" r="10" fill="#4CAF50" opacity="0.8"/>
      <circle cx="100" cy="15" r="10" fill="#4CAF50" opacity="0.8"/>
      <circle cx="65" cy="50" r="10" fill="#4CAF50" opacity="0.8"/>
      <circle cx="140" cy="40" r="10" fill="#4CAF50" opacity="0.8"/>
      <circle cx="180" cy="20" r="10" fill="#4CAF50" opacity="0.8"/>
      <!-- False positives being pruned (red, with strikethrough) -->
      <circle cx="60" cy="15" r="8" fill="#E53935" opacity="0.25"/>
      <line x1="52" y1="7" x2="68" y2="23" stroke="#E53935" stroke-width="2" opacity="0.6"/>
      <circle cx="150" cy="15" r="8" fill="#E53935" opacity="0.25"/>
      <line x1="142" y1="7" x2="158" y2="23" stroke="#E53935" stroke-width="2" opacity="0.6"/>
      <circle cx="110" cy="50" r="8" fill="#E53935" opacity="0.25"/>
      <line x1="102" y1="42" x2="118" y2="58" stroke="#E53935" stroke-width="2" opacity="0.6"/>
    </g>
    <!-- Metric -->
    <rect x="385" y="265" width="210" height="40" rx="6" fill="white" stroke="#FF9800" stroke-width="1.5"/>
    <text x="500" y="282" text-anchor="middle" font-size="12" font-weight="700" fill="#E65100" font-family="Inter, sans-serif">Precision (Accuracy)</text>
    <text x="500" y="298" text-anchor="middle" font-size="11" fill="#555" font-family="Inter, sans-serif">Corroborate and prune mercilessly</text>
  </g>

  <!-- Arrow 2→3 -->
  <path d="M 645 190 L 685 190" stroke="#8C1D40" stroke-width="3" fill="none" marker-end="url(#arrStage)"/>

  <!-- Stage 3: Confirmation -->
  <g>
    <!-- Card -->
    <rect x="690" y="50" width="290" height="280" rx="10" fill="#e8f5e9" stroke="#4CAF50" stroke-width="2.5"/>
    <!-- Header bar -->
    <rect x="690" y="50" width="290" height="45" rx="10" fill="#4CAF50"/>
    <rect x="690" y="75" width="290" height="20" fill="#4CAF50"/>
    <text x="835" y="80" text-anchor="middle" font-size="17" font-weight="700" fill="white" font-family="Inter, sans-serif">CONFIRMATION</text>
    <!-- Goal -->
    <text x="835" y="120" text-anchor="middle" font-size="13" font-weight="600" fill="#2E7D32" font-family="Inter, sans-serif">Goal: Produce proof</text>
    <!-- Dots: few, all green, with checkmarks -->
    <g transform="translate(725, 140)">
      <circle cx="40" cy="25" r="12" fill="#4CAF50" opacity="0.9"/>
      <text x="40" y="30" text-anchor="middle" font-size="12" fill="white" font-weight="bold">✓</text>
      <circle cx="110" cy="20" r="12" fill="#4CAF50" opacity="0.9"/>
      <text x="110" y="25" text-anchor="middle" font-size="12" fill="white" font-weight="bold">✓</text>
      <circle cx="75" cy="55" r="12" fill="#4CAF50" opacity="0.9"/>
      <text x="75" y="60" text-anchor="middle" font-size="12" fill="white" font-weight="bold">✓</text>
      <circle cx="155" cy="45" r="12" fill="#4CAF50" opacity="0.9"/>
      <text x="155" y="50" text-anchor="middle" font-size="12" fill="white" font-weight="bold">✓</text>
    </g>
    <!-- Metric -->
    <rect x="720" y="265" width="210" height="40" rx="6" fill="white" stroke="#4CAF50" stroke-width="1.5"/>
    <text x="835" y="282" text-anchor="middle" font-size="12" font-weight="700" fill="#2E7D32" font-family="Inter, sans-serif">Proof-of-Concept</text>
    <text x="835" y="298" text-anchor="middle" font-size="11" fill="#555" font-family="Inter, sans-serif">Concrete triggering input per vulnerability</text>
  </g>

  <!-- Bottom: Legend -->
  <circle cx="340" cy="375" r="7" fill="#4CAF50" opacity="0.7"/>
  <text x="355" y="380" font-size="12" fill="#555" font-family="Inter, sans-serif">True vulnerability</text>
  <circle cx="510" cy="375" r="7" fill="#E53935" opacity="0.5"/>
  <text x="525" y="380" font-size="12" fill="#555" font-family="Inter, sans-serif">False positive</text>

  <!-- Bottom: Key insight -->
  <text x="500" y="410" text-anchor="middle" font-size="14" font-weight="600" fill="#333" font-family="Inter, sans-serif" font-style="italic">Assign each metric to its own stage. Layer the stages in sequence.</text>
</svg>

???

You split the problem across stages, and each stage owns exactly one metric. Detection owns completeness. Its job is to sweep the entire codebase and flag every suspicious data flow, tolerating noise, because if a real vulnerability slips through here, no downstream tool recovers it. Validation owns accuracy. It takes that noisy candidate set and grinds it against independent evidence: data-flow history, control-flow feasibility, multi-technique agreement. Findings that survive get promoted. Everything else gets pruned. Confirmation owns proof. For each surviving candidate, you produce a concrete triggering input that forces the vulnerability to manifest. Vendors act on PoC exploits; they circular-file static analysis reports without them. A pipeline built this way lets each stage contribute its strength while the next stage compensates for its blind spots. Each of our 3 projects maps to one of these stages.
