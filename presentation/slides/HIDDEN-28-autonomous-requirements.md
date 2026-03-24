---
type: content
title: "What 'Autonomous' Means"
hidden: true
---

<svg viewBox="0 0 1100 380" style="width:100%; margin:0 auto; display:block;" xmlns="http://www.w3.org/2000/svg">
  <!-- Background -->
  <rect width="1100" height="380" fill="#fafafa"/>

  <!-- Top annotation: highlighted bar -->
  <rect x="0" y="0" width="1100" height="60" fill="#8C1D40"/>
  <text x="550" y="42" font-size="32" font-weight="900" text-anchor="middle" fill="white" font-family="Inter, sans-serif">143 hours. Zero human intervention.</text>

  <!-- Phase 1: Scanning -->
  <rect x="20" y="90" width="195" height="120" rx="6" fill="#2196F3" opacity="0.9"/>
  <text x="117.5" y="130" font-size="15" font-weight="bold" text-anchor="middle" fill="white" font-family="Inter, sans-serif">Full Scan</text>
  <text x="117.5" y="150" font-size="15" font-weight="bold" text-anchor="middle" fill="white" font-family="Inter, sans-serif">Delta Scan</text>
  <text x="117.5" y="178" font-size="13" text-anchor="middle" fill="white" opacity="0.9" font-family="Inter, sans-serif">Detect</text>

  <!-- Arrow marker definition -->
  <defs>
    <marker id="arrowhead" markerWidth="10" markerHeight="10" refX="9" refY="3" orient="auto">
      <polygon points="0 0, 10 3, 0 6" fill="#333"/>
    </marker>
  </defs>

  <!-- Arrow 1 -->
  <path d="M 215 150 L 250 150" stroke="#333" stroke-width="2.5" fill="none" marker-end="url(#arrowhead)"/>

  <!-- Phase 2: PoV Generation -->
  <rect x="255" y="90" width="195" height="120" rx="6" fill="#FF9800" opacity="0.9"/>
  <text x="352.5" y="130" font-size="15" font-weight="bold" text-anchor="middle" fill="white" font-family="Inter, sans-serif">PoV</text>
  <text x="352.5" y="150" font-size="15" font-weight="bold" text-anchor="middle" fill="white" font-family="Inter, sans-serif">Generation</text>
  <text x="352.5" y="178" font-size="13" text-anchor="middle" fill="white" opacity="0.9" font-family="Inter, sans-serif">Exploit</text>

  <!-- Arrow 2 -->
  <path d="M 450 150 L 485 150" stroke="#333" stroke-width="2.5" fill="none" marker-end="url(#arrowhead)"/>

  <!-- Phase 3: Patching -->
  <rect x="490" y="90" width="195" height="120" rx="6" fill="#4CAF50" opacity="0.9"/>
  <text x="587.5" y="130" font-size="15" font-weight="bold" text-anchor="middle" fill="white" font-family="Inter, sans-serif">Patch</text>
  <text x="587.5" y="150" font-size="15" font-weight="bold" text-anchor="middle" fill="white" font-family="Inter, sans-serif">Verify</text>
  <text x="587.5" y="178" font-size="13" text-anchor="middle" fill="white" opacity="0.9" font-family="Inter, sans-serif">Fix</text>

  <!-- Arrow 3 -->
  <path d="M 685 150 L 720 150" stroke="#333" stroke-width="2.5" fill="none" marker-end="url(#arrowhead)"/>

  <!-- Phase 4: Bundle -->
  <rect x="725" y="90" width="195" height="120" rx="6" fill="#9C27B0" opacity="0.9"/>
  <text x="822.5" y="130" font-size="15" font-weight="bold" text-anchor="middle" fill="white" font-family="Inter, sans-serif">Bundle</text>
  <text x="822.5" y="150" font-size="15" font-weight="bold" text-anchor="middle" fill="white" font-family="Inter, sans-serif">Submit</text>
  <text x="822.5" y="178" font-size="13" text-anchor="middle" fill="white" opacity="0.9" font-family="Inter, sans-serif">Deliver</text>

  <!-- Bottom note: Resource Constraints -->
  <rect x="30" y="240" width="1040" height="110" rx="6" fill="#E3F2FD" stroke="#2196F3" stroke-width="1.5"/>
  <text x="50" y="273" font-size="15" text-anchor="start" fill="#1565C0" font-weight="bold" font-family="Inter, sans-serif">Resource Constraints:</text>
  <text x="50" y="298" font-size="13" text-anchor="start" fill="#333" font-family="Inter, sans-serif">8-hour delta rounds, 12-hour full rounds, $50K LLM credits, $80K Azure credits, 143 hours autonomous</text>
  <text x="50" y="323" font-size="13" text-anchor="start" fill="#333" font-family="Inter, sans-serif">Time-bounded design forced every architectural decision</text>
</svg>

???

The Cyber Reasoning System must perform three tasks autonomously. First, scan the codebase and identify vulnerabilities across both full and delta modes. Second, generate proof-of-concept exploits that trigger each vulnerability. Third, produce patches that fix vulnerabilities without breaking functionality. Every submission is packaged into a bundle. The time constraint was severe: eight-hour delta rounds, twelve-hour full rounds, fifty thousand dollars in LLM credits, eighty thousand dollars in Azure compute, and 143 hours total autonomous operation. Every architectural decision was forced by these bounds. You cannot afford wasted computation. That constraint is why multi-technique coordination matters: independent confirmation from different analysis methods raises confidence before committing resources to expensive validation steps.
