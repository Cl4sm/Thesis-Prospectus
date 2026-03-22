---
type: content
title: "Zero-Day Discoveries"
---

<svg viewBox="0 0 1000 320" style="width:100%; margin:0 auto; display:block;" xmlns="http://www.w3.org/2000/svg">
  <!-- Big stat -->
  <text x="500" y="55" font-size="50" font-weight="bold" text-anchor="middle" fill="#D32F2F">7 Zero-Day Vulnerabilities</text>
  <text x="500" y="85" font-size="14" text-anchor="middle" fill="#666">Found in real open-source software during the 143-hour competition</text>

  <!-- Divider -->
  <line x1="100" y1="105" x2="900" y2="105" stroke="#ddd" stroke-width="1"/>

  <!-- Key point boxes -->
  <rect x="40" y="125" width="280" height="100" fill="#FFEBEE" stroke="#D32F2F" stroke-width="1.5" rx="6"/>
  <text x="180" y="158" font-size="13" font-weight="bold" text-anchor="middle" fill="#C62828">Not Injected by DARPA</text>
  <text x="180" y="180" font-size="11" text-anchor="middle" fill="#444">These bugs existed in production</text>
  <text x="180" y="198" font-size="11" text-anchor="middle" fill="#444">code before the competition</text>

  <rect x="360" y="125" width="280" height="100" fill="#E3F2FD" stroke="#1976D2" stroke-width="1.5" rx="6"/>
  <text x="500" y="158" font-size="13" font-weight="bold" text-anchor="middle" fill="#1565C0">Real-World Impact</text>
  <text x="500" y="180" font-size="11" text-anchor="middle" fill="#444">systemd, libxml2, Apache</text>
  <text x="500" y="198" font-size="11" text-anchor="middle" fill="#444">libraries, and others</text>

  <rect x="680" y="125" width="280" height="100" fill="#E8F5E9" stroke="#4CAF50" stroke-width="1.5" rx="6"/>
  <text x="820" y="158" font-size="13" font-weight="bold" text-anchor="middle" fill="#2E7D32">Responsible Disclosure</text>
  <text x="820" y="180" font-size="11" text-anchor="middle" fill="#444">All vulnerabilities reported</text>
  <text x="820" y="198" font-size="11" text-anchor="middle" fill="#444">through proper channels</text>

  <!-- Bottom insight -->
  <rect x="150" y="260" width="700" height="45" fill="#FFF3E0" stroke="#FF9800" stroke-width="1.5" rx="6"/>
  <text x="500" y="289" font-size="13" font-weight="bold" text-anchor="middle" fill="#E65100">Multi-technique coordination finds bugs that human developers and existing tools missed</text>
</svg>

???

Seven zero-day vulnerabilities. These were not part of the competition's injected bug set. They were real bugs in production open-source software that existed before DARPA touched the code. The system found them as a byproduct of its normal analysis. When you coordinate fuzzing, static analysis, and LLM-directed testing against real codebases for 143 hours straight, you cover enough of the state space to surface bugs that nobody knew about. These discoveries have been reported through responsible disclosure. They demonstrate that the multi-technique coordination architecture produces real security value, not just competition scores. The system works on real software with real consequences.
