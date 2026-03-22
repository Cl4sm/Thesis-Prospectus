---
type: content
title: "Dynamic Analysis"
---

<div id="dyn-diagram">
<svg viewBox="0 0 1050 500" style="width:100%; margin:0 auto; display:block;" xmlns="http://www.w3.org/2000/svg" id="dyn-svg">
  <defs>
    <marker id="dyn-arr" markerWidth="8" markerHeight="8" refX="7" refY="3" orient="auto">
      <polygon points="0 0, 8 3, 0 6" fill="#666"/>
    </marker>
  </defs>

  <!-- ===== TOP ROW: Compact summary boxes (shown after each technique is introduced) ===== -->

  <!-- Coverage-Guided summary pill -->
  <g id="dyn-pill-cov" style="opacity:0;">
    <rect x="15" y="10" width="240" height="40" rx="6" fill="#e3f2fd" stroke="#2196F3" stroke-width="2"/>
    <text x="135" y="35" font-size="13" font-weight="700" text-anchor="middle" fill="#1565C0" font-family="Inter, sans-serif">Coverage-Guided Fuzzing</text>
  </g>

  <!-- Grammar-Based summary pill -->
  <g id="dyn-pill-gram" style="opacity:0;">
    <rect x="270" y="10" width="240" height="40" rx="6" fill="#fff3e0" stroke="#FF9800" stroke-width="2"/>
    <text x="390" y="35" font-size="13" font-weight="700" text-anchor="middle" fill="#E65100" font-family="Inter, sans-serif">Grammar-Based Fuzzing</text>
  </g>

  <!-- LLM Seed Generation summary pill -->
  <g id="dyn-pill-seed" style="opacity:0;">
    <rect x="525" y="10" width="240" height="40" rx="6" fill="#e8f5e9" stroke="#4CAF50" stroke-width="2"/>
    <text x="645" y="35" font-size="13" font-weight="700" text-anchor="middle" fill="#2E7D32" font-family="Inter, sans-serif">LLM Seed Generation</text>
  </g>

  <!-- LLM-Directed Fuzzing summary pill -->
  <g id="dyn-pill-dir" style="opacity:0;">
    <rect x="780" y="10" width="250" height="40" rx="6" fill="#fce4ec" stroke="#8C1D40" stroke-width="2"/>
    <text x="905" y="35" font-size="13" font-weight="700" text-anchor="middle" fill="#8C1D40" font-family="Inter, sans-serif">LLM-Directed Fuzzing</text>
  </g>

  <!-- ===== DETAIL CARDS: Shown one at a time in the main area ===== -->

  <!-- Detail 1: Coverage-Guided Fuzzing -->
  <g id="dyn-detail-cov" style="opacity:0;">
    <rect x="100" y="75" width="850" height="300" rx="12" fill="#fafafa" stroke="#2196F3" stroke-width="2.5"/>
    <rect x="100" y="75" width="850" height="50" rx="12" fill="#e3f2fd"/>
    <rect x="100" y="115" width="850" height="10" fill="#e3f2fd"/>
    <text x="525" y="108" font-size="22" font-weight="700" text-anchor="middle" fill="#1565C0" font-family="Inter, sans-serif">Coverage-Guided Fuzzing</text>
    <text x="810" y="108" font-size="14" fill="#999" font-family="Inter, sans-serif">(AFL++, Jazzmine)</text>

    <!-- Diagram: Input → Mutate → Execute → Coverage? → loop -->
    <rect x="150" y="165" width="120" height="55" rx="6" fill="#fff" stroke="#2196F3" stroke-width="1.5"/>
    <text x="210" y="190" font-size="14" font-weight="600" text-anchor="middle" fill="#1565C0" font-family="Inter, sans-serif">Seed Input</text>
    <text x="210" y="207" font-size="12" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">corpus queue</text>

    <line x1="270" y1="192" x2="320" y2="192" stroke="#666" stroke-width="2" marker-end="url(#dyn-arr)"/>

    <rect x="325" y="165" width="120" height="55" rx="6" fill="#fff" stroke="#2196F3" stroke-width="1.5"/>
    <text x="385" y="190" font-size="14" font-weight="600" text-anchor="middle" fill="#1565C0" font-family="Inter, sans-serif">Mutate</text>
    <text x="385" y="207" font-size="12" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">bit flip, splice, etc.</text>

    <line x1="445" y1="192" x2="495" y2="192" stroke="#666" stroke-width="2" marker-end="url(#dyn-arr)"/>

    <rect x="500" y="165" width="120" height="55" rx="6" fill="#fff" stroke="#2196F3" stroke-width="1.5"/>
    <text x="560" y="190" font-size="14" font-weight="600" text-anchor="middle" fill="#1565C0" font-family="Inter, sans-serif">Execute</text>
    <text x="560" y="207" font-size="12" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">instrumented binary</text>

    <line x1="620" y1="192" x2="670" y2="192" stroke="#666" stroke-width="2" marker-end="url(#dyn-arr)"/>

    <rect x="675" y="165" width="140" height="55" rx="6" fill="#e3f2fd" stroke="#2196F3" stroke-width="2"/>
    <text x="745" y="190" font-size="14" font-weight="600" text-anchor="middle" fill="#1565C0" font-family="Inter, sans-serif">New Coverage?</text>
    <text x="745" y="207" font-size="12" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">edge bitmap check</text>

    <!-- Feedback loop arrow -->
    <path d="M 745,220 Q 745,260 445,260 Q 150,260 150,220" stroke="#2196F3" stroke-width="1.5" fill="none" stroke-dasharray="5,4" marker-end="url(#dyn-arr)"/>
    <text x="445" y="278" font-size="12" fill="#2196F3" font-weight="600" text-anchor="middle" font-family="Inter, sans-serif">keep interesting inputs → mutate again</text>

    <!-- Key point -->
    <rect x="200" y="310" width="650" height="40" rx="5" fill="#f5f5f5" stroke="#2196F3" stroke-width="1"/>
    <text x="525" y="336" font-size="14" font-weight="600" text-anchor="middle" fill="#333" font-family="Inter, sans-serif">Fast state-space exploration; struggles with structured inputs (JSON, SQL, XML)</text>
  </g>

  <!-- Detail 2: Grammar-Based Fuzzing -->
  <g id="dyn-detail-gram" style="opacity:0;">
    <rect x="100" y="75" width="850" height="300" rx="12" fill="#fafafa" stroke="#FF9800" stroke-width="2.5"/>
    <rect x="100" y="75" width="850" height="50" rx="12" fill="#fff3e0"/>
    <rect x="100" y="115" width="850" height="10" fill="#fff3e0"/>
    <text x="525" y="108" font-size="22" font-weight="700" text-anchor="middle" fill="#E65100" font-family="Inter, sans-serif">Grammar-Based Fuzzing</text>
    <text x="825" y="108" font-size="14" fill="#999" font-family="Inter, sans-serif">(GrammarGuy)</text>

    <!-- Grammar rule → Generated input → Target -->
    <rect x="150" y="165" width="200" height="90" rx="6" fill="#fff" stroke="#FF9800" stroke-width="1.5"/>
    <text x="250" y="188" font-size="14" font-weight="600" text-anchor="middle" fill="#E65100" font-family="Inter, sans-serif">Grammar Rules</text>
    <text x="250" y="210" font-size="12" text-anchor="middle" fill="#666" font-family="monospace">{"key": &lt;string&gt;,</text>
    <text x="250" y="226" font-size="12" text-anchor="middle" fill="#666" font-family="monospace"> "val": &lt;number&gt;}</text>
    <text x="250" y="245" font-size="11" text-anchor="middle" fill="#999" font-family="Inter, sans-serif">extracted from target code</text>

    <line x1="350" y1="210" x2="420" y2="210" stroke="#666" stroke-width="2" marker-end="url(#dyn-arr)"/>

    <rect x="425" y="165" width="200" height="90" rx="6" fill="#fff3e0" stroke="#FF9800" stroke-width="2"/>
    <text x="525" y="188" font-size="14" font-weight="600" text-anchor="middle" fill="#E65100" font-family="Inter, sans-serif">GrammarGuy Engine</text>
    <text x="525" y="210" font-size="12" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">Generates syntactically</text>
    <text x="525" y="226" font-size="12" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">valid test cases</text>
    <text x="525" y="245" font-size="11" text-anchor="middle" fill="#999" font-family="Inter, sans-serif">grammar composition + mutation</text>

    <line x1="625" y1="210" x2="695" y2="210" stroke="#666" stroke-width="2" marker-end="url(#dyn-arr)"/>

    <rect x="700" y="165" width="200" height="90" rx="6" fill="#fff" stroke="#FF9800" stroke-width="1.5"/>
    <text x="800" y="188" font-size="14" font-weight="600" text-anchor="middle" fill="#E65100" font-family="Inter, sans-serif">Target Parser</text>
    <text x="800" y="210" font-size="12" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">JSON, SQL, XML, protocol</text>
    <text x="800" y="226" font-size="12" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">handlers accept valid</text>
    <text x="800" y="245" font-size="11" text-anchor="middle" fill="#999" font-family="Inter, sans-serif">inputs and process deeply</text>

    <!-- Key point -->
    <rect x="200" y="310" width="650" height="40" rx="5" fill="#f5f5f5" stroke="#FF9800" stroke-width="1"/>
    <text x="525" y="336" font-size="14" font-weight="600" text-anchor="middle" fill="#333" font-family="Inter, sans-serif">Reaches code paths that random mutation cannot: format-aware exploration</text>
  </g>

  <!-- Detail 3: LLM Seed Generation -->
  <g id="dyn-detail-seed" style="opacity:0;">
    <rect x="100" y="75" width="850" height="300" rx="12" fill="#fafafa" stroke="#4CAF50" stroke-width="2.5"/>
    <rect x="100" y="75" width="850" height="50" rx="12" fill="#e8f5e9"/>
    <rect x="100" y="115" width="850" height="10" fill="#e8f5e9"/>
    <text x="525" y="108" font-size="22" font-weight="700" text-anchor="middle" fill="#2E7D32" font-family="Inter, sans-serif">LLM Seed Generation</text>
    <text x="850" y="108" font-size="14" fill="#999" font-family="Inter, sans-serif">(QuickSeed + DiscoveryGuy)</text>

    <!-- Source code → LLM → Seeds → Fuzzers -->
    <rect x="150" y="165" width="160" height="80" rx="6" fill="#fff" stroke="#4CAF50" stroke-width="1.5"/>
    <text x="230" y="190" font-size="14" font-weight="600" text-anchor="middle" fill="#2E7D32" font-family="Inter, sans-serif">Source Code</text>
    <text x="230" y="210" font-size="12" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">Target codebase +</text>
    <text x="230" y="226" font-size="12" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">input format hints</text>

    <line x1="310" y1="205" x2="370" y2="205" stroke="#666" stroke-width="2" marker-end="url(#dyn-arr)"/>

    <rect x="375" y="155" width="180" height="100" rx="6" fill="#e8f5e9" stroke="#4CAF50" stroke-width="2"/>
    <text x="465" y="183" font-size="14" font-weight="600" text-anchor="middle" fill="#2E7D32" font-family="Inter, sans-serif">LLM Analysis</text>
    <text x="465" y="205" font-size="12" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">Examines functions,</text>
    <text x="465" y="221" font-size="12" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">identifies input patterns,</text>
    <text x="465" y="237" font-size="12" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">generates valid instances</text>

    <line x1="555" y1="205" x2="615" y2="180" stroke="#666" stroke-width="2" marker-end="url(#dyn-arr)"/>
    <line x1="555" y1="205" x2="615" y2="230" stroke="#666" stroke-width="2" marker-end="url(#dyn-arr)"/>

    <rect x="620" y="155" width="160" height="45" rx="6" fill="#e3f2fd" stroke="#2196F3" stroke-width="1.5"/>
    <text x="700" y="183" font-size="13" font-weight="600" text-anchor="middle" fill="#1565C0" font-family="Inter, sans-serif">Coverage Fuzzer</text>

    <rect x="620" y="210" width="160" height="45" rx="6" fill="#fff3e0" stroke="#FF9800" stroke-width="1.5"/>
    <text x="700" y="238" font-size="13" font-weight="600" text-anchor="middle" fill="#E65100" font-family="Inter, sans-serif">Grammar Fuzzer</text>

    <!-- Key point -->
    <rect x="200" y="310" width="650" height="40" rx="5" fill="#f5f5f5" stroke="#4CAF50" stroke-width="1"/>
    <text x="525" y="336" font-size="14" font-weight="600" text-anchor="middle" fill="#333" font-family="Inter, sans-serif">Bootstraps both fuzzers with structurally valid initial inputs</text>
  </g>

  <!-- Detail 4: LLM-Directed Fuzzing -->
  <g id="dyn-detail-dir" style="opacity:0;">
    <rect x="100" y="75" width="850" height="300" rx="12" fill="#fafafa" stroke="#8C1D40" stroke-width="2.5"/>
    <rect x="100" y="75" width="850" height="50" rx="12" fill="#fce4ec"/>
    <rect x="100" y="115" width="850" height="10" fill="#fce4ec"/>
    <text x="525" y="108" font-size="22" font-weight="700" text-anchor="middle" fill="#8C1D40" font-family="Inter, sans-serif">LLM-Directed Fuzzing</text>
    <text x="830" y="108" font-size="14" fill="#999" font-family="Inter, sans-serif">(AIJON)</text>

    <!-- Target location → LLM → IJON annotations → Fuzzer -->
    <rect x="150" y="165" width="160" height="80" rx="6" fill="#fff" stroke="#8C1D40" stroke-width="1.5"/>
    <text x="230" y="190" font-size="14" font-weight="600" text-anchor="middle" fill="#8C1D40" font-family="Inter, sans-serif">Target Location</text>
    <text x="230" y="210" font-size="12" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">POI from Analysis</text>
    <text x="230" y="226" font-size="12" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">Graph or SAST</text>

    <line x1="310" y1="205" x2="370" y2="205" stroke="#666" stroke-width="2" marker-end="url(#dyn-arr)"/>

    <rect x="375" y="155" width="180" height="100" rx="6" fill="#fce4ec" stroke="#8C1D40" stroke-width="2"/>
    <text x="465" y="183" font-size="14" font-weight="600" text-anchor="middle" fill="#8C1D40" font-family="Inter, sans-serif">LLM Annotation</text>
    <text x="465" y="205" font-size="12" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">Generates custom IJON</text>
    <text x="465" y="221" font-size="12" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">feedback signals that</text>
    <text x="465" y="237" font-size="12" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">guide fuzzer to location</text>

    <line x1="555" y1="205" x2="615" y2="205" stroke="#666" stroke-width="2" marker-end="url(#dyn-arr)"/>

    <rect x="620" y="165" width="180" height="80" rx="6" fill="#fff" stroke="#8C1D40" stroke-width="1.5"/>
    <text x="710" y="190" font-size="14" font-weight="600" text-anchor="middle" fill="#8C1D40" font-family="Inter, sans-serif">Directed Fuzzer</text>
    <text x="710" y="210" font-size="12" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">Steered toward specific</text>
    <text x="710" y="226" font-size="12" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">code locations</text>

    <!-- Speedup callout -->
    <rect x="200" y="290" width="250" height="55" rx="6" fill="#fce4ec" stroke="#8C1D40" stroke-width="1.5"/>
    <text x="325" y="315" font-size="28" font-weight="bold" text-anchor="middle" fill="#8C1D40" font-family="Inter, sans-serif">35x</text>
    <text x="325" y="335" font-size="12" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">vs conventional directed fuzzers</text>

    <rect x="500" y="290" width="250" height="55" rx="6" fill="#fce4ec" stroke="#8C1D40" stroke-width="1.5"/>
    <text x="625" y="315" font-size="28" font-weight="bold" text-anchor="middle" fill="#8C1D40" font-family="Inter, sans-serif">100x</text>
    <text x="625" y="335" font-size="12" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">with high-quality seeds</text>
  </g>

  <!-- ===== SUMMARY PANEL (shown after all 4 pills are up) ===== -->
  <g id="dyn-summary" style="opacity:0;">
    <rect x="100" y="75" width="850" height="300" rx="12" fill="#fafafa" stroke="#333" stroke-width="2"/>
    <text x="525" y="115" font-size="20" font-weight="700" text-anchor="middle" fill="#333" font-family="Inter, sans-serif">Four Techniques, One Pipeline</text>

    <!-- Technique summary row -->
    <rect x="130" y="140" width="190" height="75" rx="6" fill="#e3f2fd" stroke="#2196F3" stroke-width="1.5"/>
    <text x="225" y="165" font-size="13" font-weight="600" text-anchor="middle" fill="#1565C0" font-family="Inter, sans-serif">Coverage-Guided</text>
    <text x="225" y="183" font-size="12" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">Fast, broad exploration</text>
    <text x="225" y="200" font-size="11" text-anchor="middle" fill="#999" font-family="Inter, sans-serif">AFL++, Jazzmine</text>

    <rect x="340" y="140" width="190" height="75" rx="6" fill="#fff3e0" stroke="#FF9800" stroke-width="1.5"/>
    <text x="435" y="165" font-size="13" font-weight="600" text-anchor="middle" fill="#E65100" font-family="Inter, sans-serif">Grammar-Based</text>
    <text x="435" y="183" font-size="12" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">Format-aware inputs</text>
    <text x="435" y="200" font-size="11" text-anchor="middle" fill="#999" font-family="Inter, sans-serif">GrammarGuy</text>

    <rect x="550" y="140" width="190" height="75" rx="6" fill="#e8f5e9" stroke="#4CAF50" stroke-width="1.5"/>
    <text x="645" y="165" font-size="13" font-weight="600" text-anchor="middle" fill="#2E7D32" font-family="Inter, sans-serif">LLM Seeds</text>
    <text x="645" y="183" font-size="12" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">Bootstrap both fuzzers</text>
    <text x="645" y="200" font-size="11" text-anchor="middle" fill="#999" font-family="Inter, sans-serif">QuickSeed + DiscoveryGuy</text>

    <rect x="760" y="140" width="160" height="75" rx="6" fill="#fce4ec" stroke="#8C1D40" stroke-width="1.5"/>
    <text x="840" y="165" font-size="13" font-weight="600" text-anchor="middle" fill="#8C1D40" font-family="Inter, sans-serif">LLM-Directed</text>
    <text x="840" y="183" font-size="12" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">Steer toward targets</text>
    <text x="840" y="200" font-size="11" text-anchor="middle" fill="#999" font-family="Inter, sans-serif">AIJON (35x speedup)</text>

    <!-- Key insight -->
    <rect x="150" y="250" width="750" height="50" rx="6" fill="#f5f5f5" stroke="#8C1D40" stroke-width="2"/>
    <text x="525" y="275" font-size="15" font-weight="700" text-anchor="middle" fill="#333" font-family="Inter, sans-serif">Each technique reaches different parts of the state space.</text>
    <text x="525" y="293" font-size="14" text-anchor="middle" fill="#666" font-family="Inter, sans-serif">The combination finds what no single technique can find alone.</text>

    <!-- Arrows showing flow -->
    <line x1="225" y1="215" x2="435" y2="232" stroke="#ddd" stroke-width="1"/>
    <line x1="645" y1="215" x2="435" y2="232" stroke="#ddd" stroke-width="1"/>
    <line x1="645" y1="215" x2="840" y2="232" stroke="#ddd" stroke-width="1"/>

    <!-- Data flow indicator: Seeds feed into Coverage + Grammar -->
    <path d="M 645 215 Q 500 235 225 215" stroke="#4CAF50" stroke-width="1.5" fill="none" stroke-dasharray="4,3"/>
    <path d="M 645 215 Q 550 235 435 215" stroke="#4CAF50" stroke-width="1.5" fill="none" stroke-dasharray="4,3"/>
  </g>

  <!-- ===== BOTTOM STATS LINE ===== -->
  <g id="dyn-stats" style="opacity:0;">
    <line x1="100" y1="410" x2="950" y2="410" stroke="#e0e0e0" stroke-width="1"/>
    <text x="525" y="445" font-size="16" font-weight="600" text-anchor="middle" fill="#333" font-family="Inter, sans-serif">DiscoveryGuy: the unified fuzzing pipeline coordinating all four approaches</text>
    <text x="525" y="470" font-size="14" text-anchor="middle" fill="#888" font-family="Inter, sans-serif">Results feed into the Analysis Graph as confirmed vulnerabilities</text>
  </g>

