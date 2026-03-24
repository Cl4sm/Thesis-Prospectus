---
type: content
title: "Rich Expressions: Value-Aware Tracking"
hidden: true
---

<!-- DELETED PER REVISION PLAN B7 - content merged into slide 21 -->

<div style="display: flex; gap: 20px; height: 83vh; align-items: stretch;">
  <!-- LEFT COLUMN: Code Block -->
  <div style="flex: 0 0 44%; display: flex; flex-direction: column; justify-content: center;">
    <pre style="background-color: #1e1e1e; border-radius: 8px; padding: 28px; font-family: 'Courier New', monospace; font-size: 30px; line-height: 1.8; box-shadow: 0 4px 8px rgba(0,0,0,0.3); overflow: hidden; margin: 0; color: #D4D4D4;"><span style="color: #569CD6;">void</span> <span style="color: #DCDCAA;">main</span><span style="color: #D4D4D4;">()</span> {
<span id="re-line-fgets" style="border-left: 3px solid transparent; padding-left: 8px; transition: all 0.3s;">  <span style="color: #DCDCAA;">fgets</span>(<span style="color: #9CDCFE;">name</span>, <span style="color: #B5CEA8;">0x40</span>, <span style="color: #9CDCFE;">stdin</span>);</span>
<span id="re-line-call" style="border-left: 3px solid transparent; padding-left: 8px; transition: all 0.3s;">  <span style="color: #DCDCAA;">sub_401080</span>(<span style="color: #9CDCFE;">name</span>);</span>
}

