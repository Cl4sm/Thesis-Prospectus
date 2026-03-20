---
type: content
title: "Assumed Nonimpact"
---

<style>
.ani-container {
  display: flex;
  gap: 20px;
  height: 75vh;
  align-items: stretch;
}

.ani-code-column {
  flex: 0 0 44%;
  display: flex;
  flex-direction: column;
  justify-content: center;
}

.ani-decision-column {
  flex: 1;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}

.ani-decision-box {
  margin-bottom: 20px;
  opacity: 0;
  transform: translateY(20px);
  transition: opacity 0.6s ease, transform 0.6s ease;
  width: 100%;
  max-width: 500px;
}

.ani-decision-box.visible {
  opacity: 1;
  transform: translateY(0);
}

.ani-decision-title {
  font-size: 27px;
  font-weight: bold;
  color: #333;
  margin-bottom: 8px;
  text-align: center;
  font-family: 'Courier New', monospace;
}

.ani-result-summary {
  margin-top: 24px;
  padding: 14px 20px;
  background-color: #f5f5f5;
  border-left: 4px solid #8C1D40;
  font-size: 22px;
  line-height: 1.6;
  border-radius: 4px;
}

.ani-result-summary strong {
  color: #8C1D40;
}
</style>

<div class="ani-container" style="">
  <div class="ani-code-column" style="">
    <pre style="background-color: #1e1e1e; border-radius: 8px; padding: 28px; font-family: 'Courier New', monospace; font-size: 30px; line-height: 1.8; box-shadow: 0 4px 8px rgba(0,0,0,0.3); overflow: hidden; margin: 0; color: #D4D4D4;"><span style="color: #569CD6;">void</span> <span style="color: #DCDCAA;">main</span>() {
  ...
  <span style="color: #DCDCAA;">fgets</span>(<span style="color: #9CDCFE;">name</span>, <span style="color: #B5CEA8;">0x40</span>, <span style="color: #9CDCFE;">stdin</span>);
<span id="ani-line-startbg" style="border-left: 3px solid transparent; padding-left: 8px; transition: all 0.3s;">  <span style="color: #DCDCAA;">start_background_task</span>(&amp;<span style="color: #9CDCFE;">thread</span>);</span>
<span id="ani-line-sub401080" style="border-left: 3px solid transparent; padding-left: 8px; transition: all 0.3s;">  <span style="color: #DCDCAA;">sub_401080</span>(<span style="color: #9CDCFE;">name</span>);</span>
}

