---
type: content
title: "The Complete Pipeline"
---

<div id="pipe-diagram">
<svg viewBox="0 0 1100 220" style="width: 100%; margin: 10px auto 20px auto; display: block;" id="pipe-svg">
  <defs>
    <marker id="arrowPipe" markerWidth="10" markerHeight="10" refX="7" refY="3" orient="auto" markerUnits="strokeWidth">
      <path d="M0,0 L0,6 L9,3 z" fill="#555"/>
    </marker>
  </defs>

  <!-- Step 1: Firmware input -->
  <g id="pipe-fw" style="opacity:0;">
    <rect x="20" y="60" width="130" height="80" fill="#f5f5f5" stroke="#333" stroke-width="2" rx="6"/>
    <text x="85" y="95" font-size="13" font-weight="bold" text-anchor="middle" fill="#333">Firmware</text>
    <text x="85" y="115" font-size="11" text-anchor="middle" fill="#666">1,698 images</text>
  </g>

  <!-- Step 2: Arrow + Mango -->
  <g id="pipe-mango" style="opacity:0;">
    <path d="M 150 100 L 200 100" stroke="#555" stroke-width="2.5" fill="none" marker-end="url(#arrowPipe)"/>
    <rect x="205" y="50" width="180" height="100" fill="#fff3e0" stroke="#FF9800" stroke-width="2.5" rx="6"/>
    <text x="295" y="85" font-size="14" font-weight="bold" text-anchor="middle" fill="#333">Operation Mango</text>
    <text x="295" y="108" font-size="11" text-anchor="middle" fill="#666">Scalable detection</text>
    <text x="295" y="125" font-size="11" text-anchor="middle" fill="#666">Every binary analyzed</text>
    <text x="295" y="142" font-size="11" text-anchor="middle" fill="#FF9800" font-weight="bold">10,834 alerts</text>
  </g>

  <!-- Step 3: Arrow + AIL SymEx -->
  <g id="pipe-ail" style="opacity:0;">
    <path d="M 385 100 L 435 100" stroke="#555" stroke-width="2.5" fill="none" marker-end="url(#arrowPipe)"/>
    <rect x="440" y="50" width="180" height="100" fill="#e3f2fd" stroke="#2196F3" stroke-width="2.5" rx="6"/>
    <text x="530" y="85" font-size="14" font-weight="bold" text-anchor="middle" fill="#333">AIL SymEx</text>
    <text x="530" y="108" font-size="11" text-anchor="middle" fill="#666">Formal validation</text>
    <text x="530" y="125" font-size="11" text-anchor="middle" fill="#666">Path feasibility proof</text>
    <text x="530" y="142" font-size="11" text-anchor="middle" fill="#2196F3" font-weight="bold">51 confirmed</text>
  </g>

  <!-- Step 4: Arrow + Output + Artiphishell -->
  <g id="pipe-output" style="opacity:0;">
    <path d="M 620 100 L 670 100" stroke="#555" stroke-width="2.5" fill="none" marker-end="url(#arrowPipe)"/>
    <rect x="675" y="50" width="160" height="100" fill="#ffebee" stroke="#8C1D40" stroke-width="2.5" rx="6"/>
    <text x="755" y="85" font-size="14" font-weight="bold" text-anchor="middle" fill="#8C1D40">Concrete PoC</text>
    <text x="755" y="108" font-size="11" text-anchor="middle" fill="#666">Triggering inputs</text>
    <text x="755" y="125" font-size="11" text-anchor="middle" fill="#666">Vendor-ready reports</text>
    <text x="755" y="142" font-size="11" text-anchor="middle" fill="#8C1D40" font-weight="bold">166 exploitable</text>

    <!-- Artiphishell annotation below -->
    <rect x="295" y="175" width="280" height="30" fill="#f3e5f5" stroke="#9C27B0" stroke-width="1.5" rx="3"/>
    <text x="435" y="196" font-size="11" font-weight="bold" text-anchor="middle" fill="#7B1FA2">Artiphishell: autonomous lifecycle (source-available)</text>
    <path d="M 435 150 L 435 175" stroke="#9C27B0" stroke-width="1.5" stroke-dasharray="4,3" fill="none"/>
  </g>

</svg>
</div>

**A vulnerability analysis pipeline that is simultaneously complete and scalable**

Three projects together close the gap between detection and confirmation

<script>
window._animQueue.push(function() {
  var diagram = document.getElementById('pipe-diagram');
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
      {
        show: function(instant) { showIds(['pipe-fw'], instant); },
        hide: function() { hideIds(['pipe-fw']); }
      },
      {
        show: function(instant) { showIds(['pipe-mango'], instant); },
        hide: function() { hideIds(['pipe-mango']); }
      },
      {
        show: function(instant) { showIds(['pipe-ail'], instant); },
        hide: function() { hideIds(['pipe-ail']); }
      },
      {
        show: function(instant) { showIds(['pipe-output'], instant); },
        hide: function() { hideIds(['pipe-output']); }
      }
    ]
  });
});
</script>

???

So here's the complete picture. [CLICK] We scan 1,698 firmware images. [CLICK] Mango runs across every binary and produces 10,834 alerts. These are statically-detected candidates encoding value-level reasoning about data flows. [CLICK] Those candidates go into AIL SymEx for validation. Symbolic execution on the AIL intermediate language proves path feasibility and generates concrete triggering inputs. 51 confirmed as reachable. [CLICK] From those, we synthesize concrete PoC exploits with triggering inputs. That is what vendors actually need to issue a patch. 166 exploitable vulnerabilities confirmed across the full dataset.

Now, Artiphishell sits alongside this. It demonstrates that the full vulnerability lifecycle, from detection through patch synthesis and verification, is automatable. But it works on source code. Mango works on binaries. AIL SymEx bridges that gap: it validates Mango's binary-only candidates with the same rigor Artiphishell applies to source.

Together, we have a pipeline that is both complete, covering the whole detection-to-confirmation cycle, and scalable, handling thousands of firmware images at once.
