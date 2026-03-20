---
type: content
title: "Linux-Based Firmware: A Web of Interconnected Binaries"
---

<svg viewBox="0 0 900 520" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid meet" style="max-height: 72vh;">

  <!-- Connection lines between binaries (drawn first, behind nodes) -->
  <!-- httpd connections -->
  <line x1="190" y1="70" x2="430" y2="50" stroke="#ccc" stroke-width="2" opacity="0.5"/>
  <line x1="190" y1="70" x2="130" y2="230" stroke="#ccc" stroke-width="2" opacity="0.5"/>
  <line x1="190" y1="70" x2="340" y2="220" stroke="#ccc" stroke-width="2" opacity="0.5"/>
  <line x1="190" y1="70" x2="510" y2="210" stroke="#ccc" stroke-width="2" opacity="0.5"/>

  <!-- upnpd connections -->
  <line x1="430" y1="50" x2="700" y2="75" stroke="#ccc" stroke-width="2" opacity="0.5"/>
  <line x1="430" y1="50" x2="340" y2="220" stroke="#ccc" stroke-width="2" opacity="0.5"/>
  <line x1="430" y1="50" x2="510" y2="210" stroke="#ccc" stroke-width="2" opacity="0.5"/>

  <!-- sshd connections -->
  <line x1="700" y1="75" x2="740" y2="260" stroke="#ccc" stroke-width="2" opacity="0.5"/>
  <line x1="700" y1="75" x2="510" y2="210" stroke="#ccc" stroke-width="2" opacity="0.5"/>
  <line x1="700" y1="75" x2="590" y2="380" stroke="#ccc" stroke-width="2" opacity="0.5"/>

  <!-- wan.cgi connections -->
  <line x1="130" y1="230" x2="340" y2="220" stroke="#ccc" stroke-width="2" opacity="0.5"/>
  <line x1="130" y1="230" x2="220" y2="390" stroke="#ccc" stroke-width="2" opacity="0.5"/>

  <!-- password.cgi connections -->
  <line x1="340" y1="220" x2="510" y2="210" stroke="#ccc" stroke-width="2" opacity="0.5"/>
  <line x1="340" y1="220" x2="220" y2="390" stroke="#ccc" stroke-width="2" opacity="0.5"/>
  <line x1="340" y1="220" x2="420" y2="400" stroke="#ccc" stroke-width="2" opacity="0.5"/>

  <!-- network.cgi connections -->
  <line x1="510" y1="210" x2="740" y2="260" stroke="#ccc" stroke-width="2" opacity="0.5"/>
  <line x1="510" y1="210" x2="590" y2="380" stroke="#ccc" stroke-width="2" opacity="0.5"/>
  <line x1="510" y1="210" x2="420" y2="400" stroke="#ccc" stroke-width="2" opacity="0.5"/>

  <!-- ftpd connections -->
  <line x1="740" y1="260" x2="590" y2="380" stroke="#ccc" stroke-width="2" opacity="0.5"/>

  <!-- ddns connections -->
  <line x1="220" y1="390" x2="420" y2="400" stroke="#ccc" stroke-width="2" opacity="0.5"/>
  <line x1="220" y1="390" x2="130" y2="230" stroke="#ccc" stroke-width="2" opacity="0.5"/>

  <!-- wandetect connections -->
  <line x1="420" y1="400" x2="590" y2="380" stroke="#ccc" stroke-width="2" opacity="0.5"/>
  <line x1="420" y1="400" x2="510" y2="210" stroke="#ccc" stroke-width="2" opacity="0.5"/>

  <!-- dlnad connections -->
  <line x1="590" y1="380" x2="740" y2="260" stroke="#ccc" stroke-width="2" opacity="0.5"/>

  <!-- Binary nodes -->
  <!-- httpd -->
  <circle cx="190" cy="70" r="52" fill="#8C1D40" stroke="#6b1530" stroke-width="3"/>
  <text x="190" y="65" font-size="19" font-weight="bold" fill="white" text-anchor="middle" font-family="Arial, sans-serif">httpd</text>
  <text x="190" y="85" font-size="13" fill="#ddd" text-anchor="middle" font-family="Arial, sans-serif">web server</text>

  <!-- upnpd -->
  <circle cx="430" cy="50" r="48" fill="#8C1D40" stroke="#6b1530" stroke-width="3"/>
  <text x="430" y="45" font-size="18" font-weight="bold" fill="white" text-anchor="middle" font-family="Arial, sans-serif">upnpd</text>
  <text x="430" y="65" font-size="13" fill="#ddd" text-anchor="middle" font-family="Arial, sans-serif">UPnP</text>

  <!-- sshd -->
  <circle cx="700" cy="75" r="48" fill="#8C1D40" stroke="#6b1530" stroke-width="3"/>
  <text x="700" y="70" font-size="18" font-weight="bold" fill="white" text-anchor="middle" font-family="Arial, sans-serif">sshd</text>
  <text x="700" y="90" font-size="13" fill="#ddd" text-anchor="middle" font-family="Arial, sans-serif">SSH</text>

  <!-- wan.cgi -->
  <circle cx="130" cy="230" r="50" fill="#8C1D40" stroke="#6b1530" stroke-width="3"/>
  <text x="130" y="225" font-size="16" font-weight="bold" fill="white" text-anchor="middle" font-family="Arial, sans-serif">wan.cgi</text>
  <text x="130" y="245" font-size="13" fill="#ddd" text-anchor="middle" font-family="Arial, sans-serif">WAN config</text>

  <!-- password.cgi -->
  <circle cx="340" cy="220" r="50" fill="#8C1D40" stroke="#6b1530" stroke-width="3"/>
  <text x="340" y="215" font-size="15" font-weight="bold" fill="white" text-anchor="middle" font-family="Arial, sans-serif">password.cgi</text>
  <text x="340" y="235" font-size="13" fill="#ddd" text-anchor="middle" font-family="Arial, sans-serif">credentials</text>

  <!-- network.cgi -->
  <circle cx="510" cy="210" r="50" fill="#8C1D40" stroke="#6b1530" stroke-width="3"/>
  <text x="510" y="205" font-size="15" font-weight="bold" fill="white" text-anchor="middle" font-family="Arial, sans-serif">network.cgi</text>
  <text x="510" y="225" font-size="13" fill="#ddd" text-anchor="middle" font-family="Arial, sans-serif">network config</text>

  <!-- ftpd -->
  <circle cx="740" cy="260" r="46" fill="#8C1D40" stroke="#6b1530" stroke-width="3"/>
  <text x="740" y="255" font-size="18" font-weight="bold" fill="white" text-anchor="middle" font-family="Arial, sans-serif">ftpd</text>
  <text x="740" y="275" font-size="13" fill="#ddd" text-anchor="middle" font-family="Arial, sans-serif">FTP server</text>

  <!-- ddns -->
  <circle cx="220" cy="390" r="44" fill="#8C1D40" stroke="#6b1530" stroke-width="3"/>
  <text x="220" y="385" font-size="16" font-weight="bold" fill="white" text-anchor="middle" font-family="Arial, sans-serif">ddns</text>
  <text x="220" y="405" font-size="13" fill="#ddd" text-anchor="middle" font-family="Arial, sans-serif">dynamic DNS</text>

  <!-- wandetect -->
  <circle cx="420" cy="400" r="46" fill="#8C1D40" stroke="#6b1530" stroke-width="3"/>
  <text x="420" y="395" font-size="15" font-weight="bold" fill="white" text-anchor="middle" font-family="Arial, sans-serif">wandetect</text>
  <text x="420" y="415" font-size="13" fill="#ddd" text-anchor="middle" font-family="Arial, sans-serif">WAN monitor</text>

  <!-- dlnad -->
  <circle cx="590" cy="380" r="46" fill="#8C1D40" stroke="#6b1530" stroke-width="3"/>
  <text x="590" y="375" font-size="18" font-weight="bold" fill="white" text-anchor="middle" font-family="Arial, sans-serif">dlnad</text>
  <text x="590" y="395" font-size="13" fill="#ddd" text-anchor="middle" font-family="Arial, sans-serif">media server</text>

  <!-- Annotation: scale callout -->
  <rect x="630" y="445" width="260" height="60" rx="6" fill="white" stroke="#8C1D40" stroke-width="2" opacity="0.95"/>
  <text x="760" y="470" font-size="15" font-weight="bold" fill="#8C1D40" text-anchor="middle" font-family="Arial, sans-serif">Typical firmware image:</text>
  <text x="760" y="492" font-size="15" fill="#333" text-anchor="middle" font-family="Arial, sans-serif">dozens to hundreds of binaries</text>

</svg>

<div class="slide-footnote" style="font-size: 22px; padding: 8px 12px; border-left: 4px solid #8C1D40; background: #fafafa; border-radius: 4px; margin-top: 8px; line-height: 1.5;">
  Each node is an independent <strong>ELF binary</strong> running as a separate process. Binaries interact through shared state (NVRAM, files, sockets), creating <strong style="color: #8C1D40;">cross-binary dataflows</strong>. Single-binary analysis tools cannot see these interactions.
</div>

???

This diagram shows ten binaries, but real firmware contains dozens to hundreds. Each node is a standalone ELF executable running as a separate process. The lines are dataflows through shared state: one binary writes to NVRAM or a file, another reads it. The density of connections is the fundamental problem. IDA, Ghidra, fuzzers, they all analyze one binary at a time. They have no visibility into cross-process connections. If httpd writes a value to NVRAM and dlnad reads it and passes it to system(), a single-binary tool never sees that pattern. That connection must be discovered. It's not documented anywhere; you have to infer it through analysis.
