---
type: content
title: "Scalability Has Two Dimensions"
footnote: "[1] SaTC (USENIX Sec '21)&emsp;[2] Fang et al., arXiv 2404.08144&emsp;[3] Google Project Zero / DeepMind, 'Big Sleep' (2024)&emsp;[4] OpenSSF, CVE-2024-3094"
---

<svg id="depth-diagram" viewBox="0 0 1100 480" style="width:100%; height:auto; display:block; margin:0 auto;" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <filter id="dShadow"><feDropShadow dx="0" dy="2" stdDeviation="3" flood-opacity="0.10"/></filter>
  </defs>

  <!-- Divider -->
  <line x1="540" y1="5" x2="540" y2="435" stroke="#ddd" stroke-width="1.5" stroke-dasharray="6,4"/>

  <!-- ========== LEFT COLUMN: Depth of Analysis ========== -->
  <text x="270" y="28" text-anchor="middle" fill="#B71C1C" font-size="20" font-weight="800">DEPTH: LARGE TARGETS</text>
  <text x="270" y="48" text-anchor="middle" fill="#888" font-size="12" font-style="italic">Each target is itself a scale problem</text>

  <!-- Firmware box -->
  <rect x="25" y="62" width="500" height="120" rx="8" fill="#E53935" fill-opacity="0.05" stroke="#E53935" stroke-width="1.2"/>
  <text x="45" y="82" fill="#B71C1C" font-size="14" font-weight="700">Firmware: one image, hundreds of binaries</text>

  <!-- Binary grid (compact 2 rows) -->
  <g transform="translate(45, 92)">
    <rect x="0" y="0" width="50" height="22" rx="3" fill="#E53935" opacity="0.12" stroke="#E53935" stroke-width="0.7"/>
    <text x="25" y="15" text-anchor="middle" fill="#B71C1C" font-size="8.5" font-weight="600">httpd</text>
    <rect x="56" y="0" width="50" height="22" rx="3" fill="#E53935" opacity="0.12" stroke="#E53935" stroke-width="0.7"/>
    <text x="81" y="15" text-anchor="middle" fill="#B71C1C" font-size="8.5" font-weight="600">upnpd</text>
    <rect x="112" y="0" width="50" height="22" rx="3" fill="#E53935" opacity="0.12" stroke="#E53935" stroke-width="0.7"/>
    <text x="137" y="15" text-anchor="middle" fill="#B71C1C" font-size="8.5" font-weight="600">ftpd</text>
    <rect x="168" y="0" width="50" height="22" rx="3" fill="#E53935" opacity="0.12" stroke="#E53935" stroke-width="0.7"/>
    <text x="193" y="15" text-anchor="middle" fill="#B71C1C" font-size="8.5" font-weight="600">busybox</text>
    <rect x="224" y="0" width="50" height="22" rx="3" fill="#E53935" opacity="0.12" stroke="#E53935" stroke-width="0.7"/>
    <text x="249" y="15" text-anchor="middle" fill="#B71C1C" font-size="8.5" font-weight="600">dnsmasq</text>
    <rect x="280" y="0" width="50" height="22" rx="3" fill="#E53935" opacity="0.12" stroke="#E53935" stroke-width="0.7"/>
    <text x="305" y="15" text-anchor="middle" fill="#B71C1C" font-size="8.5" font-weight="600">smbd</text>
    <rect x="336" y="0" width="50" height="22" rx="3" fill="#E53935" opacity="0.12" stroke="#E53935" stroke-width="0.7"/>
    <text x="361" y="15" text-anchor="middle" fill="#B71C1C" font-size="8.5" font-weight="600">nvram</text>
    <rect x="392" y="0" width="50" height="22" rx="3" fill="#E53935" opacity="0.08" stroke="#E53935" stroke-width="0.7"/>
    <text x="417" y="15" text-anchor="middle" fill="#B71C1C" font-size="8.5" font-weight="600">libssl</text>

    <!-- Row 2 (faded) -->
    <rect x="0" y="28" width="442" height="18" rx="3" fill="#E53935" opacity="0.04"/>
    <text x="221" y="41" text-anchor="middle" fill="#bbb" font-size="9">... hundreds more per image (ARM, MIPS, x86)</text>
  </g>

  <!-- Prior work stat -->
  <text x="275" y="163" text-anchor="middle" fill="#B71C1C" font-size="13" font-weight="700">Prior work (SaTC): 131 of 3,599 binaries (3.6%)</text>

  <!-- xz backdoor box -->
  <rect x="25" y="190" width="500" height="105" rx="8" fill="#E53935" fill-opacity="0.05" stroke="#E53935" stroke-width="1.2"/>
  <text x="45" y="212" fill="#B71C1C" font-size="14" font-weight="700">Supply chain: xz backdoor (CVE-2024-3094)</text>

  <text x="45" y="234" fill="#555" font-size="12">Attacker spent 2 years gaining commit access to xz-utils.</text>
  <text x="45" y="252" fill="#555" font-size="12">Injected a backdoor into liblzma that hijacked sshd authentication.</text>
  <text x="45" y="270" fill="#555" font-size="12">Discovered by accident (500ms latency anomaly). CVSS: 10.0.</text>
  <text x="45" y="288" fill="#E53935" font-size="12" font-weight="700">Days from shipping in every major Linux distro.</text>

  <!-- Left column verdict -->
  <rect x="25" y="308" width="500" height="50" rx="8" fill="white" stroke="#E53935" stroke-width="1.5" filter="url(#dShadow)"/>
  <text x="275" y="330" text-anchor="middle" fill="#333" font-size="13" font-weight="700">Each target can be enormous or deeply buried.</text>
  <text x="275" y="348" text-anchor="middle" fill="#888" font-size="12">Scalable analysis must handle depth: every binary, every dependency.</text>

  <!-- ========== RIGHT COLUMN: Attacker Acceleration ========== -->
  <text x="820" y="28" text-anchor="middle" fill="#4A148C" font-size="20" font-weight="800">SPEED: ATTACKERS ACCELERATE</text>
  <text x="820" y="48" text-anchor="middle" fill="#888" font-size="12" font-style="italic">LLMs are changing the offense/defense balance</text>

  <!-- LLM exploit stat box -->
  <rect x="575" y="62" width="490" height="105" rx="8" fill="#7B1FA2" fill-opacity="0.05" stroke="#7B1FA2" stroke-width="1.2"/>
  <text x="595" y="82" fill="#4A148C" font-size="14" font-weight="700">LLM agents exploit 1-day vulnerabilities</text>

  <text x="595" y="102" fill="#555" font-size="12">UIUC (2024): GPT-4 agent autonomously exploited</text>

  <text x="680" y="140" text-anchor="middle" fill="#7B1FA2" font-size="38" font-weight="900">87%</text>
  <text x="820" y="128" fill="#555" font-size="13">of tested CVEs</text>
  <text x="820" y="146" fill="#888" font-size="12">(vs. 0% for all other models tested)</text>

  <text x="595" y="162" fill="#888" font-size="10.5">91 lines of code. ReAct agent. Given only the CVE description.</text>

  <!-- Big Sleep box -->
  <rect x="575" y="190" width="490" height="105" rx="8" fill="#7B1FA2" fill-opacity="0.05" stroke="#7B1FA2" stroke-width="1.2"/>
  <text x="595" y="212" fill="#4A148C" font-size="14" font-weight="700">AI finds zero-days humans miss</text>

  <text x="595" y="234" fill="#555" font-size="12">Google Project Zero + DeepMind (2024): "Big Sleep" agent</text>
  <text x="595" y="252" fill="#555" font-size="12">found an exploitable stack buffer underflow in SQLite.</text>
  <text x="595" y="270" fill="#7B1FA2" font-size="12" font-weight="700">First AI-discovered zero-day in widely-used real-world software.</text>
  <text x="595" y="288" fill="#888" font-size="11">Human fuzzers failed to find it after 150 CPU-hours of testing.</text>

  <!-- Right column verdict -->
  <rect x="575" y="308" width="490" height="50" rx="8" fill="white" stroke="#7B1FA2" stroke-width="1.5" filter="url(#dShadow)"/>
  <text x="820" y="330" text-anchor="middle" fill="#333" font-size="13" font-weight="700">Attackers are automating exploit discovery with LLMs.</text>
  <text x="820" y="348" text-anchor="middle" fill="#888" font-size="12">Defenders need automated analysis that matches this pace.</text>

  <!-- ========== BOTTOM: Unified framing ========== -->
  <rect x="40" y="375" width="1020" height="60" rx="10" fill="#8C1D40" opacity="0.06" stroke="#8C1D40" stroke-width="1.5"/>

  <!-- Breadth pill -->
  <rect x="65" y="387" width="200" height="36" rx="18" fill="white" stroke="#E53935" stroke-width="1.2"/>
  <text x="165" y="410" text-anchor="middle" fill="#B71C1C" font-size="13" font-weight="700">Breadth: many targets</text>

  <!-- Plus sign -->
  <text x="290" y="412" text-anchor="middle" fill="#8C1D40" font-size="22" font-weight="900">+</text>

  <!-- Depth pill -->
  <rect x="315" y="387" width="200" height="36" rx="18" fill="white" stroke="#E53935" stroke-width="1.2"/>
  <text x="415" y="410" text-anchor="middle" fill="#B71C1C" font-size="13" font-weight="700">Depth: large per target</text>

  <!-- Plus sign -->
  <text x="540" y="412" text-anchor="middle" fill="#8C1D40" font-size="22" font-weight="900">+</text>

  <!-- Speed pill -->
  <rect x="565" y="387" width="200" height="36" rx="18" fill="white" stroke="#7B1FA2" stroke-width="1.2"/>
  <text x="665" y="410" text-anchor="middle" fill="#4A148C" font-size="13" font-weight="700">Speed: attackers accelerate</text>

  <!-- Equals sign -->
  <text x="790" y="412" text-anchor="middle" fill="#8C1D40" font-size="22" font-weight="900">=</text>

  <!-- Result pill -->
  <rect x="815" y="387" width="220" height="36" rx="18" fill="#8C1D40" stroke="#8C1D40" stroke-width="1.2"/>
  <text x="925" y="410" text-anchor="middle" fill="white" font-size="13" font-weight="700">Autonomous analysis</text>

  <!-- Subtle bottom labels -->
  <text x="280" y="460" text-anchor="middle" fill="#ccc" font-size="10">firmware / IoT (next slide: Mirai)</text>
  <text x="820" y="460" text-anchor="middle" fill="#ccc" font-size="10">xz, Log4Shell, Big Sleep, GPT-4 agents</text>
