---
type: content
title: "Case Study: Mirai Botnet"
footnote: "Source: Antonakakis et al., 'Understanding the Mirai Botnet,' USENIX Security 2017"
---

<style>
.mirai-anim {
  opacity: 0;
  transition: opacity 0.4s ease;
}
.mirai-anim.visible {
  opacity: 1;
}
</style>

<svg id="mirai-diagram" viewBox="0 0 1000 400" style="width:100%; margin:0 auto; display:block;" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <marker id="m-arrow" markerWidth="8" markerHeight="8" refX="7" refY="4" orient="auto">
      <path d="M0,0 L8,4 L0,8 Z" fill="#8C1D40"/>
    </marker>
  </defs>

  <!-- ===== LEFT: Device grid ===== -->
  <text x="220" y="28" text-anchor="middle" font-size="18" font-weight="800" fill="#8C1D40" font-family="Inter, sans-serif">THE VULNERABILITY</text>

  <!-- Device grid: 2 rows x 3 cols -->
  <g id="mirai-devices">
    <g transform="translate(30, 46)">
      <rect x="0" y="0" width="110" height="60" rx="6" fill="#fafafa" stroke="#ddd" stroke-width="1.2"/>
      <text x="55" y="22" text-anchor="middle" font-size="24">📷</text>
      <text x="55" y="42" text-anchor="middle" font-size="13" fill="#555" font-family="Inter, sans-serif">IP Camera</text>
    </g>
    <g transform="translate(155, 46)">
      <rect x="0" y="0" width="110" height="60" rx="6" fill="#fafafa" stroke="#ddd" stroke-width="1.2"/>
      <text x="55" y="22" text-anchor="middle" font-size="24">📷</text>
      <text x="55" y="42" text-anchor="middle" font-size="13" fill="#555" font-family="Inter, sans-serif">DVR</text>
    </g>
    <g transform="translate(280, 46)">
      <rect x="0" y="0" width="110" height="60" rx="6" fill="#fafafa" stroke="#ddd" stroke-width="1.2"/>
      <text x="55" y="22" text-anchor="middle" font-size="24">📡</text>
      <text x="55" y="42" text-anchor="middle" font-size="13" fill="#555" font-family="Inter, sans-serif">Router</text>
    </g>
    <g transform="translate(30, 116)">
      <rect x="0" y="0" width="110" height="60" rx="6" fill="#fafafa" stroke="#ddd" stroke-width="1.2"/>
      <text x="55" y="22" text-anchor="middle" font-size="24">📷</text>
      <text x="55" y="42" text-anchor="middle" font-size="13" fill="#555" font-family="Inter, sans-serif">NVR</text>
    </g>
    <g transform="translate(155, 116)">
      <rect x="0" y="0" width="110" height="60" rx="6" fill="#fafafa" stroke="#ddd" stroke-width="1.2"/>
      <text x="55" y="22" text-anchor="middle" font-size="24">📡</text>
      <text x="55" y="42" text-anchor="middle" font-size="13" fill="#555" font-family="Inter, sans-serif">Gateway</text>
    </g>
    <g transform="translate(280, 116)">
      <rect x="0" y="0" width="110" height="60" rx="6" fill="#fafafa" stroke="#ddd" stroke-width="1.2"/>
      <text x="55" y="22" text-anchor="middle" font-size="24">💡</text>
      <text x="55" y="42" text-anchor="middle" font-size="13" fill="#555" font-family="Inter, sans-serif">Smart Hub</text>
    </g>
    <text x="410" y="155" font-size="28" fill="#999" font-family="Inter, sans-serif">...</text>
  </g>

  <!-- Arrow down -->
  <path d="M 220 185 L 220 205" stroke="#8C1D40" stroke-width="2" fill="none" marker-end="url(#m-arrow)"/>

  <!-- Common vulnerability banner -->
  <rect x="55" y="212" width="330" height="40" rx="6" fill="#FFEBEE" stroke="#E53935" stroke-width="1.5"/>
  <text x="220" y="238" text-anchor="middle" font-size="17" font-weight="700" fill="#C62828" font-family="Inter, sans-serif">Same vulnerability class</text>

  <!-- Stats: separated with clear spacing -->
  <text x="120" y="300" text-anchor="middle" font-size="48" font-weight="800" fill="#E53935" font-family="Inter, sans-serif">600,000</text>
  <text x="120" y="325" text-anchor="middle" font-size="16" fill="#555" font-family="Inter, sans-serif">devices compromised</text>

  <text x="330" y="300" text-anchor="middle" font-size="48" font-weight="800" fill="#E65100" font-family="Inter, sans-serif">60+</text>
  <text x="330" y="325" text-anchor="middle" font-size="16" fill="#555" font-family="Inter, sans-serif">vendors affected</text>

  <!-- Impact line -->
  <text x="220" y="370" text-anchor="middle" font-size="16" font-weight="600" fill="#E65100" font-family="Inter, sans-serif">Took down Dyn DNS, Twitter, Reddit, Netflix</text>

  <!-- ===== DIVIDER ===== -->
  <line x1="460" y1="20" x2="460" y2="380" stroke="#e0e0e0" stroke-width="1.5" stroke-dasharray="6,4"/>

  <!-- ===== RIGHT: Why manual fails (titles only) ===== -->
  <text x="730" y="28" text-anchor="middle" font-size="18" font-weight="800" fill="#8C1D40" font-family="Inter, sans-serif">WHY MANUAL CAN'T KEEP UP</text>

  <!-- Problem 1 -->
  <rect x="500" y="50" width="460" height="56" rx="8" fill="#fafafa" stroke="#ddd" stroke-width="1"/>
  <text x="730" y="84" text-anchor="middle" font-size="17" font-weight="700" fill="#333" font-family="Inter, sans-serif">Software and Device diversity</text>

  <!-- Problem 2 -->
  <rect x="500" y="120" width="460" height="56" rx="8" fill="#fafafa" stroke="#ddd" stroke-width="1"/>
  <text x="730" y="154" text-anchor="middle" font-size="17" font-weight="700" fill="#333" font-family="Inter, sans-serif">Volume exceeds human throughput</text>

  <!-- Problem 3 -->
  <rect x="500" y="190" width="460" height="56" rx="8" fill="#fafafa" stroke="#ddd" stroke-width="1"/>
  <text x="730" y="224" text-anchor="middle" font-size="17" font-weight="700" fill="#333" font-family="Inter, sans-serif">Requires training new experts</text>

  <!-- What's needed -->
  <rect x="500" y="275" width="460" height="56" rx="8" fill="#F3E5F5" stroke="#8C1D40" stroke-width="1.5"/>
  <text x="730" y="300" text-anchor="middle" font-size="18" font-weight="800" fill="#8C1D40" font-family="Inter, sans-serif">What's needed:</text>
  <text x="730" y="321" text-anchor="middle" font-size="16" fill="#555" font-family="Inter, sans-serif">Scalable detection + automated validation</text>

  <!-- ===== OVERLAY: GitHub Issue Card (animated) ===== -->
  <g id="mirai-gh-overlay" class="mirai-anim">
    <!-- Backdrop -->
    <rect x="0" y="0" width="1000" height="400" fill="white" opacity="0.88" rx="0"/>

    <!-- Card shadow/border -->
    <rect x="140" y="30" width="720" height="340" rx="12" fill="#fff" stroke="#d0d7de" stroke-width="2" filter="url(#gh-shadow)"/>

    <!-- GitHub-style header bar -->
    <rect x="140" y="30" width="720" height="48" rx="12" fill="#f6f8fa"/>
    <rect x="140" y="66" width="720" height="12" fill="#f6f8fa"/>

    <!-- Issue icon (open circle) -->
    <circle cx="170" cy="54" r="10" fill="none" stroke="#1a7f37" stroke-width="2"/>
    <circle cx="170" cy="54" r="3" fill="#1a7f37"/>

    <!-- Title -->
    <text x="190" y="52" font-size="11" font-weight="600" fill="#1a7f37" font-family="Inter, sans-serif">Open</text>
    <text x="230" y="52" font-size="11" fill="#656d76" font-family="Inter, sans-serif">BerriAI/litellm #24512</text>
    <text x="160" y="72" font-size="14" font-weight="700" fill="#1f2328" font-family="Inter, sans-serif">[Security] CRITICAL: Malicious litellm_init.pth in litellm 1.82.8</text>

    <!-- "TODAY" badge -->
    <rect x="750" y="38" width="80" height="24" rx="12" fill="#E53935"/>
    <text x="790" y="55" font-size="12" font-weight="700" text-anchor="middle" fill="#fff" font-family="Inter, sans-serif">TODAY</text>

    <!-- Body content -->
    <text x="170" y="110" font-size="13" font-weight="700" fill="#1f2328" font-family="Inter, sans-serif">Supply Chain Compromise</text>

    <!-- Attack description -->
    <rect x="170" y="122" width="660" height="68" rx="6" fill="#fff5f5" stroke="#E53935" stroke-width="1" opacity="0.8"/>
    <text x="185" y="140" font-size="12" fill="#333" font-family="Inter, sans-serif">Malicious .pth file auto-executes on Python startup (no import needed).</text>
    <text x="185" y="157" font-size="12" fill="#333" font-family="Inter, sans-serif">Double base64-encoded payload steals: SSH keys, AWS/GCP/Azure creds,</text>
    <text x="185" y="174" font-size="12" fill="#333" font-family="Inter, sans-serif">K8s tokens, env vars, crypto wallets. Exfiltrates via AES-256 + RSA-4096.</text>

    <!-- Impact boxes -->
    <rect x="170" y="205" width="200" height="50" rx="6" fill="#fafafa" stroke="#ddd" stroke-width="1"/>
    <text x="270" y="226" font-size="11" font-weight="600" text-anchor="middle" fill="#E53935" font-family="Inter, sans-serif">Attack Vector</text>
    <text x="270" y="244" font-size="11" text-anchor="middle" fill="#555" font-family="Inter, sans-serif">PyPI package (pip install)</text>

    <rect x="400" y="205" width="200" height="50" rx="6" fill="#fafafa" stroke="#ddd" stroke-width="1"/>
    <text x="500" y="226" font-size="11" font-weight="600" text-anchor="middle" fill="#E53935" font-family="Inter, sans-serif">Trigger</text>
    <text x="500" y="244" font-size="11" text-anchor="middle" fill="#555" font-family="Inter, sans-serif">Any Python process startup</text>

    <rect x="630" y="205" width="200" height="50" rx="6" fill="#fafafa" stroke="#ddd" stroke-width="1"/>
    <text x="730" y="226" font-size="11" font-weight="600" text-anchor="middle" fill="#E53935" font-family="Inter, sans-serif">Blast Radius</text>
    <text x="730" y="244" font-size="11" text-anchor="middle" fill="#555" font-family="Inter, sans-serif">Every dev/CI/prod using litellm</text>

    <!-- Bottom callout -->
    <rect x="170" y="275" width="660" height="36" rx="6" fill="#fff3e0" stroke="#FF9800" stroke-width="1"/>
    <text x="500" y="299" font-size="14" font-weight="700" text-anchor="middle" fill="#E65100" font-family="Inter, sans-serif">Vulnerabilities aren't just in firmware. They're in your pip install.</text>

    <!-- Key point -->
    <text x="500" y="345" font-size="15" font-weight="700" text-anchor="middle" fill="#8C1D40" font-family="Inter, sans-serif">Manual review cannot keep pace with the attack surface.</text>
  </g>

