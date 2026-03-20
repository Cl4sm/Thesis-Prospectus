---
type: content
title: "Sink-to-Source Coarse-Grained Analysis"
---

<style>
.sts-container {
  display: flex;
  gap: 20px;
  height: 85vh;
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
  font-size: 22px;
  font-weight: 600;
  color: #333;
  text-align: center;
}
</style>

<div class="sts-container" style="">
  <div class="sts-code-column" style="">
    <pre style="background-color: #1e1e1e; border-radius: 8px; padding: 28px; font-family: 'Courier New', monospace; font-size: 30px; line-height: 1.8; box-shadow: 0 4px 8px rgba(0,0,0,0.3); overflow: hidden; margin: 0; color: #D4D4D4;"><span style="color: #569CD6;">void</span> <span style="color: #DCDCAA;">main</span>() {
<span id="sts-line-fgets" class="sts-code-line" style="">  <span style="color: #DCDCAA;">fgets</span>(<span style="color: #9CDCFE;">name</span>, <span style="color: #B5CEA8;">0x40</span>, <span style="color: #9CDCFE;">stdin</span>);</span>
  <span style="color: #DCDCAA;">start_background_task</span>(&amp;<span style="color: #9CDCFE;">thread</span>); <span style="background:#FFB300; color:#1e1e1e; font-size:14px; font-weight:700; padding:1px 6px; border-radius:4px; letter-spacing:0.5px;">NEW</span>
<span id="sts-line-sub401080-call" class="sts-code-line" style="">  <span style="color: #DCDCAA;">sub_401080</span>(<span style="color: #9CDCFE;">name</span>);</span>
}

