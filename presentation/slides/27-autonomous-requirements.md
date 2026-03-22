---
type: content
title: "What 'Autonomous' Means"
---

<svg viewBox="0 0 1000 300" style="width:100%; margin:0 auto; display:block;" xmlns="http://www.w3.org/2000/svg">
  <!-- Background -->
  <rect width="1000" height="300" fill="#fafafa"/>

  <!-- Phase 1: Scanning -->
  <rect x="30" y="80" width="140" height="80" rx="4" fill="#2196F3" opacity="0.9"/>
  <text x="100" y="110" font-size="13" font-weight="bold" text-anchor="middle" fill="white">Full Scan</text>
  <text x="100" y="128" font-size="13" font-weight="bold" text-anchor="middle" fill="white">Delta Scan</text>
  <text x="100" y="145" font-size="13" text-anchor="middle" fill="white" opacity="0.9">Detect</text>

  <!-- Arrow 1 -->
  <path d="M 170 120 L 210 120" stroke="#333" stroke-width="2" fill="none" marker-end="url(#arrowhead)"/>

  <!-- Phase 2: PoV Generation -->
  <rect x="210" y="80" width="140" height="80" rx="4" fill="#FF9800" opacity="0.9"/>
  <text x="280" y="110" font-size="13" font-weight="bold" text-anchor="middle" fill="white">PoV</text>
  <text x="280" y="128" font-size="13" font-weight="bold" text-anchor="middle" fill="white">Generation</text>
  <text x="280" y="145" font-size="13" text-anchor="middle" fill="white" opacity="0.9">Exploit</text>

  <!-- Arrow 2 -->
  <path d="M 350 120 L 390 120" stroke="#333" stroke-width="2" fill="none" marker-end="url(#arrowhead)"/>

  <!-- Phase 3: Patching -->
  <rect x="390" y="80" width="140" height="80" rx="4" fill="#4CAF50" opacity="0.9"/>
  <text x="460" y="110" font-size="13" font-weight="bold" text-anchor="middle" fill="white">Patch</text>
  <text x="460" y="128" font-size="13" font-weight="bold" text-anchor="middle" fill="white">Verify</text>
  <text x="460" y="145" font-size="13" text-anchor="middle" fill="white" opacity="0.9">Fix</text>

  <!-- Arrow 3 -->
  <path d="M 530 120 L 570 120" stroke="#333" stroke-width="2" fill="none" marker-end="url(#arrowhead)"/>

  <!-- Phase 4: Bundle -->
  <rect x="570" y="80" width="140" height="80" rx="4" fill="#9C27B0" opacity="0.9"/>
  <text x="640" y="110" font-size="13" font-weight="bold" text-anchor="middle" fill="white">Bundle</text>
  <text x="640" y="128" font-size="13" font-weight="bold" text-anchor="middle" fill="white">SARIF</text>
  <text x="640" y="145" font-size="13" text-anchor="middle" fill="white" opacity="0.9">Submit</text>

  <!-- Scoring penalty note -->
  <rect x="750" y="80" width="220" height="80" rx="4" fill="#F44336" opacity="0.15" stroke="#F44336" stroke-width="2"/>
  <text x="860" y="110" font-size="13" font-weight="bold" text-anchor="middle" fill="#C62828">Accuracy Penalty</text>
  <text x="860" y="130" font-size="12" text-anchor="middle" fill="#C62828">4th-power cost</text>
  <text x="860" y="145" font-size="12" text-anchor="middle" fill="#C62828">on false positives</text>

  <!-- Arrow marker definition -->
  <defs>
    <marker id="arrowhead" markerWidth="10" markerHeight="10" refX="9" refY="3" orient="auto">
      <polygon points="0 0, 10 3, 0 6" fill="#333"/>
    </marker>
  </defs>

  <!-- Bottom note -->
  <rect x="30" y="200" width="940" height="70" rx="4" fill="#E3F2FD" stroke="#2196F3" stroke-width="1"/>
  <text x="50" y="225" font-size="14" text-anchor="start" fill="#1565C0" font-weight="bold">Requirement:</text>
  <text x="50" y="242" font-size="12" text-anchor="start" fill="#333">All three phases must complete successfully for submission. One false positive costs substantially.</text>
  <text x="50" y="257" font-size="12" text-anchor="start" fill="#333">Two false positives nearly eliminate ranking. Multi-technique coordination validates findings before committing.</text>
</svg>

???

The Cyber Reasoning System must perform three tasks autonomously. First, scan the codebase and identify vulnerabilities. This includes both full scanning and delta scanning for incremental changes. Second, generate proof-of-concept exploits that trigger each vulnerability. This PoV must be reproducible and correct. Third, produce a patch that fixes the vulnerability without breaking existing functionality. A patch that introduces new problems is useless. Every submission is packaged into a bundle with structured metadata in SARIF report format. The scoring model imposes a fourth-power accuracy penalty. One bad submission costs you. Two bad submissions nearly eliminates you. This penalizes shotgun approaches and rewards systems that validate findings before submitting. You cannot afford false positives. That constraint is why multi-technique coordination matters: independent confirmation from different analysis methods raises confidence before submission.
