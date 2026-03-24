---
type: content
title: "MangoDFA: Value Dependency Analysis"
---

<div style="display: flex; gap: 14px; height: 83vh; align-items: stretch;">
  <!-- LEFT COLUMN: Code Block -->
  <div style="flex: 0 0 42%; display: flex; flex-direction: column; justify-content: center;">
    <pre style="background-color: #1e1e1e; border-radius: 8px; padding: 28px; font-family: 'Courier New', monospace; font-size: 28px; line-height: 1.8; box-shadow: 0 4px 8px rgba(0,0,0,0.3); overflow: hidden; margin: 0; color: #D4D4D4;"><span style="color: #569CD6;">void</span> <span style="color: #DCDCAA;">main</span><span style="color: #D4D4D4;">()</span> {
    ...
<span id="line-fgets" style="border-left: 3px solid transparent; padding-left: 8px; transition: all 0.3s;">  <span style="color: #DCDCAA;">fgets</span>(<span style="color: #9CDCFE;">name</span>, <span style="color: #B5CEA8;">0x40</span>, <span style="color: #9CDCFE;">stdin</span>);</span>
<span id="line-sub401080-call" style="border-left: 3px solid transparent; padding-left: 8px; transition: all 0.3s;">  <span style="color: #DCDCAA;">sub_401080</span>(<span style="color: #9CDCFE;">name</span>);</span>
}

