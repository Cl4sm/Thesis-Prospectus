---
type: content
title: "Maximizing Accuracy"
hidden: true
---

<svg viewBox="0 0 1000 400" style="width:100%; margin:0.5rem auto; display:block;" xmlns="http://www.w3.org/2000/svg">

  <!-- Maximizing Accuracy: Full Slide -->
  <g>
    <rect x="50" y="40" width="900" height="310" rx="12" fill="#e3f2fd" stroke="#2196F3" stroke-width="2.5"/>
    <rect x="50" y="40" width="900" height="50" rx="12" fill="#2196F3"/>
    <rect x="50" y="70" width="900" height="20" fill="#2196F3"/>
    <text x="500" y="73" text-anchor="middle" font-size="20" font-weight="700" fill="white" font-family="Inter, sans-serif">Maximizing Accuracy</text>

    <!-- Mostly grayed-out dots with one green checkmark -->
    <g transform="translate(120, 120)">
      <circle cx="10" cy="8" r="7" fill="#ccc" opacity="0.3"/>
      <circle cx="35" cy="15" r="7" fill="#ccc" opacity="0.3"/>
      <circle cx="60" cy="5" r="7" fill="#4CAF50" opacity="0.8"/>
      <text x="60" y="10" text-anchor="middle" font-size="10" fill="white" font-weight="bold">✓</text>
      <circle cx="85" cy="20" r="7" fill="#ccc" opacity="0.3"/>
      <circle cx="110" cy="10" r="7" fill="#ccc" opacity="0.3"/>
      <circle cx="135" cy="25" r="7" fill="#ccc" opacity="0.3"/>
      <circle cx="160" cy="8" r="7" fill="#ccc" opacity="0.3"/>
      <circle cx="185" cy="18" r="7" fill="#ccc" opacity="0.3"/>
      <circle cx="210" cy="5" r="7" fill="#ccc" opacity="0.3"/>
      <circle cx="235" cy="22" r="7" fill="#ccc" opacity="0.3"/>
      <circle cx="260" cy="12" r="7" fill="#ccc" opacity="0.3"/>
      <circle cx="285" cy="8" r="7" fill="#ccc" opacity="0.3"/>
      <circle cx="310" cy="20" r="7" fill="#ccc" opacity="0.3"/>
      <circle cx="335" cy="5" r="7" fill="#ccc" opacity="0.3"/>
      <circle cx="360" cy="18" r="7" fill="#ccc" opacity="0.3"/>
      <circle cx="385" cy="10" r="7" fill="#ccc" opacity="0.3"/>
      <circle cx="25" cy="45" r="7" fill="#ccc" opacity="0.3"/>
      <circle cx="50" cy="50" r="7" fill="#ccc" opacity="0.3"/>
      <circle cx="75" cy="40" r="7" fill="#ccc" opacity="0.3"/>
      <circle cx="100" cy="55" r="7" fill="#ccc" opacity="0.3"/>
      <circle cx="125" cy="42" r="7" fill="#ccc" opacity="0.3"/>
      <circle cx="150" cy="52" r="7" fill="#ccc" opacity="0.3"/>
      <circle cx="175" cy="38" r="7" fill="#ccc" opacity="0.3"/>
      <circle cx="200" cy="48" r="7" fill="#ccc" opacity="0.3"/>
      <circle cx="225" cy="55" r="7" fill="#ccc" opacity="0.3"/>
      <circle cx="250" cy="42" r="7" fill="#ccc" opacity="0.3"/>
      <circle cx="275" cy="50" r="7" fill="#ccc" opacity="0.3"/>
      <circle cx="300" cy="38" r="7" fill="#ccc" opacity="0.3"/>
      <circle cx="325" cy="48" r="7" fill="#ccc" opacity="0.3"/>
      <circle cx="360" cy="45" r="7" fill="#ccc" opacity="0.3"/>
      <circle cx="385" cy="55" r="7" fill="#ccc" opacity="0.3"/>
    </g>

    <!-- Result box -->
    <rect x="100" y="275" width="800" height="55" rx="8" fill="white" stroke="#2196F3" stroke-width="2"/>
    <text x="500" y="297" text-anchor="middle" font-size="13" font-weight="700" fill="#1565C0" font-family="Inter, sans-serif">Precision: undefined&emsp;&emsp;Recall: 0%</text>
    <text x="500" y="317" text-anchor="middle" font-size="12" fill="#555" font-family="Inter, sans-serif">Zero false alarms, zero vulnerabilities found</text>
  </g>

</svg>

???

The second maximizes accuracy: report only what you can prove beyond doubt. The cheapest way to guarantee zero false positives is to report zero findings. Perfect precision (technically undefined). The tool has never been wrong, and it has never been useful. Static analyzers tuned for recall drown teams in noise. Symbolic execution, applied without scoping, burns compute before producing a single result. Both failure modes are real, and a useful system must control both simultaneously.