</svg>
</div>

<script>
window._animQueue.push(function() {
  var diagram = document.getElementById('dyn-diagram');
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
      // Step 1: Coverage-Guided detail card
      {
        show: function(instant) { showIds(['dyn-detail-cov'], instant); },
        hide: function() { hideIds(['dyn-detail-cov']); }
      },
      // Step 2: Collapse to pill + show Grammar detail
      {
        show: function(instant) {
          hideIds(['dyn-detail-cov']);
          showIds(['dyn-pill-cov', 'dyn-detail-gram'], instant);
        },
        hide: function() {
          hideIds(['dyn-pill-cov', 'dyn-detail-gram']);
          showIds(['dyn-detail-cov'], true);
        }
      },
      // Step 3: Collapse to pill + show LLM Seed detail
      {
        show: function(instant) {
          hideIds(['dyn-detail-gram']);
          showIds(['dyn-pill-gram', 'dyn-detail-seed'], instant);
        },
        hide: function() {
          hideIds(['dyn-pill-gram', 'dyn-detail-seed']);
          showIds(['dyn-detail-gram'], true);
        }
      },
      // Step 4: Collapse to pill + show LLM-Directed detail
      {
        show: function(instant) {
          hideIds(['dyn-detail-seed']);
          showIds(['dyn-pill-seed', 'dyn-detail-dir'], instant);
        },
        hide: function() {
          hideIds(['dyn-pill-seed', 'dyn-detail-dir']);
          showIds(['dyn-detail-seed'], true);
        }
      },
      // Step 5: Collapse to pill + show summary + stats
      {
        show: function(instant) {
          hideIds(['dyn-detail-dir']);
          showIds(['dyn-pill-dir', 'dyn-summary', 'dyn-stats'], instant);
        },
        hide: function() {
          hideIds(['dyn-pill-dir', 'dyn-summary', 'dyn-stats']);
          showIds(['dyn-detail-dir'], true);
        }
      }
    ]
  });
});
</script>

