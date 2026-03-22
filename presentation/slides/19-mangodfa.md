---
type: content
title: "MangoDFA: Value Dependency Analysis"
---

<div style="display: flex; gap: 20px; height: 83vh; align-items: stretch;">
  <!-- LEFT COLUMN: Code Block -->
  <div style="flex: 0 0 44%; display: flex; flex-direction: column; justify-content: center;">
    <pre style="background-color: #1e1e1e; border-radius: 8px; padding: 28px; font-family: 'Courier New', monospace; font-size: 30px; line-height: 1.8; box-shadow: 0 4px 8px rgba(0,0,0,0.3); overflow: hidden; margin: 0; color: #D4D4D4;"><span style="color: #569CD6;">void</span> <span style="color: #DCDCAA;">main</span><span style="color: #D4D4D4;">()</span> {
<span id="line-fgets" style="border-left: 3px solid transparent; padding-left: 8px; transition: all 0.3s;">  <span style="color: #DCDCAA;">fgets</span>(<span style="color: #9CDCFE;">name</span>, <span style="color: #B5CEA8;">0x40</span>, <span style="color: #9CDCFE;">stdin</span>);</span>
<span id="line-sub401080-call" style="border-left: 3px solid transparent; padding-left: 8px; transition: all 0.3s;">  <span style="color: #DCDCAA;">sub_401080</span>(<span style="color: #9CDCFE;">name</span>);</span>
}

