---
type: content
title: "Artiphishell Architecture"
---

<svg id="arch-diagram" viewBox="0 0 1100 490" style="width:100%; display:block; margin: 30px auto 0;" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <marker id="a-blk" markerWidth="10" markerHeight="10" refX="9" refY="3.5" orient="auto">
      <polygon points="0 0, 10 3.5, 0 7" fill="#333"/>
    </marker>
    <marker id="a-blue" markerWidth="6" markerHeight="6" refX="5" refY="3" orient="auto">
      <polygon points="0 0, 6 3, 0 6" fill="#90CAF9"/>
    </marker>
    <marker id="a-blue-rev" markerWidth="6" markerHeight="6" refX="1" refY="3" orient="auto">
      <polygon points="6 0, 0 3, 6 6" fill="#90CAF9"/>
    </marker>
    <marker id="a-gold" markerWidth="8" markerHeight="8" refX="7" refY="3" orient="auto">
      <polygon points="0 0, 8 3, 0 6" fill="#FFB300"/>
    </marker>
    <marker id="a-maroon" markerWidth="8" markerHeight="8" refX="7" refY="3" orient="auto">
      <polygon points="0 0, 8 3, 0 6" fill="#8C1D40"/>
    </marker>
  </defs>

  <!-- ===== OUTER SYSTEM BOUNDARY (dashed) ===== -->
  <rect x="8" y="35" width="1084" height="400" rx="6" fill="none" stroke="#999" stroke-width="1.5" stroke-dasharray="6,4"/>

  <!-- ===== PYDATATASK ORCHESTRATOR (top center) ===== -->
  <rect x="430" y="8" width="170" height="30" rx="6" fill="#e8f5e9" stroke="#81C784" stroke-width="1.5"/>
  <text x="515" y="28" font-size="15.2" font-weight="bold" fill="#2E7D32" text-anchor="middle" font-family="Arial, sans-serif">Pydatatask</text>

  <!-- ===== INPUT: TOAST/OSS-Fuzz Project (far left) ===== -->
  <text x="30" y="58" font-size="11" fill="#555" font-family="Arial, sans-serif">TOAST/OSS-Fuzz</text>
  <text x="30" y="72" font-size="11" fill="#555" font-family="Arial, sans-serif">Project</text>
  <path d="M 55 78 L 55 98" stroke="#333" stroke-width="1.5" fill="none" marker-end="url(#a-blk)"/>

  <!-- ===== TARGET PREPARATION (left box) ===== -->
  <rect x="18" y="100" width="160" height="145" rx="5" fill="#fafafa" stroke="#bbb" stroke-width="1.5"/>
  <text x="98" y="118" font-size="13" font-weight="600" fill="#333" text-anchor="middle" font-family="Arial, sans-serif">Target Preparation</text>

  <rect x="28" y="126" width="65" height="38" rx="4" fill="#f0f0f0" stroke="#ccc" stroke-width="1"/>
  <text x="60" y="150" font-size="12" fill="#444" text-anchor="middle" font-family="Arial, sans-serif">Analyzer</text>

  <rect x="103" y="126" width="65" height="38" rx="4" fill="#f0f0f0" stroke="#ccc" stroke-width="1"/>
  <text x="135" y="150" font-size="12" fill="#444" text-anchor="middle" font-family="Arial, sans-serif">Indexer</text>

  <rect x="28" y="172" width="65" height="38" rx="4" fill="#f0f0f0" stroke="#ccc" stroke-width="1"/>
  <text x="60" y="196" font-size="12" fill="#444" text-anchor="middle" font-family="Arial, sans-serif">Builder(s)</text>

  <rect x="103" y="172" width="65" height="38" rx="4" fill="#f0f0f0" stroke="#ccc" stroke-width="1"/>
  <text x="135" y="196" font-size="12" fill="#444" text-anchor="middle" font-family="Arial, sans-serif">DiffGuy</text>

  <!-- Arrow: Target Prep → Bug-hunting -->
  <path d="M 178 172 L 206 172" stroke="#333" stroke-width="2" fill="none" marker-end="url(#a-blk)"/>

  <!-- ===== BUG-HUNTING SECTION (center) ===== -->
  <rect x="208" y="50" width="518" height="248" rx="5" fill="none" stroke="#888" stroke-width="1.5" stroke-dasharray="5,4"/>
  <text x="467" y="67" font-size="15.2" font-weight="bold" fill="#444" text-anchor="middle" font-family="Arial, sans-serif">Bug-hunting</text>

  <!-- --- Static group background --- -->
  <rect x="214" y="72" width="118" height="220" rx="4" fill="#F3E5F5" fill-opacity="0.35" stroke="none"/>
  <text x="273" y="86" font-size="15.2" font-weight="bold" fill="#7B1FA2" text-anchor="middle" font-family="Arial, sans-serif">STATIC</text>

  <!-- --- Dynamic group background --- -->
  <rect x="336" y="72" width="386" height="210" rx="4" fill="#FFF3E0" fill-opacity="0.35" stroke="none"/>
  <text x="529" y="86" font-size="15.2" font-weight="bold" fill="#E65100" text-anchor="middle" font-family="Arial, sans-serif">DYNAMIC</text>

  <!-- --- Pre Analysis sub-column (Static) --- -->
  <rect x="218" y="92" width="110" height="170" rx="4" fill="#f8f8f8" stroke="#ccc" stroke-width="1"/>

  <rect x="228" y="100" width="90" height="36" rx="4" fill="#fff" stroke="#ddd" stroke-width="1"/>
  <text x="273" y="115" font-size="13" font-weight="bold" fill="#5C3E84" text-anchor="middle" font-family="Arial, sans-serif">CodeQL</text>
  <text x="273" y="128" font-size="11" fill="#888" text-anchor="middle" font-family="Arial, sans-serif">SAST</text>

  <rect x="228" y="140" width="90" height="36" rx="4" fill="#fff" stroke="#ddd" stroke-width="1"/>
  <text x="273" y="155" font-size="13" font-weight="bold" fill="#00897B" text-anchor="middle" font-family="Arial, sans-serif">Semgrep</text>
  <text x="273" y="168" font-size="11" fill="#888" text-anchor="middle" font-family="Arial, sans-serif">Pattern match</text>

  <rect x="228" y="180" width="90" height="36" rx="4" fill="#fff" stroke="#ddd" stroke-width="1"/>
  <text x="273" y="195" font-size="13" font-weight="bold" fill="#333" text-anchor="middle" font-family="Arial, sans-serif">CorpusTrace</text>
  <text x="273" y="208" font-size="11" fill="#888" text-anchor="middle" font-family="Arial, sans-serif">Corpus mgmt</text>

  <rect x="228" y="220" width="90" height="36" rx="4" fill="#fff" stroke="#ddd" stroke-width="1"/>
  <text x="273" y="235" font-size="13" font-weight="bold" fill="#333" text-anchor="middle" font-family="Arial, sans-serif">LLuMinar</text>
  <text x="273" y="248" font-size="11" fill="#888" text-anchor="middle" font-family="Arial, sans-serif">LLM patterns</text>

  <text x="273" y="278" font-size="11" font-weight="600" fill="#666" text-anchor="middle" font-family="Arial, sans-serif">Pre Analysis</text>

  <!-- --- Traditional Fuzzing sub-column (Dynamic, shortened) --- -->
  <rect x="340" y="92" width="110" height="130" rx="4" fill="#f8f8f8" stroke="#ccc" stroke-width="1"/>

  <rect x="350" y="100" width="90" height="36" rx="4" fill="#fff" stroke="#ddd" stroke-width="1"/>
  <text x="395" y="115" font-size="12" font-weight="bold" fill="#C56000" text-anchor="middle" font-family="Arial, sans-serif">AFL++</text>
  <text x="395" y="128" font-size="11" fill="#888" text-anchor="middle" font-family="Arial, sans-serif">Coverage fuzz</text>

  <rect x="350" y="140" width="90" height="36" rx="4" fill="#fff" stroke="#ddd" stroke-width="1"/>
  <text x="395" y="155" font-size="12" font-weight="bold" fill="#333" text-anchor="middle" font-family="Arial, sans-serif">Jazzer</text>
  <text x="395" y="168" font-size="11" fill="#888" text-anchor="middle" font-family="Arial, sans-serif">Java fuzzing</text>

  <rect x="350" y="180" width="90" height="36" rx="4" fill="#fff" stroke="#ddd" stroke-width="1"/>
  <text x="395" y="195" font-size="12" font-weight="bold" fill="#333" text-anchor="middle" font-family="Arial, sans-serif">libfuzzer</text>
  <text x="395" y="208" font-size="11" fill="#888" text-anchor="middle" font-family="Arial, sans-serif">C/C++ fuzzing</text>

  <text x="395" y="236" font-size="11" font-weight="600" fill="#666" text-anchor="middle" font-family="Arial, sans-serif">Traditional Fuzzing</text>

  <!-- --- AI-Fuzzing sub-column (Dynamic, shortened) --- -->
  <rect x="462" y="92" width="120" height="130" rx="4" fill="#f8f8f8" stroke="#ccc" stroke-width="1"/>

  <rect x="472" y="100" width="100" height="36" rx="4" fill="#fff" stroke="#ddd" stroke-width="1"/>
  <text x="522" y="115" font-size="13" font-weight="bold" fill="#333" text-anchor="middle" font-family="Arial, sans-serif">AIJON</text>
  <text x="522" y="128" font-size="11" fill="#888" text-anchor="middle" font-family="Arial, sans-serif">AI-guided</text>

  <rect x="472" y="140" width="100" height="36" rx="4" fill="#fff" stroke="#ddd" stroke-width="1"/>
  <text x="522" y="153" font-size="13" font-weight="bold" fill="#333" text-anchor="middle" font-family="Arial, sans-serif">Grammar</text>
  <text x="522" y="165" font-size="13" font-weight="bold" fill="#333" text-anchor="middle" font-family="Arial, sans-serif">Composer</text>

  <rect x="472" y="180" width="100" height="36" rx="4" fill="#fff" stroke="#ddd" stroke-width="1"/>
  <text x="522" y="195" font-size="13" font-weight="bold" fill="#333" text-anchor="middle" font-family="Arial, sans-serif">Grammar Guy</text>
  <text x="522" y="208" font-size="11" fill="#888" text-anchor="middle" font-family="Arial, sans-serif">Grammar gen</text>

  <text x="522" y="236" font-size="11" font-weight="600" fill="#666" text-anchor="middle" font-family="Arial, sans-serif">AI-Fuzzing</text>

  <!-- --- LLM-PoVs sub-column (Dynamic, shortened) --- -->
  <rect x="594" y="92" width="120" height="130" rx="4" fill="#f8f8f8" stroke="#ccc" stroke-width="1"/>

  <rect x="604" y="100" width="100" height="36" rx="4" fill="#fff" stroke="#ddd" stroke-width="1"/>
  <text x="654" y="113" font-size="13" font-weight="bold" fill="#333" text-anchor="middle" font-family="Arial, sans-serif">Discovery</text>
  <text x="654" y="126" font-size="13" font-weight="bold" fill="#333" text-anchor="middle" font-family="Arial, sans-serif">Guy</text>

  <rect x="604" y="140" width="100" height="36" rx="4" fill="#fff" stroke="#ddd" stroke-width="1"/>
  <text x="654" y="155" font-size="13" font-weight="bold" fill="#333" text-anchor="middle" font-family="Arial, sans-serif">QuickSeed</text>
  <text x="654" y="168" font-size="11" fill="#888" text-anchor="middle" font-family="Arial, sans-serif">Seed gen</text>

  <text x="654" y="236" font-size="11" font-weight="600" fill="#666" text-anchor="middle" font-family="Arial, sans-serif">LLM-PoVs</text>

  <!-- ===== SEEDS POOL (bottom of bug-hunting box) ===== -->
  <rect x="340" y="270" width="380" height="24" rx="6" fill="#E3F2FD" stroke="#90CAF9" stroke-width="2"/>
  <text x="530" y="286" font-size="14" font-weight="bold" fill="#1565C0" text-anchor="middle" font-family="Arial, sans-serif">Seeds Pool</text>

  <!-- Double-headed arrows: Seeds Pool ↔ column labels (centered on component x) -->
  <!-- Traditional Fuzzing center x=395 -->
  <path d="M 395 266 L 395 240" stroke="#90CAF9" stroke-width="1.5" fill="none" marker-start="url(#a-blue-rev)" marker-end="url(#a-blue)"/>
  <!-- AI-Fuzzing center x=522 -->
  <path d="M 522 266 L 522 240" stroke="#90CAF9" stroke-width="1.5" fill="none" marker-start="url(#a-blue-rev)" marker-end="url(#a-blue)"/>
  <!-- LLM-PoVs center x=654 -->
  <path d="M 654 266 L 654 240" stroke="#90CAF9" stroke-width="1.5" fill="none" marker-start="url(#a-blue-rev)" marker-end="url(#a-blue)"/>

  <!-- ===== ROOT-CAUSE & PATCHING (right section, shifted left 90px total) ===== -->
  <rect x="770" y="50" width="222" height="248" rx="5" fill="none" stroke="#888" stroke-width="1.5" stroke-dasharray="5,4"/>
  <text x="881" y="67" font-size="15.2" font-weight="bold" fill="#444" text-anchor="middle" font-family="Arial, sans-serif">Root-cause &amp; Patching</text>

  <!-- Root-cause sub-column -->
  <rect x="780" y="78" width="100" height="155" rx="4" fill="#f8f8f8" stroke="#ccc" stroke-width="1"/>

  <rect x="788" y="88" width="84" height="50" rx="4" fill="#fff" stroke="#ddd" stroke-width="1"/>
  <text x="830" y="110" font-size="12" font-weight="bold" fill="#333" text-anchor="middle" font-family="Arial, sans-serif">Kumushi</text>
  <text x="830" y="126" font-size="11" fill="#888" text-anchor="middle" font-family="Arial, sans-serif">Statistical</text>

  <rect x="788" y="144" width="84" height="50" rx="4" fill="#fff" stroke="#ddd" stroke-width="1"/>
  <text x="830" y="166" font-size="13" font-weight="bold" fill="#333" text-anchor="middle" font-family="Arial, sans-serif">DyVa</text>
  <text x="830" y="182" font-size="11" fill="#888" text-anchor="middle" font-family="Arial, sans-serif">Dynamic RCA</text>

  <text x="830" y="248" font-size="11" font-weight="600" fill="#666" text-anchor="middle" font-family="Arial, sans-serif">Root-cause</text>

  <!-- Patching sub-column -->
  <rect x="888" y="78" width="96" height="155" rx="4" fill="#f8f8f8" stroke="#ccc" stroke-width="1"/>

  <rect x="896" y="88" width="80" height="50" rx="4" fill="#fff" stroke="#ddd" stroke-width="1"/>
  <text x="936" y="110" font-size="13" font-weight="bold" fill="#333" text-anchor="middle" font-family="Arial, sans-serif">PatcherY</text>
  <text x="936" y="126" font-size="11" fill="#888" text-anchor="middle" font-family="Arial, sans-serif">YAML-based</text>

  <rect x="896" y="144" width="80" height="50" rx="4" fill="#fff" stroke="#ddd" stroke-width="1"/>
  <text x="936" y="166" font-size="13" font-weight="bold" fill="#333" text-anchor="middle" font-family="Arial, sans-serif">PatcherQ</text>
  <text x="936" y="182" font-size="11" fill="#888" text-anchor="middle" font-family="Arial, sans-serif">Query-based</text>

  <text x="936" y="248" font-size="11" font-weight="600" fill="#666" text-anchor="middle" font-family="Arial, sans-serif">Patching</text>

  <!-- Arrow: Bug-hunting → Root-cause & Patching (outside bug-hunting box) -->
  <path d="M 730 172 L 768 172" stroke="#333" stroke-width="2.5" fill="none" marker-end="url(#a-blk)"/>

  <!-- ===== OUTPUT: Submit box containing Patch & PoV ===== -->
  <!-- Single arrow: Patching → Submit box -->
  <path d="M 984 160 L 1018 160" stroke="#333" stroke-width="2" fill="none" marker-end="url(#a-blk)"/>

  <!-- Submit outer box (vertically centered with RCA content) -->
  <rect x="1020" y="110" width="66" height="100" rx="5" fill="#fafafa" stroke="#8C1D40" stroke-width="2"/>
  <text x="1053" y="130" font-size="14" font-weight="bold" fill="#8C1D40" text-anchor="middle" font-family="Arial, sans-serif">Submit</text>
  <!-- Patch sub-box -->
  <rect x="1028" y="138" width="50" height="28" rx="3" fill="#F3E5F5" stroke="#7B1FA2" stroke-width="1"/>
  <text x="1053" y="156" font-size="13" font-weight="bold" fill="#7B1FA2" text-anchor="middle" font-family="Arial, sans-serif">Patch</text>
  <!-- PoV sub-box -->
  <rect x="1028" y="172" width="50" height="28" rx="3" fill="#FFF3E0" stroke="#E65100" stroke-width="1"/>
  <text x="1053" y="190" font-size="13" font-weight="bold" fill="#E65100" text-anchor="middle" font-family="Arial, sans-serif">PoV</text>

  <!-- Arrow: AG → Submit box (right-angle from AG right side, up to Submit bottom) -->
  <path d="M 1030 380 L 1053 380 L 1053 212" stroke="#8C1D40" stroke-width="2" fill="none" marker-end="url(#a-maroon)"/>

  <!-- ===== ANALYSIS GRAPH (bottom, full width) ===== -->
  <rect x="30" y="355" width="1000" height="50" rx="8" fill="#F8EEF1" stroke="#8C1D40" stroke-width="2.5"/>
  <circle cx="500" cy="380" r="15" fill="#8C1D40"/>
  <text x="500" y="385" font-size="14" fill="white" text-anchor="middle" font-family="Arial, sans-serif">AG</text>
  <text x="548" y="376" font-size="15.2" font-weight="bold" fill="#8C1D40" font-family="Arial, sans-serif">Analysis Graph</text>
  <text x="548" y="393" font-size="11" fill="#666" font-family="Arial, sans-serif">(Knowledge Base)</text>

  <!-- Arrows: Analysis Graph ↔ phases above -->
  <!-- Target Prep → AG (single arrow down) -->
  <path d="M 90 245 L 90 353" stroke="#FFB300" stroke-width="2" fill="none" marker-end="url(#a-gold)"/>

  <!-- Bug-hunting ↔ AG (one pair) -->
  <path d="M 460 300 L 460 353" stroke="#FFB300" stroke-width="2" fill="none" marker-end="url(#a-gold)"/>
  <path d="M 480 353 L 480 300" stroke="#FFB300" stroke-width="2" fill="none" marker-end="url(#a-gold)"/>

  <!-- RCA & Patching ↔ AG -->
  <path d="M 850 300 L 850 353" stroke="#FFB300" stroke-width="2" fill="none" marker-end="url(#a-gold)"/>
  <path d="M 870 353 L 870 300" stroke="#FFB300" stroke-width="2" fill="none" marker-end="url(#a-gold)"/>

  <!-- ===== PYDATATASK LINES (right-angle dashed green) ===== -->
  <!-- Pydatatask → Target Preparation -->
  <path d="M 460 38 L 460 45 L 98 45 L 98 98" stroke="#81C784" stroke-width="1.2" stroke-dasharray="4,3" fill="none"/>
  <!-- Pydatatask → Bug-hunting -->
  <path d="M 515 38 L 515 50" stroke="#81C784" stroke-width="1.2" stroke-dasharray="4,3" fill="none"/>
  <!-- Pydatatask → Root-cause & Patching -->
  <path d="M 570 38 L 570 45 L 881 45 L 881 50" stroke="#81C784" stroke-width="1.2" stroke-dasharray="4,3" fill="none"/>
  <!-- Pydatatask → Submit box -->
  <path d="M 600 38 L 600 45 L 1053 45 L 1053 108" stroke="#81C784" stroke-width="1.2" stroke-dasharray="4,3" fill="none"/>

