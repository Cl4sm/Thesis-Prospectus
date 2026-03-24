---
type: content
title: "SaTC: Frontend-Guided Binary Selection"
---

<div id="satc-diagram">
<svg viewBox="0 0 900 380" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid meet" style="display: block; margin: 0 auto;" id="satc-svg">

  <defs>
    <marker id="arr-satc" markerWidth="8" markerHeight="8" refX="7" refY="3" orient="auto">
      <polygon points="0 0, 8 3, 0 6" fill="#FF9800"/>
    </marker>
  </defs>

  <!-- ===== Step 1: Router admin page mockup + keywords ===== -->
  <g id="satc-frontend" style="opacity:0;">

    <!-- Browser chrome window -->
    <rect x="55" y="2" width="790" height="148" rx="8" fill="#f5f5f5" stroke="#bbb" stroke-width="1.5"/>
    <!-- Title bar -->
    <rect x="55" y="2" width="790" height="24" rx="8" fill="#e0e0e0"/>
    <rect x="55" y="20" width="790" height="6" fill="#e0e0e0"/>
    <!-- Traffic light dots -->
    <circle cx="74" cy="14" r="5" fill="#ff5f57"/>
    <circle cx="92" cy="14" r="5" fill="#ffbd2e"/>
    <circle cx="110" cy="14" r="5" fill="#28c840"/>
    <!-- URL bar -->
    <rect x="140" y="6" width="500" height="14" rx="4" fill="#fff" stroke="#ccc" stroke-width="0.8"/>
    <text x="150" y="17" font-size="11" fill="#888" font-family="monospace">https://192.168.1.1/admin.cgi</text>

    <!-- Page body area -->
    <rect x="56" y="26" width="788" height="123" rx="8" fill="#fff"/>
    <!-- Sidebar -->
    <rect x="56" y="26" width="130" height="123" fill="#3a3a4a"/>
    <text x="121" y="43" text-anchor="middle" font-size="12" font-weight="700" fill="#fff" font-family="Arial, sans-serif">NETGEAR</text>
    <line x1="63" y1="48" x2="179" y2="48" stroke="#555" stroke-width="0.5"/>
    <rect x="62" y="52" width="118" height="15" rx="3" fill="#4a4a5a"/>
    <text x="121" y="63" text-anchor="middle" font-size="11" fill="#ccc" font-family="Arial, sans-serif">Basic Settings</text>
    <rect x="62" y="70" width="118" height="15" rx="3" fill="#8C1D40"/>
    <text x="121" y="81" text-anchor="middle" font-size="11" fill="#fff" font-weight="600" font-family="Arial, sans-serif">Remote Access</text>
    <rect x="62" y="88" width="118" height="15" rx="3" fill="#4a4a5a"/>
    <text x="121" y="99" text-anchor="middle" font-size="11" fill="#ccc" font-family="Arial, sans-serif">Wireless</text>
    <rect x="62" y="106" width="118" height="15" rx="3" fill="#4a4a5a"/>
    <text x="121" y="117" text-anchor="middle" font-size="11" fill="#ccc" font-family="Arial, sans-serif">WAN Setup</text>
    <rect x="62" y="124" width="118" height="15" rx="3" fill="#4a4a5a"/>
    <text x="121" y="135" text-anchor="middle" font-size="11" fill="#ccc" font-family="Arial, sans-serif">USB Storage</text>

    <!-- Main content area header -->
    <text x="205" y="44" font-size="13" font-weight="700" fill="#333" font-family="Arial, sans-serif">Remote Management</text>
    <line x1="205" y1="49" x2="825" y2="49" stroke="#ddd" stroke-width="1"/>

    <!-- Form row 1: password -->
    <text x="205" y="66" font-size="11" fill="#555" font-family="Arial, sans-serif">Admin Password:</text>
    <rect x="340" y="56" width="170" height="15" rx="3" fill="#fff" stroke="#ccc" stroke-width="1"/>
    <text x="348" y="67" font-size="11" fill="#aaa" font-family="Arial, sans-serif">••••••••</text>
    <rect x="525" y="56" width="130" height="15" rx="3" fill="#FFF3E0" stroke="#FF9800" stroke-width="0.8"/>
    <text x="530" y="67" font-size="11" fill="#E65100" font-weight="700" font-family="monospace">name="password"</text>

    <!-- Form row 2: admin_user -->
    <text x="205" y="86" font-size="11" fill="#555" font-family="Arial, sans-serif">Admin Username:</text>
    <rect x="340" y="76" width="170" height="15" rx="3" fill="#fff" stroke="#ccc" stroke-width="1"/>
    <text x="348" y="87" font-size="11" fill="#666" font-family="Arial, sans-serif">admin</text>
    <rect x="525" y="76" width="140" height="15" rx="3" fill="#FFF3E0" stroke="#FF9800" stroke-width="0.8"/>
    <text x="530" y="87" font-size="11" fill="#E65100" font-weight="700" font-family="monospace">name="admin_user"</text>

    <!-- Form row 3: config_set -->
    <text x="205" y="106" font-size="11" fill="#555" font-family="Arial, sans-serif">Remote Config:</text>
    <rect x="340" y="96" width="100" height="15" rx="3" fill="#fff" stroke="#ccc" stroke-width="1"/>
    <text x="348" y="107" font-size="11" fill="#666" font-family="Arial, sans-serif">Enabled</text>
    <rect x="525" y="96" width="130" height="15" rx="3" fill="#FFF3E0" stroke="#FF9800" stroke-width="0.8"/>
    <text x="530" y="107" font-size="11" fill="#E65100" font-weight="700" font-family="monospace">name="config_set"</text>

    <!-- Form row 4: remote_pw -->
    <text x="205" y="126" font-size="11" fill="#555" font-family="Arial, sans-serif">Remote Passcode:</text>
    <rect x="340" y="116" width="170" height="15" rx="3" fill="#fff" stroke="#ccc" stroke-width="1"/>
    <text x="348" y="127" font-size="11" fill="#aaa" font-family="Arial, sans-serif">••••••••</text>
    <rect x="525" y="116" width="140" height="15" rx="3" fill="#FFF3E0" stroke="#FF9800" stroke-width="0.8"/>
    <text x="530" y="127" font-size="11" fill="#E65100" font-weight="700" font-family="monospace">name="remote_pw"</text>

  </g>

  <!-- ===== Step 2: Arrows + match label + backend header ===== -->
  <g id="satc-match" style="opacity:0;">
    <!-- Keywords extraction box -->
    <rect x="55" y="156" width="790" height="32" rx="6" fill="#FFF3E0" stroke="#FF9800" stroke-width="2"/>
    <text x="450" y="170" text-anchor="middle" font-size="12" font-weight="600" fill="#E65100" font-family="Arial, sans-serif">SaTC extracts parameter names from HTML/PHP form fields</text>
    <text x="450" y="183" text-anchor="middle" font-size="13" font-weight="700" fill="#E65100" font-family="monospace">password    admin_user    config_set    remote_pw    ...</text>
    <path d="M 300 190 L 300 204" stroke="#FF9800" stroke-width="2.5" fill="none" marker-end="url(#arr-satc)"/>
    <path d="M 600 190 L 600 204" stroke="#FF9800" stroke-width="2.5" fill="none" marker-end="url(#arr-satc)"/>
    <text x="450" y="201" text-anchor="middle" font-size="12" fill="#FF9800" font-weight="600" font-family="Arial, sans-serif">match against string references in binaries</text>
    <text x="450" y="219" text-anchor="middle" font-size="15" font-weight="700" fill="#666" font-family="Arial, sans-serif">Backend Binaries</text>
  </g>

  <!-- ===== Step 3: Matched/analyzed binaries (green) + count ===== -->
  <g id="satc-analyzed" style="opacity:0;">
    <rect x="50" y="226" width="180" height="42" rx="6" fill="#e8f5e9" stroke="#4CAF50" stroke-width="2.5"/>
    <text x="140" y="245" text-anchor="middle" font-size="15" font-weight="bold" fill="#333" font-family="Arial, sans-serif">httpd</text>
    <text x="140" y="260" text-anchor="middle" font-size="11" fill="#4CAF50" font-weight="700" font-family="Arial, sans-serif">ANALYZED</text>

    <rect x="260" y="226" width="180" height="42" rx="6" fill="#e8f5e9" stroke="#4CAF50" stroke-width="2.5"/>
    <text x="350" y="245" text-anchor="middle" font-size="14" font-weight="bold" fill="#333" font-family="Arial, sans-serif">password.cgi</text>
    <text x="350" y="260" text-anchor="middle" font-size="11" fill="#4CAF50" font-weight="700" font-family="Arial, sans-serif">ANALYZED</text>

    <rect x="470" y="226" width="180" height="42" rx="6" fill="#e8f5e9" stroke="#4CAF50" stroke-width="2.5"/>
    <text x="560" y="245" text-anchor="middle" font-size="15" font-weight="bold" fill="#333" font-family="Arial, sans-serif">wan.cgi</text>
    <text x="560" y="260" text-anchor="middle" font-size="11" fill="#4CAF50" font-weight="700" font-family="Arial, sans-serif">ANALYZED</text>

  </g>

  <!-- ===== Step 4: Skipped binaries (gray, dashed) ===== -->
  <g id="satc-skipped" style="opacity:0;">
    <rect x="50" y="278" width="130" height="36" rx="6" fill="#f0f0f0" stroke="#ccc" stroke-width="1.5" stroke-dasharray="4,4"/>
    <text x="115" y="296" text-anchor="middle" font-size="14" fill="#999" font-family="Arial, sans-serif">dlnad</text>
    <text x="115" y="308" text-anchor="middle" font-size="10" fill="#bbb" font-family="Arial, sans-serif">SKIPPED</text>

    <rect x="196" y="278" width="130" height="36" rx="6" fill="#f0f0f0" stroke="#ccc" stroke-width="1.5" stroke-dasharray="4,4"/>
    <text x="261" y="296" text-anchor="middle" font-size="14" fill="#999" font-family="Arial, sans-serif">ddns</text>
    <text x="261" y="308" text-anchor="middle" font-size="10" fill="#bbb" font-family="Arial, sans-serif">SKIPPED</text>

    <rect x="342" y="278" width="130" height="36" rx="6" fill="#f0f0f0" stroke="#ccc" stroke-width="1.5" stroke-dasharray="4,4"/>
    <text x="407" y="296" text-anchor="middle" font-size="13" fill="#999" font-family="Arial, sans-serif">wandetect</text>
    <text x="407" y="308" text-anchor="middle" font-size="10" fill="#bbb" font-family="Arial, sans-serif">SKIPPED</text>

    <rect x="488" y="278" width="130" height="36" rx="6" fill="#f0f0f0" stroke="#ccc" stroke-width="1.5" stroke-dasharray="4,4"/>
    <text x="553" y="296" text-anchor="middle" font-size="14" fill="#999" font-family="Arial, sans-serif">sshd</text>
    <text x="553" y="308" text-anchor="middle" font-size="10" fill="#bbb" font-family="Arial, sans-serif">SKIPPED</text>

    <rect x="634" y="278" width="46" height="36" rx="6" fill="#f0f0f0" stroke="#ccc" stroke-width="1.5" stroke-dasharray="4,4"/>
    <text x="657" y="300" text-anchor="middle" font-size="14" fill="#ccc" font-family="Arial, sans-serif">...</text>

    <!-- 3.6% callout -->
    <rect x="700" y="274" width="110" height="44" rx="6" fill="#ffebee" stroke="#E53935" stroke-width="2"/>
    <text x="755" y="296" text-anchor="middle" font-size="22" font-weight="bold" fill="#C62828" font-family="Arial, sans-serif">3.6%</text>
    <text x="755" y="312" text-anchor="middle" font-size="11" fill="#C62828" font-family="Arial, sans-serif">of binaries analyzed</text>
  </g>

  <!-- ===== Step 5: Problem callout + stats ===== -->
  <g id="satc-problem" style="opacity:0;">
    <rect x="50" y="326" width="800" height="22" rx="5" fill="#ffebee" stroke="#E53935" stroke-width="1.5"/>
    <text x="450" y="341" text-anchor="middle" font-size="12" font-weight="bold" fill="#C62828" font-family="Arial, sans-serif">dlnad contains CVE-2019-20215 but has no frontend keyword matches; SaTC never analyzes it</text>

    <text x="450" y="368" text-anchor="middle" font-size="12" fill="#666" font-family="Arial, sans-serif">3,599 binaries → 131 analyzed (3.6%) · 33 bugs found · 32.77% true positive rate</text>
  </g>

