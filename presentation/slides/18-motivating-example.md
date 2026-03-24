---
type: content
title: "The NVRAM IPC"
---

<div id="trupoc-diagram">
<svg viewBox="0 0 1220 430" style="width: 100%; margin: 0 auto; display: block;" id="trupoc-svg">
  <defs>
    <marker id="arrowBlue17" markerWidth="8" markerHeight="8" refX="5" refY="3" orient="auto" markerUnits="strokeWidth">
      <path d="M0,0 L0,6 L7,3 z" fill="#2196F3"/>
    </marker>
  </defs>

  <!-- ==================== R6400 badge ==================== -->
  <g id="tp-badge" style="opacity:0;">
    <rect x="785" y="2" width="210" height="26" rx="13" fill="#8C1D40" opacity="0.9"/>
    <text x="890" y="19" font-size="14" font-weight="600" text-anchor="middle" fill="#fff" letter-spacing="0.3">Real Bug: Netgear R6400</text>
  </g>

  <!-- ==================== httpd box (top-left) ==================== -->
  <g id="tp-httpd" style="opacity:0;">
    <rect x="30" y="15" width="520" height="150" fill="#fafafa" stroke="#444" stroke-width="1.5" rx="6"/>
    <!-- Title bar -->
    <rect x="30" y="15" width="520" height="28" fill="#555" rx="6"/>
    <rect x="30" y="36" width="520" height="7" fill="#555"/>
    <text x="290" y="34" font-size="17" font-weight="700" text-anchor="middle" fill="#fff" font-family="'JetBrains Mono', monospace" letter-spacing="0.5">httpd</text>
    <!-- Code -->
    <text x="46" y="62" font-size="14.5" font-family="'JetBrains Mono', monospace" fill="#1a1a1a" xml:space="preserve">
      <tspan x="46" dy="0"><tspan fill="#0033B3" font-weight="600">void</tspan> <tspan fill="#00627A">change_passcode</tspan>(request) {</tspan>
      <tspan x="46" dy="19">    passcode = <tspan fill="#00627A">get_http_param</tspan>(request, <tspan fill="#067D17">"remote_passcode"</tspan>);</tspan>
      <tspan x="46" dy="19">    <tspan fill="#00627A">nvram_set</tspan>(<tspan fill="#067D17">"remote_passcode"</tspan>, passcode);</tspan>
      <tspan x="46" dy="19">    <tspan fill="#00627A">system</tspan>(<tspan fill="#067D17">"dlnad"</tspan>);</tspan>
      <tspan x="46" dy="19">}</tspan>
    </text>
    <!-- Role label (inside box, bottom-right) -->
    <!-- WRITE SOURCE label centered below httpd box -->
    <rect x="230" y="170" width="120" height="22" rx="11" fill="#e3f2fd" stroke="#2196F3" stroke-width="0.8"/>
    <text x="290" y="185" font-size="13" text-anchor="middle" fill="#2196F3" font-weight="700" letter-spacing="0.5">WRITE SOURCE</text>
  </g>

  <!-- ==================== Arrow 1: httpd → NVRAM ==================== -->
  <path id="tp-arrow1" d="M 550 100 L 675 160" stroke="#2196F3" stroke-width="2.5" fill="none" marker-end="url(#arrowBlue17)" stroke-dasharray="140" stroke-dashoffset="140" style="opacity:0;"/>
  <text id="tp-label-writes" x="615" y="118" font-size="14" text-anchor="middle" fill="#2196F3" font-weight="600" style="opacity:0;">writes</text>

  <!-- Data pulse 1 -->
  <circle id="tp-pulse1" cx="550" cy="100" r="6" fill="#FF9800" fill-opacity="0.6" style="opacity:0;"/>

  <!-- ==================== NVRAM box (center-right, spanning full height) ==================== -->
  <g id="tp-nvram" style="opacity:0;">
    <rect x="680" y="35" width="420" height="310" fill="#fffbf0" stroke="#FF9800" stroke-width="2" rx="6"/>
    <!-- Title bar -->
    <rect x="680" y="35" width="420" height="32" fill="#FF9800" rx="6"/>
    <rect x="680" y="57" width="420" height="10" fill="#FF9800"/>
    <text x="890" y="57" font-size="18" font-weight="700" text-anchor="middle" fill="#fff" letter-spacing="1">NVRAM</text>

    <!-- Column headers -->
    <text x="760" y="88" font-size="13" font-weight="700" fill="#999" font-family="'JetBrains Mono', monospace" letter-spacing="0.5">KEY</text>
    <text x="940" y="88" font-size="13" font-weight="700" fill="#999" font-family="'JetBrains Mono', monospace" letter-spacing="0.5">VALUE</text>
    <line x1="698" y1="97" x2="1082" y2="97" stroke="#f0e0c0" stroke-width="0.8"/>

    <!-- Row 1: wifi_ssid -->
    <text x="760" y="122" font-size="14" fill="#888" font-family="'JetBrains Mono', monospace">wifi_ssid</text>
    <text x="940" y="122" font-size="14" fill="#aaa" font-family="'JetBrains Mono', monospace">"HomeNet"</text>
    <line x1="698" y1="132" x2="1082" y2="132" stroke="#f5ead5" stroke-width="0.5"/>

    <!-- Row 2: remote_passcode (DANGEROUS) — same height as other rows -->
    <rect id="tp-nvram-highlight" x="696" y="140" width="405" height="24" rx="3" fill="#E53935" opacity="0"/>
    <text x="760" y="158" font-size="14" fill="#333" font-family="'JetBrains Mono', monospace" font-weight="700">remote_passcode</text>
    <!-- Benign value -->
    <text id="tp-nvram-benign" x="940" y="158" font-size="14" fill="#aaa" font-family="'JetBrains Mono', monospace" font-weight="700">"super_secret_123"</text>
    <!-- Malicious payload -->
    <text id="tp-nvram-malicious" x="940" y="158" font-size="14" fill="#C41C3B" font-family="'JetBrains Mono', monospace" font-weight="700" style="opacity:0;">"; cat /etc/shadow"</text>
    <!-- Evil emoji -->
    <text id="tp-evil-emoji" x="1100" y="162" font-size="22" style="opacity:0;">&#x1F608;</text>
    <!-- CMDI label badge (inline, left of key) -->
    <g id="tp-cmdi-label" style="opacity:0;">
      <rect x="696" y="144" width="50" height="18" rx="9" fill="#C41C3B"/>
      <text x="721" y="157" font-size="12" font-weight="700" text-anchor="middle" fill="#fff" letter-spacing="0.8">CMDI</text>
    </g>
    <line x1="698" y1="166" x2="1082" y2="166" stroke="#f5ead5" stroke-width="0.5"/>

    <!-- Row 3: http_port -->
    <text x="760" y="190" font-size="14" fill="#888" font-family="'JetBrains Mono', monospace">http_port</text>
    <text x="940" y="190" font-size="14" fill="#aaa" font-family="'JetBrains Mono', monospace">"8080"</text>
    <line x1="698" y1="200" x2="1082" y2="200" stroke="#f5ead5" stroke-width="0.5"/>

    <!-- Row 4: lan_ipaddr -->
    <text x="760" y="224" font-size="14" fill="#888" font-family="'JetBrains Mono', monospace">lan_ipaddr</text>
    <text x="940" y="224" font-size="14" fill="#aaa" font-family="'JetBrains Mono', monospace">"192.168.1.1"</text>
    <line x1="698" y1="234" x2="1082" y2="234" stroke="#f5ead5" stroke-width="0.5"/>

    <!-- Row 5: wan_gateway -->
    <text x="760" y="258" font-size="14" fill="#888" font-family="'JetBrains Mono', monospace">wan_gateway</text>
    <text x="940" y="258" font-size="14" fill="#aaa" font-family="'JetBrains Mono', monospace">"10.0.0.1"</text>
    <line x1="698" y1="268" x2="1082" y2="268" stroke="#f5ead5" stroke-width="0.5"/>

    <!-- Row 6: dns_server -->
    <text x="760" y="292" font-size="14" fill="#888" font-family="'JetBrains Mono', monospace">dns_server</text>
    <text x="940" y="292" font-size="14" fill="#aaa" font-family="'JetBrains Mono', monospace">"8.8.8.8"</text>

    <!-- Subtitle -->
    <text x="890" y="332" font-size="13" text-anchor="middle" fill="#bbb" letter-spacing="0.3">shared key-value store across all binaries</text>
  </g>

  <!-- ==================== Arrow 2: NVRAM → dlnad ==================== -->
  <path id="tp-arrow2" d="M 675 260 L 550 295" stroke="#2196F3" stroke-width="2.5" fill="none" marker-end="url(#arrowBlue17)" stroke-dasharray="140" stroke-dashoffset="140" style="opacity:0;"/>
  <text id="tp-label-reads" x="620" y="270" font-size="14" text-anchor="middle" fill="#2196F3" font-weight="600" style="opacity:0;">reads</text>

  <!-- Data pulse 2 -->
  <circle id="tp-pulse2" cx="675" cy="260" r="6" fill="#FF9800" fill-opacity="0.6" style="opacity:0;"/>

  <!-- ==================== dlnad box (bottom-left) ==================== -->
  <g id="tp-dlnad" style="opacity:0;">
    <rect x="30" y="220" width="520" height="150" fill="#fafafa" stroke="#444" stroke-width="1.5" rx="6"/>
    <!-- Title bar -->
    <rect x="30" y="220" width="520" height="28" fill="#555" rx="6"/>
    <rect x="30" y="241" width="520" height="7" fill="#555"/>
    <text x="290" y="239" font-size="17" font-weight="700" text-anchor="middle" fill="#fff" font-family="'JetBrains Mono', monospace" letter-spacing="0.5">dlnad</text>
    <!-- Code -->
    <text x="46" y="267" font-size="14.5" font-family="'JetBrains Mono', monospace" fill="#1a1a1a" xml:space="preserve">
      <tspan x="46" dy="0"><tspan fill="#0033B3" font-weight="600">void</tspan> <tspan fill="#00627A">main</tspan>() {</tspan>
      <tspan x="46" dy="19">    passcode = <tspan fill="#00627A">nvram_get</tspan>(<tspan fill="#067D17">"remote_passcode"</tspan>);</tspan>
      <tspan x="46" dy="19">    <tspan fill="#00627A">sprintf</tspan>(v11, <tspan fill="#067D17">"set_password %s"</tspan>, passcode);</tspan>
      <tspan x="46" dy="19">    <tspan fill="#00627A">system</tspan>(v11);</tspan>
      <tspan x="46" dy="19">}</tspan>
    </text>
    <!-- Danger highlight on system(v11) -->
    <rect id="tp-danger-bg" x="46" y="310" width="145" height="17" rx="3" fill="#E53935" fill-opacity="0.12" stroke="#E53935" stroke-width="0.8" opacity="0"/>
    <!-- READ → SINK label centered below dlnad box -->
    <rect x="230" y="375" width="120" height="22" rx="11" fill="#ffebee" stroke="#E53935" stroke-width="0.8"/>
    <text x="290" y="390" font-size="13" text-anchor="middle" fill="#E53935" font-weight="700" letter-spacing="0.5">READ → SINK</text>
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

  function showIds(ids, instant) {
    ids.forEach(function(id) {
      var el = getEl(id);
      if (!el) return;
      el.style.opacity = '1';
      el.setAttribute('opacity', '1');
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
      el.getAnimations().forEach(function(a) { a.cancel(); });
      el.style.opacity = '0';
      el.setAttribute('opacity', '0');
      if (el.tagName === 'path') {
        var dashArr = el.getAttribute('stroke-dasharray');
        if (dashArr) el.style.strokeDashoffset = dashArr;
      }
    });
  }

  function showLabel(id, instant) {
    var lbl = getEl(id);
    if (!lbl) return;
    lbl.style.opacity = '1';
    lbl.setAttribute('opacity', '1');
    if (!instant) {
      lbl.animate([{ opacity: 0 }, { opacity: 1 }], { duration: 300, easing: 'ease-out' });
    }
  }

  window.registerSlideAnimation(idx, {
    mode: 'step',
    steps: [
      // Step 1: httpd source binary
      {
        show: function(instant) { showIds(['tp-httpd'], instant); },
        hide: function() { hideIds(['tp-httpd']); }
      },
      // Step 2: httpd writes to NVRAM
      {
        show: function(instant) {
          showIds(['tp-arrow1', 'tp-pulse1', 'tp-nvram'], instant);
          var arrow = getEl('tp-arrow1');
          if (arrow) { arrow.style.opacity = '1'; arrow.style.strokeDashoffset = '0'; }
          showLabel('tp-label-writes', instant);
        },
        hide: function() {
          hideIds(['tp-arrow1', 'tp-label-writes', 'tp-pulse1', 'tp-nvram']);
        }
      },
      // Step 3: NVRAM flows to dlnad (NO badge yet)
      {
        show: function(instant) {
          showIds(['tp-arrow2', 'tp-pulse2', 'tp-dlnad'], instant);
          var arrow = getEl('tp-arrow2');
          if (arrow) { arrow.style.opacity = '1'; arrow.style.strokeDashoffset = '0'; }
          showLabel('tp-label-reads', instant);
        },
        hide: function() {
          hideIds(['tp-arrow2', 'tp-label-reads', 'tp-pulse2', 'tp-dlnad']);
        }
      },
      // Step 4: Danger highlight on system(v11)
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
      // Step 5: Highlight passcode row red + swap to malicious cmdi + big emoji + CMDI label
      {
        show: function(instant) {
          // Red highlight on the row
          var nh = getEl('tp-nvram-highlight');
          if (nh) { nh.style.opacity = '0.18'; nh.setAttribute('opacity', '0.18'); }
          // Hide benign, show malicious
          var benign = getEl('tp-nvram-benign');
          var malicious = getEl('tp-nvram-malicious');
          if (benign) { benign.style.opacity = '0'; benign.setAttribute('opacity', '0'); }
          if (malicious) {
            malicious.style.opacity = '1'; malicious.setAttribute('opacity', '1');
            if (!instant) {
              malicious.animate([{ opacity: 0 }, { opacity: 1 }], { duration: 300, easing: 'ease-out' });
            }
          }
          // Big evil emoji
          showIds(['tp-evil-emoji'], instant);
          // CMDI label
          showIds(['tp-cmdi-label'], instant);
        },
        hide: function() {
          var nh = getEl('tp-nvram-highlight');
          if (nh) { nh.style.opacity = '0'; nh.setAttribute('opacity', '0'); }
          var benign = getEl('tp-nvram-benign');
          var malicious = getEl('tp-nvram-malicious');
          if (benign) { benign.style.opacity = '1'; benign.setAttribute('opacity', '1'); }
          if (malicious) { malicious.style.opacity = '0'; malicious.setAttribute('opacity', '0'); }
          hideIds(['tp-evil-emoji', 'tp-cmdi-label']);
        }
      },
      // Step 6: Real Bug badge
      {
        show: function(instant) { showIds(['tp-badge'], instant); },
        hide: function() { hideIds(['tp-badge']); }
      },
    ]
  });
});
</script>

???

This diagram shows a real firmware vulnerability. [CLICK] httpd, the web server, receives user input through an HTTP parameter and stores it in NVRAM, a key-value store shared across all binaries on the device. [CLICK] A separate binary, dlnad, reads that same key. [CLICK] It passes the value to sprintf, building a command string, then hands it to system. [CLICK] Now consider what happens when the attacker controls that value. The passcode becomes a command injection payload. [CLICK] This is a real bug in the Netgear R6400. The critical piece: httpd and dlnad never communicate directly. They share state through NVRAM, which persists across process boundaries. Mango automatically resolves this cross-binary link. When it sees nvram_set in one binary and nvram_get in another with the same key, it connects them.
