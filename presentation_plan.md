# Dissertation Prospectus Presentation Plan

**Title:** Towards Complete and Scalable Automated Software Vulnerability Analysis
**Presenter:** Wil Gibbs
**Committee:** Adam Doupe (Co-Chair), Fish Wang (Co-Chair), Yan Shoshitaishvili, Adil Ahmad
**Target Duration:** ~45 minutes (+ 15 min Q&A = 1 hour)

---

## Narrative Arc (The Story)

**Theme: Towards Complete and Scalable Automated Software Vulnerability Analysis**

Automated vulnerability analysis tools today force a trade-off: **scalable** tools (static analyzers) produce candidates they cannot confirm, while **complete** tools (symbolic executors) prove individual paths but cannot scale to real software. This dissertation eliminates that trade-off through three systems that progressively close the gap between detecting a vulnerability and confirming it with concrete evidence, all while operating at the scale of real-world firmware and software.

| Project | What It Achieves | Scalability | Completeness of Evidence |
|---------|-----------------|-------------|--------------------------|
| Operation Mango | Scalable detection across entire firmware images | Every binary (not just border binaries) | Ranked candidates (partial) |
| Artiphishell | Autonomous find-validate-patch on real software | Real-world OSS (Linux, SQLite, Jenkins) | Convergent: multi-technique corroboration |
| Proposed (AIL SymEx) | Formal validation of static candidates | Directed (validates specific paths, avoids explosion) | Concrete triggering inputs (formal) |

The talk progresses from **scalable detection** → **autonomous multi-technique analysis** → **formal validation at scale**, showing how each project pushes the boundary of what automated vulnerability analysis can both cover and confirm.

---

## SECTION 1: INTRODUCTION & MOTIVATION (~5 min, slides 1-7)

### Slide 1: Title Slide
- **Title:** Towards Complete and Scalable Automated Software Vulnerability Analysis
- **Subtitle:** Dissertation Prospectus
- **Name, Date, Committee, ASU/SEFCOM logos**
- Speaker notes: Quick intro, thank committee

### Slide 2: The Problem — Vulnerabilities Are Everywhere
- 40,000+ CVEs in 2024 (38% increase YoY)
- 29 billion connected devices, IoT firmware especially exposed
- Mirai botnet as a concrete example of consequence
- 4.8M unfilled cybersecurity positions
- **Key point:** The scale of the problem far exceeds human capacity
- Diagram idea: Simple visual showing exponential growth of CVEs vs. flat analyst workforce

### Slide 3: The Scalability vs. Completeness Trade-Off
- The fundamental tension in automated vulnerability analysis:
  - **Scalable but incomplete:** Static analyzers scan thousands of binaries, but produce unconfirmed candidates (false positives, no PoC)
  - **Complete but not scalable:** Symbolic execution can prove paths, but suffers path explosion on real programs
  - **Dynamic (fuzzing):** Finds real crashes, but coverage is opportunistic and misses targeted vulnerabilities
- Diagram: 2x2 grid with Scalability on X-axis, Completeness of Evidence on Y-axis. Existing tools cluster in the corners. The goal is the top-right.
- **Key point:** No existing tool occupies the top-right quadrant. This dissertation aims to get there.

### Slide 4: The Detection-to-Confirmation Gap
- A static analyzer reports "tainted data flows to system()" — is it exploitable?
  - Maybe an NVRAM flag blocks the path
  - Maybe the value is sanitized before reaching the sink
  - Maybe a cross-binary precondition is unsatisfiable
- Vendors reject vulnerability reports without Proof-of-Concept exploits
- Human analysts close this gap manually: they trace control flow, evaluate branches, cross-reference tools
- Reference: Votipka et al. — practitioners combine value judgment, multi-tool correlation, path reasoning
- **Key point:** We need automated systems that can both detect at scale AND confirm with evidence

