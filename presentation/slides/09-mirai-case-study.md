---
type: content
title: "Case Study: Mirai Botnet"
footnote: "Source: Antonakakis et al., 'Understanding the Mirai Botnet,' USENIX Security 2017"
---

<style>
#mirai-gh-frame {
  opacity: 0;
  pointer-events: none;
  transition: opacity 0.4s ease;
  position: absolute;
  top: 14.5%;
  left: 50%;
  transform: translateX(-50%);
  z-index: 100;
  width: 78%;
  max-height: 82%;
  border-radius: 10px;
  box-shadow: 0 8px 30px rgba(0,0,0,0.3);
  overflow: hidden;
  border: 2px solid #d0d7de;
}
#mirai-gh-frame.visible {
  opacity: 1;
  pointer-events: auto;
}
#mirai-gh-frame img {
  width: 100%;
  display: block;
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

  <!-- Stats -->
  <text x="120" y="300" text-anchor="middle" font-size="48" font-weight="800" fill="#E53935" font-family="Inter, sans-serif">600,000</text>
  <text x="120" y="325" text-anchor="middle" font-size="16" fill="#555" font-family="Inter, sans-serif">devices compromised</text>

  <text x="330" y="300" text-anchor="middle" font-size="48" font-weight="800" fill="#E65100" font-family="Inter, sans-serif">60+</text>
  <text x="330" y="325" text-anchor="middle" font-size="16" fill="#555" font-family="Inter, sans-serif">vendors affected</text>

  <!-- Impact line -->
  <text x="220" y="370" text-anchor="middle" font-size="16" font-weight="600" fill="#E65100" font-family="Inter, sans-serif">Took down Dyn DNS, Twitter, Reddit, Netflix</text>

  <!-- ===== DIVIDER ===== -->
  <line x1="460" y1="20" x2="460" y2="380" stroke="#e0e0e0" stroke-width="1.5" stroke-dasharray="6,4"/>

  <!-- ===== RIGHT: Why manual fails ===== -->
  <text x="730" y="28" text-anchor="middle" font-size="18" font-weight="800" fill="#8C1D40" font-family="Inter, sans-serif">WHY MANUAL CAN'T KEEP UP</text>

  <rect x="500" y="50" width="460" height="56" rx="8" fill="#fafafa" stroke="#ddd" stroke-width="1"/>
  <text x="730" y="84" text-anchor="middle" font-size="17" font-weight="700" fill="#333" font-family="Inter, sans-serif">Software and Device diversity</text>

  <rect x="500" y="120" width="460" height="56" rx="8" fill="#fafafa" stroke="#ddd" stroke-width="1"/>
  <text x="730" y="154" text-anchor="middle" font-size="17" font-weight="700" fill="#333" font-family="Inter, sans-serif">Volume exceeds human throughput</text>

  <rect x="500" y="190" width="460" height="56" rx="8" fill="#fafafa" stroke="#ddd" stroke-width="1"/>
  <text x="730" y="224" text-anchor="middle" font-size="17" font-weight="700" fill="#333" font-family="Inter, sans-serif">Requires training new experts</text>

  <rect x="500" y="275" width="460" height="56" rx="8" fill="#F3E5F5" stroke="#8C1D40" stroke-width="1.5"/>
  <text x="730" y="300" text-anchor="middle" font-size="18" font-weight="800" fill="#8C1D40" font-family="Inter, sans-serif">What's needed:</text>
  <text x="730" y="321" text-anchor="middle" font-size="16" fill="#555" font-family="Inter, sans-serif">Scalable detection + automated validation</text>
</svg>

<!-- GitHub issue screenshot overlay -->
<div id="mirai-gh-frame">
  <img src="presentation/figures/litellm-issue.png" alt="LiteLLM Supply Chain Compromise - GitHub Issue #24512"/>
</div>

<script>
window._animQueue.push(function() {
  var frame = document.getElementById('mirai-gh-frame');
  if (!frame) return;
  var slideEl = frame.closest('.slide');
  var slides = document.querySelectorAll('.slide');
  var idx = Array.from(slides).indexOf(slideEl);
  if (idx < 0) return;

  window.registerSlideAnimation(idx, {
    mode: 'step',
    steps: [
      {
        show: function(instant) {
          var el = document.getElementById('mirai-gh-frame');
          if (el) el.classList.add('visible');
        },
        hide: function() {
          var el = document.getElementById('mirai-gh-frame');
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