<span style="color: #569CD6;">void</span> <span style="color: #DCDCAA;">sub_401080</span>(<span style="color: #4EC9B0;">char</span> *<span style="color: #9CDCFE;">name</span>) {
    ...
<span id="line-snprintf" style="border-left: 3px solid transparent; padding-left: 8px; transition: all 0.3s;">  <span style="color: #DCDCAA;">snprintf</span>(<span style="color: #9CDCFE;">cmd</span>, <span style="color: #B5CEA8;">0x60</span>, <span style="color: #CE9178;">"hostname %s"</span>, <span style="color: #9CDCFE;">name</span>);</span>
<span id="line-system" style="border-left: 3px solid transparent; padding-left: 8px; transition: all 0.3s;">  <span style="color: #DCDCAA;">system</span>(<span style="color: #9CDCFE;">cmd</span>);</span>
}</pre>
  </div>

  <!-- RIGHT COLUMN: Dependency Graph + Rich Expressions side-by-side -->
  <div style="flex: 1; display: flex; flex-direction: column; justify-content: center; align-items: center;">
    <svg id="re-chain" viewBox="0 0 750 530" style="width: 100%; height: 92%; display: block;">
      <defs>
        <marker id="reArr" markerWidth="10" markerHeight="10" refX="8" refY="3" orient="auto" markerUnits="strokeWidth">
          <path d="M0,0 L0,6 L9,3 z" fill="#8C1D40"/>
        </marker>
        <marker id="reArrRed" markerWidth="10" markerHeight="10" refX="8" refY="3" orient="auto" markerUnits="strokeWidth">
          <path d="M0,0 L0,6 L9,3 z" fill="#E53935"/>
        </marker>
        <marker id="dashArr" markerWidth="8" markerHeight="8" refX="6" refY="3" orient="auto" markerUnits="strokeWidth">
          <path d="M0,0 L0,6 L7,3 z" fill="#999"/>
        </marker>
      </defs>

      <!-- Column headers -->
      <text x="135" y="22" font-family="Inter, Arial, sans-serif" font-size="15" text-anchor="middle" fill="#666" font-weight="600">Data Dependency</text>
      <text x="540" y="22" font-family="Inter, Arial, sans-serif" font-size="15" text-anchor="middle" fill="#666" font-weight="600">Rich Expression</text>

      <!-- ═══ ROW 1: name (initial variable) ═══ -->
      <g id="dep-node-name" style="opacity:0;">
        <rect x="50" y="40" width="170" height="42" rx="6" fill="#f5f5f5" stroke="#888" stroke-width="2"/>
        <text x="135" y="67" font-family="Courier New, monospace" font-size="20" font-weight="700" text-anchor="middle" fill="#333">name</text>
      </g>
      <g id="re-node-name" style="opacity:0;">
        <rect x="440" y="40" width="200" height="42" rx="6" fill="#f5f5f5" stroke="#888" stroke-width="2"/>
        <text x="540" y="67" font-family="Courier New, monospace" font-size="20" font-weight="700" text-anchor="middle" fill="#333">name</text>
      </g>
      <line id="link-1" x1="220" y1="61" x2="435" y2="61" stroke="#bbb" stroke-width="1.5" stroke-dasharray="6,4" marker-end="url(#dashArr)" style="opacity:0;"/>

      <!-- Vertical arrow dep 1→2 -->
      <path id="dep-arrow-1" d="M 135 82 L 135 120" stroke="#8C1D40" stroke-width="2.5" fill="none" marker-end="url(#reArr)" style="opacity:0;"/>

      <!-- ═══ ROW 2: fgets (SOURCE) ═══ -->
      <g id="dep-node-fgets" style="opacity:0;">
        <rect x="10" y="125" width="250" height="42" rx="6" fill="#e8f5e9" stroke="#4CAF50" stroke-width="2.5"/>
        <text x="135" y="152" font-family="Courier New, monospace" font-size="16" font-weight="700" text-anchor="middle" fill="#1b5e20">fgets(name,0x40,stdin)</text>
        <text x="165" y="105" font-family="Inter, Arial, sans-serif" font-size="14" font-weight="700" text-anchor="start" fill="#4CAF50">SOURCE</text>
      </g>
      <g id="re-node-fgets" style="opacity:0;">
        <rect x="340" y="125" width="400" height="42" rx="6" fill="#e8f5e9" stroke="#4CAF50" stroke-width="2.5"/>
        <text x="540" y="152" font-family="Courier New, monospace" font-size="16" font-weight="700" text-anchor="middle" fill="#1b5e20">fgets(name, 0x40, stdin)</text>
        <text x="540" y="113" font-family="Inter, Arial, sans-serif" font-size="14" font-weight="700" text-anchor="middle" fill="#4CAF50">SOURCE</text>
      </g>
      <line id="link-2" x1="260" y1="146" x2="335" y2="146" stroke="#bbb" stroke-width="1.5" stroke-dasharray="6,4" marker-end="url(#dashArr)" style="opacity:0;"/>

      <!-- Vertical arrow dep 2→3 -->
      <path id="dep-arrow-2" d="M 135 167 L 135 210" stroke="#8C1D40" stroke-width="2.5" fill="none" marker-end="url(#reArr)" style="opacity:0;"/>

      <!-- ═══ ROW 3: sub_401080(name) — call boundary ═══ -->
      <g id="dep-node-call" style="opacity:0;">
        <rect x="10" y="215" width="250" height="42" rx="6" fill="#f5f5f5" stroke="#888" stroke-width="2" stroke-dasharray="8,4"/>
        <text x="135" y="242" font-family="Courier New, monospace" font-size="16" font-weight="700" text-anchor="middle" fill="#333">sub_401080(name)</text>
        <text x="165" y="192" font-family="Inter, Arial, sans-serif" font-size="14" font-weight="600" text-anchor="start" fill="#FF9800">call boundary</text>
      </g>
      <g id="re-node-call" style="opacity:0;">
        <rect x="340" y="215" width="400" height="42" rx="6" fill="#f5f5f5" stroke="#888" stroke-width="2"/>
        <text x="540" y="242" font-family="Courier New, monospace" font-size="16" font-weight="700" text-anchor="middle" fill="#333">fgets(name, 0x40, stdin)</text>
        <text x="540" y="207" font-family="Inter, Arial, sans-serif" font-size="14" font-weight="600" text-anchor="middle" fill="#999">unchanged</text>
      </g>
      <line id="link-3" x1="260" y1="236" x2="335" y2="236" stroke="#bbb" stroke-width="1.5" stroke-dasharray="6,4" marker-end="url(#dashArr)" style="opacity:0;"/>

      <!-- Vertical arrow dep 3→4 -->
      <path id="dep-arrow-3" d="M 135 257 L 135 300" stroke="#8C1D40" stroke-width="2.5" fill="none" marker-end="url(#reArr)" style="opacity:0;"/>

      <!-- ═══ ROW 4: snprintf (transform) ═══ -->
      <g id="dep-node-snprintf" style="opacity:0;">
        <rect x="10" y="305" width="250" height="42" rx="6" fill="#FFF3E0" stroke="#FF9800" stroke-width="2.5"/>
        <text x="135" y="332" font-family="Courier New, monospace" font-size="14" font-weight="700" text-anchor="middle" fill="#E65100">snprintf(cmd,...,name)</text>
      </g>
      <g id="re-node-snprintf" style="opacity:0;">
        <rect x="310" y="305" width="435" height="42" rx="6" fill="#FFF3E0" stroke="#FF9800" stroke-width="2.5"/>
        <text x="528" y="332" font-family="Courier New, monospace" font-size="16" font-weight="700" text-anchor="middle" fill="#E65100">"hostname " + fgets(name, 0x40, stdin)</text>
      </g>
      <line id="link-4" x1="260" y1="326" x2="305" y2="326" stroke="#bbb" stroke-width="1.5" stroke-dasharray="6,4" marker-end="url(#dashArr)" style="opacity:0;"/>

      <!-- Vertical arrow dep 4→5 -->
      <path id="dep-arrow-4" d="M 135 347 L 135 390" stroke="#E53935" stroke-width="2.5" fill="none" marker-end="url(#reArrRed)" style="opacity:0;"/>

      <!-- ═══ ROW 5: system(cmd) — SINK ═══ -->
      <g id="dep-node-sink" style="opacity:0;">
        <rect x="30" y="395" width="210" height="42" rx="6" fill="#ffebee" stroke="#E53935" stroke-width="2.5"/>
        <text x="135" y="422" font-family="Courier New, monospace" font-size="18" font-weight="700" text-anchor="middle" fill="#C62828">system(cmd)</text>
        <text x="135" y="452" font-family="Inter, Arial, sans-serif" font-size="15" font-weight="700" text-anchor="middle" fill="#E53935">SINK</text>
      </g>
      <g id="re-node-sink" style="opacity:0;">
        <rect x="310" y="395" width="435" height="42" rx="6" fill="#ffebee" stroke="#E53935" stroke-width="2.5"/>
        <text x="528" y="422" font-family="Courier New, monospace" font-size="16" font-weight="700" text-anchor="middle" fill="#C62828">"hostname " + fgets(name, 0x40, stdin)</text>
        <text x="528" y="452" font-family="Inter, Arial, sans-serif" font-size="15" font-weight="700" text-anchor="middle" fill="#E53935">SINK: system(cmd)</text>
      </g>
      <line id="link-5" x1="240" y1="416" x2="305" y2="416" stroke="#bbb" stroke-width="1.5" stroke-dasharray="6,4" marker-end="url(#dashArr)" style="opacity:0;"/>

      <!-- ═══ Summary callout ═══ -->
      <g id="re-summary" style="opacity:0;">
        <rect x="140" y="478" width="470" height="46" rx="8" fill="#F3E5F5" stroke="#7B1FA2" stroke-width="2"/>
        <text x="375" y="498" font-family="Inter, Arial, sans-serif" font-size="14" font-weight="700" text-anchor="middle" fill="#7B1FA2">Rich Expressions track transformation history</text>
        <text x="375" y="516" font-family="Inter, Arial, sans-serif" font-size="12" text-anchor="middle" fill="#7B1FA2">not just tainted / not-tainted bits</text>
      </g>

    </svg>
  </div>