### Slide 5: Thesis Statement (Full-Screen, Bold)
> **Complete and scalable automated vulnerability analysis is achievable by building systems that progressively close the gap between detection and confirmation — scaling detection across entire firmware images, coordinating multiple analysis techniques autonomously, and formally validating static candidates with concrete triggering inputs.**

### Slide 6: Roadmap / Agenda
- Overview of three projects, their relationship, and the progression:
  - **Operation Mango** (USENIX Security '24) — Scales detection to every binary in a firmware image
  - **Artiphishell** (DEF CON '25 / DARPA AIxCC) — Coordinates multiple techniques for autonomous find-validate-patch
  - **Proposed: AIL Symbolic Execution** — Formally validates static candidates with concrete PoCs
- Visual: Three boxes arranged left-to-right with an arrow showing the progression from detection → corroboration → formal proof
- Each project increases both the scale of analysis AND the strength of evidence produced

### Slide 7: The Completeness-Scalability Progression (Visual)
- Return to the 2x2 from Slide 3, now with the three projects plotted:
  - Mango: high scalability (770K binaries), partial evidence (ranked candidates)
  - Artiphishell: moderate scalability (real OSS projects), convergent evidence (multi-technique agreement)
  - AIL SymEx: directed scalability (validates specific paths), formal evidence (concrete inputs)
  - Arrow connecting all three: together they cover the full pipeline from scan-everything detection to per-candidate proof
- **Key visual:** The three projects together form a pipeline that is BOTH complete AND scalable

---

## SECTION 2: OPERATION MANGO (~15 min, slides 8-20)

### Slide 8: Section Title — Operation Mango
- Full title: "Operation Mango: Scalable Discovery of Taint-Style Vulnerabilities in Binary Firmware Services"
- Published: USENIX Security 2024
- **Thesis contribution:** Scales firmware vulnerability detection to every binary in an image while maintaining precision through value-aware tracking

### Slide 9: Firmware Vulnerability Landscape
- IoT firmware = embedded Linux with user-space ELF binaries
- Devices expose services (web interfaces, UPnP, custom protocols)
- Backend binaries communicate via NVRAM, shared memory, sockets
- Diagram idea: A router with arrows showing frontend (httpd) → NVRAM → backend (dlnad)

### Slide 10: The Motivating Example (Netgear R6400)
- Show the httpd → NVRAM → dlnad code example from the paper
- httpd receives `iserver_passcode`, writes to NVRAM
- dlnad reads from NVRAM, passes unsanitized to `system()`
- **Key point:** SaTC and Karonte both miss this because they only analyze "border binaries" — dlnad is excluded
- This is a real command injection that existing tools cannot find

### Slide 11: Why Existing Tools Fail — The Two Challenges
- **Challenge 1: Precision** — Taint tracking loses value transformation history (overtainting)
  - Traditional taint = 1 bit (tainted or not)
  - Can't distinguish "tainted and passed through strlen()" from "tainted and passed directly to system()"
- **Challenge 2: Scalability** — Border binary restriction misses most of the firmware
  - Karonte/SaTC: max 131 of 3,599 binaries analyzed
  - Vulnerabilities in the remaining 3,468 binaries go unexamined

### Slide 12: Mango's Approach Overview
- Mango workflow diagram (create new, cleaner version of Figure 4.1):
  1. Analyze ALL environment ELFs (find what writes to NVRAM, files, etc.)
  2. Analyze ALL sink-containing ELFs with environment context
  3. Produce ranked TruPoCs
- **Key distinction:** No border binary filtering. Every binary gets analyzed.

### Slide 13: Rich Expressions — Encoding Value-Level Reasoning
- The core innovation: replace binary taint bits with Rich Expressions
- Rich Expressions track the full transformation history of a value
- Example: `RichExpr(src="iserver_passcode", ops=[nvram_get, sprintf, system])`
- vs. traditional taint: just "tainted = true"
- This captures the same judgment a human analyst applies when tracing data flows
- Diagram: Side-by-side comparison of taint bit vs. Rich Expression for the same path

### Slide 14: MangoDFA — The Analysis Engine
- Built on angr's ReachingDefinitions analysis
- Operates on VEX IR, tracks Rich Expressions through registers and memory
- Key features:
  - Inter-function analysis with function summaries
  - Handles indirect calls, complex data structures
  - Models library functions (strcpy, sprintf, system, etc.)

### Slide 15: Sink-to-Source Analysis
- Traditional: start from source (network input), trace forward to sink
- Mango: start from sink (system(), sprintf()), trace BACKWARD to source
- Why? Far fewer sinks than potential sources in a binary
- Diagram: Show the backward trace from system() call up through the call chain
- Reduces search space dramatically

### Slide 16: Assumed Nonimpact — Scaling Without Losing Precision
- Problem: Analyzing every callee causes exponential blowup
- Insight: Most callees don't affect the sink argument
- Assumed Nonimpact: Skip callees that don't appear to modify the tracked value
- If needed later, re-analyze with the callee included
- This is what allows Mango to analyze 3,599 binaries in reasonable time (avg 8 min/binary)

### Slide 17: From Alerts to TruPoCs
- Mango produces alerts, but not all are exploitable
- TruPoC filtering: prioritize alerts where the source is attacker-reachable
  - Network input → high priority
  - Cross-binary NVRAM path (httpd sets, dlnad gets) → high priority
  - Config file only written by local admin → lower priority
- Environment resolution: trace NVRAM SET/GET pairs across binaries

### Slide 18: Evaluation — Karonte Dataset Results
- Table: Mango vs. SaTC on Karonte benchmark
  - Mango: 3,599 binaries analyzed, avg 8 min/binary
  - SaTC: 131 binaries, avg 6.5 hours
  - Mango finds 56 additional real vulnerabilities SaTC misses
- Highlight the 27x more binaries analyzed

### Slide 19: Evaluation — Large-Scale Results
- 1,698 firmware images, 770,374 binaries
- 10,834 ranked vulnerability alerts
- 166 confirmed exploitable vulnerabilities in sampled audit
- Table showing vendor breakdown (Netgear, TP-Link, D-Link, etc.)
- **Key point:** This is what complete-coverage firmware analysis looks like — no binary left behind

### Slide 20: Ablation Study & Mango Summary
- Ablation results on R6400v2 showing contribution of each component
- Summary of Mango's contribution to the thesis:
  - **Scalability:** Analyzes every binary (27x more than SaTC), avg 8 min/binary
  - **Precision:** Rich Expressions reduce false positives by tracking transformation history
  - **Remaining gap:** Candidates are still static hypotheses. Mango tells us WHERE, but not whether an attacker can actually reach that path.
  - **Transition:** "We've scaled detection. Now: can we build systems that autonomously confirm these findings?"

---

## SECTION 3: ARTIPHISHELL (~12 min, slides 21-30)

### Slide 21: Section Title — Artiphishell
- Full title: "Artiphishell: An AI-Powered Cyber Reasoning System for Automatic Vulnerability Identification and Patching"
- Published: DEF CON 2025 (DARPA AIxCC)
- **Thesis contribution:** Demonstrates that the full vulnerability lifecycle (find → validate → patch) can be automated on real-world software by coordinating multiple analysis techniques
- Note: "I led the design and implementation of this system within team Shellphish"

### Slide 22: The AIxCC Challenge
- DARPA's $29.5M AI Cyber Challenge
- Target: real-world open-source software (Linux kernel, SQLite, Jenkins, etc.)
- Requirement: Find, validate, AND patch vulnerabilities with zero human intervention
- Evolution from CGC (2016, simplified DECREE binaries) → AIxCC (2024-25, real software)
- This forced teams to encode the multi-technique workflow that human teams apply naturally

### Slide 23: Why Multi-Technique Coordination Matters
- Each technique alone produces partial evidence:
  - Fuzzer crash on function X → "something wrong here"
  - LLM scanner flags function X → "pattern looks vulnerable"
  - Root-cause analysis confirms → "buffer overflow at line 42"
  - Combined → convergent evidence, high confidence
- This is what human security teams do: cross-reference findings
- Diagram: Venn diagram showing overlap of techniques building confidence

### Slide 24: Artiphishell Architecture Overview
- High-level pipeline diagram (create new version of Figure 5.1):
  - **Preprocessing:** Builder, Analyzer, Indexer
  - **Vulnerability Identification:** Coverage-guided fuzzing, grammar-based fuzzing, LLM scanning
  - **Root Cause Analysis:** Statistical (Kumushi) + LLM-based (DyVA)
  - **Patching:** LLM-driven patchers, validation pipeline
  - **Orchestration:** Metagent coordinates all agents
- All connected through the **Analysis Graph** (shared knowledge base)

### Slide 25: The Analysis Graph — Shared Knowledge Base
- Central data structure that enables cross-technique reasoning
- Stores: POIs, crashes, vulnerability reports, patches, test results
- When a fuzzer finds a crash, it's linked to the same POI the scanner flagged
- Enables the convergent evidence pattern:
  - Scanner flags function → fuzzer crashes on that function → RCA confirms root cause → patch generated
- Diagram: Show data flow between agents through the Analysis Graph

### Slide 26: Vulnerability Identification — Multi-Technique Approach
- **Coverage-guided fuzzing** (AFluzzer): AFL++ based, persistent mode
- **Grammar-based fuzzing** (Jazzmine): For structured inputs (JSON, SQL, XML)
- **LLM-powered scanning** (Discovery Guy, LLuMinar): Pattern recognition at scale
- **Hybrid seed generation** (QuickSeed, AIJON): LLM-generated initial seeds
- Key insight: These aren't competing — they're complementary. Grammar fuzzing reaches states coverage fuzzing can't, and vice versa.

### Slide 27: Root Cause Analysis & Patching
- **Kumushi:** Statistical correlation of crashes to source locations
- **DyVA:** LLM-based dynamic vulnerability analysis
- **Patching pipeline:** Multiple LLM-driven patchers generate candidate patches
- Validation: patches must pass original test suite + regression tests
- Deduplication ensures only distinct patches are submitted

### Slide 28: Competition Results
- Performance across AIxCC exhibitions and scored rounds
- Key metrics: vulnerabilities found, patches accepted, patches that introduced regressions
- Position relative to other teams
- Highlight specific wins (e.g., categories where Artiphishell excelled)

### Slide 29: What Artiphishell Demonstrated
- The complete vulnerability lifecycle CAN be automated on real software
- Multi-technique coordination produces stronger evidence than any single tool
- The Analysis Graph architecture enables scalable cross-referencing
- **But:** AIxCC provides source code. Firmware analysis is binary-only.
- **Remaining gap for completeness:** How do we move from "multiple techniques agree this looks bad" to "here is a concrete input that triggers the bug" — in binary-only firmware?

### Slide 30: Connecting Mango and Artiphishell — The Remaining Gap
- Mango: **scalable detection** across entire firmware (binary-only), but candidates unvalidated
- Artiphishell: **complete autonomous lifecycle** on source-available software
- Together they show: we can detect at scale, and we can automate the full lifecycle
- Missing piece: **formal validation of binary-only static candidates** — take a Mango alert and produce a concrete proof-of-concept exploit
- **Transition:** "The final step towards complete and scalable analysis: formal path validation"

---

## SECTION 4: PROPOSED WORK — AIL SYMBOLIC EXECUTION (~8 min, slides 31-38)

### Slide 31: Section Title — Proposed Work
- "Automated Validation of Static Vulnerability Candidates Through Directed Symbolic Execution"
- **Thesis contribution:** Closes the loop — transforms static candidates into formally validated vulnerabilities with concrete triggering inputs, completing the path from scalable detection to confirmed exploitation
- Status: Working prototype with promising initial results

### Slide 32: The Validation Gap
- Mango produces candidates. Vendors reject reports without PoC exploits.
- A static candidate says "data flows from source to sink" but:
  - An NVRAM flag check might block the path
  - A string comparison against a whitelist might sanitize the input
  - A cross-binary precondition might be unsatisfiable
- Human analysts manually trace control flow, evaluate branch conditions, judge feasibility
- This is expensive, time-consuming, requires domain expertise
- **Key question:** Can we automate this path feasibility reasoning?

### Slide 33: Why Conventional Symbolic Execution Fails on Firmware
- Path explosion makes whole-program execution intractable
- Low-level IRs (VEX) produce verbose, complex SMT constraints
- Firmware-specific challenges:
  - Environmental state (NVRAM, HTTP APIs) must be modeled
  - Cross-binary IPC means constraints span multiple programs
  - Entry-point problem: complex preconditions before reaching the vulnerability
- Diagram: Show constraint complexity at VEX level vs. what we want

### Slide 34: Our Approach — Three Key Design Choices
1. **AIL-level execution:** Operate on angr's decompiler IR, not VEX
   - Carries recovered types, structured control flow
   - Produces tighter constraints, fewer lifting artifacts
   - Operates at the variable level (like source code)
2. **Hybrid concretization:** Static precondition extraction + LLM-directed recovery
   - NVRAM keys, HTTP parameters, guard patterns extracted from decompilation
   - LLM fills in gaps where static extraction fails
3. **Cross-binary constraint chaining:** Trace NVRAM SET/GET across firmware
   - Connect setter binary's symbolic state to getter binary's path conditions
   - Multi-stage constraint chains for multi-binary vulnerabilities

### Slide 35: System Architecture Diagram
- New diagram showing the pipeline:
  - Input: Static analysis trace (from Mango, SaTC, Karonte, etc.)
  - Normalization layer → canonical path representation
  - AIL symbolic execution engine
  - Hybrid concretization (static + LLM)
  - Cross-binary constraint resolver
  - Output: Verdict (reachable / unreachable / constant sink) + concrete PoC inputs
- Highlight the normalization layer that accepts any taint-style tool's output

### Slide 36: Preliminary Results
- Working prototype on Netgear R6400 firmware
- 161 statically-reported closures from Mango
- 51 confirmed as reachable command injection paths
- Concrete proof-of-concept exploits synthesized for each
- 1 zero-day vulnerability already identified
- **Key point:** This is the formal validation that Mango's candidates needed

### Slide 37: Planned Evaluation
- Three experiments:
  1. **Multi-firmware effectiveness:** Multiple vendors, architectures → generalizability
     - Including responsible disclosure of discovered 0-days
  2. **Static analysis verification:** Test normalization layer on Mango, SaTC, Karonte output
     - Measure gap between reported candidates and confirmed vulnerabilities
  3. **LLM-directed precondition recovery:** Ablation comparing with/without LLM component
- Extension: Buffer overflow candidates (beyond command injection)

### Slide 38: How It All Fits Together — Towards Complete and Scalable Analysis
- Full thesis vision diagram:
  - **Scalable detection (Mango):** Scans every binary in a firmware image → ranked candidates
  - **Formal validation (AIL SymEx):** Takes each candidate → produces concrete PoC or rules infeasible
  - **Autonomous lifecycle (Artiphishell):** Demonstrates the full find-validate-patch cycle is automatable for source-available targets
- Return to the 2x2 diagram from Slide 7: the three projects together cover the full scalability-completeness space
- **The thesis vision:** A vulnerability analysis pipeline that is simultaneously complete (concrete triggering inputs) and scalable (every binary, every firmware image)

---

## SECTION 5: TIMELINE & CONCLUSION (~5 min, slides 39-43)

### Slide 39: PhD Timeline (Full History)
- Visual timeline (horizontal bar chart or Gantt-style):
  - **Fall 2021:** Started PhD at ASU/SEFCOM
  - **2022-2023:** Operation Mango development, comprehensive exam
  - **Aug 2024:** Operation Mango published at USENIX Security '24
  - **2024-2025:** Artiphishell / DARPA AIxCC competition
  - **Aug 2025:** Artiphishell at DEF CON 33
  - **Mar 2026:** Prospectus defense (YOU ARE HERE marker)
  - **Spring-Summer 2026:** Complete AIL SymEx evaluation, multi-firmware expansion
  - **Fall 2026:** Write dissertation, submit paper on AIL SymEx
  - **Spring 2027:** Dissertation defense (target)
- Color-code: completed work in solid, future work in dashed/lighter

### Slide 40: Remaining Work Breakdown
- Detailed breakdown of proposed work timeline:
  - **Apr-May 2026:** Expand evaluation to additional firmware (TP-Link, D-Link, etc.)
  - **Jun-Jul 2026:** Complete baseline comparisons (SaTC, Karonte normalization)
  - **Aug-Sep 2026:** LLM ablation study, buffer overflow extension
  - **Oct 2026:** Submit AIL SymEx paper (target venue: USENIX Security '27 or S&P '27)
  - **Nov 2026 - Feb 2027:** Write dissertation
  - **Spring 2027:** Dissertation defense
- Emphasize feasibility: working prototype already confirms 51/161 paths

### Slide 41: Thesis Contributions Summary
- Three concrete contributions toward complete and scalable automated vulnerability analysis:
  1. **Operation Mango:** Scales firmware vulnerability detection to every binary in an image (27x more than prior work) while maintaining precision through value-level tracking (USENIX Security '24)
  2. **Artiphishell:** Demonstrates the full autonomous vulnerability lifecycle on real-world software through multi-technique coordination (DEF CON '25)
  3. **AIL Symbolic Execution:** (Proposed) Bridges the detection-confirmation gap by formally validating static candidates with concrete triggering inputs, operating on decompiler-level IR for tractability
- Together: a path from "scan everything" to "prove exploitability" — complete and scalable

### Slide 42: Conclusion / Thesis Statement Revisited
- Return to the thesis statement from Slide 5
- Show the 2x2 diagram one final time with all three projects plotted
- "Automated vulnerability analysis does not have to choose between scale and rigor. By building systems that scale detection, coordinate multiple techniques, and formally validate findings, we achieve both."
- The progression: Mango (detect at scale) → Artiphishell (automate the full lifecycle) → AIL SymEx (prove it)

### Slide 43: Thank You / Questions
- "Thank you. Questions?"
- Committee names, contact info
- Acknowledgments (SEFCOM, DARPA, co-authors)

---

## Estimated Slide Count: ~43 slides for ~45 min
- Section 1 (Intro): 7 slides, ~5 min
- Section 2 (Mango): 13 slides, ~15 min
- Section 3 (Artiphishell): 10 slides, ~12 min
- Section 4 (Proposed): 8 slides, ~8 min
- Section 5 (Timeline/Conclusion): 5 slides, ~5 min

## Key Diagrams to Create
1. CVE growth vs. analyst workforce (Slide 2)
2. Three-column partial evidence comparison (Slide 3)
3. Evidence strength progression ladder (Slide 7)
4. Firmware architecture: httpd → NVRAM → dlnad (Slide 9)
5. Mango workflow pipeline (Slide 12)
6. Rich Expression vs. taint bit comparison (Slide 13)
7. Sink-to-Source backward trace (Slide 15)
8. Artiphishell architecture pipeline (Slide 24)
9. Analysis Graph data flow (Slide 25)
10. AIL SymEx system architecture (Slide 35)
11. Complete thesis pipeline (Slide 38)
12. PhD timeline Gantt chart (Slide 39)
