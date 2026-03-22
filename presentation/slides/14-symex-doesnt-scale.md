---
type: content
title: "Symbolic Execution Does Not Scale"
---

<div id="symex-diagram">
<svg viewBox="0 0 880 560" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid meet" style="max-height: 90vh;" id="symex-svg">
  <defs>
    <marker id="arrow-orange-se" markerWidth="10" markerHeight="10" refX="9" refY="3" orient="auto" markerUnits="strokeWidth">
      <polygon points="0 0, 10 3, 0 6" fill="#FF9800"/>
    </marker>
  </defs>

  <!-- ===== Background IPC lines (revealed with their respective groups) ===== -->

  <!-- Border-to-border IPC (step 2) -->
  <g id="se-ipc-border" style="opacity:0;">
    <line x1="190" y1="160" x2="440" y2="140" stroke="#8C1D40" stroke-width="3" opacity="0.35"/>
    <line x1="190" y1="160" x2="340" y2="300" stroke="#8C1D40" stroke-width="3" opacity="0.35"/>
    <line x1="440" y1="140" x2="340" y2="300" stroke="#8C1D40" stroke-width="3" opacity="0.35"/>
  </g>

  <!-- Border-to-BDG IPC (step 3) -->
  <g id="se-ipc-bdg" style="opacity:0;">
    <line x1="190" y1="160" x2="150" y2="330" stroke="#B05070" stroke-width="2" opacity="0.4" stroke-dasharray="6,5"/>
    <line x1="440" y1="140" x2="550" y2="310" stroke="#B05070" stroke-width="2" opacity="0.4" stroke-dasharray="6,5"/>
    <line x1="340" y1="300" x2="150" y2="330" stroke="#B05070" stroke-width="2" opacity="0.4" stroke-dasharray="6,5"/>
    <line x1="340" y1="300" x2="460" y2="380" stroke="#B05070" stroke-width="2" opacity="0.4" stroke-dasharray="6,5"/>
    <text x="295" y="238" font-size="14" fill="#B05070" font-style="italic" font-family="Arial, sans-serif" text-anchor="middle" transform="rotate(-25, 295, 238)">BDG IPC</text>
  </g>

  <!-- BDG-to-unreached IPC (step 4) -->
  <g id="se-ipc-unreached" style="opacity:0;">
    <line x1="150" y1="330" x2="280" y2="430" stroke="#ccc" stroke-width="1.5" opacity="0.25" stroke-dasharray="4,4"/>
    <line x1="550" y1="310" x2="600" y2="160" stroke="#ccc" stroke-width="1.5" opacity="0.25" stroke-dasharray="4,4"/>
    <line x1="460" y1="380" x2="280" y2="430" stroke="#ccc" stroke-width="1.5" opacity="0.25" stroke-dasharray="4,4"/>
    <line x1="550" y1="310" x2="700" y2="280" stroke="#ccc" stroke-width="1.5" opacity="0.25" stroke-dasharray="4,4"/>
    <line x1="600" y1="160" x2="700" y2="280" stroke="#ccc" stroke-width="1.5" opacity="0.25" stroke-dasharray="4,4"/>
  </g>

  <!-- Network arrows (drawn BEHIND the ellipse, shown with step 2) -->
  <!-- Endpoints calculated so arrowhead tip touches border binary circle outline -->
  <g id="se-net-arrows" style="opacity:0;">
    <path d="M 115 100 L 153 131" stroke="#FF9800" stroke-width="3" fill="none" marker-end="url(#arrow-orange-se)"/>
    <path d="M 128 82 L 394 131" stroke="#FF9800" stroke-width="3" fill="none" marker-end="url(#arrow-orange-se)"/>
    <path d="M 100 113 L 303 271" stroke="#FF9800" stroke-width="3" fill="none" marker-end="url(#arrow-orange-se)"/>
  </g>

  <!-- ===== External Network cloud (step 1, drawn ON TOP of arrows) ===== -->
  <g id="se-network" style="opacity:0;">
    <ellipse cx="70" cy="80" rx="60" ry="35" fill="#FFF3E0" stroke="#FF9800" stroke-width="2.5"/>
    <text x="70" y="74" font-size="14" font-weight="bold" fill="#E65100" text-anchor="middle" font-family="Arial, sans-serif">External</text>
    <text x="70" y="92" font-size="14" font-weight="bold" fill="#E65100" text-anchor="middle" font-family="Arial, sans-serif">Network</text>
  </g>

  <!-- ===== Border binaries (step 2, drawn ON TOP of arrows) ===== -->
  <g id="se-border" style="opacity:0;">
    <circle cx="190" cy="160" r="44" fill="#8C1D40" stroke="#5C1028" stroke-width="3"/>
    <text x="190" y="155" font-size="18" font-weight="bold" fill="white" text-anchor="middle" font-family="Arial, sans-serif">httpd</text>
    <text x="190" y="175" font-size="13" fill="#ddd" text-anchor="middle" font-family="Arial, sans-serif">web server</text>

    <circle cx="440" cy="140" r="44" fill="#8C1D40" stroke="#5C1028" stroke-width="3"/>
    <text x="440" y="135" font-size="17" font-weight="bold" fill="white" text-anchor="middle" font-family="Arial, sans-serif">upnpd</text>
    <text x="440" y="155" font-size="13" fill="#ddd" text-anchor="middle" font-family="Arial, sans-serif">UPnP</text>

    <circle cx="340" cy="300" r="44" fill="#8C1D40" stroke="#5C1028" stroke-width="3"/>
    <text x="340" y="295" font-size="16" font-weight="bold" fill="white" text-anchor="middle" font-family="Arial, sans-serif">wan.cgi</text>
    <text x="340" y="315" font-size="13" fill="#ddd" text-anchor="middle" font-family="Arial, sans-serif">WAN config</text>
  </g>

  <!-- ===== BDG-discovered binaries (step 3) ===== -->
  <g id="se-bdg" style="opacity:0;">
    <circle cx="150" cy="330" r="36" fill="#D4829A" stroke="#B05070" stroke-width="2" stroke-dasharray="5,5"/>
    <text x="150" y="326" font-size="16" fill="white" text-anchor="middle" font-family="Arial, sans-serif">passwd</text>
    <text x="150" y="344" font-size="13" fill="#f0d0d8" text-anchor="middle" font-family="Arial, sans-serif">BDG found</text>

    <circle cx="550" cy="310" r="36" fill="#D4829A" stroke="#B05070" stroke-width="2" stroke-dasharray="5,5"/>
    <text x="550" y="306" font-size="16" fill="white" text-anchor="middle" font-family="Arial, sans-serif">ddns</text>
    <text x="550" y="324" font-size="13" fill="#f0d0d8" text-anchor="middle" font-family="Arial, sans-serif">BDG found</text>

    <circle cx="460" cy="380" r="34" fill="#D4829A" stroke="#B05070" stroke-width="2" stroke-dasharray="5,5"/>
    <text x="460" y="376" font-size="15" fill="white" text-anchor="middle" font-family="Arial, sans-serif">wandetect</text>
    <text x="460" y="394" font-size="13" fill="#f0d0d8" text-anchor="middle" font-family="Arial, sans-serif">BDG found</text>
  </g>

  <!-- ===== Unreached binaries (step 4) ===== -->
  <g id="se-unreached" style="opacity:0;">
    <circle cx="600" cy="160" r="36" fill="#e0e0e0" stroke="#bbb" stroke-width="2" stroke-dasharray="5,5"/>
    <text x="600" y="156" font-size="16" fill="#888" text-anchor="middle" font-family="Arial, sans-serif">sshd</text>
    <text x="600" y="174" font-size="13" fill="#aaa" text-anchor="middle" font-family="Arial, sans-serif">unreached</text>

    <circle cx="700" cy="280" r="36" fill="#e0e0e0" stroke="#bbb" stroke-width="2" stroke-dasharray="5,5"/>
    <text x="700" y="276" font-size="16" fill="#888" text-anchor="middle" font-family="Arial, sans-serif">ftpd</text>
    <text x="700" y="294" font-size="13" fill="#aaa" text-anchor="middle" font-family="Arial, sans-serif">unreached</text>

    <circle cx="280" cy="430" r="34" fill="#e0e0e0" stroke="#bbb" stroke-width="2" stroke-dasharray="5,5"/>
    <text x="280" y="426" font-size="14" fill="#888" text-anchor="middle" font-family="Arial, sans-serif">dlnad</text>
    <text x="280" y="444" font-size="13" fill="#aaa" text-anchor="middle" font-family="Arial, sans-serif">unreached</text>
  </g>

  <!-- ===== Problem callout box (step 5) ===== -->
  <g id="se-callout" style="opacity:0;">
    <rect x="572" y="390" width="295" height="140" rx="6" fill="#fff3cd" stroke="#ffb400" stroke-width="2"/>
    <text x="590" y="416" font-size="16" font-weight="bold" fill="#8C1D40" font-family="Arial, sans-serif">Karonte's BDG pipeline:</text>
    <text x="590" y="438" font-size="14" fill="#333" font-family="Arial, sans-serif">Seeds: border binaries</text>
    <text x="590" y="456" font-size="14" fill="#333" font-family="Arial, sans-serif">Expands via IPC key grep</text>
    <text x="590" y="474" font-size="14" fill="#333" font-family="Arial, sans-serif">Typical graph: 5-15 binaries</text>
    <text x="590" y="500" font-size="14" font-weight="bold" fill="#E53935" font-family="Arial, sans-serif">Path explosion still limits</text>
    <text x="590" y="518" font-size="14" font-weight="bold" fill="#E53935" font-family="Arial, sans-serif">analysis depth per binary</text>
  </g>

  <!-- ===== Legend (revealed incrementally with each group) ===== -->
  <g id="se-legend-border" style="opacity:0;">
    <circle cx="610" cy="42" r="10" fill="#8C1D40"/>
    <text x="628" y="47" font-size="13" fill="#333" font-family="Arial, sans-serif">Border binary (seed)</text>
  </g>
  <g id="se-legend-bdg" style="opacity:0;">
    <circle cx="610" cy="66" r="10" fill="#D4829A" stroke="#B05070" stroke-width="1.5" stroke-dasharray="3,3"/>
    <text x="628" y="71" font-size="13" fill="#333" font-family="Arial, sans-serif">BDG-discovered via IPC keys</text>
  </g>
  <g id="se-legend-unreached" style="opacity:0;">
    <circle cx="610" cy="90" r="10" fill="#e0e0e0" stroke="#bbb" stroke-width="1.5" stroke-dasharray="3,3"/>
    <text x="628" y="95" font-size="13" fill="#666" font-family="Arial, sans-serif">Unreached (no matching keys)</text>
  </g>

