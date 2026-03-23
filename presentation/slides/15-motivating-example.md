---
type: content
title: "Environment Resolution & TruPoC Ranking"
---

<div id="trupoc-diagram">
<svg viewBox="0 0 1100 410" style="width: 100%; margin: 0 auto; display: block;" id="trupoc-svg">
  <defs>
    <marker id="arrowBlue17" markerWidth="8" markerHeight="8" refX="5" refY="3" orient="auto" markerUnits="strokeWidth">
      <path d="M0,0 L0,6 L7,3 z" fill="#2196F3"/>
    </marker>
    <radialGradient id="pulseGrad17">
      <stop offset="0%" stop-color="#FF9800" stop-opacity="0.85"/>
      <stop offset="100%" stop-color="#FF9800" stop-opacity="0"/>
    </radialGradient>
  </defs>

  <!-- ==================== R6400 badge (centered over NVRAM) ==================== -->
  <g id="tp-badge" style="opacity:0;">
    <rect x="695" y="2" width="210" height="24" rx="12" fill="#8C1D40" opacity="0.9"/>
    <text x="800" y="18" font-size="11" font-weight="600" text-anchor="middle" fill="#fff" letter-spacing="0.3">Real Bug: Netgear R6400</text>
  </g>

  <!-- ==================== httpd box (top-left) ==================== -->
  <g id="tp-httpd" style="opacity:0;">
    <rect x="5" y="10" width="480" height="152" fill="#fafafa" stroke="#444" stroke-width="1.5" rx="6"/>
    <!-- Title bar -->
    <rect x="5" y="10" width="480" height="28" fill="#555" rx="6"/>
    <rect x="5" y="31" width="480" height="7" fill="#555"/>
    <text x="245" y="29" font-size="15" font-weight="700" text-anchor="middle" fill="#fff" font-family="'JetBrains Mono', monospace" letter-spacing="0.5">httpd</text>
    <!-- Code -->
    <text x="18" y="56" font-size="13" font-family="'JetBrains Mono', monospace" fill="#1a1a1a" xml:space="preserve">
      <tspan x="18" dy="0"><tspan fill="#0033B3" font-weight="600">void</tspan> <tspan fill="#00627A">change_passcode</tspan>(request) {</tspan>
      <tspan x="18" dy="19">    passcode = <tspan fill="#00627A">get_http_param</tspan>(request, <tspan fill="#067D17">"remote_passcode"</tspan>);</tspan>
      <tspan x="18" dy="19">    <tspan fill="#00627A">nvram_set</tspan>(<tspan fill="#067D17">"remote_passcode"</tspan>, passcode);</tspan>
      <tspan x="18" dy="19">    <tspan fill="#00627A">system</tspan>(<tspan fill="#067D17">"dlnad"</tspan>);</tspan>
      <tspan x="18" dy="19">}</tspan>
    </text>
    <!-- Role label -->
    <rect x="195" y="164" width="110" height="20" rx="10" fill="#e3f2fd" stroke="#2196F3" stroke-width="0.8"/>
    <text x="250" y="178" font-size="10" text-anchor="middle" fill="#2196F3" font-weight="700" letter-spacing="0.5">WRITE SOURCE</text>
  </g>

  <!-- ==================== Arrow 1: httpd → NVRAM ==================== -->
  <path id="tp-arrow1" d="M 485 90 L 598 155" stroke="#2196F3" stroke-width="2.5" fill="none" marker-end="url(#arrowBlue17)" stroke-dasharray="140" stroke-dashoffset="140" style="opacity:0;"/>
  <text id="tp-label-writes" x="530" y="110" font-size="11" text-anchor="middle" fill="#2196F3" font-weight="600" style="opacity:0;" transform="rotate(30, 530, 110)">writes</text>

  <!-- Data pulse 1 -->
  <circle id="tp-pulse1" cx="485" cy="90" r="6" fill="url(#pulseGrad17)" style="opacity:0;"/>

  <!-- ==================== NVRAM box (right side, spanning full height) ==================== -->
  <g id="tp-nvram" style="opacity:0;">
    <rect x="605" y="35" width="390" height="340" fill="#fffbf0" stroke="#FF9800" stroke-width="2" rx="6"/>
    <!-- Title bar -->
    <rect x="605" y="35" width="390" height="32" fill="#FF9800" rx="6"/>
    <rect x="605" y="57" width="390" height="10" fill="#FF9800"/>
    <text x="800" y="57" font-size="16" font-weight="700" text-anchor="middle" fill="#fff" letter-spacing="1">NVRAM</text>

    <!-- Column headers -->
    <text x="680" y="88" font-size="12" font-weight="700" fill="#999" font-family="'JetBrains Mono', monospace" letter-spacing="0.5">KEY</text>
    <text x="835" y="88" font-size="12" font-weight="700" fill="#999" font-family="'JetBrains Mono', monospace" letter-spacing="0.5">VALUE</text>
    <line x1="622" y1="97" x2="978" y2="97" stroke="#f0e0c0" stroke-width="0.8"/>

    <!-- Row 1: wifi_ssid -->
    <text x="680" y="125" font-size="13" fill="#888" font-family="'JetBrains Mono', monospace">wifi_ssid</text>
    <text x="835" y="125" font-size="13" fill="#aaa" font-family="'JetBrains Mono', monospace">"HomeNet"</text>
    <line x1="622" y1="137" x2="978" y2="137" stroke="#f5ead5" stroke-width="0.5"/>

    <!-- Row 2: remote_passcode (DANGEROUS) -->
    <rect id="tp-nvram-highlight" x="620" y="148" width="362" height="30" rx="3" fill="#E53935" opacity="0"/>
    <text x="680" y="169" font-size="12" fill="#333" font-family="'JetBrains Mono', monospace" font-weight="700">remote_passcode</text>
    <text x="835" y="169" font-size="12" fill="#C41C3B" font-family="'JetBrains Mono', monospace" font-weight="700">"; cat /etc/shadow"</text>
    <line x1="622" y1="183" x2="978" y2="183" stroke="#f5ead5" stroke-width="0.5"/>

    <!-- Row 3: http_port -->
    <text x="680" y="210" font-size="13" fill="#888" font-family="'JetBrains Mono', monospace">http_port</text>
    <text x="835" y="210" font-size="13" fill="#aaa" font-family="'JetBrains Mono', monospace">"8080"</text>
    <line x1="622" y1="222" x2="978" y2="222" stroke="#f5ead5" stroke-width="0.5"/>

    <!-- Row 4: lan_ipaddr -->
    <text x="680" y="248" font-size="13" fill="#888" font-family="'JetBrains Mono', monospace">lan_ipaddr</text>
    <text x="835" y="248" font-size="13" fill="#aaa" font-family="'JetBrains Mono', monospace">"192.168.1.1"</text>
    <line x1="622" y1="260" x2="978" y2="260" stroke="#f5ead5" stroke-width="0.5"/>

    <!-- Row 5: wan_gateway -->
    <text x="680" y="286" font-size="13" fill="#888" font-family="'JetBrains Mono', monospace">wan_gateway</text>
    <text x="835" y="286" font-size="13" fill="#aaa" font-family="'JetBrains Mono', monospace">"10.0.0.1"</text>
    <line x1="622" y1="298" x2="978" y2="298" stroke="#f5ead5" stroke-width="0.5"/>

    <!-- Row 6: dns_server -->
    <text x="680" y="324" font-size="13" fill="#888" font-family="'JetBrains Mono', monospace">dns_server</text>
    <text x="835" y="324" font-size="13" fill="#aaa" font-family="'JetBrains Mono', monospace">"8.8.8.8"</text>

    <!-- Subtitle -->
    <text x="800" y="362" font-size="10" text-anchor="middle" fill="#bbb" letter-spacing="0.3">shared key-value store across all binaries</text>
  </g>

  <!-- ==================== Arrow 2: NVRAM → dlnad ==================== -->
  <path id="tp-arrow2" d="M 598 270 L 485 310" stroke="#2196F3" stroke-width="2.5" fill="none" marker-end="url(#arrowBlue17)" stroke-dasharray="140" stroke-dashoffset="140" style="opacity:0;"/>
  <text id="tp-label-reads" x="555" y="280" font-size="11" text-anchor="middle" fill="#2196F3" font-weight="600" style="opacity:0;" transform="rotate(-20, 555, 280)">reads</text>

  <!-- Data pulse 2 -->
  <circle id="tp-pulse2" cx="598" cy="270" r="6" fill="url(#pulseGrad17)" style="opacity:0;"/>

  <!-- ==================== dlnad box (bottom-left) ==================== -->
  <g id="tp-dlnad" style="opacity:0;">
    <rect x="5" y="230" width="480" height="152" fill="#fafafa" stroke="#444" stroke-width="1.5" rx="6"/>
    <!-- Title bar -->
    <rect x="5" y="230" width="480" height="28" fill="#555" rx="6"/>
    <rect x="5" y="251" width="480" height="7" fill="#555"/>
    <text x="245" y="249" font-size="15" font-weight="700" text-anchor="middle" fill="#fff" font-family="'JetBrains Mono', monospace" letter-spacing="0.5">dlnad</text>
    <!-- Code -->
    <text x="18" y="276" font-size="13" font-family="'JetBrains Mono', monospace" fill="#1a1a1a" xml:space="preserve">
      <tspan x="18" dy="0"><tspan fill="#0033B3" font-weight="600">void</tspan> <tspan fill="#00627A">main</tspan>() {</tspan>
      <tspan x="18" dy="19">    passcode = <tspan fill="#00627A">nvram_get</tspan>(<tspan fill="#067D17">"remote_passcode"</tspan>);</tspan>
      <tspan x="18" dy="19">    <tspan fill="#00627A">sprintf</tspan>(v11, <tspan fill="#067D17">"set_password %s"</tspan>, passcode);</tspan>
      <tspan x="18" dy="19">    <tspan fill="#00627A">system</tspan>(v11);</tspan>
      <tspan x="18" dy="19">}</tspan>
    </text>
    <!-- Danger highlight on system(v11) — line 4: y=276+3*19=333, rect slightly above baseline -->
    <rect id="tp-danger-bg" x="18" y="322" width="145" height="17" rx="3" fill="#E53935" fill-opacity="0.12" stroke="#E53935" stroke-width="0.8" opacity="0"/>
    <!-- Role label -->
    <rect x="195" y="384" width="110" height="20" rx="10" fill="#ffebee" stroke="#E53935" stroke-width="0.8"/>
    <text x="250" y="398" font-size="10" text-anchor="middle" fill="#E53935" font-weight="700" letter-spacing="0.5">READ → SINK</text>
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
      // Step 1: httpd source binary
      {
        show: function(instant) { showIds(['tp-httpd'], instant); },
        hide: function() { hideIds(['tp-httpd']); }
      },
      // Step 2: Data flows to NVRAM (arrow, pulse, nvram box, then label fades without translate)
      {
        show: function(instant) {
          showIds(['tp-arrow1', 'tp-pulse1', 'tp-nvram'], instant);
          var arrow = getEl('tp-arrow1');
          if (arrow) { arrow.style.opacity = '1'; arrow.style.strokeDashoffset = '0'; }
          // Label fades in without translateY so it stays aligned with the arrow
          var lbl = getEl('tp-label-writes');
          if (lbl) {
            lbl.style.opacity = '1';
            lbl.setAttribute('opacity', '1');
            if (!instant) {
              lbl.animate([{ opacity: 0 }, { opacity: 1 }], { duration: 300, easing: 'ease-out' });
            }
          }
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
      // Step 4: Data flows to dlnad (arrow, pulse, dlnad box, badge) + label fades without translate
      {
        show: function(instant) {
          showIds(['tp-arrow2', 'tp-pulse2', 'tp-dlnad', 'tp-badge'], instant);
          var arrow = getEl('tp-arrow2');
          if (arrow) { arrow.style.opacity = '1'; arrow.style.strokeDashoffset = '0'; }
          // Label fades in without translateY so it stays aligned with the arrow
          var lbl = getEl('tp-label-reads');
          if (lbl) {
            lbl.style.opacity = '1';
            lbl.setAttribute('opacity', '1');
            if (!instant) {
              lbl.animate([{ opacity: 0 }, { opacity: 1 }], { duration: 300, easing: 'ease-out' });
            }
          }
        },
        hide: function() {
          hideIds(['tp-arrow2', 'tp-label-reads', 'tp-pulse2', 'tp-dlnad', 'tp-badge']);
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
    ]
  });
});
</script>

???

This is a real bug we found in the Netgear R6400. [CLICK] httpd, the web server, receives user input through HTTP and writes it to NVRAM. [CLICK] dlnad, a separate binary, reads from the same NVRAM key. [CLICK] It creates a command string via sprintf, using unsanitized input. [CLICK] Passes that command to system. Command injection. The critical piece: [CLICK] Mango automatically resolves the cross-binary link through NVRAM. When we see nvram_set in one binary and nvram_get in another with the same key, Environment Resolution connects them. The attacker data flows from httpd through NVRAM into dlnad and to the sink. Mango produces the full chain: httpd → NVRAM → dlnad → command injection. That chain justifies the alert. Without Environment Resolution, we would flag dlnad as vulnerable in isolation, but the true PoC requires understanding the cross-binary connection.
