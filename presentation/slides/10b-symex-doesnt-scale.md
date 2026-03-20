---
type: content
title: "Symbolic Execution Does Not Scale"
---

<svg viewBox="0 0 880 560" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid meet" style="max-height: 75vh;">

  <!-- IPC connection lines (behind everything) -->
  <!-- Border-to-border (solid maroon) -->
  <line x1="190" y1="160" x2="440" y2="140" stroke="#8C1D40" stroke-width="3" opacity="0.35"/>
  <line x1="190" y1="160" x2="340" y2="300" stroke="#8C1D40" stroke-width="3" opacity="0.35"/>
  <line x1="440" y1="140" x2="340" y2="300" stroke="#8C1D40" stroke-width="3" opacity="0.35"/>

  <!-- Border-to-BDG-discovered (medium maroon dashed) -->
  <line x1="190" y1="160" x2="150" y2="330" stroke="#B05070" stroke-width="2" opacity="0.4" stroke-dasharray="6,5"/>
  <line x1="440" y1="140" x2="550" y2="310" stroke="#B05070" stroke-width="2" opacity="0.4" stroke-dasharray="6,5"/>
  <line x1="340" y1="300" x2="150" y2="330" stroke="#B05070" stroke-width="2" opacity="0.4" stroke-dasharray="6,5"/>
  <line x1="340" y1="300" x2="460" y2="380" stroke="#B05070" stroke-width="2" opacity="0.4" stroke-dasharray="6,5"/>

  <!-- BDG-discovered to unreached (faint gray) -->
  <line x1="150" y1="330" x2="280" y2="430" stroke="#ccc" stroke-width="1.5" opacity="0.25" stroke-dasharray="4,4"/>
  <line x1="550" y1="310" x2="600" y2="160" stroke="#ccc" stroke-width="1.5" opacity="0.25" stroke-dasharray="4,4"/>
  <line x1="460" y1="380" x2="280" y2="430" stroke="#ccc" stroke-width="1.5" opacity="0.25" stroke-dasharray="4,4"/>
  <line x1="550" y1="310" x2="700" y2="280" stroke="#ccc" stroke-width="1.5" opacity="0.25" stroke-dasharray="4,4"/>
  <line x1="600" y1="160" x2="700" y2="280" stroke="#ccc" stroke-width="1.5" opacity="0.25" stroke-dasharray="4,4"/>

  <!-- BDG label on a discovered connection -->
  <text x="295" y="238" font-size="14" fill="#B05070" font-style="italic" font-family="Arial, sans-serif" text-anchor="middle" transform="rotate(-25, 295, 238)">BDG IPC</text>

  <!-- External Network cloud -->
  <ellipse cx="70" cy="80" rx="60" ry="35" fill="#FFF3E0" stroke="#FF9800" stroke-width="2.5"/>
  <text x="70" y="74" font-size="14" font-weight="bold" fill="#E65100" text-anchor="middle" font-family="Arial, sans-serif">External</text>
  <text x="70" y="92" font-size="14" font-weight="bold" fill="#E65100" text-anchor="middle" font-family="Arial, sans-serif">Network</text>

  <!-- Arrows from network to border binaries -->
  <path d="M 115 100 L 155 140" stroke="#FF9800" stroke-width="3" fill="none" marker-end="url(#arrow-orange)"/>
  <path d="M 125 80 L 400 135" stroke="#FF9800" stroke-width="3" fill="none" marker-end="url(#arrow-orange)"/>
  <path d="M 95 112 L 305 280" stroke="#FF9800" stroke-width="3" fill="none" marker-end="url(#arrow-orange)"/>

  <!-- BORDER BINARIES (maroon, solid) — seeds -->
  <circle cx="190" cy="160" r="44" fill="#8C1D40" stroke="#5C1028" stroke-width="3"/>
  <text x="190" y="155" font-size="18" font-weight="bold" fill="white" text-anchor="middle" font-family="Arial, sans-serif">httpd</text>
  <text x="190" y="175" font-size="13" fill="#ddd" text-anchor="middle" font-family="Arial, sans-serif">web server</text>

  <circle cx="440" cy="140" r="44" fill="#8C1D40" stroke="#5C1028" stroke-width="3"/>
  <text x="440" y="135" font-size="17" font-weight="bold" fill="white" text-anchor="middle" font-family="Arial, sans-serif">upnpd</text>
  <text x="440" y="155" font-size="13" fill="#ddd" text-anchor="middle" font-family="Arial, sans-serif">UPnP</text>

  <circle cx="340" cy="300" r="44" fill="#8C1D40" stroke="#5C1028" stroke-width="3"/>
  <text x="340" y="295" font-size="16" font-weight="bold" fill="white" text-anchor="middle" font-family="Arial, sans-serif">wan.cgi</text>
  <text x="340" y="315" font-size="13" fill="#ddd" text-anchor="middle" font-family="Arial, sans-serif">WAN config</text>

  <!-- BDG-DISCOVERED BINARIES (lighter maroon, dashed border) -->
  <circle cx="150" cy="330" r="36" fill="#D4829A" stroke="#B05070" stroke-width="2" stroke-dasharray="5,5"/>
  <text x="150" y="326" font-size="15" fill="white" text-anchor="middle" font-family="Arial, sans-serif">passwd</text>
  <text x="150" y="344" font-size="11" fill="#f0d0d8" text-anchor="middle" font-family="Arial, sans-serif">BDG found</text>

  <circle cx="550" cy="310" r="36" fill="#D4829A" stroke="#B05070" stroke-width="2" stroke-dasharray="5,5"/>
  <text x="550" y="306" font-size="15" fill="white" text-anchor="middle" font-family="Arial, sans-serif">ddns</text>
  <text x="550" y="324" font-size="11" fill="#f0d0d8" text-anchor="middle" font-family="Arial, sans-serif">BDG found</text>

  <circle cx="460" cy="380" r="34" fill="#D4829A" stroke="#B05070" stroke-width="2" stroke-dasharray="5,5"/>
  <text x="460" y="376" font-size="14" fill="white" text-anchor="middle" font-family="Arial, sans-serif">wandetect</text>
  <text x="460" y="394" font-size="11" fill="#f0d0d8" text-anchor="middle" font-family="Arial, sans-serif">BDG found</text>

  <!-- UNREACHED BINARIES (gray, dashed) -->
  <circle cx="600" cy="160" r="36" fill="#e0e0e0" stroke="#bbb" stroke-width="2" stroke-dasharray="5,5"/>
  <text x="600" y="156" font-size="16" fill="#888" text-anchor="middle" font-family="Arial, sans-serif">sshd</text>
  <text x="600" y="174" font-size="12" fill="#aaa" text-anchor="middle" font-family="Arial, sans-serif">unreached</text>

  <circle cx="700" cy="280" r="36" fill="#e0e0e0" stroke="#bbb" stroke-width="2" stroke-dasharray="5,5"/>
  <text x="700" y="276" font-size="16" fill="#888" text-anchor="middle" font-family="Arial, sans-serif">ftpd</text>
  <text x="700" y="294" font-size="12" fill="#aaa" text-anchor="middle" font-family="Arial, sans-serif">unreached</text>

  <circle cx="280" cy="430" r="34" fill="#e0e0e0" stroke="#bbb" stroke-width="2" stroke-dasharray="5,5"/>
  <text x="280" y="426" font-size="14" fill="#888" text-anchor="middle" font-family="Arial, sans-serif">dlnad</text>
  <text x="280" y="444" font-size="12" fill="#aaa" text-anchor="middle" font-family="Arial, sans-serif">unreached</text>

  <!-- Problem callout box -->
  <rect x="572" y="390" width="295" height="140" rx="6" fill="#fff3cd" stroke="#ffb400" stroke-width="2"/>
  <text x="590" y="416" font-size="16" font-weight="bold" fill="#8C1D40" font-family="Arial, sans-serif">Karonte's BDG pipeline:</text>
  <text x="590" y="438" font-size="14" fill="#333" font-family="Arial, sans-serif">Seeds: border binaries</text>
  <text x="590" y="456" font-size="14" fill="#333" font-family="Arial, sans-serif">Expands via IPC key grep</text>
  <text x="590" y="474" font-size="14" fill="#333" font-family="Arial, sans-serif">Typical graph: 5-15 binaries</text>
  <text x="590" y="500" font-size="14" font-weight="bold" fill="#E53935" font-family="Arial, sans-serif">Path explosion still limits</text>
  <text x="590" y="518" font-size="14" font-weight="bold" fill="#E53935" font-family="Arial, sans-serif">analysis depth per binary</text>

  <!-- Legend -->
  <circle cx="610" cy="42" r="10" fill="#8C1D40"/>
  <text x="628" y="47" font-size="13" fill="#333" font-family="Arial, sans-serif">Border binary (seed)</text>
  <circle cx="610" cy="66" r="10" fill="#D4829A" stroke="#B05070" stroke-width="1.5" stroke-dasharray="3,3"/>
  <text x="628" y="71" font-size="13" fill="#333" font-family="Arial, sans-serif">BDG-discovered via IPC keys</text>
  <circle cx="610" cy="90" r="10" fill="#e0e0e0" stroke="#bbb" stroke-width="1.5" stroke-dasharray="3,3"/>
  <text x="628" y="95" font-size="13" fill="#666" font-family="Arial, sans-serif">Unreached (no matching keys)</text>

  <!-- Arrow markers -->
  <defs>
    <marker id="arrow-orange" markerWidth="10" markerHeight="10" refX="9" refY="3" orient="auto">
      <polygon points="0 0, 10 3, 0 6" fill="#FF9800"/>
    </marker>
  </defs>