</svg>
</div>

<script>
window._animQueue.push(function() {
  var diagram = document.getElementById('symex-diagram');
  if (!diagram) return;
  var slideEl = diagram.closest('.slide');
  var slides = document.querySelectorAll('.slide');
  var idx = Array.from(slides).indexOf(slideEl);
  if (idx < 0) return;

  function getEl(id) { return document.getElementById(id); }

  function showIds(ids, instant) {
    ids.forEach(function(id) {
      var el = getEl(id);
      if (!el) return;
      el.style.opacity = '1';
      el.setAttribute('opacity', '1');
      if (!instant) {
        el.animate([
          { opacity: 0, transform: 'translateY(6px)' },
          { opacity: 1, transform: 'translateY(0)' }
        ], { duration: 300, easing: 'ease-out' });
      }
    });
  }

  function hideIds(ids) {
    ids.forEach(function(id) {
      var el = getEl(id);
      if (!el) return;
      el.getAnimations().forEach(function(a) { a.cancel(); });
      el.style.opacity = '0';
      el.setAttribute('opacity', '0');
    });
  }

  window.registerSlideAnimation(idx, {
    mode: 'step',
    steps: [
      // Step 1: External Network cloud
      {
        show: function(instant) { showIds(['se-network'], instant); },
        hide: function() { hideIds(['se-network']); }
      },
      // Step 2: Border binaries + network arrows + border IPC + legend
      {
        show: function(instant) { showIds(['se-net-arrows', 'se-border', 'se-ipc-border', 'se-legend-border'], instant); },
        hide: function() { hideIds(['se-net-arrows', 'se-border', 'se-ipc-border', 'se-legend-border']); }
      },
      // Step 3: BDG-discovered binaries + BDG IPC + legend
      {
        show: function(instant) { showIds(['se-bdg', 'se-ipc-bdg', 'se-legend-bdg'], instant); },
        hide: function() { hideIds(['se-bdg', 'se-ipc-bdg', 'se-legend-bdg']); }
      },
      // Step 4: Unreached binaries + unreached IPC + legend
      {
        show: function(instant) { showIds(['se-unreached', 'se-ipc-unreached', 'se-legend-unreached'], instant); },
        hide: function() { hideIds(['se-unreached', 'se-ipc-unreached', 'se-legend-unreached']); }
      },
      // Step 5: Problem callout
      {
        show: function(instant) { showIds(['se-callout'], instant); },
        hide: function() { hideIds(['se-callout']); }
      }
    ]
  });
});
</script>

