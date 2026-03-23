---
type: content
title: "The Metrics Trap"
---

<svg viewBox="0 0 1000 400" style="width:100%; margin:0.5rem auto; display:block;" xmlns="http://www.w3.org/2000/svg">

  <!-- Left scenario: Maximize Completeness -->
  <g>
    <rect x="30" y="40" width="430" height="310" rx="12" fill="#fff3e0" stroke="#FF9800" stroke-width="2.5"/>
    <rect x="30" y="40" width="430" height="50" rx="12" fill="#FF9800"/>
    <rect x="30" y="70" width="430" height="20" fill="#FF9800"/>
    <text x="245" y="73" text-anchor="middle" font-size="18" font-weight="700" fill="white" font-family="Inter, sans-serif">Maximize Completeness Only</text>
    <text x="245" y="120" text-anchor="middle" font-size="14" font-weight="600" fill="#E65100" font-family="Inter, sans-serif">Strategy: Report everything</text>

    <!-- Flood of dots: many red, few green, all mixed -->
    <g transform="translate(60, 140)">
      <circle cx="10" cy="8" r="7" fill="#E53935" opacity="0.5"/><circle cx="35" cy="15" r="7" fill="#E53935" opacity="0.5"/>
      <circle cx="60" cy="5" r="7" fill="#4CAF50" opacity="0.7"/><circle cx="85" cy="20" r="7" fill="#E53935" opacity="0.5"/>
      <circle cx="110" cy="10" r="7" fill="#E53935" opacity="0.5"/><circle cx="135" cy="25" r="7" fill="#E53935" opacity="0.5"/>
      <circle cx="160" cy="8" r="7" fill="#E53935" opacity="0.5"/><circle cx="185" cy="18" r="7" fill="#4CAF50" opacity="0.7"/>
      <circle cx="210" cy="5" r="7" fill="#E53935" opacity="0.5"/><circle cx="235" cy="22" r="7" fill="#E53935" opacity="0.5"/>
      <circle cx="260" cy="12" r="7" fill="#E53935" opacity="0.5"/><circle cx="285" cy="8" r="7" fill="#E53935" opacity="0.5"/>
      <circle cx="310" cy="20" r="7" fill="#4CAF50" opacity="0.7"/><circle cx="335" cy="5" r="7" fill="#E53935" opacity="0.5"/>
      <circle cx="25" cy="45" r="7" fill="#E53935" opacity="0.5"/><circle cx="50" cy="50" r="7" fill="#E53935" opacity="0.5"/>
      <circle cx="75" cy="40" r="7" fill="#E53935" opacity="0.5"/><circle cx="100" cy="55" r="7" fill="#4CAF50" opacity="0.7"/>
      <circle cx="125" cy="42" r="7" fill="#E53935" opacity="0.5"/><circle cx="150" cy="52" r="7" fill="#E53935" opacity="0.5"/>
      <circle cx="175" cy="38" r="7" fill="#E53935" opacity="0.5"/><circle cx="200" cy="48" r="7" fill="#E53935" opacity="0.5"/>
      <circle cx="225" cy="55" r="7" fill="#E53935" opacity="0.5"/><circle cx="250" cy="42" r="7" fill="#E53935" opacity="0.5"/>
      <circle cx="275" cy="50" r="7" fill="#4CAF50" opacity="0.7"/><circle cx="300" cy="38" r="7" fill="#E53935" opacity="0.5"/>
      <circle cx="325" cy="48" r="7" fill="#E53935" opacity="0.5"/>
    </g>

    <!-- Result box -->
    <rect x="65" y="275" width="330" height="55" rx="8" fill="white" stroke="#E53935" stroke-width="2"/>
    <text x="230" y="297" text-anchor="middle" font-size="13" font-weight="700" fill="#C62828" font-family="Inter, sans-serif">Recall: 100%&emsp;&emsp;Precision: near zero</text>
    <text x="230" y="317" text-anchor="middle" font-size="12" fill="#555" font-family="Inter, sans-serif">Every real bug found, buried in thousands of false alarms</text>
  </g>

  <!-- Right scenario: Maximize Accuracy -->
  <g>
    <rect x="540" y="40" width="430" height="310" rx="12" fill="#e3f2fd" stroke="#2196F3" stroke-width="2.5"/>
    <rect x="540" y="40" width="430" height="50" rx="12" fill="#2196F3"/>
    <rect x="540" y="70" width="430" height="20" fill="#2196F3"/>
    <text x="755" y="73" text-anchor="middle" font-size="18" font-weight="700" fill="white" font-family="Inter, sans-serif">Maximize Accuracy Only</text>
    <text x="755" y="120" text-anchor="middle" font-size="14" font-weight="600" fill="#1565C0" font-family="Inter, sans-serif">Strategy: Report nothing</text>

    <!-- Empty space with empty-set symbol -->
    <text x="755" y="215" text-anchor="middle" font-size="80" font-weight="300" fill="#ccc" font-family="Inter, sans-serif">&#x2205;</text>

    <!-- Result box -->
    <rect x="575" y="275" width="330" height="55" rx="8" fill="white" stroke="#2196F3" stroke-width="2"/>
    <text x="740" y="297" text-anchor="middle" font-size="13" font-weight="700" fill="#1565C0" font-family="Inter, sans-serif">Recall: 0%&emsp;&emsp;Precision: N/A</text>
    <text x="740" y="317" text-anchor="middle" font-size="12" fill="#555" font-family="Inter, sans-serif">Zero false alarms, zero vulnerabilities found</text>
  </g>

  <!-- Bottom insight -->
  <text x="500" y="388" text-anchor="middle" font-size="15" font-weight="600" fill="#333" font-family="Inter, sans-serif" font-style="italic">Accuracy and completeness measure different failure modes. Optimizing one alone is degenerate.</text>
</svg>

???

Accuracy and completeness measure different failure modes: missing real vulnerabilities versus reporting fake ones. Two degenerate systems illustrate why you need both. The first maximizes completeness: flag every data flow as a potential vulnerability. Recall is perfect. Every real bug is in there, buried under 50,000 alerts per firmware image. No analyst will triage that. The tool found everything and told you nothing. The second maximizes accuracy: report only what you can prove beyond doubt. The cheapest way to guarantee zero false positives is to report zero findings. Perfect precision (technically undefined, but who's counting). The tool has never been wrong, and it has never been useful. These are not thought experiments. Static analyzers tuned for recall drown teams in noise. Symbolic execution, applied without scoping, burns its compute budget before producing a single result. Both failure modes are real, and a useful system has to control both at the same time. The question is how you wire that together.
