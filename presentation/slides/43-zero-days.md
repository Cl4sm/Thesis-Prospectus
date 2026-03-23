---
type: content
title: "Zero-Day Discoveries"
---

<svg viewBox="0 0 1050 370" style="width:100%; margin:0 auto; display:block;" xmlns="http://www.w3.org/2000/svg">
  <!-- Big stat -->
  <text x="525" y="60" font-size="54" font-weight="bold" text-anchor="middle" fill="#D32F2F">7 Zero-Day Vulnerabilities</text>
  <text x="525" y="90" font-size="15" text-anchor="middle" fill="#666">Found in real open-source software during the 143-hour competition</text>

  <!-- Divider -->
  <line x1="80" y1="112" x2="970" y2="112" stroke="#ddd" stroke-width="1"/>

  <!-- Card 1: Not Injected (strongest claim, largest) -->
  <rect x="30" y="130" width="310" height="130" fill="#FFEBEE" stroke="#D32F2F" stroke-width="2" rx="8"/>
  <text x="56" y="163" font-size="26" fill="#C62828">✓</text>
  <text x="82" y="165" font-size="17" font-weight="700" fill="#C62828">Not Injected by DARPA</text>
  <text x="185" y="195" font-size="13" text-anchor="middle" fill="#444">These bugs existed in production</text>
  <text x="185" y="215" font-size="13" text-anchor="middle" fill="#444">code before the competition.</text>
  <text x="185" y="245" font-size="12" text-anchor="middle" fill="#C62828" font-weight="600">Real bugs in real software.</text>

  <!-- Card 2: Real-World Impact -->
  <rect x="370" y="130" width="310" height="130" fill="#E3F2FD" stroke="#1976D2" stroke-width="2" rx="8"/>
  <text x="396" y="163" font-size="26" fill="#1565C0">⊕</text>
  <text x="422" y="165" font-size="17" font-weight="700" fill="#1565C0">Real-World Impact</text>
  <text x="525" y="195" font-size="13" text-anchor="middle" fill="#444">systemd, libxml2, Apache</text>
  <text x="525" y="215" font-size="13" text-anchor="middle" fill="#444">libraries, and others</text>
  <text x="525" y="245" font-size="12" text-anchor="middle" fill="#1565C0" font-weight="600">Widely deployed codebases.</text>

  <!-- Card 3: Responsible Disclosure -->
  <rect x="710" y="130" width="310" height="130" fill="#E8F5E9" stroke="#4CAF50" stroke-width="2" rx="8"/>
  <text x="736" y="163" font-size="26" fill="#2E7D32">⛨</text>
  <text x="762" y="165" font-size="17" font-weight="700" fill="#2E7D32">Responsible Disclosure</text>
  <text x="865" y="195" font-size="13" text-anchor="middle" fill="#444">All vulnerabilities reported</text>
  <text x="865" y="215" font-size="13" text-anchor="middle" fill="#444">through proper channels.</text>
  <text x="865" y="245" font-size="12" text-anchor="middle" fill="#2E7D32" font-weight="600">Ethical security research.</text>

  <!-- Bottom insight (enlarged) -->
  <rect x="100" y="290" width="850" height="55" fill="#FFF3E0" stroke="#FF9800" stroke-width="2" rx="8"/>
  <text x="525" y="324" font-size="16" font-weight="700" text-anchor="middle" fill="#E65100">Multi-technique coordination finds bugs that human developers and existing tools missed</text>
</svg>

???

Seven zero-day vulnerabilities. These were not part of the competition's injected bug set. They were real bugs in production open-source software that existed before DARPA touched the code. The system found them as a byproduct of its normal analysis. When you coordinate fuzzing, static analysis, and LLM-directed testing against real codebases for 143 hours straight, you cover enough of the state space to surface bugs that nobody knew about. These include bugs in systemd, libxml2, Apache libraries. These discoveries have been reported through responsible disclosure. They demonstrate that the multi-technique coordination architecture produces real security value: real bugs in real software, reported ethically.