<span style="color: #569CD6;">void</span> <span style="color: #DCDCAA;">sub_401080</span>(<span style="color: #4EC9B0;">char</span> *<span style="color: #9CDCFE;">a1</span>) {
<span id="line-snprintf" style="border-left: 3px solid transparent; padding-left: 8px; transition: all 0.3s;">  <span style="color: #DCDCAA;">snprintf</span>(<span style="color: #9CDCFE;">cmd</span>, <span style="color: #B5CEA8;">0x60</span>, <span style="color: #CE9178;">"hostname %s"</span>, <span style="color: #9CDCFE;">a1</span>);</span>
<span id="line-system" style="border-left: 3px solid transparent; padding-left: 8px; transition: all 0.3s;">  <span style="color: #DCDCAA;">system</span>(<span style="color: #9CDCFE;">cmd</span>);</span>
}</pre>
  </div>

  <!-- RIGHT COLUMN: Value Dependency Graph -->
  <div style="flex: 1; display: flex; flex-direction: column; justify-content: center; align-items: center;">
    <svg id="depgraph" viewBox="0 0 480 580" style="width: 100%; height: 90%; display: block;">
      <defs>
        <marker id="arrowDep" markerWidth="10" markerHeight="10" refX="8" refY="3" orient="auto" markerUnits="strokeWidth">
          <path d="M0,0 L0,6 L9,3 z" fill="#8C1D40"/>
        </marker>
        <marker id="arrowDepGreen" markerWidth="10" markerHeight="10" refX="8" refY="3" orient="auto" markerUnits="strokeWidth">
          <path d="M0,0 L0,6 L9,3 z" fill="#4CAF50"/>
        </marker>
        <marker id="arrowDepRed" markerWidth="10" markerHeight="10" refX="8" refY="3" orient="auto" markerUnits="strokeWidth">
          <path d="M0,0 L0,6 L9,3 z" fill="#E53935"/>
        </marker>
      </defs>

      <!-- Vertical dividing line (subtle) -->
      <line x1="200" y1="20" x2="200" y2="560" stroke="#ddd" stroke-width="1" stroke-dasharray="3,2"/>

      <!-- Column labels -->
      <text x="80" y="25" font-family="Arial, sans-serif" font-size="18" text-anchor="middle" fill="#999" font-weight="600">Call Graph</text>
      <text x="350" y="25" font-family="Arial, sans-serif" font-size="18" text-anchor="middle" fill="#999" font-weight="600">Data Dependencies</text>

      <!-- NODE 1: user_input (source, green) -->
      <g id="node-user-input" opacity="0">
        <rect x="250" y="50" width="190" height="50" rx="6" fill="#e8f5e9" stroke="#4CAF50" stroke-width="2.5"/>
        <text x="345" y="82" font-family="Courier New, monospace" font-size="22" font-weight="700" text-anchor="middle" fill="#1b5e20">user_input</text>
        <text x="345" y="46" font-family="Arial, sans-serif" font-size="12" font-style="italic" text-anchor="middle" fill="#4CAF50">SOURCE</text>
      </g>

      <!-- NODE 2: fgets (call site label) -->
      <g id="node-fgets-label" opacity="0">
        <rect x="15" y="115" width="130" height="45" rx="6" fill="#f5f5f5" stroke="#888" stroke-width="1.5"/>
        <text x="80" y="145" font-family="Courier New, monospace" font-size="20" font-weight="600" text-anchor="middle" fill="#333">fgets</text>
        <!-- Horizontal connector to data column -->
        <line x1="145" y1="137" x2="248" y2="137" stroke="#ccc" stroke-width="1" stroke-dasharray="4,3"/>
      </g>

      <!-- Arrow: user_input -> name (green, from source) -->
      <g id="arrow-user-to-name" opacity="0">
        <path d="M 345 100 L 345 155" stroke="#4CAF50" stroke-width="3" fill="none" marker-end="url(#arrowDepGreen)"/>
        <!-- Rich Expression annotation -->
        <rect x="365" y="113" width="110" height="20" rx="4" fill="#FFF3E0" stroke="#FF9800" stroke-width="1"/>
        <text x="420" y="127" font-family="monospace" font-size="11" text-anchor="middle" fill="#E65100" font-weight="600">fgets(stdin)</text>
      </g>

      <!-- NODE 3: name -->
      <g id="node-name" opacity="0">
        <rect x="250" y="160" width="190" height="50" rx="6" fill="#f5f5f5" stroke="#888" stroke-width="2"/>
        <text x="345" y="192" font-family="Courier New, monospace" font-size="22" font-weight="700" text-anchor="middle" fill="#333">name</text>
      </g>

      <!-- NODE 4: sub_401080 (call site) -->
      <g id="node-sub401080-label" opacity="0">
        <rect x="0" y="230" width="160" height="45" rx="6" fill="#f5f5f5" stroke="#888" stroke-width="1.5"/>
        <text x="80" y="260" font-family="Courier New, monospace" font-size="18" font-weight="600" text-anchor="middle" fill="#333">sub_401080</text>
        <!-- Horizontal connector -->
        <line x1="160" y1="252" x2="248" y2="252" stroke="#ccc" stroke-width="1" stroke-dasharray="4,3"/>
      </g>

      <!-- Arrow: name -> arg1:name -->
      <g id="arrow-name-to-arg1" opacity="0">
        <path d="M 345 210 L 345 275" stroke="#8C1D40" stroke-width="3" fill="none" marker-end="url(#arrowDep)"/>
        <!-- Rich Expression annotation -->
        <rect x="365" y="228" width="110" height="20" rx="4" fill="#FFF3E0" stroke="#FF9800" stroke-width="1"/>
        <text x="420" y="242" font-family="monospace" font-size="11" text-anchor="middle" fill="#E65100" font-weight="600">call boundary</text>
      </g>

      <!-- NODE 5: arg1:name -->
      <g id="node-arg1-name" opacity="0">
        <rect x="250" y="280" width="190" height="50" rx="6" fill="#f5f5f5" stroke="#888" stroke-width="2"/>
        <text x="345" y="312" font-family="Courier New, monospace" font-size="22" font-weight="700" text-anchor="middle" fill="#333">arg1:name</text>
      </g>

      <!-- NODE 6: snprintf (call site) -->
      <g id="node-snprintf-label" opacity="0">
        <rect x="0" y="350" width="160" height="45" rx="6" fill="#f5f5f5" stroke="#888" stroke-width="1.5"/>
        <text x="80" y="380" font-family="Courier New, monospace" font-size="20" font-weight="600" text-anchor="middle" fill="#333">snprintf</text>
        <!-- Horizontal connector -->
        <line x1="160" y1="372" x2="248" y2="372" stroke="#ccc" stroke-width="1" stroke-dasharray="4,3"/>
      </g>

      <!-- Arrow: arg1:name -> arg1:a1 -->
      <g id="arrow-arg1-name-to-a1" opacity="0">
        <path d="M 345 330 L 345 385" stroke="#8C1D40" stroke-width="3" fill="none" marker-end="url(#arrowDep)"/>
      </g>

      <!-- NODE 7: arg1:a1 -->
      <g id="node-arg1-a1" opacity="0">
        <rect x="250" y="390" width="190" height="50" rx="6" fill="#f5f5f5" stroke="#888" stroke-width="2"/>
        <text x="345" y="422" font-family="Courier New, monospace" font-size="22" font-weight="700" text-anchor="middle" fill="#333">arg1:a1</text>
      </g>

      <!-- Arrow: arg1:a1 -> cmd -->
      <g id="arrow-a1-to-cmd" opacity="0">
        <path d="M 345 440 L 345 475" stroke="#8C1D40" stroke-width="3" fill="none" marker-end="url(#arrowDep)"/>
        <!-- Rich Expression annotation -->
        <rect x="360" y="443" width="118" height="20" rx="4" fill="#FFF3E0" stroke="#FF9800" stroke-width="1"/>
        <text x="419" y="457" font-family="monospace" font-size="10" text-anchor="middle" fill="#E65100" font-weight="600">snprintf(%s,...)</text>
      </g>

      <!-- NODE 8: cmd -->
      <g id="node-cmd" opacity="0">
        <rect x="250" y="480" width="190" height="50" rx="6" fill="#f5f5f5" stroke="#888" stroke-width="2"/>
        <text x="345" y="512" font-family="Courier New, monospace" font-size="22" font-weight="700" text-anchor="middle" fill="#333">cmd</text>
      </g>

      <!-- NODE 9: system (SINK, red) -->
      <g id="node-system-label" opacity="0">
        <rect x="0" y="520" width="160" height="45" rx="6" fill="#ffebee" stroke="#E53935" stroke-width="2"/>
        <text x="80" y="550" font-family="Courier New, monospace" font-size="18" font-weight="700" text-anchor="middle" fill="#C62828">system (SINK)</text>
      </g>

      <!-- Arrow: cmd -> system (RED) -->
      <g id="arrow-cmd-to-system" opacity="0">
        <path d="M 250 505 L 160 538" stroke="#E53935" stroke-width="3.5" fill="none" marker-end="url(#arrowDepRed)"/>
      </g>

    </svg>
  </div>
