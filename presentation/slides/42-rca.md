---
type: content
title: "Root Cause Analysis: DyVA"
---

<div id="dyva-diagram">
<svg viewBox="0 -15 1050 495" style="width:100%; display:block; margin: 0 auto;" xmlns="http://www.w3.org/2000/svg" id="dyva-svg">
  <defs>
    <marker id="dyva-arr" markerWidth="9" markerHeight="9" refX="8" refY="3" orient="auto">
      <polygon points="0 0, 9 3, 0 6" fill="#4CAF50"/>
    </marker>
    <marker id="dyva-arr-gray" markerWidth="9" markerHeight="9" refX="8" refY="3" orient="auto">
      <polygon points="0 0, 9 3, 0 6" fill="#999"/>
    </marker>
    <marker id="dyva-arr-maroon" markerWidth="9" markerHeight="9" refX="8" refY="3" orient="auto">
      <polygon points="0 0, 9 3, 0 6" fill="#8C1D40"/>
    </marker>
  </defs>

  <!-- ===== ROW 1: Crash Report → Triage Agent + Root cause explainer ===== -->

  <!-- STEP 1: Crash input arrives -->
  <g id="dyva-crash" style="opacity:0;">
    <rect x="25" y="38" width="180" height="105" rx="10" fill="#fff3e0" stroke="#FF9800" stroke-width="2.5"/>
    <text x="115" y="65" font-size="16" font-weight="bold" text-anchor="middle" fill="#E65100" font-family="Inter, sans-serif">Crash Report</text>
    <line x1="40" y1="73" x2="190" y2="73" stroke="#FFE0B2" stroke-width="1"/>
    <text x="115" y="89" font-size="12" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">crashing input binary</text>
    <text x="115" y="103" font-size="12" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">stack trace + signal</text>
    <text x="115" y="117" font-size="12" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">POI from Analysis Graph</text>
    <text x="115" y="135" font-size="12" text-anchor="middle" fill="#999" font-style="italic" font-family="Inter, sans-serif">"SIGSEGV at 0x4012a0"</text>
  </g>

  <!-- Arrow: Crash → Agent -->
  <g id="dyva-arrow1" style="opacity:0;">
    <line x1="205" y1="90" x2="275" y2="90" stroke="#4CAF50" stroke-width="2.5" marker-end="url(#dyva-arr)"/>
  </g>

  <!-- STEP 2: Triage Agent + Root cause explainer (side by side) -->
  <g id="dyva-agent" style="opacity:0;">
    <rect x="280" y="42" width="240" height="72" rx="12" fill="#4CAF50" stroke="#2E7D32" stroke-width="3"/>
    <text x="400" y="74" font-size="22" font-weight="bold" text-anchor="middle" fill="white" font-family="Inter, sans-serif">Triage Agent</text>
    <text x="400" y="96" font-size="13" text-anchor="middle" fill="#c8e6c9" font-family="Inter, sans-serif">LLM-directed debugging</text>

    <!-- Root cause explainer: to the RIGHT of agent -->
    <rect x="545" y="44" width="220" height="68" rx="6" fill="#f5f5f5" stroke="#ddd" stroke-width="1"/>
    <text x="655" y="66" font-size="12.5" font-weight="600" text-anchor="middle" fill="#333" font-family="Inter, sans-serif">Root cause = the specific</text>
    <text x="655" y="82" font-size="12.5" font-weight="600" text-anchor="middle" fill="#333" font-family="Inter, sans-serif">code defect causing the crash</text>
    <text x="655" y="100" font-size="12" text-anchor="middle" fill="#888" font-family="Inter, sans-serif">(not just where, but why)</text>
  </g>

  <!-- ===== ROW 2: Three tools + Iterative Loop ===== -->

  <!-- Tool 1: Debugger -->
  <g id="dyva-tool-dbg" style="opacity:0;">
    <rect x="120" y="182" width="170" height="65" rx="8" fill="#e8f5e9" stroke="#4CAF50" stroke-width="2"/>
    <text x="205" y="208" font-size="15" font-weight="600" text-anchor="middle" fill="#333" font-family="Inter, sans-serif">&#9654; GDB / JDB</text>
    <text x="205" y="225" font-size="11" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">Breakpoints, step through,</text>
    <text x="205" y="238" font-size="11" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">inspect registers</text>

    <!-- Down: Agent → Debugger -->
    <line x1="335" y1="114" x2="205" y2="182" stroke="#4CAF50" stroke-width="2" marker-end="url(#dyva-arr)"/>
    <!-- Up: Debugger → Agent (dashed) -->
    <line x1="225" y1="182" x2="350" y2="114" stroke="#4CAF50" stroke-width="1.5" stroke-dasharray="4,4" marker-end="url(#dyva-arr)"/>
  </g>

  <!-- Tool 2: Source Code -->
  <g id="dyva-tool-src" style="opacity:0;">
    <rect x="320" y="182" width="170" height="65" rx="8" fill="#e8f5e9" stroke="#4CAF50" stroke-width="2"/>
    <text x="405" y="208" font-size="15" font-weight="600" text-anchor="middle" fill="#333" font-family="Inter, sans-serif">&#128196; Source Code</text>
    <text x="405" y="225" font-size="11" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">Read functions, trace</text>
    <text x="405" y="238" font-size="11" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">call chains, check types</text>

    <!-- Down: Agent → Source -->
    <line x1="390" y1="114" x2="395" y2="182" stroke="#4CAF50" stroke-width="2" marker-end="url(#dyva-arr)"/>
    <!-- Up: Source → Agent (dashed) -->
    <line x1="415" y1="182" x2="410" y2="114" stroke="#4CAF50" stroke-width="1.5" stroke-dasharray="4,4" marker-end="url(#dyva-arr)"/>
  </g>

  <!-- Tool 3: Variable Inspector -->
  <g id="dyva-tool-var" style="opacity:0;">
    <rect x="520" y="182" width="170" height="65" rx="8" fill="#e8f5e9" stroke="#4CAF50" stroke-width="2"/>
    <text x="605" y="208" font-size="15" font-weight="600" text-anchor="middle" fill="#333" font-family="Inter, sans-serif">&#128270; Variables</text>
    <text x="605" y="225" font-size="11" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">Inspect values, heap,</text>
    <text x="605" y="238" font-size="11" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">stack frames, layout</text>

    <!-- Down: Agent → Variables -->
    <line x1="460" y1="114" x2="590" y2="182" stroke="#4CAF50" stroke-width="2" marker-end="url(#dyva-arr)"/>
    <!-- Up: Variables → Agent (dashed) -->
    <line x1="610" y1="182" x2="475" y2="114" stroke="#4CAF50" stroke-width="1.5" stroke-dasharray="4,4" marker-end="url(#dyva-arr)"/>

    <!-- Iterative Loop label (to the right of all tools) -->
    <rect x="720" y="186" width="155" height="55" rx="6" fill="#f5f5f5" stroke="#4CAF50" stroke-width="1.5"/>
    <text x="740" y="208" font-size="13" fill="#4CAF50" font-weight="600" font-family="Inter, sans-serif">Iterative Loop:</text>
    <text x="740" y="224" font-size="12" fill="#666" font-family="Inter, sans-serif">inspect → hypothesize</text>
    <text x="740" y="237" font-size="12" fill="#666" font-family="Inter, sans-serif">→ test → refine</text>
  </g>

  <!-- ===== ROW 3: Investigation Trace + Root Cause Report ===== -->

  <!-- STEP 4: Example investigation trace -->
  <g id="dyva-trace" style="opacity:0;">
    <rect x="25" y="300" width="460" height="130" rx="8" fill="#fafafa" stroke="#999" stroke-width="1.5"/>
    <text x="255" y="322" font-size="13" font-weight="600" text-anchor="middle" fill="#333" font-family="Inter, sans-serif">Example Investigation Trace</text>
    <line x1="40" y1="330" x2="470" y2="330" stroke="#e0e0e0" stroke-width="1"/>

    <circle cx="50" cy="349" r="7" fill="#4CAF50"/>
    <text x="50" y="353" font-size="10" font-weight="bold" text-anchor="middle" fill="white">1</text>
    <text x="65" y="353" font-size="13" fill="#333" font-family="Inter, sans-serif">Replay crash: SIGSEGV at memcpy()</text>

    <circle cx="50" cy="371" r="7" fill="#4CAF50"/>
    <text x="50" y="375" font-size="10" font-weight="bold" text-anchor="middle" fill="white">2</text>
    <text x="65" y="375" font-size="13" fill="#333" font-family="Inter, sans-serif">Breakpoint: dest=1024 bytes, src=4096</text>

    <circle cx="50" cy="393" r="7" fill="#4CAF50"/>
    <text x="50" y="397" font-size="10" font-weight="bold" text-anchor="middle" fill="white">3</text>
    <text x="65" y="397" font-size="13" fill="#333" font-family="Inter, sans-serif">Hypothesis: missing bounds check</text>

    <circle cx="50" cy="415" r="7" fill="#FF9800"/>
    <text x="50" y="419" font-size="10" font-weight="bold" text-anchor="middle" fill="white">4</text>
    <text x="65" y="419" font-size="13" fill="#333" font-family="Inter, sans-serif">Verify: trace source back to attacker input</text>
  </g>

  <!-- STEP 5: Root Cause Report output -->
  <g id="dyva-report" style="opacity:0;">
    <!-- Maroon arrow: from loop box bottom straight down to report -->
    <line x1="765" y1="241" x2="765" y2="300" stroke="#8C1D40" stroke-width="2.5" marker-end="url(#dyva-arr-maroon)"/>

    <rect x="520" y="300" width="460" height="130" rx="10" fill="#fafafa" stroke="#8C1D40" stroke-width="2.5"/>
    <rect x="520" y="300" width="460" height="32" rx="10" fill="#8C1D40"/>
    <rect x="520" y="327" width="460" height="8" fill="#8C1D40"/>
    <text x="750" y="322" font-size="15" font-weight="bold" text-anchor="middle" fill="white" font-family="Inter, sans-serif">Root Cause Report</text>

    <text x="545" y="355" font-size="13" fill="#333" font-family="Inter, sans-serif"><tspan font-weight="600" fill="#8C1D40">Type:</tspan> CWE-122 Heap Buffer Overflow</text>
    <text x="545" y="373" font-size="13" fill="#333" font-family="Inter, sans-serif"><tspan font-weight="600" fill="#8C1D40">Location:</tspan> parse_input() line 42</text>
    <text x="545" y="391" font-size="13" fill="#333" font-family="Inter, sans-serif"><tspan font-weight="600" fill="#8C1D40">Cause:</tspan> Unchecked memcpy, attacker-controlled length</text>
    <text x="545" y="415" font-size="12" fill="#888" font-family="Inter, sans-serif">Feeds into patching pipeline (PatcherY + PatcherQ)</text>
  </g>