<span style="color: #569CD6;">void</span> <span style="color: #DCDCAA;">sub_401080</span>(<span style="color: #4EC9B0;">char</span> *<span style="color: #9CDCFE;">name</span>) {
<span id="sts-line-validate" class="sts-code-line" style="">  <span style="color: #DCDCAA;">validate_name</span>(<span style="color: #9CDCFE;">name</span>);          <span style="background:#FFB300; color:#1e1e1e; font-size:14px; font-weight:700; padding:1px 6px; border-radius:4px; letter-spacing:0.5px;">NEW</span></span>
<span id="sts-line-snprintf" class="sts-code-line" style="">  <span style="color: #DCDCAA;">snprintf</span>(<span style="color: #9CDCFE;">cmd</span>, <span style="color: #B5CEA8;">0x60</span>, <span style="color: #CE9178;">"hostname %s"</span>, <span style="color: #9CDCFE;">name</span>);</span>
<span id="sts-line-system" class="sts-code-line" style="">  <span style="color: #DCDCAA;">system</span>(<span style="color: #9CDCFE;">cmd</span>);</span>
}</pre>
  </div>

  <div class="sts-trace-column" style="">
    <svg class="sts-trace-svg" viewBox="0 0 500 600" preserveAspectRatio="xMidYMid meet" style="">
      <defs>
        <marker id="sts-arrowUp" markerWidth="10" markerHeight="10" refX="5" refY="5" orient="auto">
          <path d="M 0 8 L 5 0 L 10 8 Z" fill="#8C1D40" />
        </marker>
      </defs>

      <g id="sts-node-0" opacity="0">
        <rect x="30" y="15" width="440" height="70" rx="6" fill="#ffebee" stroke="#E53935" stroke-width="2.5"/>
        <text x="55" y="40" font-size="20" font-weight="bold" fill="#E53935" font-family="Arial, sans-serif">← SINK</text>
        <text x="250" y="62" text-anchor="middle" font-family="Courier New, monospace" font-size="26" font-weight="700" fill="#333">system(cmd)</text>
      </g>

      <g id="sts-arrow-0" opacity="0">
        <line x1="250" y1="85" x2="250" y2="115" stroke="#8C1D40" stroke-width="3" marker-end="url(#sts-arrowUp)"/>
      </g>

      <g id="sts-node-1" opacity="0">
        <rect x="30" y="120" width="440" height="70" rx="6" fill="#f5f5f5" stroke="#8C1D40" stroke-width="2.5"/>
        <text x="250" y="163" text-anchor="middle" font-family="Courier New, monospace" font-size="26" font-weight="700" fill="#333">snprintf(cmd, 0x60, ...)</text>
      </g>

      <g id="sts-arrow-1" opacity="0">
        <line x1="250" y1="190" x2="250" y2="220" stroke="#8C1D40" stroke-width="3" marker-end="url(#sts-arrowUp)"/>
      </g>

      <g id="sts-node-2" opacity="0">
        <rect x="30" y="225" width="440" height="70" rx="6" fill="#f5f5f5" stroke="#8C1D40" stroke-width="2.5"/>
        <text x="250" y="268" text-anchor="middle" font-family="Courier New, monospace" font-size="26" font-weight="700" fill="#333">validate_name(name)</text>
      </g>

      <g id="sts-arrow-2" opacity="0">
        <line x1="250" y1="295" x2="250" y2="325" stroke="#8C1D40" stroke-width="3" marker-end="url(#sts-arrowUp)"/>
      </g>

      <g id="sts-node-3" opacity="0">
        <rect x="30" y="330" width="440" height="70" rx="6" fill="#f5f5f5" stroke="#8C1D40" stroke-width="2.5"/>
        <text x="55" y="353" font-size="20" font-weight="bold" fill="#8C1D40" font-family="Arial, sans-serif">◆ boundary</text>
        <text x="250" y="380" text-anchor="middle" font-family="Courier New, monospace" font-size="26" font-weight="700" fill="#333">sub_401080(name)</text>
      </g>

      <g id="sts-arrow-3" opacity="0">
        <line x1="250" y1="400" x2="250" y2="430" stroke="#8C1D40" stroke-width="3" marker-end="url(#sts-arrowUp)"/>
      </g>

      <g id="sts-node-4" opacity="0">
        <rect x="30" y="435" width="440" height="70" rx="6" fill="#e8f5e9" stroke="#4CAF50" stroke-width="2.5"/>
        <text x="55" y="460" font-size="20" font-weight="bold" fill="#4CAF50" font-family="Arial, sans-serif">← SOURCE</text>
        <text x="250" y="483" text-anchor="middle" font-family="Courier New, monospace" font-size="24" font-weight="700" fill="#333">fgets(name, 0x40, stdin)</text>
      </g>
    </svg>

    <div class="sts-analysis-result" id="sts-analysis-result" style="">
      <div class="sts-result-box" style="">
        <strong>Analysis Scope:</strong> main → sub_401080
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
      // Step 1: SINK identified
      makeStep(['sts-node-0'], { codeLines: ['sts-line-system'] }),
      // Step 2: Trace through snprintf
      makeStep(['sts-arrow-0', 'sts-node-1'], { codeLines: ['sts-line-snprintf'] }),
      // Step 3: Trace through validate_name
      makeStep(['sts-arrow-1', 'sts-node-2'], { codeLines: ['sts-line-validate'] }),
      // Step 4: Cross function boundary
      makeStep(['sts-arrow-2', 'sts-node-3'], { codeLines: ['sts-line-sub401080-call'] }),
      // Step 5: Reach SOURCE + show analysis result
      makeStep(['sts-arrow-3', 'sts-node-4'], {
        codeLines: ['sts-line-fgets'],
        showEls: ['sts-analysis-result']
      })
    ]
  });
});
</script>

???

This is sink-to-source analysis, the key to scalability. Instead of starting from sources and flowing forward through all possible paths, we start at dangerous sinks like system() and work backward. [CLICK] Identify cmd as the argument to system. Work backward: what creates cmd? The snprintf call. What feeds snprintf? The parameter a1. Cross the function boundary into sub_401080. What feeds a1? The argument name passed from main. Trace backward to fgets in main. That's the source. [CLICK] Notice what we never touch: start_background_task. Why? Because we're working backward from a specific data flow. Start_background_task doesn't feed into the chain we're tracing, so it's irrelevant. We analyze only the functions on the path from source to sink. That dramatically reduces scope. In a binary with hundreds of functions, sink-to-source analysis might visit only a handful of the critical ones.
