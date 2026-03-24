---
type: content
title: "Sink-to-Source Coarse-Grained Analysis"
---

<style>
.sts-container {
  display: flex;
  gap: 20px;
  height: 83vh;
  align-items: stretch;
}

.sts-code-column {
  flex: 0 0 44%;
  display: flex;
  flex-direction: column;
  justify-content: center;
}

.sts-code-line {
  border-left: 3px solid transparent;
  padding-left: 8px;
  transition: all 0.3s ease;
}

.sts-trace-column {
  flex: 1;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}

.sts-trace-svg {
  width: 100%;
  height: 90%;
  display: block;
}

.sts-analysis-result {
  margin-top: 1rem;
  opacity: 0;
}

.sts-result-box {
  border: 2px dashed #8C1D40;
  border-radius: 6px;
  padding: 0.8rem 1.5rem;
  background: #fafafa;
  font-size: 26px;
  font-weight: 600;
  color: #333;
  text-align: center;
}
</style>

<div class="sts-container" style="">
  <div class="sts-code-column" style="">
    <pre style="background-color: #1e1e1e; border-radius: 8px; padding: 28px; font-family: 'Courier New', monospace; font-size: 30px; line-height: 1.8; box-shadow: 0 4px 8px rgba(0,0,0,0.3); overflow: hidden; margin: 0; color: #D4D4D4;"><span style="color: #569CD6;">void</span> <span style="color: #DCDCAA;">main</span>() {
   ...
<span id="sts-line-fgets" class="sts-code-line" style="">  <span style="color: #DCDCAA;">fgets</span>(<span style="color: #9CDCFE;">name</span>, <span style="color: #B5CEA8;">0x40</span>, <span style="color: #9CDCFE;">stdin</span>);</span>
<span id="sts-line-startbg" class="sts-code-line" style="">  <span style="color: #DCDCAA;">start_background_task</span>(&amp;<span style="color: #9CDCFE;">thread</span>); <span style="background:#FFB300; color:#1e1e1e; font-size:20px; font-weight:700; padding:2px 8px; border-radius:4px; letter-spacing:0.5px;">NEW</span>
<span id="sts-line-logaccess" style="border-left: 3px solid transparent; padding-left: 8px; transition: all 0.3s;">  <span style="color: #DCDCAA;">log_access</span>(<span style="color: #9CDCFE;">timestamp</span>);</span>  <span style="background:#FFB300; color:#1e1e1e; font-size:20px; font-weight:700; padding:2px 8px; border-radius:4px; letter-spacing:0.5px;">NEW</span>
<span id="sts-line-sub401080-call" class="sts-code-line" style="">  <span style="color: #DCDCAA;">sub_401080</span>(<span style="color: #9CDCFE;">name</span>);</span>
}

