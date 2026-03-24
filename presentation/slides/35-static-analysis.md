---
type: content
title: "Static Analysis Pipeline"
---

<svg viewBox="0 0 1050 330" style="width:100%; margin:0 auto; display:block;" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <marker id="sa-arr" markerWidth="8" markerHeight="8" refX="7" refY="3" orient="auto">
      <polygon points="0 0, 8 3, 0 6" fill="#333"/>
    </marker>
  </defs>

  <!-- Title band -->
  <rect x="30" y="10" width="990" height="45" rx="6" fill="#F3E5F5" stroke="#7B1FA2" stroke-width="2"/>
  <text x="525" y="42" font-size="21" font-weight="bold" text-anchor="middle" fill="#7B1FA2" font-family="Inter, sans-serif">Static Analysis: Filter and Coordinate</text>

  <!-- Stage 1: CodeQL + Semgrep -->
  <rect x="50" y="80" width="200" height="35" rx="8" fill="#e3f2fd"/>
  <rect x="50" y="80" width="200" height="120" rx="8" fill="#fafafa00" stroke="#2196F3" stroke-width="2"/>
  <text x="150" y="103" font-size="17.5" font-weight="bold" text-anchor="middle" fill="#1565C0" font-family="Inter, sans-serif">CodeQL + Semgrep</text>
  <line x1="50" x2="250" y1="115" y2="115" stroke="#2196F3" stroke-width="1"/>
  <text x="150" y="138" font-size="14" text-anchor="middle" fill="#333" font-family="Inter, sans-serif">Scans full codebase:</text>
  <text x="150" y="155" font-size="14" text-anchor="middle" fill="#333" font-family="Inter, sans-serif">Buffer overflows</text>
  <text x="150" y="172" font-size="14" text-anchor="middle" fill="#333" font-family="Inter, sans-serif">injection flaws,</text>
  <text x="150" y="189" font-size="14" text-anchor="middle" fill="#333" font-family="Inter, sans-serif">use-after-free patterns</text>

  <!-- Arrow 1 -->
  <path d="M 250 140 L 290 140" stroke="#333" stroke-width="2.5" fill="none" marker-end="url(#sa-arr)"/>

  <!-- Stage 2: LLuMinar -->
  <rect x="300" y="80" width="200" height="35" rx="8" fill="#fff3e0"/>
  <rect x="300" y="80" width="200" height="120" rx="8" fill="#fafafa00" stroke="#FF9800" stroke-width="2"/>
  <text x="400" y="103" font-size="17.5" font-weight="bold" text-anchor="middle" fill="#E65100" font-family="Inter, sans-serif">LLuMinar</text>
  <line x1="300" x2="500" y1="115" y2="115" stroke="#FF9800" stroke-width="1"/>
  <text x="400" y="138" font-size="14" text-anchor="middle" fill="#333" font-family="Inter, sans-serif">Fine-tuned on Qwen 2.5:</text>
  <text x="400" y="155" font-size="14" text-anchor="middle" fill="#333" font-family="Inter, sans-serif">Surfaces vulnerable code</text>
  <text x="400" y="172" font-size="14" text-anchor="middle" fill="#333" font-family="Inter, sans-serif">patterns in SAST output</text>

  <!-- Arrow 2 -->
  <path d="M 500 140 L 540 140" stroke="#333" stroke-width="2.5" fill="none" marker-end="url(#sa-arr)"/>

  <!-- Stage 3: Analysis Graph POIs -->
  <rect x="550" y="80" width="200" height="35" rx="8" fill="#e8f5e9"/>
  <rect x="550" y="80" width="200" height="120" rx="8" fill="#fafafa00" stroke="#4CAF50" stroke-width="2"/>
  <text x="650" y="103" font-size="17.5" font-weight="bold" text-anchor="middle" fill="#2E7D32" font-family="Inter, sans-serif">Analysis Graph POIs</text>
  <line x1="550" x2="750" y1="115" y2="115" stroke="#4CAF50" stroke-width="1"/>
  <text x="650" y="138" font-size="14" text-anchor="middle" fill="#333" font-family="Inter, sans-serif">Confirmed warnings:</text>
  <text x="650" y="155" font-size="14" text-anchor="middle" fill="#333" font-family="Inter, sans-serif">Create Points of Interest for</text>
  <text x="650" y="172" font-size="14" text-anchor="middle" fill="#333" font-family="Inter, sans-serif">cross-technique coordination</text>

  <!-- Arrow 3 -->
  <path d="M 750 140 L 790 140" stroke="#333" stroke-width="2.5" fill="none" marker-end="url(#sa-arr)"/>

  <!-- Stage 4: Directed Fuzzing -->
  <rect x="800" y="80" width="220" height="35" rx="8" fill="#fce4ec"/>
  <rect x="800" y="80" width="220" height="120" rx="8" fill="#fafafa00" stroke="#8C1D40" stroke-width="2"/>
  <text x="910" y="103" font-size="17.5" font-weight="bold" text-anchor="middle" fill="#8C1D40" font-family="Inter, sans-serif">CodeSwipe</text>
  <line x1="800" x2="1020" y1="115" y2="115" stroke="#8C1D40" stroke-width="1"/>
  <text x="910" y="138" font-size="14" text-anchor="middle" fill="#333" font-family="Inter, sans-serif">Heuristic ranked PoIs</text>
  <text x="910" y="155" font-size="14" text-anchor="middle" fill="#333" font-family="Inter, sans-serif">for future analyses with</text>
  <text x="910" y="172" font-size="14" text-anchor="middle" fill="#333" font-family="Inter, sans-serif">combined confidence of</text>
  <text x="910" y="189" font-size="14" text-anchor="middle" fill="#333" font-family="Inter, sans-serif">prior static results</text>

  <!-- Bottom insight -->
  <rect x="50" y="240" width="970" height="80" rx="6" fill="#f5f5f5" stroke="#666" stroke-width="1"/>
  <text x="525" y="270" font-size="16.3" font-weight="bold" text-anchor="middle" fill="#333" font-family="Inter, sans-serif">Static analysis guides dynamic testing, dynamic testing validates static findings</text>
  <text x="525" y="295" font-size="14" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">Feedback loop prevents overfitting and directs fuzzer effort toward the most likely bugs</text>
</svg>

???

Static analysis runs CodeQL and Semgrep across the full codebase. The results are raw and noisy: many warnings are false positives. LLuMinar, a fine-tuned model on Qwen 2.5, evaluates each warning against surrounding code context and surfaces patterns that match real vulnerabilities, filtering out likely false positives. Surviving warnings enter the Analysis Graph as Points of Interest. Those POIs coordinate across techniques: static analysis can identify suspicious code patterns, but it cannot prove reachability. Fuzzing can trigger crashes, but it explores slowly without guidance. Dynamic analysis consumes those POIs and directs fuzzer effort toward flagged locations. Static analysis tells the fuzzer where to look. The fuzzer confirms whether the warning is real and demonstrates how to trigger it. This tight coordination between static and dynamic analysis prevents the overfitting that plagues static-only tools and the inefficient exploration of undirected fuzzing.