</svg>
</div>

<script>
window._animQueue.push(function() {
  var diagram = document.getElementById('dyva-diagram');
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
      // Step 1: Crash report arrives
      {
        show: function(instant) { showIds(['dyva-crash', 'dyva-arrow1'], instant); },
        hide: function() { hideIds(['dyva-crash', 'dyva-arrow1']); }
      },
      // Step 2: Triage agent + root cause explainer
      {
        show: function(instant) { showIds(['dyva-agent'], instant); },
        hide: function() { hideIds(['dyva-agent']); }
      },
      // Step 3: Tools cascade in (debugger, source, variables + loop label)
      {
        show: function(instant) {
          showIds(['dyva-tool-dbg'], instant);
          setTimeout(function() { showIds(['dyva-tool-src'], instant); }, instant ? 0 : 150);
          setTimeout(function() { showIds(['dyva-tool-var'], instant); }, instant ? 0 : 300);
        },
        hide: function() {
          hideIds(['dyva-tool-dbg', 'dyva-tool-src', 'dyva-tool-var']);
        }
      },
      // Step 4: Example investigation trace
      {
        show: function(instant) { showIds(['dyva-trace'], instant); },
        hide: function() { hideIds(['dyva-trace']); }
      },
      // Step 5: Root cause report output
      {
        show: function(instant) { showIds(['dyva-report'], instant); },
        hide: function() { hideIds(['dyva-report']); }
      }
    ]
  });
});
</script>