<span style="color: #569CD6;">void</span> <span style="color: #DCDCAA;">sub_401080</span>(<span style="color: #4EC9B0;">char</span> *<span style="color: #9CDCFE;">name</span>) {
   ...
<span id="sts-line-validate" class="sts-code-line" style="">  <span style="color: #DCDCAA;">validate_name</span>(<span style="color: #9CDCFE;">name</span>);          <span style="background:#FFB300; color:#1e1e1e; font-size:20px; font-weight:700; padding:2px 8px; border-radius:4px; letter-spacing:0.5px;">NEW</span></span>
<span id="sts-line-snprintf" class="sts-code-line" style="">  <span style="color: #DCDCAA;">snprintf</span>(<span style="color: #9CDCFE;">cmd</span>, <span style="color: #B5CEA8;">0x60</span>, <span style="color: #CE9178;">"hostname %s"</span>, <span style="color: #9CDCFE;">name</span>);</span>
<span id="sts-line-system" class="sts-code-line" style="">  <span style="color: #DCDCAA;">system</span>(<span style="color: #9CDCFE;">cmd</span>);</span>
}</pre>
  </div>

  <div class="sts-trace-column" style="">
    <svg class="sts-trace-svg" viewBox="0 0 500 580" preserveAspectRatio="xMidYMid meet" style="">
      <!-- Layout: SOURCE at top, SINK at bottom (natural code flow) -->
      <!-- Animation reveals bottom-to-top (sink-to-source direction) -->

      <!-- Node 4 (top): SOURCE - fgets -->
      <g id="sts-node-4" opacity="0">
        <rect x="40" y="15" width="420" height="65" rx="6" fill="#e8f5e9" stroke="#4CAF50" stroke-width="2.5"/>
        <text x="60" y="37" font-size="16" font-weight="bold" fill="#4CAF50" font-family="Arial, sans-serif">SOURCE →</text>
        <text x="250" y="60" text-anchor="middle" font-family="Courier New, monospace" font-size="20" font-weight="700" fill="#333">fgets(name, 0x40, stdin)</text>
      </g>

      <!-- Arrow 3: sub_401080 traces back up to fgets -->
      <g id="sts-arrow-3" opacity="0">
        <line x1="250" y1="112" x2="250" y2="93" stroke="#8C1D40" stroke-width="2.5"/>
        <polygon points="242,93 250,81 258,93" fill="#8C1D40"/>
      </g>

      <!-- Node 3: function boundary - sub_401080(name) -->
      <g id="sts-node-3" opacity="0">
        <rect x="40" y="115" width="420" height="65" rx="6" fill="#f5f5f5" stroke="#8C1D40" stroke-width="2.5"/>
        <text x="60" y="137" font-size="14" font-weight="bold" fill="#8C1D40" font-family="Arial, sans-serif">◆ boundary</text>
        <text x="250" y="160" text-anchor="middle" font-family="Courier New, monospace" font-size="20" font-weight="700" fill="#333">sub_401080(name)</text>
      </g>

      <!-- Arrow 2: validate_name traces back up to sub_401080 -->
      <g id="sts-arrow-2" opacity="0">
        <line x1="250" y1="212" x2="250" y2="193" stroke="#8C1D40" stroke-width="2.5"/>
        <polygon points="242,193 250,181 258,193" fill="#8C1D40"/>
      </g>

      <!-- Node 2: validate_name(name) -->
      <g id="sts-node-2" opacity="0">
        <rect x="40" y="215" width="420" height="65" rx="6" fill="#f5f5f5" stroke="#8C1D40" stroke-width="2.5"/>
        <text x="250" y="255" text-anchor="middle" font-family="Courier New, monospace" font-size="20" font-weight="700" fill="#333">validate_name(name)</text>
      </g>

      <!-- Arrow 1: snprintf traces back up to validate_name -->
      <g id="sts-arrow-1" opacity="0">
        <line x1="250" y1="312" x2="250" y2="293" stroke="#8C1D40" stroke-width="2.5"/>
        <polygon points="242,293 250,281 258,293" fill="#8C1D40"/>
      </g>

      <!-- Node 1: snprintf -->
      <g id="sts-node-1" opacity="0">
        <rect x="40" y="315" width="420" height="65" rx="6" fill="#f5f5f5" stroke="#8C1D40" stroke-width="2.5"/>
        <text x="250" y="355" text-anchor="middle" font-family="Courier New, monospace" font-size="20" font-weight="700" fill="#333">snprintf(cmd, 0x60, ...)</text>
      </g>

      <!-- Arrow 0: system traces back up to snprintf -->
      <g id="sts-arrow-0" opacity="0">
        <line x1="250" y1="412" x2="250" y2="393" stroke="#8C1D40" stroke-width="2.5"/>
        <polygon points="242,393 250,381 258,393" fill="#8C1D40"/>
      </g>

      <!-- Node 0 (bottom): SINK - system(cmd) -->
      <g id="sts-node-0" opacity="0">
        <rect x="40" y="415" width="420" height="65" rx="6" fill="#ffebee" stroke="#E53935" stroke-width="2.5"/>
        <text x="60" y="437" font-size="16" font-weight="bold" fill="#E53935" font-family="Arial, sans-serif">SINK →</text>
        <text x="250" y="460" text-anchor="middle" font-family="Courier New, monospace" font-size="22" font-weight="700" fill="#333">system(cmd)</text>
      </g>

      <!-- Direction label at bottom -->
      <g id="sts-direction" opacity="0">
        <text x="250" y="510" text-anchor="middle" font-size="15" fill="#8C1D40" font-weight="600" font-family="Arial, sans-serif">↑  trace backward from sink to source  ↑</text>
      </g>

    </svg>

    <div class="sts-analysis-result" id="sts-analysis-result" style="">
      <div class="sts-result-box" style="">
        <strong>Analysis Scope:</strong> main → sub_401080 only
      </div>
    </div>
  </div>
</div>

<script>
window._animQueue.push(function() {
  var el = document.getElementById('sts-node-0');
  if (!el) return;
  var slideEl = el.closest('.slide');
  var slides = document.querySelectorAll('.slide');
  var idx = Array.from(slides).indexOf(slideEl);
  if (idx < 0) return;

  window.registerSlideAnimation(idx, {
    mode: 'step',
    steps: [
      // Step 1: SINK identified at bottom
      makeStep(['sts-node-0', 'sts-direction'], { codeLines: ['sts-line-system'] }),
      // Step 2: Trace up to snprintf
      makeStep(['sts-arrow-0', 'sts-node-1'], { codeLines: ['sts-line-snprintf'] }),
      // Step 3: Trace up through validate_name
      makeStep(['sts-arrow-1', 'sts-node-2'], { codeLines: ['sts-line-validate'] }),
      // Step 4: Cross function boundary
      makeStep(['sts-arrow-2', 'sts-node-3'], { codeLines: ['sts-line-sub401080-call'] }),
      // Step 5: Reach SOURCE at top + show analysis result
      makeStep(['sts-arrow-3', 'sts-node-4'], {
        codeLines: ['sts-line-fgets'],
        showEls: ['sts-analysis-result']
      })
    ]
  });
});
</script>

???

This is sink-to-source analysis, the key to scalability. Instead of starting from sources and flowing forward through all possible paths, we start at dangerous sinks and work backward. First we identify the dangerous sinks and trace dependencies. [CLICK] [step 1] Identify system() as a sink at the bottom. [CLICK] [step 2] Work backward: what feeds cmd? The snprintf call. [CLICK] [step 3] What feeds snprintf? The parameter name, which also passes through validate_name. [CLICK] [step 4] Cross the function boundary: name was passed from main into sub_401080. [CLICK] [step 5] Trace back to fgets in main. That's the source. Notice what we never touch: start_background_task. It doesn't feed into the chain we're tracing, so it's irrelevant. We analyze only the relevant function calls on the path from source to sink. In a binary with hundreds of functions, sink-to-source analysis visits only the relevant function calls.
