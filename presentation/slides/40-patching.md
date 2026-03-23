---
type: content
title: "Patch Generation & Verification"
---

<style>
.patch-group {
  opacity: 0;
  transition: opacity 0.5s ease;
}
.patch-group.visible {
  opacity: 1;
}
</style>

<svg viewBox="0 0 1100 480" style="width:100%; margin:0 auto; display:block;" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <marker id="p-arr" markerWidth="9" markerHeight="9" refX="8" refY="3" orient="auto">
      <polygon points="0 0, 9 3, 0 6" fill="#666"/>
    </marker>
    <marker id="p-arr-maroon" markerWidth="9" markerHeight="9" refX="8" refY="3" orient="auto">
      <polygon points="0 0, 9 3, 0 6" fill="#8C1D40"/>
    </marker>
    <marker id="p-arr-red" markerWidth="9" markerHeight="9" refX="8" refY="3" orient="auto">
      <polygon points="0 0, 9 3, 0 6" fill="#D32F2F"/>
    </marker>
    <filter id="p-shadow">
      <feDropShadow dx="0" dy="2" stdDeviation="2" flood-opacity="0.08"/>
    </filter>
  </defs>

  <!-- ===== GROUP 1: Root Cause Input ===== -->
  <g id="patch-g1" class="patch-group">
    <rect x="15" y="130" width="130" height="100" rx="8" fill="#f5f5f5" stroke="#666" stroke-width="1.5" filter="url(#p-shadow)"/>
    <text x="80" y="160" font-size="13" font-weight="700" text-anchor="middle" fill="#333" font-family="Inter, sans-serif">Root Cause</text>
    <text x="80" y="178" font-size="12" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">Kumushi (statistical)</text>
    <text x="80" y="193" font-size="12" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">DyVA (LLM agent)</text>
    <text x="80" y="208" font-size="12" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">SARIF triage</text>

    <line x1="145" y1="160" x2="195" y2="90" stroke="#666" stroke-width="2" marker-end="url(#p-arr)"/>
    <line x1="145" y1="200" x2="195" y2="280" stroke="#666" stroke-width="2" marker-end="url(#p-arr)"/>
  </g>

  <!-- ===== GROUP 2: PatcherY (top) ===== -->
  <g id="patch-g2" class="patch-group">
    <rect x="200" y="15" width="300" height="155" rx="10" fill="#fafafa" stroke="#FF9800" stroke-width="2" filter="url(#p-shadow)"/>
    <rect x="200" y="15" width="300" height="35" rx="10" fill="#fff3e0"/>
    <rect x="200" y="42" width="300" height="8" fill="#fff3e0"/>
    <text x="350" y="39" font-size="13" font-weight="700" text-anchor="middle" fill="#E65100" font-family="Inter, sans-serif">PatcherY: Constrained</text>

    <rect x="215" y="60" width="120" height="50" rx="4" fill="#fff" stroke="#FF9800" stroke-width="1.5"/>
    <text x="275" y="78" font-size="12" font-weight="600" text-anchor="middle" fill="#E65100" font-family="Inter, sans-serif">Kumushi Clusters</text>
    <text x="275" y="93" font-size="11" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">One function at a time</text>
    <text x="275" y="105" font-size="11" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">Scoped edit region</text>

    <line x1="335" y1="85" x2="355" y2="85" stroke="#666" stroke-width="1.5" marker-end="url(#p-arr)"/>

    <rect x="360" y="60" width="120" height="50" rx="4" fill="#fff3e0" stroke="#FF9800" stroke-width="1.5"/>
    <text x="420" y="78" font-size="12" font-weight="600" text-anchor="middle" fill="#E65100" font-family="Inter, sans-serif">Claude 3.7 Sonnet</text>
    <text x="420" y="93" font-size="11" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">Code-only generation</text>
    <text x="420" y="105" font-size="11" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">No root cause analysis</text>

    <path d="M 420,110 Q 420,140 340,140 Q 260,140 260,115" stroke="#D32F2F" stroke-width="1.5" fill="none" stroke-dasharray="4,3" marker-end="url(#p-arr-red)"/>
    <text x="340" y="155" font-size="11" font-weight="600" fill="#D32F2F" text-anchor="middle" font-family="Inter, sans-serif">Iterative refinement (max 10)</text>
  </g>

  <!-- ===== GROUP 3: PatcherQ (bottom) ===== -->
  <g id="patch-g3" class="patch-group">
    <rect x="200" y="210" width="300" height="195" rx="10" fill="#fafafa" stroke="#9C27B0" stroke-width="2" filter="url(#p-shadow)"/>
    <rect x="200" y="210" width="300" height="35" rx="10" fill="#f3e5f5"/>
    <rect x="200" y="237" width="300" height="8" fill="#f3e5f5"/>
    <text x="350" y="234" font-size="13" font-weight="700" text-anchor="middle" fill="#7B1FA2" font-family="Inter, sans-serif">PatcherQ: Free-Form</text>

    <rect x="215" y="255" width="120" height="55" rx="4" fill="#fff" stroke="#9C27B0" stroke-width="1.5"/>
    <text x="275" y="273" font-size="12" font-weight="600" text-anchor="middle" fill="#7B1FA2" font-family="Inter, sans-serif">Root Cause Agent</text>
    <text x="275" y="288" font-size="11" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">Multiple chains of</text>
    <text x="275" y="300" font-size="11" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">thought (diverse models)</text>

    <line x1="335" y1="282" x2="355" y2="282" stroke="#666" stroke-width="1.5" marker-end="url(#p-arr)"/>

    <rect x="360" y="255" width="120" height="55" rx="4" fill="#f3e5f5" stroke="#9C27B0" stroke-width="1.5"/>
    <text x="420" y="273" font-size="12" font-weight="600" text-anchor="middle" fill="#7B1FA2" font-family="Inter, sans-serif">Programmer Agent</text>
    <text x="420" y="288" font-size="11" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">Tool access: source</text>
    <text x="420" y="300" font-size="11" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">search, file browse</text>

    <rect x="280" y="325" width="180" height="35" rx="4" fill="#fff" stroke="#9C27B0" stroke-width="1.5"/>
    <text x="370" y="340" font-size="12" font-weight="600" text-anchor="middle" fill="#7B1FA2" font-family="Inter, sans-serif">CriticPass</text>
    <text x="370" y="353" font-size="11" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">GPT-o3 review (no tool-calling)</text>

    <path d="M 420,310 Q 440,330 460,365 Q 475,395 340,400 Q 215,400 215,315" stroke="#D32F2F" stroke-width="1.5" fill="none" stroke-dasharray="4,3" marker-end="url(#p-arr-red)"/>
    <text x="350" y="398" font-size="11" font-weight="600" fill="#D32F2F" text-anchor="middle" font-family="Inter, sans-serif">Feedback loop</text>
  </g>

  <!-- ===== GROUP 4: 7-Step Validator ===== -->
  <g id="patch-g4" class="patch-group">
    <line x1="500" y1="90" x2="560" y2="180" stroke="#666" stroke-width="2" marker-end="url(#p-arr)"/>
    <line x1="500" y1="310" x2="560" y2="220" stroke="#666" stroke-width="2" marker-end="url(#p-arr)"/>

    <rect x="565" y="100" width="220" height="260" rx="10" fill="#fafafa" stroke="#8C1D40" stroke-width="2.5" filter="url(#p-shadow)"/>
    <rect x="565" y="100" width="220" height="35" rx="10" fill="#F8EEF1"/>
    <rect x="565" y="127" width="220" height="8" fill="#F8EEF1"/>
    <text x="675" y="124" font-size="13" font-weight="700" text-anchor="middle" fill="#8C1D40" font-family="Inter, sans-serif">7-Step Validator</text>

    <rect x="585" y="148" width="180" height="24" rx="3" fill="#fff" stroke="#ddd" stroke-width="1"/>
    <text x="590" y="164" font-size="11" fill="#333" font-family="Inter, sans-serif">1</text>
    <text x="610" y="164" font-size="12" fill="#333" font-family="Inter, sans-serif">CompilerPass</text>

    <rect x="585" y="178" width="180" height="24" rx="3" fill="#fff" stroke="#ddd" stroke-width="1"/>
    <text x="590" y="194" font-size="11" fill="#333" font-family="Inter, sans-serif">2</text>
    <text x="610" y="194" font-size="12" fill="#333" font-family="Inter, sans-serif">BuildCheckPass</text>

    <rect x="585" y="208" width="180" height="24" rx="3" fill="#fff" stroke="#ddd" stroke-width="1"/>
    <text x="590" y="224" font-size="11" fill="#333" font-family="Inter, sans-serif">3</text>
    <text x="610" y="224" font-size="12" fill="#333" font-family="Inter, sans-serif">CrashPass (PoV regression)</text>

    <rect x="585" y="238" width="180" height="24" rx="3" fill="#fff" stroke="#ddd" stroke-width="1"/>
    <text x="590" y="254" font-size="11" fill="#333" font-family="Inter, sans-serif">4</text>
    <text x="610" y="254" font-size="12" fill="#333" font-family="Inter, sans-serif">TestsPass</text>

    <rect x="585" y="268" width="180" height="24" rx="3" fill="#fff" stroke="#ddd" stroke-width="1"/>
    <text x="590" y="284" font-size="11" fill="#333" font-family="Inter, sans-serif">5</text>
    <text x="610" y="284" font-size="12" fill="#333" font-family="Inter, sans-serif">RegressionPass</text>

    <rect x="585" y="298" width="180" height="24" rx="3" fill="#e8f5e9" stroke="#4CAF50" stroke-width="1"/>
    <text x="590" y="314" font-size="11" fill="#333" font-family="Inter, sans-serif">6</text>
    <text x="610" y="314" font-size="12" font-weight="600" fill="#2E7D32" font-family="Inter, sans-serif">FuzzPass (harness)</text>

    <rect x="585" y="328" width="180" height="24" rx="3" fill="#fff" stroke="#ddd" stroke-width="1"/>
    <text x="590" y="344" font-size="11" fill="#333" font-family="Inter, sans-serif">7</text>
    <text x="610" y="344" font-size="12" fill="#333" font-family="Inter, sans-serif">SanitizersPass</text>
  </g>

  <!-- ===== GROUP 5: PatcherG + Output + Stats ===== -->
  <g id="patch-g5" class="patch-group">
    <line x1="785" y1="230" x2="830" y2="230" stroke="#8C1D40" stroke-width="2.5" marker-end="url(#p-arr-maroon)"/>

    <rect x="835" y="155" width="130" height="150" rx="10" fill="#fafafa" stroke="#4CAF50" stroke-width="2" filter="url(#p-shadow)"/>
    <rect x="835" y="155" width="130" height="35" rx="10" fill="#e8f5e9"/>
    <rect x="835" y="182" width="130" height="8" fill="#e8f5e9"/>
    <text x="900" y="178" font-size="12" font-weight="700" text-anchor="middle" fill="#2E7D32" font-family="Inter, sans-serif">PatcherG</text>

    <rect x="870" y="205" width="60" height="40" rx="4" fill="#fff" stroke="#4CAF50" stroke-width="1.5"/>
    <text x="900" y="222" font-size="12" font-weight="600" text-anchor="middle" fill="#2E7D32" font-family="Inter, sans-serif">Dedup</text>
    <text x="900" y="236" font-size="11" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">Gate</text>

    <text x="900" y="270" font-size="11" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">One patch per bug</text>
    <text x="900" y="284" font-size="11" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">First valid wins</text>

    <line x1="965" y1="230" x2="1010" y2="230" stroke="#8C1D40" stroke-width="2.5" marker-end="url(#p-arr-maroon)"/>

    <rect x="1015" y="200" width="70" height="60" rx="6" fill="#8C1D40" filter="url(#p-shadow)"/>
    <text x="1050" y="228" font-size="12" font-weight="700" text-anchor="middle" fill="#FFD700" font-family="Inter, sans-serif">Submitted</text>
    <text x="1050" y="244" font-size="12" font-weight="700" text-anchor="middle" fill="#FFD700" font-family="Inter, sans-serif">Patch</text>

    <line x1="50" y1="430" x2="1060" y2="430" stroke="#e0e0e0" stroke-width="1"/>

    <rect x="100" y="445" width="250" height="28" rx="4" fill="#fff3e0"/>
    <text x="225" y="464" font-size="13" font-weight="600" text-anchor="middle" fill="#E65100" font-family="Inter, sans-serif">PatcherY: fast, scoped, deterministic</text>

    <rect x="420" y="445" width="250" height="28" rx="4" fill="#f3e5f5"/>
    <text x="545" y="464" font-size="13" font-weight="600" text-anchor="middle" fill="#7B1FA2" font-family="Inter, sans-serif">PatcherQ: creative, multi-model, agentic</text>

    <rect x="740" y="445" width="250" height="28" rx="4" fill="#e8f5e9"/>
    <text x="865" y="464" font-size="13" font-weight="600" text-anchor="middle" fill="#2E7D32" font-family="Inter, sans-serif">Race condition: best patch wins</text>
  </g>