<span style="color: #569CD6;">void</span> <span style="color: #DCDCAA;">sub_401080</span>(<span style="color: #4EC9B0;">char</span> *<span style="color: #9CDCFE;">name</span>) {
<span id="ani-line-validate" style="border-left: 3px solid transparent; padding-left: 8px; transition: all 0.3s;">  <span style="color: #DCDCAA;">validate_name</span>(<span style="color: #9CDCFE;">name</span>);</span>
  <span style="color: #DCDCAA;">snprintf</span>(<span style="color: #9CDCFE;">cmd</span>, <span style="color: #B5CEA8;">0x60</span>, <span style="color: #CE9178;">"hostname %s"</span>, <span style="color: #9CDCFE;">name</span>);
  <span style="color: #DCDCAA;">system</span>(<span style="color: #9CDCFE;">cmd</span>);
}</pre>
  </div>

  <div class="ani-decision-column" style="">
    <div class="ani-decision-box" id="decision-start-bg" style="">
      <div class="ani-decision-title" style="">start_background_task(&amp;thread)</div>
      <svg viewBox="0 0 420 200" style="width: 100%; height: 200px;">
        <rect x="40" y="10" width="340" height="70" rx="6" fill="none" stroke="#8C1D40" stroke-width="2.5"/>
        <text x="210" y="40" font-family="Arial, sans-serif" font-size="24" text-anchor="middle" fill="#333" font-weight="bold">Does it receive</text>
        <text x="210" y="68" font-family="Arial, sans-serif" font-size="24" text-anchor="middle" fill="#333" font-weight="bold">name?</text>
        <path d="M 210 80 L 210 115" stroke="#E53935" stroke-width="3" fill="none" marker-end="url(#ani-arrowred)"/>
        <text x="235" y="105" font-family="Arial, sans-serif" font-size="21" fill="#E53935" font-weight="bold">NO</text>
        <rect x="45" y="120" width="330" height="55" rx="4" fill="#ffebee" stroke="#E53935" stroke-width="2.5"/>
        <text x="210" y="155" font-family="Arial, sans-serif" font-size="26" text-anchor="middle" fill="#E53935" font-weight="bold">SKIP FUNCTION</text>
      </svg>
    </div>

    <div class="ani-decision-box" id="decision-validate" style="margin-top: 20px;">
      <div class="ani-decision-title" style="">validate_name(name)</div>
      <svg viewBox="0 0 420 200" style="width: 100%; height: 200px;">
        <rect x="40" y="10" width="340" height="70" rx="6" fill="none" stroke="#4CAF50" stroke-width="2.5"/>
        <text x="210" y="40" font-family="Arial, sans-serif" font-size="24" text-anchor="middle" fill="#333" font-weight="bold">Does it receive</text>
        <text x="210" y="68" font-family="Arial, sans-serif" font-size="24" text-anchor="middle" fill="#333" font-weight="bold">name?</text>
        <path d="M 210 80 L 210 115" stroke="#4CAF50" stroke-width="3" fill="none" marker-end="url(#ani-arrowgreen)"/>
        <text x="235" y="105" font-family="Arial, sans-serif" font-size="21" fill="#4CAF50" font-weight="bold">YES</text>
        <rect x="45" y="120" width="330" height="55" rx="4" fill="#e8f5e9" stroke="#4CAF50" stroke-width="2.5"/>
        <text x="210" y="155" font-family="Arial, sans-serif" font-size="26" text-anchor="middle" fill="#4CAF50" font-weight="bold">ANALYZE FUNCTION</text>
      </svg>
    </div>

    <svg style="width: 0; height: 0; position: absolute;">
      <defs>
        <marker id="ani-arrowred" markerWidth="10" markerHeight="10" refX="5" refY="5" orient="auto">
          <polygon points="0,0 10,5 0,10" fill="#E53935"/>
        </marker>
        <marker id="ani-arrowgreen" markerWidth="10" markerHeight="10" refX="5" refY="5" orient="auto">
          <polygon points="0,0 10,5 0,10" fill="#4CAF50"/>
        </marker>
      </defs>
    </svg>
  </div>
</div>

<div class="ani-result-summary" style="">
  <strong>Result:</strong> Assumed Nonimpact determines which functions to analyze based on whether tracked values flow into them. Through architecture-specific calling convention analysis on stripped binaries, we identify value dependencies and skip functions that do not receive the tracked data. 3,599 binaries analyzed, avg 8 min/binary.
</div>

<script>
window._animQueue.push(function() {
  var el = document.getElementById('decision-start-bg');
  if (!el) return;
  var slideEl = el.closest('.slide');
  var slides = document.querySelectorAll('.slide');
  var idx = Array.from(slides).indexOf(slideEl);
  if (idx < 0) return;

  window.registerSlideAnimation(idx, {
    mode: 'step',
    steps: [
      // Step 1: First decision (start_background_task -> SKIP) + highlight code line red
      makeStep([], {
        addClasses: [{ id: 'decision-start-bg', cls: 'visible' }],
        codeLines: ['ani-line-startbg'],
        highlightColor: '#E53935',
        highlightBg: 'rgba(229, 57, 53, 0.18)'
      }),
      // Step 2: Second decision (validate_name -> ANALYZE) + highlight code line green
      makeStep([], {
        addClasses: [{ id: 'decision-validate', cls: 'visible' }],
        codeLines: ['ani-line-validate'],
        highlightColor: '#66FF88',
        highlightBg: 'rgba(76, 230, 100, 0.18)'
      })
    ]
  });
});
</script>

???

Assumed Nonimpact is the scalability breakthrough. We're already narrowing scope through sink-to-source traversal. But we can narrow further through calling convention analysis. When we encounter a function call, ask: does this function receive the tracked value? [CLICK] For start_background_task, it receives &thread, the address of a thread structure. Our tracked value is name. There's no connection. We skip the entire function. [CLICK] For validate_name, it receives name as the first argument. Our tracked value flows into it. We must analyze it. How do we know this on stripped binaries where symbols are gone and parameter names are erased? Through architecture-specific calling convention recovery. On ARM, the first integer argument is in r0. We can determine whether r0 is aliased to our tracked value at the call site. This is what makes eight minutes per binary tractable. Sink-to-source limits which functions we visit. Assumed Nonimpact limits which function calls we traverse. Together they make firmware-scale analysis practical.
