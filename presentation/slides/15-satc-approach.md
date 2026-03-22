---
type: content
title: "SaTC: Frontend-Guided Binary Selection"
---

<div id="satc-diagram">
<svg viewBox="0 0 900 570" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid meet" style="max-height: 88vh; display: block; margin: 0 auto;" id="satc-svg">

  <defs>
    <marker id="arr-satc" markerWidth="8" markerHeight="8" refX="7" refY="3" orient="auto">
      <polygon points="0 0, 8 3, 0 6" fill="#FF9800"/>
    </marker>
  </defs>

  <!-- ===== Step 1: Router admin page mockup + keywords ===== -->
  <g id="satc-frontend" style="opacity:0;">

    <!-- Browser chrome window -->
    <rect x="55" y="4" width="790" height="190" rx="8" fill="#f5f5f5" stroke="#bbb" stroke-width="1.5"/>
    <!-- Title bar -->
    <rect x="55" y="4" width="790" height="30" rx="8" fill="#e0e0e0"/>
    <rect x="55" y="26" width="790" height="8" fill="#e0e0e0"/>
    <!-- Traffic light dots -->
    <circle cx="76" cy="19" r="6" fill="#ff5f57"/>
    <circle cx="96" cy="19" r="6" fill="#ffbd2e"/>
    <circle cx="116" cy="19" r="6" fill="#28c840"/>
    <!-- URL bar -->
    <rect x="148" y="10" width="540" height="18" rx="5" fill="#fff" stroke="#ccc" stroke-width="0.8"/>
    <text x="160" y="23" font-size="11" fill="#888" font-family="monospace">https://192.168.1.1/admin.cgi</text>

    <!-- Page body area -->
    <rect x="56" y="34" width="788" height="159" fill="#fff"/>
    <!-- Sidebar -->
    <rect x="56" y="34" width="150" height="159" fill="#3a3a4a"/>
    <text x="131" y="56" text-anchor="middle" font-size="13" font-weight="700" fill="#fff" font-family="Arial, sans-serif">NETGEAR</text>
    <line x1="65" y1="62" x2="197" y2="62" stroke="#555" stroke-width="0.5"/>
    <rect x="62" y="68" width="138" height="18" rx="3" fill="#4a4a5a"/>
    <text x="131" y="81" text-anchor="middle" font-size="11" fill="#ccc" font-family="Arial, sans-serif">Basic Settings</text>
    <rect x="62" y="90" width="138" height="18" rx="3" fill="#8C1D40"/>
    <text x="131" y="103" text-anchor="middle" font-size="11" fill="#fff" font-weight="600" font-family="Arial, sans-serif">Remote Access</text>
    <rect x="62" y="112" width="138" height="18" rx="3" fill="#4a4a5a"/>
    <text x="131" y="125" text-anchor="middle" font-size="11" fill="#ccc" font-family="Arial, sans-serif">Wireless</text>
    <rect x="62" y="134" width="138" height="18" rx="3" fill="#4a4a5a"/>
    <text x="131" y="147" text-anchor="middle" font-size="11" fill="#ccc" font-family="Arial, sans-serif">WAN Setup</text>
    <rect x="62" y="156" width="138" height="18" rx="3" fill="#4a4a5a"/>
    <text x="131" y="169" text-anchor="middle" font-size="11" fill="#ccc" font-family="Arial, sans-serif">USB Storage</text>

    <!-- Main content area header -->
    <text x="225" y="58" font-size="15" font-weight="700" fill="#333" font-family="Arial, sans-serif">Remote Management</text>
    <line x1="225" y1="64" x2="825" y2="64" stroke="#ddd" stroke-width="1"/>

    <!-- Form row 1: password -->
    <text x="225" y="86" font-size="12" fill="#555" font-family="Arial, sans-serif">Admin Password:</text>
    <rect x="380" y="74" width="200" height="18" rx="3" fill="#fff" stroke="#ccc" stroke-width="1"/>
    <text x="388" y="87" font-size="10" fill="#aaa" font-family="Arial, sans-serif">••••••••</text>
    <rect x="595" y="74" width="145" height="18" rx="3" fill="#FFF3E0" stroke="#FF9800" stroke-width="0.8"/>
    <text x="600" y="87" font-size="10" fill="#E65100" font-weight="700" font-family="monospace">name="password"</text>

    <!-- Form row 2: admin_user -->
    <text x="225" y="114" font-size="12" fill="#555" font-family="Arial, sans-serif">Admin Username:</text>
    <rect x="380" y="102" width="200" height="18" rx="3" fill="#fff" stroke="#ccc" stroke-width="1"/>
    <text x="388" y="115" font-size="10" fill="#666" font-family="Arial, sans-serif">admin</text>
    <rect x="595" y="102" width="155" height="18" rx="3" fill="#FFF3E0" stroke="#FF9800" stroke-width="0.8"/>
    <text x="600" y="115" font-size="10" fill="#E65100" font-weight="700" font-family="monospace">name="admin_user"</text>

    <!-- Form row 3: config_set -->
    <text x="225" y="142" font-size="12" fill="#555" font-family="Arial, sans-serif">Remote Config:</text>
    <rect x="380" y="130" width="120" height="18" rx="3" fill="#fff" stroke="#ccc" stroke-width="1"/>
    <text x="388" y="143" font-size="10" fill="#666" font-family="Arial, sans-serif">Enabled</text>
    <rect x="595" y="130" width="150" height="18" rx="3" fill="#FFF3E0" stroke="#FF9800" stroke-width="0.8"/>
    <text x="600" y="143" font-size="10" fill="#E65100" font-weight="700" font-family="monospace">name="config_set"</text>

    <!-- Form row 4: remote_pw -->
    <text x="225" y="170" font-size="12" fill="#555" font-family="Arial, sans-serif">Remote Passcode:</text>
    <rect x="380" y="158" width="200" height="18" rx="3" fill="#fff" stroke="#ccc" stroke-width="1"/>
    <text x="388" y="171" font-size="10" fill="#aaa" font-family="Arial, sans-serif">••••••••</text>
    <rect x="595" y="158" width="155" height="18" rx="3" fill="#FFF3E0" stroke="#FF9800" stroke-width="0.8"/>
    <text x="600" y="171" font-size="10" fill="#E65100" font-weight="700" font-family="monospace">name="remote_pw"</text>

    <!-- "Apply" button -->
    <rect x="380" y="182" width="60" height="16" rx="3" fill="#4CAF50"/>
    <text x="410" y="194" text-anchor="middle" font-size="10" fill="#fff" font-weight="600" font-family="Arial, sans-serif">Apply</text>

    <!-- Keywords extraction box -->
    <rect x="55" y="202" width="790" height="38" rx="6" fill="#FFF3E0" stroke="#FF9800" stroke-width="2"/>
    <text x="450" y="217" text-anchor="middle" font-size="12" font-weight="600" fill="#E65100" font-family="Arial, sans-serif">SaTC extracts parameter names from HTML/PHP form fields</text>
    <text x="450" y="234" text-anchor="middle" font-size="14" font-weight="700" fill="#E65100" font-family="monospace">password    admin_user    config_set    remote_pw    ...</text>
  </g>

  <!-- ===== Step 2: Arrows + match label + backend header ===== -->
  <g id="satc-match" style="opacity:0;">
    <path d="M 300 242 L 300 272" stroke="#FF9800" stroke-width="2.5" fill="none" marker-end="url(#arr-satc)"/>
    <path d="M 600 242 L 600 272" stroke="#FF9800" stroke-width="2.5" fill="none" marker-end="url(#arr-satc)"/>
    <text x="450" y="265" text-anchor="middle" font-size="13" fill="#FF9800" font-weight="600" font-family="Arial, sans-serif">match against string references in binaries</text>
    <text x="450" y="295" text-anchor="middle" font-size="16" font-weight="700" fill="#666" font-family="Arial, sans-serif">Backend Binaries</text>
  </g>

  <!-- ===== Step 3: Matched/analyzed binaries (green) + count ===== -->
  <g id="satc-analyzed" style="opacity:0;">
    <rect x="50" y="310" width="180" height="55" rx="6" fill="#e8f5e9" stroke="#4CAF50" stroke-width="2.5"/>
    <text x="140" y="335" text-anchor="middle" font-size="16" font-weight="bold" fill="#333" font-family="Arial, sans-serif">httpd</text>
    <text x="140" y="353" text-anchor="middle" font-size="12" fill="#4CAF50" font-weight="700" font-family="Arial, sans-serif">ANALYZED</text>

    <rect x="260" y="310" width="180" height="55" rx="6" fill="#e8f5e9" stroke="#4CAF50" stroke-width="2.5"/>
    <text x="350" y="335" text-anchor="middle" font-size="15" font-weight="bold" fill="#333" font-family="Arial, sans-serif">password.cgi</text>
    <text x="350" y="353" text-anchor="middle" font-size="12" fill="#4CAF50" font-weight="700" font-family="Arial, sans-serif">ANALYZED</text>

    <rect x="470" y="310" width="180" height="55" rx="6" fill="#e8f5e9" stroke="#4CAF50" stroke-width="2.5"/>
    <text x="560" y="335" text-anchor="middle" font-size="16" font-weight="bold" fill="#333" font-family="Arial, sans-serif">wan.cgi</text>
    <text x="560" y="353" text-anchor="middle" font-size="12" fill="#4CAF50" font-weight="700" font-family="Arial, sans-serif">ANALYZED</text>

  </g>

  <!-- ===== Step 4: Skipped binaries (gray, dashed) ===== -->
  <g id="satc-skipped" style="opacity:0;">
    <rect x="50" y="395" width="140" height="45" rx="6" fill="#f0f0f0" stroke="#ccc" stroke-width="1.5" stroke-dasharray="4,4"/>
    <text x="120" y="418" text-anchor="middle" font-size="15" fill="#999" font-family="Arial, sans-serif">dlnad</text>
    <text x="120" y="433" text-anchor="middle" font-size="10" fill="#bbb" font-family="Arial, sans-serif">SKIPPED</text>

    <rect x="210" y="395" width="140" height="45" rx="6" fill="#f0f0f0" stroke="#ccc" stroke-width="1.5" stroke-dasharray="4,4"/>
    <text x="280" y="418" text-anchor="middle" font-size="15" fill="#999" font-family="Arial, sans-serif">ddns</text>
    <text x="280" y="433" text-anchor="middle" font-size="10" fill="#bbb" font-family="Arial, sans-serif">SKIPPED</text>

    <rect x="370" y="395" width="140" height="45" rx="6" fill="#f0f0f0" stroke="#ccc" stroke-width="1.5" stroke-dasharray="4,4"/>
    <text x="440" y="418" text-anchor="middle" font-size="14" fill="#999" font-family="Arial, sans-serif">wandetect</text>
    <text x="440" y="433" text-anchor="middle" font-size="10" fill="#bbb" font-family="Arial, sans-serif">SKIPPED</text>

    <rect x="530" y="395" width="140" height="45" rx="6" fill="#f0f0f0" stroke="#ccc" stroke-width="1.5" stroke-dasharray="4,4"/>
    <text x="600" y="418" text-anchor="middle" font-size="15" fill="#999" font-family="Arial, sans-serif">sshd</text>
    <text x="600" y="433" text-anchor="middle" font-size="10" fill="#bbb" font-family="Arial, sans-serif">SKIPPED</text>

    <rect x="690" y="395" width="50" height="45" rx="6" fill="#f0f0f0" stroke="#ccc" stroke-width="1.5" stroke-dasharray="4,4"/>
    <text x="715" y="422" text-anchor="middle" font-size="14" fill="#ccc" font-family="Arial, sans-serif">...</text>

    <!-- 3.6% callout -->
    <rect x="760" y="390" width="120" height="55" rx="6" fill="#ffebee" stroke="#E53935" stroke-width="2"/>
    <text x="820" y="416" text-anchor="middle" font-size="22" font-weight="bold" fill="#C62828" font-family="Arial, sans-serif">3.6%</text>
    <text x="820" y="436" text-anchor="middle" font-size="12" fill="#C62828" font-family="Arial, sans-serif">of binaries analyzed</text>
  </g>

  <!-- ===== Step 5: Problem callout + stats ===== -->
  <g id="satc-problem" style="opacity:0;">
    <rect x="50" y="468" width="800" height="50" rx="6" fill="#ffebee" stroke="#E53935" stroke-width="2"/>
    <text x="450" y="490" text-anchor="middle" font-size="15" font-weight="bold" fill="#C62828" font-family="Arial, sans-serif">dlnad contains CVE-2019-20215 but has no frontend keyword matches</text>
    <text x="450" y="508" text-anchor="middle" font-size="13" fill="#C62828" font-family="Arial, sans-serif">SaTC never analyzes it — the vulnerability is invisible to frontend-guided selection</text>

    <text x="450" y="555" text-anchor="middle" font-size="14" fill="#666" font-family="Arial, sans-serif">3,599 binaries → 131 analyzed (3.6%) · 33 bugs found · 32.77% true positive rate</text>
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
