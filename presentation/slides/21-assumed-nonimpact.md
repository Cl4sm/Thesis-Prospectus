---
type: content
title: "Assumed Nonimpact"
---

<style>
.ani-container {
  display: flex;
  gap: 20px;
  height: 73vh;
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
  justify-content: flex-start;
  align-items: center;
  padding-top: 10px;
  overflow: hidden;
}

.ani-decision-box {
  margin-bottom: 10px;
  opacity: 0;
  transform: translateY(20px);
  transition: opacity 0.5s ease, transform 0.5s ease;
  width: 100%;
  max-width: 480px;
}

.ani-decision-box.visible {
  opacity: 1;
  transform: translateY(0);
}

.ani-decision-title {
  font-size: 20px;
  font-weight: bold;
  color: #333;
  margin-bottom: 4px;
  text-align: center;
  font-family: 'Courier New', monospace;
}

.ani-result-summary {
  margin-top: 12px;
  padding: 10px 18px;
  background-color: #f5f5f5;
  border-left: 4px solid #8C1D40;
  font-size: 19px;
  line-height: 1.6;
  border-radius: 4px;
}

.ani-result-summary strong {
  color: #8C1D40;
}
</style>

<div class="ani-container" style="">
  <div class="ani-code-column" style="">
    <pre style="background-color: #1e1e1e; border-radius: 8px; padding: 22px; font-family: 'Courier New', monospace; font-size: 25px; line-height: 1.7; box-shadow: 0 4px 8px rgba(0,0,0,0.3); overflow: hidden; margin: 0; color: #D4D4D4;"><span style="color: #569CD6;">void</span> <span style="color: #DCDCAA;">main</span>() {
  ...
  <span style="color: #DCDCAA;">fgets</span>(<span style="color: #9CDCFE;">name</span>, <span style="color: #B5CEA8;">0x40</span>, <span style="color: #9CDCFE;">stdin</span>);
<span id="ani-line-startbg" style="border-left: 3px solid transparent; padding-left: 8px; transition: all 0.3s;">  <span style="color: #DCDCAA;">start_background_task</span>(&amp;<span style="color: #9CDCFE;">thread</span>);</span>
<span id="ani-line-logaccess" style="border-left: 3px solid transparent; padding-left: 8px; transition: all 0.3s;">  <span style="color: #DCDCAA;">log_access</span>(<span style="color: #9CDCFE;">timestamp</span>);</span>
<span id="ani-line-sub401080" style="border-left: 3px solid transparent; padding-left: 8px; transition: all 0.3s;">  <span style="color: #DCDCAA;">sub_401080</span>(<span style="color: #9CDCFE;">name</span>);</span>
}

