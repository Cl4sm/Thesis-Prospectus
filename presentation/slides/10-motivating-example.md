---
type: content
title: "Environment Resolution & TruPoC Ranking"
---

<div id="trupoc-diagram">
<svg viewBox="0 0 1200 380" style="width: 100%; margin: 0 auto; display: block;" id="trupoc-svg">
  <defs>
    <marker id="arrowBlue17" markerWidth="8" markerHeight="8" refX="5" refY="3" orient="auto" markerUnits="strokeWidth">
      <path d="M0,0 L0,6 L7,3 z" fill="#2196F3"/>
    </marker>
    <radialGradient id="pulseGrad17">
      <stop offset="0%" stop-color="#FF9800" stop-opacity="0.85"/>
      <stop offset="100%" stop-color="#FF9800" stop-opacity="0"/>
    </radialGradient>
  </defs>

  <!-- ==================== R6400 badge ==================== -->
  <g id="tp-badge" style="opacity:0;">
    <rect x="1000" y="2" width="190" height="22" rx="11" fill="#8C1D40" opacity="0.9"/>
    <text x="1095" y="16" font-size="10" font-weight="600" text-anchor="middle" fill="#fff" letter-spacing="0.3">Real Bug: Netgear R6400</text>
  </g>

  <!-- ==================== httpd box (left) ==================== -->
  <g id="tp-httpd" style="opacity:0;">
    <rect x="5" y="28" width="390" height="118" fill="#fafafa" stroke="#444" stroke-width="1.5" rx="6"/>
    <!-- Title bar -->
    <rect x="5" y="28" width="390" height="26" fill="#555" rx="6"/>
    <rect x="5" y="47" width="390" height="7" fill="#555"/>
    <text x="200" y="46" font-size="13" font-weight="700" text-anchor="middle" fill="#fff" font-family="'JetBrains Mono', monospace" letter-spacing="0.5">httpd</text>
    <!-- Code via SVG text with manual syntax coloring -->
    <text x="16" y="70" font-size="11" font-family="'JetBrains Mono', monospace" fill="#1a1a1a" xml:space="preserve">
      <tspan x="16" dy="0"><tspan fill="#0033B3" font-weight="600">void</tspan> <tspan fill="#00627A">change_passcode</tspan>(request) {</tspan>
      <tspan x="16" dy="16">    passcode = <tspan fill="#00627A">get_http_param</tspan>(request, <tspan fill="#067D17">"remote_passcode"</tspan>);</tspan>
      <tspan x="16" dy="16">    <tspan fill="#00627A">nvram_set</tspan>(<tspan fill="#067D17">"remote_passcode"</tspan>, passcode);</tspan>
      <tspan x="16" dy="16">    <tspan fill="#00627A">system</tspan>(<tspan fill="#067D17">"dlnad"</tspan>);</tspan>
      <tspan x="16" dy="16">}</tspan>
    </text>
    <!-- Role label -->
    <rect x="150" y="148" width="100" height="18" rx="9" fill="#e3f2fd" stroke="#2196F3" stroke-width="0.8"/>
    <text x="200" y="161" font-size="9" text-anchor="middle" fill="#2196F3" font-weight="700" letter-spacing="0.5">WRITE SOURCE</text>
  </g>

  <!-- ==================== Arrow 1: httpd → NVRAM ==================== -->
  <path id="tp-arrow1" d="M 395 92 L 438 92" stroke="#2196F3" stroke-width="2.5" fill="none" marker-end="url(#arrowBlue17)" stroke-dasharray="43" stroke-dashoffset="43" style="opacity:0;"/>
  <text id="tp-label-writes" x="416" y="84" font-size="10" text-anchor="middle" fill="#2196F3" font-weight="600" style="opacity:0;">writes</text>

  <!-- Data pulse 1 -->
  <circle id="tp-pulse1" cx="395" cy="92" r="5" fill="url(#pulseGrad17)" style="opacity:0;"/>

  <!-- ==================== NVRAM box (center) ==================== -->
  <g id="tp-nvram" style="opacity:0;">
    <rect x="442" y="8" width="330" height="180" fill="#fffbf0" stroke="#FF9800" stroke-width="2" rx="6"/>
    <!-- Title bar -->
    <rect x="442" y="8" width="330" height="28" fill="#FF9800" rx="6"/>
    <rect x="442" y="26" width="330" height="10" fill="#FF9800"/>
    <text x="607" y="27" font-size="14" font-weight="700" text-anchor="middle" fill="#fff" letter-spacing="1">NVRAM</text>

    <!-- Column headers -->
    <text x="500" y="52" font-size="10" font-weight="700" fill="#999" font-family="'JetBrains Mono', monospace" letter-spacing="0.5">KEY</text>
    <text x="620" y="52" font-size="10" font-weight="700" fill="#999" font-family="'JetBrains Mono', monospace" letter-spacing="0.5">VALUE</text>
    <line x1="458" y1="59" x2="756" y2="59" stroke="#f0e0c0" stroke-width="0.8"/>

    <!-- Row 1: wifi_ssid -->
    <text x="500" y="76" font-size="11" fill="#888" font-family="'JetBrains Mono', monospace">wifi_ssid</text>
    <text x="620" y="76" font-size="11" fill="#aaa" font-family="'JetBrains Mono', monospace">"HomeNet"</text>
    <line x1="458" y1="84" x2="756" y2="84" stroke="#f5ead5" stroke-width="0.5"/>

    <!-- Row 2: remote_passcode (DANGEROUS) -->
    <rect id="tp-nvram-highlight" x="456" y="88" width="304" height="24" rx="3" fill="#E53935" opacity="0"/>
    <text x="500" y="105" font-size="10" fill="#333" font-family="'JetBrains Mono', monospace" font-weight="700">remote_passcode</text>
    <text x="620" y="105" font-size="10" fill="#C41C3B" font-family="'JetBrains Mono', monospace" font-weight="700">"; cat /etc/shadow"</text>
    <line x1="458" y1="114" x2="756" y2="114" stroke="#f5ead5" stroke-width="0.5"/>

    <!-- Row 3: http_port -->
    <text x="500" y="131" font-size="11" fill="#888" font-family="'JetBrains Mono', monospace">http_port</text>
    <text x="620" y="131" font-size="11" fill="#aaa" font-family="'JetBrains Mono', monospace">"8080"</text>
    <line x1="458" y1="139" x2="756" y2="139" stroke="#f5ead5" stroke-width="0.5"/>

    <!-- Row 4: lan_ipaddr -->
    <text x="500" y="156" font-size="11" fill="#888" font-family="'JetBrains Mono', monospace">lan_ipaddr</text>
    <text x="620" y="156" font-size="11" fill="#aaa" font-family="'JetBrains Mono', monospace">"192.168.1.1"</text>

    <!-- Subtitle -->
    <text x="607" y="178" font-size="9" text-anchor="middle" fill="#bbb" letter-spacing="0.3">shared key-value store across all binaries</text>
  </g>

  <!-- ==================== Arrow 2: NVRAM → dlnad ==================== -->
  <path id="tp-arrow2" d="M 772 92 L 815 92" stroke="#2196F3" stroke-width="2.5" fill="none" marker-end="url(#arrowBlue17)" stroke-dasharray="43" stroke-dashoffset="43" style="opacity:0;"/>
  <text id="tp-label-reads" x="793" y="84" font-size="10" text-anchor="middle" fill="#2196F3" font-weight="600" style="opacity:0;">reads</text>

  <!-- Data pulse 2 -->
  <circle id="tp-pulse2" cx="772" cy="92" r="5" fill="url(#pulseGrad17)" style="opacity:0;"/>

  <!-- ==================== dlnad box (right) ==================== -->
  <g id="tp-dlnad" style="opacity:0;">
    <rect x="818" y="28" width="377" height="118" fill="#fafafa" stroke="#444" stroke-width="1.5" rx="6"/>
    <!-- Title bar -->
    <rect x="818" y="28" width="377" height="26" fill="#555" rx="6"/>
    <rect x="818" y="47" width="377" height="7" fill="#555"/>
    <text x="1006" y="46" font-size="13" font-weight="700" text-anchor="middle" fill="#fff" font-family="'JetBrains Mono', monospace" letter-spacing="0.5">dlnad</text>
    <!-- Code via SVG text with manual syntax coloring -->
    <text x="831" y="70" font-size="11" font-family="'JetBrains Mono', monospace" fill="#1a1a1a" xml:space="preserve">
      <tspan x="831" dy="0"><tspan fill="#0033B3" font-weight="600">void</tspan> <tspan fill="#00627A">main</tspan>() {</tspan>
      <tspan x="831" dy="16">    passcode = <tspan fill="#00627A">nvram_get</tspan>(<tspan fill="#067D17">"remote_passcode"</tspan>);</tspan>
      <tspan x="831" dy="16">    <tspan fill="#00627A">sprintf</tspan>(v11, <tspan fill="#067D17">"set_password %s"</tspan>, passcode);</tspan>
      <tspan x="831" dy="16">    <tspan fill="#00627A">system</tspan>(v11);</tspan>
      <tspan x="831" dy="16">}</tspan>
    </text>
    <!-- Danger highlight on system(v11) — line 4: baseline at y=70+3*16=118, rect from y=109 -->
    <rect id="tp-danger-bg" x="831" y="106" width="130" height="15" rx="3" fill="#E53935" fill-opacity="0.12" stroke="#E53935" stroke-width="0.8" opacity="0"/>
    <!-- Role label -->
    <rect x="956" y="148" width="100" height="18" rx="9" fill="#ffebee" stroke="#E53935" stroke-width="0.8"/>
    <text x="1006" y="161" font-size="9" text-anchor="middle" fill="#E53935" font-weight="700" letter-spacing="0.5">READ → SINK</text>
  </g>

  <!-- ==================== Mango resolution arc ==================== -->
  <path id="tp-arc" d="M 200 168 Q 607 270 1006 168" stroke="#8C1D40" stroke-width="2.5" fill="none" stroke-dasharray="5,4" stroke-dashoffset="1100" style="opacity:0;"/>

  <!-- Mango label -->
  <g id="tp-mango-label" style="opacity:0;">
    <rect x="477" y="255" width="260" height="30" rx="5" fill="#8C1D40"/>
    <text x="607" y="275" font-size="12" font-weight="700" text-anchor="middle" fill="#fff" letter-spacing="0.3">Mango resolves cross-binary link</text>
  </g>

  <!-- Bottom summary chain -->
  <g id="tp-summary" style="opacity:0;">
    <text x="607" y="310" font-size="12" text-anchor="middle" fill="#888">
      <tspan fill="#333" font-weight="600">httpd</tspan>
      <tspan fill="#aaa"> → </tspan>
      <tspan fill="#FF9800" font-weight="600">NVRAM</tspan>
      <tspan fill="#aaa"> → </tspan>
      <tspan fill="#333" font-weight="600">dlnad</tspan>
      <tspan fill="#aaa"> → </tspan>
      <tspan fill="#E53935" font-weight="700">command injection</tspan>
    </text>
    <text x="607" y="330" font-size="10" text-anchor="middle" fill="#aaa">attacker-controlled data flows through shared NVRAM to reach system()</text>
  </g>