</svg>
</div>

<script>
window._animQueue.push(function() {
  var diagram = document.getElementById('satc-diagram');
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
      // Step 1: Router admin page + extracted keywords
      {
        show: function(instant) { showIds(['satc-frontend'], instant); },
        hide: function() { hideIds(['satc-frontend']); }
      },
      // Step 2: Arrows + match label + backend header
      {
        show: function(instant) { showIds(['satc-match'], instant); },
        hide: function() { hideIds(['satc-match']); }
      },
      // Step 3: Analyzed binaries (green) + count
      {
        show: function(instant) { showIds(['satc-analyzed'], instant); },
        hide: function() { hideIds(['satc-analyzed']); }
      },
      // Step 4: Skipped binaries (gray)
      {
        show: function(instant) { showIds(['satc-skipped'], instant); },
        hide: function() { hideIds(['satc-skipped']); }
      },
      // Step 5: Problem callout + stats
      {
        show: function(instant) { showIds(['satc-problem'], instant); },
        hide: function() { hideIds(['satc-problem']); }
      }
    ]
  });
});
</script>

???

**Speaker Notes:**

[step 1] SaTC takes a different approach from Karonte. Instead of building a dependency graph, it uses an even lighter-weight heuristic: frontends and backends share vocabulary. Look at a real router admin page. Each form field has a parameter name: password, admin_user, config_set, remote_pw. SaTC extracts these string literals from the web interface HTML and PHP files. [CLICK] [step 2] Then it searches backend binaries for those same strings. If a binary contains matching keywords, analyze it. If not, skip it. [CLICK] [step 3] It's remarkably effective for narrow scope. Analyzed 131 of 3,599 binaries, 3.6 percent, and found 33 bugs with a 32.77 percent true positive rate. [CLICK] [step 4] But look at what's skipped: dlnad, ddns, wandetect, sshd. These binaries have no parameter overlap with the web frontend. [CLICK] [step 5] And dlnad contains CVE-2019-20215, the same command injection vulnerability from our motivating example. The vulnerability path goes through NVRAM, not through frontend keywords. SaTC never examines it. Both Karonte and SaTC face the same fundamental tension: any heuristic for narrowing scope will exclude binaries that fall outside its discovery radius.
