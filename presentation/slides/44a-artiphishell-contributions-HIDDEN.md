---
type: content
title: "Dissertation Contributions from Artiphishell"
hidden: True
---

<svg viewBox="0 0 1050 365" style="width:100%; margin:0 auto; display:block;" xmlns="http://www.w3.org/2000/svg">

  <!-- Header -->
  <text x="525" y="30" text-anchor="middle" font-size="19.4" font-weight="700" fill="#333" font-family="Inter, sans-serif">What this dissertation claims from Artiphishell</text>

  <!-- Contribution 1: System Architecture -->
  <rect x="50" y="55" width="950" height="75" rx="8" fill="#f3e5f5" stroke="#9C27B0" stroke-width="2"/>
  <circle cx="90" cy="92" r="20" fill="#9C27B0"/>
  <text x="90" y="98" text-anchor="middle" font-size="17.2" font-weight="bold" fill="white" font-family="Inter, sans-serif">1</text>
  <text x="125" y="82" font-size="17.2" font-weight="700" fill="#333" font-family="Inter, sans-serif">CRS Architecture Design</text>
  <text x="125" y="103" font-size="15.1" fill="#555" font-family="Inter, sans-serif">Designed the multi-technique coordination pipeline and Analysis Graph structure.</text>
  <text x="125" y="120" font-size="15.1" fill="#555" font-family="Inter, sans-serif">Led integration of fuzzing, static analysis, LLM scanning, and patching subsystems.</text>

  <!-- Contribution 2: DyVA -->
  <rect x="50" y="150" width="950" height="75" rx="8" fill="#f3e5f5" stroke="#9C27B0" stroke-width="2"/>
  <circle cx="90" cy="187" r="20" fill="#9C27B0"/>
  <text x="90" y="193" text-anchor="middle" font-size="17.2" font-weight="bold" fill="white" font-family="Inter, sans-serif">2</text>
  <text x="125" y="177" font-size="17.2" font-weight="700" fill="#333" font-family="Inter, sans-serif">DyVA: LLM-Directed Root Cause Analysis</text>
  <text x="125" y="198" font-size="15.1" fill="#555" font-family="Inter, sans-serif">Designed and built the triage agent that debugs crashes to identify root causes.</text>
  <text x="125" y="215" font-size="15.1" fill="#555" font-family="Inter, sans-serif">Produces structured CWE-classified reports that feed directly into patching.</text>

  <!-- Contribution 3: Multi-technique insight -->
  <rect x="50" y="245" width="950" height="75" rx="8" fill="#f3e5f5" stroke="#9C27B0" stroke-width="2"/>
  <circle cx="90" cy="282" r="20" fill="#9C27B0"/>
  <text x="90" y="288" text-anchor="middle" font-size="17.2" font-weight="bold" fill="white" font-family="Inter, sans-serif">3</text>
  <text x="125" y="272" font-size="17.2" font-weight="700" fill="#333" font-family="Inter, sans-serif">Multi-Technique Convergence Evidence</text>
  <text x="125" y="293" font-size="15.1" fill="#555" font-family="Inter, sans-serif">46% of vulnerabilities required multiple analysis techniques to discover.</text>
  <text x="125" y="310" font-size="15.1" fill="#555" font-family="Inter, sans-serif">Empirical validation that staged pipelines outperform any single technique.</text>

  <!-- Note -->
  <text x="525" y="365" text-anchor="middle" font-size="14" fill="#888" font-style="italic" font-family="Inter, sans-serif">Artiphishell is a team effort (Shellphish); contributions above are Wil's specific dissertation claims.</text>

</svg>

???

Artiphishell was a team project, so let me be precise about what this dissertation claims. Three contributions. First, the CRS architecture design: I led the design of the multi-technique coordination pipeline, the Analysis Graph structure that routes findings between subsystems, and the integration of fuzzing, static analysis, LLM scanning, and patching. Second, DyVA, the LLM-directed root cause analysis agent. I designed and built the triage system that takes a crashing input and debugs it to identify the specific code defect, producing structured CWE-classified reports that feed directly into the patching pipeline. Third, the empirical evidence for multi-technique convergence. 46% of vulnerabilities required multiple analysis techniques to discover. That result validates the core thesis argument: staged pipelines where each technique compensates for others' weaknesses produce broader coverage than any single approach.