</svg>

???

Scalability is a two-dimensional problem, and now there's a third dimension: speed.

On the left: depth. A single firmware image contains hundreds of binaries across multiple architectures. Prior work (SaTC) only analyzed 131 of 3,599 binaries, 3.6%. That is 96% of the attack surface untouched. Then there's supply-chain depth: the xz backdoor (CVE-2024-3094) is a textbook case. An attacker spent two years gaining maintainer trust, then injected a backdoor into liblzma that hijacked sshd authentication. CVSS 10.0. It was days from shipping in every major Linux distribution and was caught by accident, a developer noticed a 500-millisecond latency anomaly during unrelated benchmarking. Automated binary analysis could have flagged the anomalous code path.

On the right: attackers are accelerating. UIUC researchers showed in 2024 that a GPT-4 agent, 91 lines of code, could autonomously exploit 87% of tested 1-day vulnerabilities given only the CVE description. Google's Project Zero and DeepMind collaboration "Big Sleep" found the first AI-discovered zero-day in widely-used software: a stack buffer underflow in SQLite that human fuzzers missed after 150 CPU-hours. These are early results, and LLM capabilities are only improving.

The bottom line: breadth (many targets), depth (large per target), and speed (attackers are getting faster). Defenders need autonomous, scalable analysis to match all three.