???

Once a fuzzer produces a crashing input, you need to know why it crashed. That's what DyVA does. [CLICK] It starts with a crash report: the crashing input, the stack trace, and a Point of Interest from the Analysis Graph. [CLICK] The Triage Agent receives this and begins LLM-directed debugging. Root cause analysis answers the question: what specific code defect caused this crash? Not just where, but why. A crash at memcpy tells you where the program died. Root cause analysis traces backward to find the missing bounds check that allowed attacker-controlled data to overflow the buffer. [CLICK] The agent has three tools. GDB for setting breakpoints, stepping through execution, and inspecting registers. Source code access for reading functions and tracing call chains. Variable inspection for examining heap layout, stack frames, and data values. The key is the iterative loop: the LLM inspects a point of interest, forms a hypothesis, then tests it by requesting more information. This mirrors how a human analyst debugs. [CLICK] Here's a concrete trace. The agent replays the crash, sees a SIGSEGV at memcpy in parse_input. Sets a breakpoint, inspects arguments: destination buffer is 1024 bytes, source data is 4096. Hypothesis: unchecked length from attacker input. Traces the source length back to a network read call. Confirmed. [CLICK] The output is a structured root cause report with CWE classification, exact location, root cause mechanism, and affected variables. This feeds directly into PatcherY and PatcherQ, which can generate targeted fixes because they know exactly what needs to be fixed and why.