</svg>

<script>
window._animQueue.push(function() {
  var overlay = document.getElementById('mirai-gh-overlay');
  if (!overlay) return;
  var slideEl = overlay.closest('.slide');
  var slides = document.querySelectorAll('.slide');
  var idx = Array.from(slides).indexOf(slideEl);
  if (idx < 0) return;

  window.registerSlideAnimation(idx, {
    mode: 'step',
    steps: [
      {
        show: function(instant) {
          var el = document.getElementById('mirai-gh-overlay');
          if (el) el.classList.add('visible');
        },
        hide: function() {
          var el = document.getElementById('mirai-gh-overlay');
          if (el) el.classList.remove('visible');
        }
      }
    ]
  });
});
</script>

???

Mirai is the concrete case that makes the scaling argument visceral.

In October 2016, the Mirai botnet conscripted roughly 600,000 IoT devices, cameras, DVRs, routers, gateways, from over 60 different vendors. These devices all shared the same class of vulnerability: default credentials and command injection in their telnet and SSH services. But each vendor shipped a different firmware build, compiled for different architectures, ARM, MIPS, x86, with different binary layouts. The vulnerability was the same in concept, but different in every binary.

[CLICK] And this isn't ancient history. Today, March 24th, 2026, a supply chain compromise was disclosed in LiteLLM, one of the most popular AI proxy libraries. A malicious .pth file, just 34 kilobytes, was inserted into the PyPI package. It auto-executes on any Python startup, no import required, and exfiltrates SSH keys, cloud credentials, Kubernetes tokens, everything. The attack vector is a pip install. The same fundamental problem: vulnerabilities hiding in code that nobody manually reviewed.

That is why manual analysis fails at this scale.

First, firmware diversity blocks per-binary auditing. An analyst who reverse-engineers the bug in Vendor A's camera firmware has to start from scratch for Vendor B's DVR because the binaries are structurally different. The vulnerability class is identical; the binary representations are not.

Second, the volume exceeds human throughput. A single firmware image contains hundreds of binaries. Prior work like Karonte and SaTC analyzed a maximum of 131 out of 3,599 binaries and stopped. The remaining 96% were never examined. Mango, which I'll present in the next section, analyzed all 3,599.

Third, detection alone is not enough. Static tools can flag thousands of candidates across a firmware corpus, but without automated validation, analysts spend their time triaging false positives rather than confirming real vulnerabilities.

What's needed is exactly what this dissertation builds: automated detection that scales across every binary in a firmware image, coupled with validation that confirms which candidates are actually exploitable.