</div>

<script>
window._animQueue.push(function() {
  var el = document.getElementById('depgraph');
  if (!el) return;
  var slideEl = el.closest('.slide');
  var slides = document.querySelectorAll('.slide');
  var idx = Array.from(slides).indexOf(slideEl);
  if (idx < 0) return;

  window.registerSlideAnimation(idx, {
    mode: 'step',
    steps: [
      // Step 1: Source data enters (user_input -> fgets -> name)
      makeStep(['node-user-input', 'node-fgets-label', 'arrow-user-to-name', 'node-name'], {
        codeLines: ['line-fgets']
      }),
      // Step 2: Cross call boundary (sub_401080 -> arg1:name)
      makeStep(['node-sub401080-label', 'arrow-name-to-arg1', 'node-arg1-name'], {
        codeLines: ['line-sub401080-call']
      }),
      // Step 3: Data transformed (snprintf -> arg1:a1 -> cmd)
      makeStep(['node-snprintf-label', 'arrow-arg1-name-to-a1', 'node-arg1-a1', 'arrow-a1-to-cmd', 'node-cmd'], {
        codeLines: ['line-snprintf']
      }),
      // Step 4: Reaches sink (system)
      makeStep(['node-system-label', 'arrow-cmd-to-system'], {
        codeLines: ['line-system']
      })
    ]
  });
});
</script>

???

This is MangoDFA, the analysis engine that builds the value dependency graph. The left side shows code; the right side shows the data dependencies. [CLICK] [step 1] User input enters through fgets from stdin. MangoDFA records a Rich Expression at each step: here, fgets(stdin). The orange annotations show these Rich Expressions, the transformation history that distinguishes MangoDFA from simple taint tracking. [CLICK] [step 2] Name passes across a function call boundary into sub_401080. MangoDFA tracks the argument mapping: name becomes arg1. [CLICK] [step 3] Inside the callee, snprintf transforms arg1 into a command string. MangoDFA records the format string transformation, so we know cmd contains "hostname %s" applied to user input. [CLICK] [step 4] cmd reaches the sink, system(). The full dependency chain from source to sink is recorded with transformation context at each hop. Unlike simple taint analysis that just marks values as "tainted" or "not tainted", MangoDFA constructs the complete dependency graph with transformation history, giving precise, actionable alerts.
