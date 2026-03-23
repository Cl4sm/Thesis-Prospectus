---
type: content
title: "Root Cause Analysis: DyVA"
---

<div id="dyva-diagram">
<svg viewBox="0 0 1050 490" style="width:100%; display:block; margin: 0 auto;" xmlns="http://www.w3.org/2000/svg" id="dyva-svg">
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

  <!-- ===== STEP 1: Crash input arrives ===== -->
  <g id="dyva-crash" style="opacity:0;">
    <rect x="20" y="120" width="180" height="130" rx="10" fill="#fff3e0" stroke="#FF9800" stroke-width="2.5"/>
    <text x="110" y="155" font-size="16" font-weight="bold" text-anchor="middle" fill="#E65100" font-family="Inter, sans-serif">Crash Report</text>
    <line x1="40" y1="165" x2="180" y2="165" stroke="#FFE0B2" stroke-width="1"/>
    <text x="110" y="185" font-size="12" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">crashing input binary</text>
    <text x="110" y="203" font-size="12" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">stack trace + signal</text>
    <text x="110" y="221" font-size="12" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">POI from Analysis Graph</text>
    <text x="110" y="240" font-size="11" text-anchor="middle" fill="#999" font-style="italic" font-family="Inter, sans-serif">"SIGSEGV at 0x4012a0"</text>
  </g>

  <!-- Arrow: Crash → Agent -->
  <g id="dyva-arrow1" style="opacity:0;">
    <line x1="200" y1="185" x2="280" y2="185" stroke="#4CAF50" stroke-width="2.5" marker-end="url(#dyva-arr)"/>
  </g>

  <!-- ===== STEP 2: Triage Agent (central) ===== -->
  <g id="dyva-agent" style="opacity:0;">
    <rect x="285" y="100" width="230" height="80" rx="12" fill="#4CAF50" stroke="#2E7D32" stroke-width="3"/>
    <text x="400" y="137" font-size="20" font-weight="bold" text-anchor="middle" fill="white" font-family="Inter, sans-serif">Triage Agent</text>
    <text x="400" y="162" font-size="13" text-anchor="middle" fill="#c8e6c9" font-family="Inter, sans-serif">LLM-directed debugging</text>

    <!-- "What is root cause?" explainer below agent -->
    <rect x="290" y="195" width="220" height="55" rx="6" fill="#f5f5f5" stroke="#ddd" stroke-width="1"/>
    <text x="400" y="215" font-size="12" font-weight="600" text-anchor="middle" fill="#333" font-family="Inter, sans-serif">Root cause = the specific</text>
    <text x="400" y="232" font-size="12" font-weight="600" text-anchor="middle" fill="#333" font-family="Inter, sans-serif">code defect causing the crash</text>
    <text x="400" y="247" font-size="11" text-anchor="middle" fill="#888" font-family="Inter, sans-serif">(not just where, but why)</text>
  </g>

  <!-- ===== STEP 3: Tools the agent uses (iterative loop) ===== -->
  <!-- Tool 1: Debugger -->
  <g id="dyva-tool-dbg" style="opacity:0;">
    <rect x="200" y="290" width="155" height="75" rx="8" fill="#e8f5e9" stroke="#4CAF50" stroke-width="2"/>
    <text x="218" y="316" font-size="18" fill="#2E7D32" font-family="Inter, sans-serif">&#9654;</text>
    <text x="240" y="319" font-size="14" font-weight="600" fill="#333" font-family="Inter, sans-serif">GDB / JDB</text>
    <text x="218" y="340" font-size="12" fill="#666" font-family="Inter, sans-serif">Set breakpoints, step</text>
    <text x="218" y="355" font-size="12" fill="#666" font-family="Inter, sans-serif">through, inspect regs</text>

    <!-- Bidirectional arrows: Agent ↔ Debugger -->
    <path d="M 340 180 L 278 290" stroke="#4CAF50" stroke-width="2" fill="none" marker-end="url(#dyva-arr)"/>
    <path d="M 298 290 L 360 182" stroke="#4CAF50" stroke-width="1.5" fill="none" stroke-dasharray="4,4" marker-end="url(#dyva-arr)"/>
  </g>

  <!-- Tool 2: Source Code -->
  <g id="dyva-tool-src" style="opacity:0;">
    <rect x="380" y="290" width="155" height="75" rx="8" fill="#e8f5e9" stroke="#4CAF50" stroke-width="2"/>
    <text x="398" y="316" font-size="18" fill="#2E7D32" font-family="Inter, sans-serif">&#128196;</text>
    <text x="420" y="319" font-size="14" font-weight="600" fill="#333" font-family="Inter, sans-serif">Source Code</text>
    <text x="398" y="340" font-size="12" fill="#666" font-family="Inter, sans-serif">Read functions, trace</text>
    <text x="398" y="355" font-size="12" fill="#666" font-family="Inter, sans-serif">call chains, check types</text>

    <!-- Bidirectional arrows: Agent ↔ Source -->
    <path d="M 420 180 L 458 290" stroke="#4CAF50" stroke-width="2" fill="none" marker-end="url(#dyva-arr)"/>
    <path d="M 438 290 L 400 182" stroke="#4CAF50" stroke-width="1.5" fill="none" stroke-dasharray="4,4" marker-end="url(#dyva-arr)"/>
  </g>

  <!-- Tool 3: Variable Inspector -->
  <g id="dyva-tool-var" style="opacity:0;">
    <rect x="290" y="395" width="155" height="75" rx="8" fill="#e8f5e9" stroke="#4CAF50" stroke-width="2"/>
    <text x="308" y="421" font-size="18" fill="#2E7D32" font-family="Inter, sans-serif">&#128270;</text>
    <text x="330" y="424" font-size="14" font-weight="600" fill="#333" font-family="Inter, sans-serif">Variables</text>
    <text x="308" y="445" font-size="12" fill="#666" font-family="Inter, sans-serif">Inspect values, heap,</text>
    <text x="308" y="460" font-size="12" fill="#666" font-family="Inter, sans-serif">stack frames, layout</text>

    <!-- Arrow: Agent → Variables (through tools) -->
    <path d="M 400 250 L 367 393" stroke="#4CAF50" stroke-width="2" fill="none" marker-end="url(#dyva-arr)"/>
    <path d="M 387 395 Q 500 330 470 182" stroke="#4CAF50" stroke-width="1.5" fill="none" stroke-dasharray="4,4" marker-end="url(#dyva-arr)"/>

    <!-- Iteration loop label -->
    <rect x="140" y="395" width="140" height="50" rx="6" fill="#f5f5f5" stroke="#4CAF50" stroke-width="1.5"/>
    <text x="210" y="415" font-size="12" fill="#4CAF50" font-weight="600" font-family="Inter, sans-serif">Iterative Loop:</text>
    <text x="210" y="432" font-size="11" fill="#666" font-family="Inter, sans-serif">inspect → hypothesize</text>
    <text x="210" y="444" font-size="11" fill="#666" font-family="Inter, sans-serif">→ test → refine</text>
  </g>

  <!-- ===== STEP 4: Example investigation trace ===== -->
  <g id="dyva-trace" style="opacity:0;">
    <rect x="570" y="195" width="450" height="175" rx="8" fill="#fafafa" stroke="#999" stroke-width="1.5"/>
    <text x="795" y="218" font-size="13" font-weight="600" text-anchor="middle" fill="#333" font-family="Inter, sans-serif">Example Investigation Trace</text>
    <line x1="585" y1="225" x2="1005" y2="225" stroke="#e0e0e0" stroke-width="1"/>

    <!-- Trace steps -->
    <circle cx="595" cy="245" r="8" fill="#4CAF50"/>
    <text x="595" y="249" font-size="10" font-weight="bold" text-anchor="middle" fill="white">1</text>
    <text x="615" y="249" font-size="12" fill="#333" font-family="Inter, sans-serif">Replay crash: SIGSEGV at memcpy() in parse_input()</text>

    <circle cx="595" cy="275" r="8" fill="#4CAF50"/>
    <text x="595" y="279" font-size="10" font-weight="bold" text-anchor="middle" fill="white">2</text>
    <text x="615" y="279" font-size="12" fill="#333" font-family="Inter, sans-serif">Set breakpoint, inspect: dest_len=1024, src_len=4096</text>

    <circle cx="595" cy="305" r="8" fill="#4CAF50"/>
    <text x="595" y="309" font-size="10" font-weight="bold" text-anchor="middle" fill="white">3</text>
    <text x="615" y="309" font-size="12" fill="#333" font-family="Inter, sans-serif">Hypothesis: unchecked length from attacker input</text>

    <circle cx="595" cy="335" r="8" fill="#FF9800"/>
    <text x="595" y="339" font-size="10" font-weight="bold" text-anchor="middle" fill="white">4</text>
    <text x="615" y="339" font-size="12" fill="#333" font-family="Inter, sans-serif">Verify: trace src_len back to network read(). Confirmed.</text>

    <circle cx="595" cy="360" r="8" fill="#8C1D40"/>
    <text x="595" y="364" font-size="10" font-weight="bold" text-anchor="middle" fill="white">5</text>
    <text x="615" y="364" font-size="12" fill="#333" font-family="Inter, sans-serif">Root cause: missing bounds check on attacker-controlled length</text>
  </g>

  <!-- ===== STEP 5: Root Cause Report output ===== -->
  <g id="dyva-report" style="opacity:0;">
    <rect x="610" y="395" width="400" height="90" rx="10" fill="#fafafa" stroke="#8C1D40" stroke-width="2.5"/>
    <rect x="610" y="395" width="400" height="35" rx="10" fill="#8C1D40"/>
    <rect x="610" y="420" width="400" height="10" fill="#8C1D40"/>
    <text x="810" y="418" font-size="15" font-weight="bold" text-anchor="middle" fill="white" font-family="Inter, sans-serif">Root Cause Report</text>

    <text x="630" y="450" font-size="12" fill="#333" font-family="Inter, sans-serif"><tspan font-weight="600" fill="#8C1D40">Type:</tspan> CWE-122 Heap Buffer Overflow</text>
    <text x="630" y="468" font-size="12" fill="#333" font-family="Inter, sans-serif"><tspan font-weight="600" fill="#8C1D40">Location:</tspan> parse_input() line 42</text>
    <text x="630" y="486" font-size="12" fill="#333" font-family="Inter, sans-serif"><tspan font-weight="600" fill="#8C1D40">Cause:</tspan> Unchecked memcpy with attacker-controlled length</text>

    <!-- Arrow: Agent → Report -->
    <path d="M 515 140 L 608 420" stroke="#8C1D40" stroke-width="2.5" fill="none" marker-end="url(#dyva-arr-maroon)"/>

    <!-- "Feeds into patching" note -->
    <text x="810" y="505" font-size="13" fill="#888" text-anchor="middle" font-family="Inter, sans-serif" font-style="italic">Feeds directly into patching pipeline (PatcherY + PatcherQ)</text>
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
      // Step 2: Triage agent appears with "what is root cause" explainer
      {
        show: function(instant) { showIds(['dyva-agent'], instant); },
        hide: function() { hideIds(['dyva-agent']); }
      },
      // Step 3: Tools appear one by one (debugger, source, variables + loop label)
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