</svg>


???

The system is built around seven agent types organized in three phases. The preprocessing pipeline runs first: Builder compiles the target with instrumentation, the Analyzer extracts structural information like control flow graphs, the Indexer builds searchable code indices, and DiffGuy tracks code changes between versions. Once preprocessing completes, bug-hunting runs in parallel across four categories. Pre-analysis agents, CodeQL, Semgrep, CorpusTrace, and LLuMinar, perform static scanning and LLM-based pattern matching. Traditional fuzzers AFL++ and Jazzer run coverage-guided and Java-specific fuzzing. AI-fuzzing agents AIJON, Grammar Composer, and Grammar Guy generate structured inputs. LLM-PoV agents DiscoveryGuy and QuickSeed use language models to generate proof-of-vulnerability candidates directly. All fuzzers share a Seeds Pool for cross-pollination. Root-cause analysis consumes crash signals: Kumushi uses statistical correlation, DyVa runs LLM-directed debugging. Patchers generate fixes in two modes: PatcherY uses YAML templates, PatcherQ uses query-based reasoning. The Analysis Graph at the bottom is the central knowledge base. Every agent reads from and writes to it. Every finding from every technique gets recorded there. That's how cross-technique reasoning happens without agents needing to communicate directly. Pydatatask orchestrates the entire pipeline, scheduling agents based on dependencies and available resources.