</svg>
</div>

<script>
window._animQueue.push(function() {
  var diagram = document.getElementById('trupoc-diagram');
  if (!diagram) return;
  var slideEl = diagram.closest('.slide');
  var slides = document.querySelectorAll('.slide');
  var idx = Array.from(slides).indexOf(slideEl);
  if (idx < 0) return;

  function getEl(id) { return document.getElementById(id); }

  // Helper: show a list of elements with fade-in
  function showIds(ids, instant) {
    ids.forEach(function(id) {
      var el = getEl(id);
      if (!el) return;
      el.style.opacity = '1';
      el.setAttribute('opacity', '1');
      // For path elements with stroke-dashoffset, reset to 0
      if (el.tagName === 'path' && el.style.strokeDashoffset !== undefined) {
        el.style.strokeDashoffset = '0';
      }
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
      // Cancel WAAPI animations so fill:forwards doesn't override
      el.getAnimations().forEach(function(a) { a.cancel(); });
      el.style.opacity = '0';
      el.setAttribute('opacity', '0');
      // Reset stroke-dashoffset for path elements
      if (el.tagName === 'path') {
        var dashArr = el.getAttribute('stroke-dasharray');
        if (dashArr) el.style.strokeDashoffset = dashArr;
      }
    });
  }

  window.registerSlideAnimation(idx, {
    mode: 'step',
    steps: [
      // Step 1: Badge + httpd source binary
      {
        show: function(instant) { showIds(['tp-badge', 'tp-httpd'], instant); },
        hide: function() { hideIds(['tp-badge', 'tp-httpd']); }
      },
      // Step 2: Data flows to NVRAM (arrow, label, pulse, nvram box)
      {
        show: function(instant) {
          showIds(['tp-arrow1', 'tp-label-writes', 'tp-pulse1', 'tp-nvram'], instant);
          var arrow = getEl('tp-arrow1');
          if (arrow) { arrow.style.opacity = '1'; arrow.style.strokeDashoffset = '0'; }
        },
        hide: function() {
          hideIds(['tp-arrow1', 'tp-label-writes', 'tp-pulse1', 'tp-nvram']);
        }
      },
      // Step 3: NVRAM highlight on dangerous row
      {
        show: function(instant) {
          var nh = getEl('tp-nvram-highlight');
          if (nh) { nh.style.opacity = '0.15'; nh.setAttribute('opacity', '0.15'); }
        },
        hide: function() {
          var nh = getEl('tp-nvram-highlight');
          if (nh) { nh.style.opacity = '0'; nh.setAttribute('opacity', '0'); }
        }
      },
      // Step 4: Data flows to dlnad (arrow, label, pulse, dlnad box)
      {
        show: function(instant) {
          showIds(['tp-arrow2', 'tp-label-reads', 'tp-pulse2', 'tp-dlnad'], instant);
          var arrow = getEl('tp-arrow2');
          if (arrow) { arrow.style.opacity = '1'; arrow.style.strokeDashoffset = '0'; }
        },
        hide: function() {
          hideIds(['tp-arrow2', 'tp-label-reads', 'tp-pulse2', 'tp-dlnad']);
        }
      },
      // Step 5: Danger highlight on system(v11)
      {
        show: function(instant) {
          var db = getEl('tp-danger-bg');
          if (db) { db.style.opacity = '1'; db.setAttribute('opacity', '1'); }
        },
        hide: function() {
          var db = getEl('tp-danger-bg');
          if (db) { db.style.opacity = '0'; db.setAttribute('opacity', '0'); }
        }
      },
      // Step 6: Mango resolution arc + label
      {
        show: function(instant) {
          var arc = getEl('tp-arc');
          if (arc) { arc.style.opacity = '1'; arc.style.strokeDashoffset = '0'; }
          showIds(['tp-mango-label'], instant);
        },
        hide: function() {
          var arc = getEl('tp-arc');
          if (arc) { arc.style.opacity = '0'; arc.style.strokeDashoffset = '1100'; }
          hideIds(['tp-mango-label']);
        }
      },
      // Step 7: Summary text
      {
        show: function(instant) { showIds(['tp-summary'], instant); },
        hide: function() { hideIds(['tp-summary']); }
      }
    ]
  });
});
</script>

???

This is a real bug we found in the Netgear R6400. [CLICK] httpd, the web server, receives user input through HTTP and writes it to NVRAM. [CLICK] dlnad, a separate binary, reads from the same NVRAM key. [CLICK] It creates a command string via sprintf, using unsanitized input. [CLICK] Passes that command to system. Command injection. The critical piece: [CLICK] Mango automatically resolves the cross-binary link through NVRAM. When we see nvram_set in one binary and nvram_get in another with the same key, Environment Resolution connects them. The attacker data flows from httpd through NVRAM into dlnad and to the sink. Mango produces the full chain: httpd → NVRAM → dlnad → command injection. That chain justifies the alert. Without Environment Resolution, we would flag dlnad as vulnerable in isolation, but the true PoC requires understanding the cross-binary connection.
