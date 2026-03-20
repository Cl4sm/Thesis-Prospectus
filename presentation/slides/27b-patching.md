---
type: content
title: "Patch Generation & Verification"
---

<svg viewBox="0 0 1000 280" style="width:100%; margin:0 auto; display:block;" xmlns="http://www.w3.org/2000/svg">
  <!-- Flow containers -->
  <rect x="20" y="100" width="140" height="80" fill="#f5f5f5" stroke="#333" stroke-width="2" rx="8"/>
  <rect x="190" y="60" width="140" height="160" fill="#f5f5f5" stroke="#333" stroke-width="2" rx="8"/>
  <rect x="370" y="100" width="140" height="80" fill="#f5f5f5" stroke="#333" stroke-width="2" rx="8"/>
  <rect x="540" y="20" width="160" height="240" fill="#f5f5f5" stroke="#333" stroke-width="2" rx="8"/>
  <rect x="750" y="100" width="140" height="80" fill="#f5f5f5" stroke="#333" stroke-width="2" rx="8"/>

  <!-- Input: Root Cause Report -->
  <text x="90" y="145" font-size="12" font-weight="bold" text-anchor="middle">Root Cause</text>
  <text x="90" y="162" font-size="12" font-weight="bold" text-anchor="middle">Report</text>

  <!-- ProgrammerLLM -->
  <rect x="200" y="85" width="120" height="50" fill="#8C1D40" stroke="#5C0E1F" stroke-width="2" rx="4"/>
  <text x="260" y="115" font-size="12" font-weight="bold" text-anchor="middle" fill="white">ProgrammerLLM</text>

  <!-- Tool calls indicator -->
  <circle cx="260" cy="130" r="4" fill="#FFD700"/>
  <circle cx="252" cy="135" r="4" fill="#FFD700"/>
  <circle cx="268" cy="135" r="4" fill="#FFD700"/>

  <!-- Source Code (sub-component of ProgrammerLLM) -->
  <rect x="205" y="155" width="110" height="35" fill="#f0e6e8" stroke="#8C1D40" stroke-width="1" rx="3"/>
  <text x="260" y="176" font-size="10" text-anchor="middle">Source Files</text>

  <!-- Candidate Patch -->
  <text x="440" y="145" font-size="12" font-weight="bold" text-anchor="middle">Candidate</text>
  <text x="440" y="162" font-size="12" font-weight="bold" text-anchor="middle">Patch</text>

  <!-- Verification Loop -->
  <rect x="555" y="50" width="130" height="50" fill="#f0e6e8" stroke="#8C1D40" stroke-width="1.5" rx="4"/>
  <text x="620" y="80" font-size="11" text-anchor="middle">Compile Check</text>

  <rect x="555" y="125" width="130" height="50" fill="#f0e6e8" stroke="#8C1D40" stroke-width="1.5" rx="4"/>
  <text x="620" y="150" font-size="10" text-anchor="middle">PoV Regression</text>

  <rect x="555" y="200" width="130" height="50" fill="#f0e6e8" stroke="#8C1D40" stroke-width="1.5" rx="4"/>
  <text x="620" y="225" font-size="10" text-anchor="middle">Test Suite</text>

  <!-- Output: Verified Patch -->
  <text x="820" y="145" font-size="12" font-weight="bold" text-anchor="middle">Verified</text>
  <text x="820" y="162" font-size="12" font-weight="bold" text-anchor="middle">Patch</text>

  <!-- Arrows -->
  <defs>
    <marker id="arrowMaroon" markerWidth="10" markerHeight="10" refX="9" refY="3" orient="auto" markerUnits="strokeWidth">
      <path d="M0,0 L0,6 L9,3 z" fill="#8C1D40"/>
    </marker>
    <marker id="arrowLoop" markerWidth="10" markerHeight="10" refX="9" refY="3" orient="auto" markerUnits="strokeWidth">
      <path d="M0,0 L0,6 L9,3 z" fill="#D32F2F"/>
    </marker>
  </defs>

  <!-- Main flow -->
  <line x1="160" y1="140" x2="200" y2="110" stroke="#8C1D40" stroke-width="2.5" marker-end="url(#arrowMaroon)"/>
  <line x1="320" y1="110" x2="370" y2="140" stroke="#8C1D40" stroke-width="2.5" marker-end="url(#arrowMaroon)"/>
  <line x1="510" y1="140" x2="540" y2="140" stroke="#8C1D40" stroke-width="2.5" marker-end="url(#arrowMaroon)"/>
  <line x1="700" y1="140" x2="750" y2="140" stroke="#8C1D40" stroke-width="2.5" marker-end="url(#arrowMaroon)"/>

  <!-- Feedback loop from verification to ProgrammerLLM -->
  <path d="M 555,165 Q 390,250 260,160" stroke="#D32F2F" stroke-width="2" fill="none" stroke-dasharray="5,5" marker-end="url(#arrowLoop)"/>
  <text x="380" y="265" font-size="10" fill="#D32F2F">Critic Feedback</text>
</svg>

???

Patching is where everything comes together. The ProgrammerLLM receives the root cause report from DyVA and generates a candidate fix. It has tool access: it can read source files, check related code, and examine the vulnerability context before writing the patch. Each candidate goes through a three-stage verification loop. First, compilation. If the patch introduces syntax errors or type mismatches, it fails immediately. Second, PoV regression. The original crashing input must no longer trigger the vulnerability. Third, the full test suite. The patch must preserve existing functionality. If any check fails, a critic LLM analyzes the failure and provides feedback. The ProgrammerLLM uses that feedback to refine the patch. This loop continues until verification passes. Across the competition, Artiphishell achieved 95% or higher patch accuracy, the highest among all seven finalist CRS teams.