<span style="color: #569CD6;">void</span> <span style="color: #DCDCAA;">sub_401080</span>(<span style="color: #4EC9B0;">char</span> *<span style="color: #9CDCFE;">name</span>) {
<span id="ani-line-validate" style="border-left: 3px solid transparent; padding-left: 8px; transition: all 0.3s;">  <span style="color: #DCDCAA;">validate_name</span>(<span style="color: #9CDCFE;">name</span>);</span>
  <span style="color: #DCDCAA;">snprintf</span>(<span style="color: #9CDCFE;">cmd</span>, <span style="color: #B5CEA8;">0x60</span>, <span style="color: #CE9178;">"hostname %s"</span>, <span style="color: #9CDCFE;">name</span>);
  <span style="color: #DCDCAA;">system</span>(<span style="color: #9CDCFE;">cmd</span>);
}</pre>
  </div>

  <div class="ani-decision-column" style="">
    <!-- Decision 1: start_background_task → SKIP -->
    <div class="ani-decision-box" id="decision-start-bg" style="">
      <div class="ani-decision-title" style="">start_background_task(&amp;thread)</div>
      <svg viewBox="0 0 420 120" style="width: 100%; height: 120px;">
        <rect x="30" y="5" width="160" height="45" rx="5" fill="none" stroke="#E53935" stroke-width="2"/>
        <text x="110" y="22" font-family="Arial, sans-serif" font-size="16" text-anchor="middle" fill="#333" font-weight="600">Receives name?</text>
        <text x="110" y="42" font-family="Arial, sans-serif" font-size="18" text-anchor="middle" fill="#E53935" font-weight="bold">NO</text>
        <polygon points="195,27 220,27 207,17" fill="#E53935"/>
        <rect x="225" y="5" width="170" height="45" rx="4" fill="#ffebee" stroke="#E53935" stroke-width="2"/>
        <text x="310" y="33" font-family="Arial, sans-serif" font-size="20" text-anchor="middle" fill="#E53935" font-weight="bold">SKIP</text>
        <!-- Strikethrough effect -->
        <line x1="30" y1="75" x2="395" y2="75" stroke="#E53935" stroke-width="1.5" stroke-dasharray="6,4" opacity="0.4"/>
      </svg>
    </div>

    <!-- Decision 2: log_access → SKIP -->
    <div class="ani-decision-box" id="decision-logaccess" style="">
      <div class="ani-decision-title" style="">log_access(timestamp)</div>
      <svg viewBox="0 0 420 120" style="width: 100%; height: 120px;">
        <rect x="30" y="5" width="160" height="45" rx="5" fill="none" stroke="#E53935" stroke-width="2"/>
        <text x="110" y="22" font-family="Arial, sans-serif" font-size="16" text-anchor="middle" fill="#333" font-weight="600">Receives name?</text>
        <text x="110" y="42" font-family="Arial, sans-serif" font-size="18" text-anchor="middle" fill="#E53935" font-weight="bold">NO</text>
        <polygon points="195,27 220,27 207,17" fill="#E53935"/>
        <rect x="225" y="5" width="170" height="45" rx="4" fill="#ffebee" stroke="#E53935" stroke-width="2"/>
        <text x="310" y="33" font-family="Arial, sans-serif" font-size="20" text-anchor="middle" fill="#E53935" font-weight="bold">SKIP</text>
        <line x1="30" y1="75" x2="395" y2="75" stroke="#E53935" stroke-width="1.5" stroke-dasharray="6,4" opacity="0.4"/>
      </svg>
    </div>

    <!-- Decision 3: sub_401080 → ENTER -->
    <div class="ani-decision-box" id="decision-sub401080" style="">
      <div class="ani-decision-title" style="">sub_401080(name)</div>
      <svg viewBox="0 0 420 120" style="width: 100%; height: 120px;">
        <rect x="30" y="5" width="160" height="45" rx="5" fill="none" stroke="#4CAF50" stroke-width="2"/>
        <text x="110" y="22" font-family="Arial, sans-serif" font-size="16" text-anchor="middle" fill="#333" font-weight="600">Receives name?</text>
        <text x="110" y="42" font-family="Arial, sans-serif" font-size="18" text-anchor="middle" fill="#4CAF50" font-weight="bold">YES</text>
        <polygon points="195,27 220,27 207,17" fill="#4CAF50"/>
        <rect x="225" y="5" width="170" height="45" rx="4" fill="#e8f5e9" stroke="#4CAF50" stroke-width="2"/>
        <text x="310" y="33" font-family="Arial, sans-serif" font-size="20" text-anchor="middle" fill="#4CAF50" font-weight="bold">ENTER</text>
      </svg>
    </div>

    <!-- Decision 4: validate_name → ANALYZE -->
    <div class="ani-decision-box" id="decision-validate" style="">
      <div class="ani-decision-title" style="">validate_name(name)</div>
      <svg viewBox="0 0 420 120" style="width: 100%; height: 120px;">
        <rect x="30" y="5" width="160" height="45" rx="5" fill="none" stroke="#4CAF50" stroke-width="2"/>
        <text x="110" y="22" font-family="Arial, sans-serif" font-size="16" text-anchor="middle" fill="#333" font-weight="600">Receives name?</text>
        <text x="110" y="42" font-family="Arial, sans-serif" font-size="18" text-anchor="middle" fill="#4CAF50" font-weight="bold">YES</text>
        <polygon points="195,27 220,27 207,17" fill="#4CAF50"/>
        <rect x="225" y="5" width="170" height="45" rx="4" fill="#e8f5e9" stroke="#4CAF50" stroke-width="2"/>
        <text x="310" y="33" font-family="Arial, sans-serif" font-size="20" text-anchor="middle" fill="#4CAF50" font-weight="bold">ANALYZE</text>
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

<div class="ani-result-summary" style="font-size: 19px; padding: 10px 18px;" id="ani-summary-box">
  <strong>Result:</strong> Assumed Nonimpact skips functions that do not receive tracked values. Calling convention recovery on stripped binaries identifies value dependencies per call site. 2 of 4 function calls skipped in this example; at scale, the majority are skipped, yielding 8 min/binary average across 3,599 binaries.
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
      // Step 1: start_background_task → SKIP
      makeStep([], {
        addClasses: [{ id: 'decision-start-bg', cls: 'visible' }],
        codeLines: ['ani-line-startbg'],
        highlightColor: '#E53935',
        highlightBg: 'rgba(229, 57, 53, 0.18)'
      }),
      // Step 2: log_access → SKIP
      makeStep([], {
        addClasses: [{ id: 'decision-logaccess', cls: 'visible' }],
        codeLines: ['ani-line-logaccess'],
        highlightColor: '#E53935',
        highlightBg: 'rgba(229, 57, 53, 0.18)'
      }),
      // Step 3: sub_401080(name) → ENTER
      makeStep([], {
        addClasses: [{ id: 'decision-sub401080', cls: 'visible' }],
        codeLines: ['ani-line-sub401080'],
        highlightColor: '#66FF88',
        highlightBg: 'rgba(76, 230, 100, 0.18)'
      }),
      // Step 4: validate_name → ANALYZE
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

Assumed Nonimpact is the scalability breakthrough. We're already narrowing scope through sink-to-source traversal. But we can narrow further through calling convention analysis. When we encounter a function call, ask: does this function receive the tracked value? [CLICK] For start_background_task, it receives &thread, the address of a thread structure. Our tracked value is name. There's no connection. Skip. [CLICK] Same with log_access: it receives timestamp. No relation to name. Skip again. [CLICK] But sub_401080 receives name directly as its argument. We must enter this function to continue tracking the data flow. [CLICK] Inside sub_401080, validate_name also receives name. We analyze it. How do we know this on stripped binaries where symbols are gone and parameter names are erased? Through architecture-specific calling convention recovery. On ARM, the first integer argument is in r0. We can determine whether r0 is aliased to our tracked value at the call site. This is what makes eight minutes per binary tractable: half the function calls in this example were skipped entirely. At scale, the ratio is much higher.