???

DiscoveryGuy is the fuzzing pipeline. It combines four approaches. [CLICK] Coverage-guided fuzzing with AFL++ and Jazzmine. Mutate inputs, execute the instrumented binary, check if we hit new code paths. Fast and thorough for unstructured input, but when the target expects a specific format, random byte mutations rarely produce valid inputs. [CLICK] Grammar-based fuzzing solves that. GrammarGuy understands input structure and generates syntactically valid test cases for JSON, SQL, XML parsers. It reaches code paths that random mutation cannot. [CLICK] LLM seed generation through QuickSeed and DiscoveryGuy. Both components examine the target codebase and produce initial inputs that exercise interesting functionality. Those seeds bootstrap the coverage-guided and grammar-based fuzzers. [CLICK] AIJON is the most novel component. It uses an LLM to automatically generate IJON annotations, custom feedback signals that guide the fuzzer toward specific program locations. Preliminary results show a 35x speedup over conventional directed fuzzers, and 100x faster with high-quality seeds. That acceleration is critical in a time-bounded competition. [CLICK] Together, these four techniques cover different parts of the state space. Coverage-guided explores broadly. Grammar-based reaches structured code paths. LLM seeds bootstrap both. AIJON steers toward specific targets. The combination finds what no single technique can find alone.
