---
type: content
title: "Mango: Alert Ablation"
---

<svg viewBox="0 0 1050 440" style="width:100%; margin:0 auto; display:block;" xmlns="http://www.w3.org/2000/svg">

  <!-- Legend -->
  <rect x="370" y="15" width="16" height="16" rx="3" fill="#ddd" stroke="#bbb" stroke-width="1"/>
  <text x="392" y="28" font-size="15.1" fill="#555" font-family="Inter, sans-serif">False Positive</text>
  <rect x="510" y="15" width="16" height="16" rx="3" fill="#c07090" stroke="#8C1D40" stroke-width="1"/>
  <text x="532" y="28" font-size="15.1" fill="#555" font-family="Inter, sans-serif">True Positive</text>

  <!-- Y-axis: # of Alerts -->
  <text x="68" y="225" font-size="17.2" font-weight="700" fill="#333" font-family="Inter, sans-serif" text-anchor="middle" transform="rotate(-90, 68, 225)"># of Alerts</text>

  <!-- Y-axis line -->
  <line x1="120" y1="50" x2="120" y2="360" stroke="#ddd" stroke-width="1.5"/>
  <!-- X-axis line -->
  <line x1="120" y1="360" x2="980" y2="360" stroke="#ddd" stroke-width="1.5"/>

  <!-- Y-axis gridlines and ticks. Scale: 0-22, chart height=310px, 1 unit=14.1px -->
  <text x="108" y="364" font-size="14" text-anchor="end" fill="#888" font-family="Inter, sans-serif">0</text>

  <line x1="120" y1="289" x2="980" y2="289" stroke="#f0f0f0" stroke-width="0.8"/>
  <text x="108" y="293" font-size="14" text-anchor="end" fill="#888" font-family="Inter, sans-serif">5</text>

  <line x1="120" y1="219" x2="980" y2="219" stroke="#f0f0f0" stroke-width="0.8"/>
  <text x="108" y="223" font-size="14" text-anchor="end" fill="#888" font-family="Inter, sans-serif">10</text>

  <line x1="120" y1="148" x2="980" y2="148" stroke="#f0f0f0" stroke-width="0.8"/>
  <text x="108" y="152" font-size="14" text-anchor="end" fill="#888" font-family="Inter, sans-serif">15</text>

  <line x1="120" y1="78" x2="980" y2="78" stroke="#f0f0f0" stroke-width="0.8"/>
  <text x="108" y="82" font-size="14" text-anchor="end" fill="#888" font-family="Inter, sans-serif">20</text>

  <!-- 1 unit = 14.1px. Bar bottom at y=360. Bar width=140, gap=60. -->
  <!-- 4 bars: centers at x=230, x=430, x=630, x=830 -->

  <!-- Group 1: No Modifications — 1 TP, 7 FP (total 8) -->
  <!-- FP: 7 * 14.1 = 98.7px -->
  <rect x="160" y="261" width="140" height="99" rx="0" fill="#ddd" stroke="#bbb" stroke-width="1"/>
  <text x="230" y="318" font-size="19.4" font-weight="700" text-anchor="middle" fill="#555" font-family="Inter, sans-serif">7</text>
  <!-- TP: 1 * 14.1 = 14.1px -->
  <rect x="160" y="247" width="140" height="14" fill="#c07090" stroke="#8C1D40" stroke-width="1"/>
  <text x="230" y="242" font-size="17.2" font-weight="700" text-anchor="middle" fill="#8C1D40" font-family="Inter, sans-serif">1</text>
  <!-- Label -->
  <text x="230" y="390" font-size="15.1" text-anchor="middle" fill="#333" font-family="Inter, sans-serif">No Modifications</text>

  <!-- Group 2: Sink-to-Source — 5 TP, 8 FP (total 13) -->
  <!-- FP: 8 * 14.1 = 112.8px -->
  <rect x="360" y="247" width="140" height="113" rx="0" fill="#ddd" stroke="#bbb" stroke-width="1"/>
  <text x="430" y="312" font-size="19.4" font-weight="700" text-anchor="middle" fill="#555" font-family="Inter, sans-serif">8</text>
  <!-- TP: 5 * 14.1 = 70.5px -->
  <rect x="360" y="177" width="140" height="70" fill="#c07090" stroke="#8C1D40" stroke-width="1"/>
  <text x="430" y="218" font-size="19.4" font-weight="700" text-anchor="middle" fill="#fff" font-family="Inter, sans-serif">5</text>
  <!-- Label -->
  <text x="430" y="390" font-size="15.1" text-anchor="middle" fill="#333" font-family="Inter, sans-serif">Sink-to-Source</text>

  <!-- Group 3: Assumed Nonimpact — 9 TP, 12 FP (total 21) -->
  <!-- FP: 12 * 14.1 = 169.2px -->
  <rect x="560" y="191" width="140" height="169" rx="0" fill="#ddd" stroke="#bbb" stroke-width="1"/>
  <text x="630" y="284" font-size="19.4" font-weight="700" text-anchor="middle" fill="#555" font-family="Inter, sans-serif">12</text>
  <!-- TP: 9 * 14.1 = 126.9px -->
  <rect x="560" y="64" width="140" height="127" fill="#c07090" stroke="#8C1D40" stroke-width="1"/>
  <text x="630" y="135" font-size="19.4" font-weight="700" text-anchor="middle" fill="#fff" font-family="Inter, sans-serif">9</text>
  <!-- Label -->
  <text x="630" y="390" font-size="15.1" text-anchor="middle" fill="#333" font-family="Inter, sans-serif">Assumed Nonimpact</text>

  <!-- Group 4: Both — 9 TP, 7 FP (total 16) -->
  <!-- FP: 7 * 14.1 = 98.7px -->
  <rect x="760" y="261" width="140" height="99" rx="0" fill="#ddd" stroke="#bbb" stroke-width="1"/>
  <text x="830" y="318" font-size="19.4" font-weight="700" text-anchor="middle" fill="#555" font-family="Inter, sans-serif">7</text>
  <!-- TP: 9 * 14.1 = 126.9px -->
  <rect x="760" y="134" width="140" height="127" fill="#c07090" stroke="#8C1D40" stroke-width="1"/>
  <text x="830" y="205" font-size="19.4" font-weight="700" text-anchor="middle" fill="#fff" font-family="Inter, sans-serif">9</text>
  <!-- Label -->
  <text x="830" y="390" font-size="15.1" text-anchor="middle" fill="#333" font-family="Inter, sans-serif">Both</text>

  <!-- Bottom insight -->
  <text x="525" y="430" font-size="16.2" font-weight="600" text-anchor="middle" fill="#8C1D40" font-family="Inter, sans-serif">Both optimizations: same true positive count, fewer false positives</text>

</svg>

???

The optimizations do not just make analysis faster; they change alert quality. Without modifications, Mango finds only 1 true positive against 7 false positives. Sink-to-source improves that to 5 true positives. Assumed nonimpact pushes it to 9. With both optimizations combined, we retain all 9 true positives while dropping false positives back to 7. The pruning removes irrelevant paths that generate noise without discarding the paths that matter.
