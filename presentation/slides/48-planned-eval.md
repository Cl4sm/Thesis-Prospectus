---
type: content
title: "Planned Evaluation"
---

<svg viewBox="0 0 1050 440" style="width:100%; display:block; margin: 0 auto;" xmlns="http://www.w3.org/2000/svg">

  <!-- ===== Experiment 1 ===== -->
  <rect x="15" y="15" width="490" height="40" rx="10" fill="#e3f2fd"/>
  <rect x="15" y="45" width="490" height="10" fill="#e3f2fd"/>
  <rect x="15" y="15" width="490" height="190" rx="10" fill="#fafafa00" stroke="#2196F3" stroke-width="2"/>
  <text x="35" y="42" font-size="13" font-weight="700" fill="#1565C0" font-family="Inter, sans-serif">Experiment 1: Multi-Firmware Effectiveness</text>

  <!-- Firmware icons row -->
  <rect x="40" y="70" width="90" height="55" rx="4" fill="#fff" stroke="#ddd" stroke-width="1.5"/>
  <text x="85" y="92" font-size="10" font-weight="600" text-anchor="middle" fill="#333" font-family="Inter, sans-serif">Netgear</text>
  <text x="85" y="107" font-size="9" text-anchor="middle" fill="#2196F3" font-family="Inter, sans-serif">R7000, R6400</text>

  <rect x="145" y="70" width="90" height="55" rx="4" fill="#fff" stroke="#ddd" stroke-width="1.5"/>
  <text x="190" y="92" font-size="10" font-weight="600" text-anchor="middle" fill="#333" font-family="Inter, sans-serif">TP-Link</text>
  <text x="190" y="107" font-size="9" text-anchor="middle" fill="#2196F3" font-family="Inter, sans-serif">Archer series</text>

  <rect x="250" y="70" width="90" height="55" rx="4" fill="#fff" stroke="#ddd" stroke-width="1.5"/>
  <text x="295" y="92" font-size="10" font-weight="600" text-anchor="middle" fill="#333" font-family="Inter, sans-serif">D-Link</text>
  <text x="295" y="107" font-size="9" text-anchor="middle" fill="#2196F3" font-family="Inter, sans-serif">DIR series</text>

  <rect x="355" y="70" width="90" height="55" rx="4" fill="#fff" stroke="#ddd" stroke-width="1.5"/>
  <text x="400" y="92" font-size="10" font-weight="600" text-anchor="middle" fill="#333" font-family="Inter, sans-serif">Tenda</text>
  <text x="400" y="107" font-size="9" text-anchor="middle" fill="#2196F3" font-family="Inter, sans-serif">AC series</text>

  <!-- Description -->
  <text x="40" y="150" font-size="11" fill="#555" font-family="Inter, sans-serif">Expand validation across multiple vendors and architectures.</text>
  <text x="40" y="168" font-size="11" fill="#555" font-family="Inter, sans-serif">Responsible disclosure for all confirmed vulnerabilities.</text>
  <text x="40" y="186" font-size="11" font-weight="600" fill="#1565C0" font-family="Inter, sans-serif">Goal: demonstrate generalization beyond single target</text>

  <!-- ===== Experiment 2 ===== -->
  <rect x="535" y="15" width="490" height="40" rx="10" fill="#fff3e0"/>
  <rect x="535" y="45" width="490" height="10" fill="#fff3e0"/>
  <rect x="535" y="15" width="490" height="190" rx="10" fill="#fafafa00" stroke="#FF9800" stroke-width="2"/>
  <text x="555" y="42" font-size="13" font-weight="700" fill="#E65100" font-family="Inter, sans-serif">Experiment 2: Static Analysis Verification</text>

  <!-- Tool boxes -->
  <rect x="560" y="70" width="100" height="45" rx="4" fill="#fff3e0" stroke="#FF9800" stroke-width="1.5"/>
  <text x="610" y="97" font-size="11" font-weight="600" text-anchor="middle" fill="#E65100" font-family="Inter, sans-serif">Mango</text>

  <rect x="675" y="70" width="100" height="45" rx="4" fill="#e3f2fd" stroke="#2196F3" stroke-width="1.5"/>
  <text x="725" y="97" font-size="11" font-weight="600" text-anchor="middle" fill="#1565C0" font-family="Inter, sans-serif">SaTC</text>

  <rect x="790" y="70" width="100" height="45" rx="4" fill="#f3e5f5" stroke="#9C27B0" stroke-width="1.5"/>
  <text x="840" y="97" font-size="11" font-weight="600" text-anchor="middle" fill="#7B1FA2" font-family="Inter, sans-serif">Karonte</text>

  <!-- Arrow down to normalization -->
  <line x1="610" y1="115" x2="725" y2="138" stroke="#999" stroke-width="1"/>
  <line x1="725" y1="115" x2="725" y2="138" stroke="#999" stroke-width="1"/>
  <line x1="840" y1="115" x2="725" y2="138" stroke="#999" stroke-width="1"/>

  <rect x="660" y="138" width="130" height="28" rx="4" fill="#e8f5e9" stroke="#4CAF50" stroke-width="1.5"/>
  <text x="725" y="157" font-size="10" font-weight="600" text-anchor="middle" fill="#2E7D32" font-family="Inter, sans-serif">Normalization Layer</text>

  <!-- Description -->
  <text x="560" y="186" font-size="11" fill="#555" font-family="Inter, sans-serif">Test normalization layer against different upstream tools.</text>
  <text x="560" y="198" font-size="11" font-weight="600" fill="#E65100" font-family="Inter, sans-serif">Goal: tool-agnostic validation</text>

  <!-- ===== Experiment 3 ===== -->
  <rect x="15" y="230" width="490" height="40" rx="10" fill="#f3e5f5"/>
  <rect x="15" y="260" width="490" height="10" fill="#f3e5f5"/>
  <rect x="15" y="230" width="490" height="190" rx="10" fill="#fafafa00" stroke="#9C27B0" stroke-width="2"/>
  <text x="35" y="257" font-size="13" font-weight="700" fill="#7B1FA2" font-family="Inter, sans-serif">Experiment 3: LLM Ablation Study</text>

  <!-- Two columns: with LLM vs without -->
  <rect x="40" y="285" width="190" height="90" rx="6" fill="#fff" stroke="#9C27B0" stroke-width="1.5"/>
  <text x="135" y="305" font-size="11" font-weight="700" text-anchor="middle" fill="#7B1FA2" font-family="Inter, sans-serif">With LLM</text>
  <line x1="55" y1="312" x2="215" y2="312" stroke="#e0e0e0" stroke-width="1"/>
  <text x="135" y="332" font-size="10" text-anchor="middle" fill="#555" font-family="Inter, sans-serif">Handler analysis</text>
  <text x="135" y="348" font-size="10" text-anchor="middle" fill="#555" font-family="Inter, sans-serif">PostFix retry with feedback</text>
  <text x="135" y="364" font-size="10" text-anchor="middle" fill="#555" font-family="Inter, sans-serif">Branch hint generation</text>

  <text x="260" y="340" font-size="16" font-weight="700" fill="#555" font-family="Inter, sans-serif">vs</text>

  <rect x="290" y="285" width="190" height="90" rx="6" fill="#fff" stroke="#999" stroke-width="1.5"/>
  <text x="385" y="305" font-size="11" font-weight="700" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">Without LLM</text>
  <line x1="305" y1="312" x2="465" y2="312" stroke="#e0e0e0" stroke-width="1"/>
  <text x="385" y="332" font-size="10" text-anchor="middle" fill="#555" font-family="Inter, sans-serif">Static extraction only</text>
  <text x="385" y="348" font-size="10" text-anchor="middle" fill="#555" font-family="Inter, sans-serif">Deterministic retry</text>
  <text x="385" y="364" font-size="10" text-anchor="middle" fill="#555" font-family="Inter, sans-serif">No environmental hints</text>

  <!-- Description -->
  <text x="40" y="400" font-size="11" font-weight="600" fill="#7B1FA2" font-family="Inter, sans-serif">Goal: quantify LLM contribution vs. cost</text>

  <!-- ===== PEACH Branding ===== -->
  <rect x="535" y="230" width="490" height="190" rx="14" fill="#fdf6f0" stroke="#e8c4a0" stroke-width="1.5" stroke-dasharray="6,4"/>

  <!-- SVG Peach fruit -->
  <g transform="translate(690, 270)">
    <!-- Leaf -->
    <ellipse cx="12" cy="-8" rx="14" ry="6" fill="#66BB6A" transform="rotate(-30 12 -8)"/>
    <line x1="0" y1="0" x2="12" y2="-8" stroke="#43A047" stroke-width="2" stroke-linecap="round"/>
    <!-- Peach body -->
    <ellipse cx="0" cy="18" rx="28" ry="26" fill="#FFAB91"/>
    <ellipse cx="-6" cy="14" rx="18" ry="20" fill="#FF8A65" opacity="0.5"/>
    <!-- Crease -->
    <path d="M 0,-8 Q -4,18 0,44" stroke="#E64A19" stroke-width="1.5" fill="none" opacity="0.4"/>
    <!-- Highlight -->
    <ellipse cx="10" cy="8" rx="8" ry="10" fill="#FFCCBC" opacity="0.5"/>
  </g>

  <!-- SVG Lab flask -->
  <g transform="translate(830, 268)">
    <!-- Flask neck -->
    <rect x="-6" y="-10" width="12" height="18" rx="2" fill="#e0e0e0" stroke="#999" stroke-width="1.2"/>
    <!-- Flask body -->
    <path d="M -6,8 L -22,36 Q -24,42 -18,44 L 18,44 Q 24,42 22,36 L 6,8 Z" fill="#e3f2fd" stroke="#999" stroke-width="1.2"/>
    <!-- Liquid -->
    <path d="M -16,30 Q -18,42 -14,42 L 14,42 Q 18,42 16,30 Z" fill="#81D4FA" opacity="0.7"/>
    <!-- Bubbles -->
    <circle cx="-4" cy="34" r="2.5" fill="#B3E5FC"/>
    <circle cx="6" cy="30" r="1.8" fill="#B3E5FC"/>
    <!-- Cork/rim -->
    <rect x="-8" y="-12" width="16" height="4" rx="1" fill="#bdbdbd" stroke="#999" stroke-width="0.8"/>
  </g>

  <text x="770" y="370" font-size="20" font-weight="700" text-anchor="middle" fill="#8C1D40" font-family="Inter, sans-serif">PEACH Experiments</text>
  <text x="770" y="393" font-size="13" text-anchor="middle" fill="#999" font-family="Inter, sans-serif">Proposed evaluation plan</text>

</svg>

???

The planned evaluation has three parts. First, we expand to multiple firmware images from different vendors: TP-Link, D-Link, others. This shows the approach generalizes beyond the R6400. We follow responsible disclosure throughout.

Second, we test the normalization layer against multiple static analyzers. Not just Mango, but SaTC and Karonte as well. This demonstrates that the system works with different upstream tools, not just one.

Third, we run an ablation study. We disable the LLM-directed concretization and re-run the validation. This shows how much the LLM contribution matters, and allows us to quantify the benefit versus the cost of running the LLM.