<span style="color: #569CD6;">void</span> <span style="color: #DCDCAA;">sub_401080</span>(<span style="color: #4EC9B0;">char</span> *<span style="color: #9CDCFE;">name</span>) {
<span id="re-line-snprintf" style="border-left: 3px solid transparent; padding-left: 8px; transition: all 0.3s;">  <span style="color: #DCDCAA;">snprintf</span>(<span style="color: #9CDCFE;">cmd</span>, <span style="color: #B5CEA8;">0x60</span>, <span style="color: #CE9178;">"hostname %s"</span>, <span style="color: #9CDCFE;">name</span>);</span>
<span id="re-line-system" style="border-left: 3px solid transparent; padding-left: 8px; transition: all 0.3s;">  <span style="color: #DCDCAA;">system</span>(<span style="color: #9CDCFE;">cmd</span>);</span>
}</pre>
  </div>

  <!-- RIGHT COLUMN: Rich Expression Chain -->
  <div style="flex: 1; display: flex; flex-direction: column; justify-content: center; align-items: center;">
    <svg id="re-chain" viewBox="0 0 500 560" style="width: 100%; height: 92%; display: block;">
      <defs>
        <marker id="reArrow" markerWidth="10" markerHeight="10" refX="8" refY="3" orient="auto" markerUnits="strokeWidth">
          <path d="M0,0 L0,6 L9,3 z" fill="#8C1D40"/>
        </marker>
        <marker id="reArrowRed" markerWidth="10" markerHeight="10" refX="8" refY="3" orient="auto" markerUnits="strokeWidth">
          <path d="M0,0 L0,6 L9,3 z" fill="#E53935"/>
        </marker>
      </defs>

      <!-- Column header -->
      <text x="250" y="22" font-family="Arial, sans-serif" font-size="18" text-anchor="middle" fill="#999" font-weight="600">Rich Expression at each step</text>

      <!-- STEP 1: name (initial variable) -->
      <g id="re-box-name" opacity="0">
        <rect x="100" y="45" width="300" height="55" rx="8" fill="#f5f5f5" stroke="#888" stroke-width="2"/>
        <text x="250" y="80" font-family="'Courier New', monospace" font-size="24" font-weight="700" text-anchor="middle" fill="#333">name</text>
        <!-- Taint comparison (small, faded) -->
        <rect x="10" y="52" width="75" height="40" rx="5" fill="#ffebee" stroke="#E53935" stroke-width="1.5"/>
        <text x="47" y="68" font-family="Arial, sans-serif" font-size="11" text-anchor="middle" fill="#c62828" font-weight="600">Taint:</text>
        <text x="47" y="84" font-family="'Courier New', monospace" font-size="13" text-anchor="middle" fill="#c62828" font-weight="700">true</text>
      </g>

      <!-- Arrow 1->2 -->
      <g id="re-arrow-1" opacity="0">
        <path d="M 250 100 L 250 135" stroke="#8C1D40" stroke-width="3" fill="none" marker-end="url(#reArrow)"/>
      </g>

      <!-- STEP 2: fgets(name, 0x40, stdin) -->
      <g id="re-box-fgets" opacity="0">
        <rect x="50" y="142" width="400" height="55" rx="8" fill="#FFF3E0" stroke="#FF9800" stroke-width="2.5"/>
        <text x="250" y="177" font-family="'Courier New', monospace" font-size="22" font-weight="700" text-anchor="middle" fill="#E65100">fgets(name, 0x40, stdin)</text>
      </g>

      <!-- Arrow 2->3 -->
      <g id="re-arrow-2" opacity="0">
        <path d="M 250 197 L 250 232" stroke="#8C1D40" stroke-width="3" fill="none" marker-end="url(#reArrow)"/>
        <!-- Label: propagated into callee -->
        <text x="258" y="220" font-family="Arial, sans-serif" font-size="12" fill="#999" font-style="italic">propagated into sub_401080</text>
      </g>

      <!-- STEP 3: value propagated through call into sub_401080 -->
      <g id="re-box-propagated" opacity="0">
        <rect x="50" y="239" width="400" height="55" rx="8" fill="#FFF3E0" stroke="#FF9800" stroke-width="2.5"/>
        <text x="250" y="274" font-family="'Courier New', monospace" font-size="22" font-weight="700" text-anchor="middle" fill="#E65100">fgets(name, 0x40, stdin)</text>
        <!-- Location badge -->
        <rect x="352" y="242" width="95" height="20" rx="4" fill="#8C1D40"/>
        <text x="399" y="256" font-family="'Courier New', monospace" font-size="10" font-weight="700" text-anchor="middle" fill="white">sub_401080</text>
      </g>

      <!-- Arrow 3->4 -->
      <g id="re-arrow-3" opacity="0">
        <path d="M 250 294 L 250 329" stroke="#8C1D40" stroke-width="3" fill="none" marker-end="url(#reArrow)"/>
        <!-- Label: snprintf transforms -->
        <text x="258" y="317" font-family="Arial, sans-serif" font-size="12" fill="#999" font-style="italic">snprintf transforms value</text>
      </g>

      <!-- STEP 4: "hostname " + fgets(name, 0x40, stdin) -->
      <g id="re-box-snprintf" opacity="0">
        <rect x="15" y="336" width="470" height="55" rx="8" fill="#FFF3E0" stroke="#FF9800" stroke-width="2.5"/>
        <text x="250" y="370" font-family="'Courier New', monospace" font-size="19" font-weight="700" text-anchor="middle" fill="#E65100">"hostname " + fgets(name, 0x40, stdin)</text>
      </g>

      <!-- Arrow 4->5 (red, reaching sink) -->
      <g id="re-arrow-4" opacity="0">
        <path d="M 250 391 L 250 426" stroke="#E53935" stroke-width="3" fill="none" marker-end="url(#reArrowRed)"/>
        <!-- Label: reaches sink -->
        <text x="258" y="414" font-family="Arial, sans-serif" font-size="12" fill="#E53935" font-weight="600" font-style="italic">reaches sink</text>
      </g>

      <!-- STEP 5: system() SINK with full expression -->
      <g id="re-box-sink" opacity="0">
        <rect x="15" y="433" width="470" height="55" rx="8" fill="#ffebee" stroke="#E53935" stroke-width="2.5"/>
        <text x="250" y="455" font-family="'Courier New', monospace" font-size="17" font-weight="700" text-anchor="middle" fill="#C62828">"hostname " + fgets(name, 0x40, stdin)</text>
        <text x="250" y="478" font-family="Arial, sans-serif" font-size="15" text-anchor="middle" fill="#C62828" font-style="italic">Full history at system() call</text>
      </g>

      <!-- ALERT BOX: Rich vs Taint comparison -->
      <g id="re-alert-box" opacity="0">
        <!-- Taint alert (red, unhelpful) -->
        <rect x="15" y="505" width="220" height="45" rx="6" fill="#ffcdd2" stroke="#E53935" stroke-width="1.5"/>
        <text x="125" y="523" font-family="Arial, sans-serif" font-size="12" text-anchor="middle" fill="#b71c1c" font-weight="700">Taint Alert:</text>
        <text x="125" y="541" font-family="'Courier New', monospace" font-size="12" text-anchor="middle" fill="#b71c1c">tainted arg to system()</text>

        <!-- Rich Expression alert (green, actionable) -->
        <rect x="250" y="505" width="240" height="45" rx="6" fill="#c8e6c9" stroke="#4CAF50" stroke-width="1.5"/>
        <text x="370" y="523" font-family="Arial, sans-serif" font-size="12" text-anchor="middle" fill="#1b5e20" font-weight="700">Rich Expression Alert:</text>
        <text x="370" y="541" font-family="'Courier New', monospace" font-size="11" text-anchor="middle" fill="#1b5e20">stdin via snprintf → system()</text>
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
      // Step 1: Track name variable
      makeStep(['re-box-name'], {
        codeLines: ['re-line-fgets']
      }),
      // Step 2: fgets records source
      makeStep(['re-arrow-1', 're-box-fgets'], {
        codeLines: ['re-line-fgets']
      }),
      // Step 3: Propagated across call boundary
      makeStep(['re-arrow-2', 're-box-propagated'], {
        codeLines: ['re-line-call']
      }),
      // Step 4: snprintf transforms
      makeStep(['re-arrow-3', 're-box-snprintf'], {
        codeLines: ['re-line-snprintf']
      }),
      // Step 5: Reaches system() sink
      makeStep(['re-arrow-4', 're-box-sink'], {
        codeLines: ['re-line-system']
      }),
      // Step 6: Compare alerts
      makeStep(['re-alert-box'])
    ]
  });
});
</script>

???

Rich Expressions are the precision solution. Let me show you exactly what they track. [CLICK] [step 1] We start with the variable name. Traditional taint analysis marks it tainted equals true. That's all you get. [CLICK] [step 2] When fgets reads from stdin, a Rich Expression records the full call: fgets, name, 0x40, stdin. The taint bit? Still just true. [CLICK] [step 3] Name crosses the call boundary into sub_401080. The Rich Expression propagates unchanged: we still know exactly where this value came from. Taint? True. [CLICK] [step 4] snprintf transforms the value. Now the Rich Expression reads "hostname" plus fgets of name from stdin. The entire transformation history is preserved. A human analyst would mentally reconstruct this same chain. [CLICK] [step 5] When the value reaches system, we have the complete provenance: user input from stdin, formatted through snprintf, reaching a command execution sink. [CLICK] [step 6] Compare the two alerts. Traditional taint says "tainted argument to system." Rich Expressions say "stdin via snprintf reaches system." The second tells you whether the vulnerability is real. This is practitioner reasoning, encoded.