</svg>

<script>
window._animQueue.push(function() {
  var g1 = document.getElementById('patch-g1');
  if (!g1) return;
  var slideEl = g1.closest('.slide');
  var slides = document.querySelectorAll('.slide');
  var idx = Array.from(slides).indexOf(slideEl);
  if (idx < 0) return;

  var groups = ['patch-g1', 'patch-g2', 'patch-g3', 'patch-g4', 'patch-g5'];

  window.registerSlideAnimation(idx, {
    mode: 'step',
    steps: groups.map(function(gid, i) {
      return {
        show: function(instant) {
          var el = document.getElementById(gid);
          if (!el) return;
          if (instant) {
            el.classList.add('visible');
          } else {
            el.classList.add('visible');
          }
        },
        hide: function() {
          var el = document.getElementById(gid);
          if (el) el.classList.remove('visible');
        }
      };
    })
  });
});
</script>

???

Patching is where everything comes together. Artiphishell runs two patchers in parallel, each with a fundamentally different strategy. [CLICK]

PatcherY is the constrained patcher. It receives function clusters from Kumushi, our statistical root cause analysis system, and patches one function at a time. The LLM, Claude 3.7 Sonnet, only generates code. It does not perform root cause analysis; that was already done upstream. If the patch fails validation, PatcherY refines iteratively, up to ten attempts, staying within the same scoped edit region. [CLICK]

PatcherQ is the free-form patcher. It uses a multi-agent architecture: a root cause agent generates hypotheses using multiple chains of thought across different models, then a programmer agent with full tool access, file browsing, source search, writes the patch. PatcherQ also runs a CriticPass using GPT-o3, which reviews the patch without tool access, providing an independent quality check. [CLICK]

Both patchers feed into the same seven-step validation pipeline. CompilerPass checks syntax. BuildCheckPass verifies the full project builds. CrashPass confirms the original exploit no longer triggers. TestsPass runs the test suite. RegressionPass checks for side effects. FuzzPass runs the harness to search for new bugs introduced by the patch. SanitizersPass checks for memory safety violations. [CLICK]

Finally, PatcherG acts as a deduplication gatekeeper. Only one patch per bug can be submitted. Whichever patcher produces a valid patch first wins. This race condition between a constrained and a creative approach maximized our coverage across different bug classes. Across the competition, Artiphishell achieved 95% or higher patch accuracy, the highest among all seven finalist CRS teams.