<div class="slide-footnote" style="font-size: 18px; padding: 4px 10px; border-left: 3px solid #8C1D40; background: #fafafa; border-radius: 4px; margin-top: 4px; line-height: 1.4;">
  <strong style="color: #8C1D40;">Karonte</strong> builds a Binary Dependency Graph seeded from border binaries, expanding through shared IPC keys. Path explosion limits symbolic execution depth.
</div>

???

[step 1] Karonte starts from the external network. Any binary that directly receives network input is a border binary. [CLICK] [step 2] These three, httpd, upnpd, wan.cgi, are the seeds. Karonte begins symbolic execution on each one and tracks IPC connections between them. [CLICK] [step 3] From those seeds, Karonte builds a Binary Dependency Graph. It greps the firmware filesystem for shared IPC keys, matching nvram_set calls in one binary with nvram_get in another. passwd, ddns, and wandetect get discovered this way. [CLICK] [step 4] But the BDG expansion depends on matching string literals. Binaries communicating through indirect channels or transformed keys, like sshd, ftpd, dlnad, fall outside the discovery radius entirely. [CLICK] [step 5] Even within the discovered graph, the real problem: symbolic execution must track taint constraints across IPC boundaries, and path explosion compounds across every binary in the chain. A typical BDG of 5 to 15 binaries already produces too many paths to explore exhaustively.