</svg>

<div class="slide-footnote" style="font-size: 22px; padding: 8px 12px; border-left: 4px solid #8C1D40; background: #fafafa; border-radius: 4px; margin-top: 8px; line-height: 1.5;">
  <strong style="color: #8C1D40;">Karonte</strong> builds a Binary Dependency Graph seeded from border binaries, expanding through shared IPC keys (NVRAM, sockets, files). Path explosion limits symbolic execution depth across the resulting graph.
</div>

???

Karonte starts with border binaries as seeds, those that directly receive network input. From there, it builds a Binary Dependency Graph by iteratively discovering related binaries. The mechanism is a worklist algorithm: for each binary analyzed, Karonte classifies it as a setter or getter for shared data keys. If httpd calls nvram_set with the key "wan_ipaddr", Karonte greps the firmware filesystem for other binaries containing that same string, checks whether they import the corresponding nvram_get, and adds confirmed matches to the worklist. The BDG grows until no new binaries are discovered. In practice, a complex firmware yields a graph of 5 to 15 nodes. The problem is twofold. First, the expansion relies on grep for shared string literals, so binaries communicating through indirect channels or transformed keys fall outside the discovery radius. dlnad, which reads "iserver_remote_passcode" from NVRAM, may not share enough initial seed keywords with the border binaries for the BDG to reach it. Second, even within the discovered graph, symbolic execution must track taint constraints across IPC boundaries, and path explosion compounds across every binary in the chain. Three border binaries with a handful of discovered getters already produce too many paths to explore exhaustively.