</div>

<script>
window._animQueue.push(function() {
  var el = document.getElementById('re-chain');
  if (!el) return;
  var slideEl = el.closest('.slide');
  var slides = document.querySelectorAll('.slide');
  var idx = Array.from(slides).indexOf(slideEl);
  if (idx < 0) return;

  window.registerSlideAnimation(idx, {
    mode: 'step',
    steps: [
      // Step 1: name tracked, fgets fills it — show both dependency and RE
      makeStep(['dep-node-name', 're-node-name', 'link-1', 'dep-arrow-1', 'dep-node-fgets', 're-node-fgets', 'link-2'], {
        codeLines: ['line-fgets']
      }),
      // Step 2: Crosses call boundary — expression unchanged
      makeStep(['dep-arrow-2', 'dep-node-call', 're-node-call', 'link-3'], {
        codeLines: ['line-sub401080-call']
      }),
      // Step 3: snprintf transforms
      makeStep(['dep-arrow-3', 'dep-node-snprintf', 're-node-snprintf', 'link-4'], {
        codeLines: ['line-snprintf']
      }),
      // Step 4: Reaches sink
      makeStep(['dep-arrow-4', 'dep-node-sink', 're-node-sink', 'link-5'], {
        codeLines: ['line-system']
      }),
      // Step 5: Summary
      makeStep(['re-summary'], {})
    ]
  });
});
</script>

???

This is MangoDFA, the analysis engine. The left column shows the code; the middle column shows the data dependency chain that traditional analysis tracks; and the right column shows the Rich Expression that MangoDFA records at each step. [CLICK] [step 1] User input enters through fgets from stdin. Traditional analysis marks "name" as tainted. MangoDFA records the full Rich Expression: fgets(name, 0x40, stdin). [CLICK] [step 2] The data crosses into sub_401080. The dependency graph just shows the call. MangoDFA's Rich Expression persists unchanged because the value wasn't transformed. [CLICK] [step 3] snprintf wraps the input into a command string. Now the Rich Expression accumulates the transformation: "hostname " + fgets(name, 0x40, stdin). A traditional analysis only knows "cmd is tainted." [CLICK] [step 4] system(cmd) is the sink. The dependency graph just says "tainted data reached system." The Rich Expression tells us exactly what the attacker-controlled string looks like when it hits the dangerous function. [CLICK] [step 5] This is the core insight: Rich Expressions capture the complete transformation history, giving analysts actionable context instead of just a tainted/not-tainted bit.
