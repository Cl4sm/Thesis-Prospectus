# Presentation Revision Plan v3

## Changelog from v1
- **ISSUE 1 FIX**: Compress slide 4 (evidence stages) instead of cutting; fold into 30-second preamble in slide 10 notes
- **ISSUE 2 FIX**: Clarify slide 42 placement: after slide 30, before slide 31
- **ISSUE 3 FIX**: Keep slide 45 (remaining gap) but repurpose as minimal Mango/Artiphishell limitation pair; remove PEACH bridge box
- **ISSUE 4 FIX**: Add static analysis section header slide alongside preprocessing slide
- **ISSUE 5 FIX**: Reconcile DARPA numbers (semifinal vs finals); note discrepancies explicitly
- **ISSUE 6 FIX**: Pre-scan all proposed speaker notes for Voice DNA violations before implementation
- **ISSUE 7 FIX**: Defer slide 38 pipeline correction; write generically ("CodeQL and Semgrep outputs → LLM validation → Analysis Graph") until codebase inspection confirms
- **ISSUE 8 FIX**: Flag animations as must-have vs nice-to-have
- **ISSUE 9 FIX**: Update slide 57 SVG bottom text (not just speaker notes)
- **ISSUE 10 FIX**: Include explicit before/after renumbering table
- **TEAM NAME FIX**: Fix "Team Atlanta" → "Team Shellphish" on slide 55

## Guiding Principles
- Remove all "practitioner knowledge" / "encoding expert reasoning" framing
- Replace "both X and Y" with "complete, accurate, and scalable" throughout
- Introduction = background + problem only; no claims about our work until roadmap
- PEACH works on generic static analysis output, not specifically Mango
- Artiphishell scalability limitation = computational expense (primary), source code requirement (secondary)
- Voice DNA compliance: no em-dashes, no banned phrases, physical verbs, academic tone
- Team name: Shellphish (NOT Atlanta)

---

## WORKSTREAM A: Introduction (Slides 3-11)

### A1. Slide 3 — Split "Metrics Trap" into two slides
**Current**: Single slide with side-by-side panels.
**Change**: Split into two separate slides.

**New Slide 3a — "Maximizing Completeness"**
- Keep left panel (flood of red/green dots), expand to fill slide
- Result box: "Recall: 100% / Precision: near zero"
- Tagline: "Every real bug found, buried in thousands of false alarms"
- Speaker notes: "Accuracy and completeness measure different failure modes. The first degenerate system maximizes completeness: flag every data flow as a potential vulnerability. Recall is perfect. Every real bug is in there, buried under thousands of alerts per codebase. No analyst will triage that. The tool found everything and communicated nothing."

**New Slide 3b — "Maximizing Accuracy"**
- Same dot field from 3a, but gray out everything except ONE green dot with checkmark
- Result box: "Precision: undefined / Recall: 0%"
- Tagline: "Zero false alarms, zero vulnerabilities found"
- Speaker notes: "The second maximizes accuracy: report only what you can prove beyond doubt. The cheapest way to guarantee zero false positives is to report zero findings. Perfect precision (technically undefined). The tool has never been wrong, and it has never been useful. Static analyzers tuned for recall drown teams in noise. Symbolic execution, applied without scoping, burns compute before producing a single result. Both failure modes are real, and a useful system must control both simultaneously."

### A2. Slide 4 (Evidence Stages) — COMPRESS (changed from CUT)
**Rationale** (from critic): The detection→validation→confirmation framework is never explicitly introduced if cut; slides 10-11 depend on it.
**Change**: Keep the slide but strip the speaker notes to 30 seconds max. Tighten the visual if possible (reduce vertical height of cards). New compressed notes:
"Split the problem across stages. Detection owns completeness: sweep the codebase and flag every suspicious flow. Validation owns accuracy: grind candidates against independent evidence and prune false positives. Confirmation owns proof: produce a concrete triggering input that forces the vulnerability to manifest. Each of our three projects maps to one of these stages."

### A3. Slide 5 (Tradeoff Radar) — Revise speaker notes
**Changes**:
- Static analysis: remove firmware-specific language; "Static analyzers sweep entire codebases cheaply and flag every suspicious data flow. But the accuracy axis barely registers. Most of what they report is noise."
- Fuzzing: "Fuzzing produces a balanced but modest triangle. It finds real crashes with decent accuracy, explores some paths, and runs at reasonable cost. Fuzzers scale by adding cores, but increased compute does not produce proportionally more findings. Coverage is opportunistic, driven by mutation luck rather than systematic exploration."
- Symbolic execution: keep as-is (no firmware-specific language present)
- Remove "The claim of this work is that..." sentence entirely

### A4. Slides 6-8 (Gap Analysis) — Reframe as pure background
**Slide 6**: Remove "the crux of the problem we solve in this work". Replace ending with: "This gap between what a detector finds and what a vendor accepts is a persistent challenge in vulnerability analysis."
**Slide 7**: Ensure no claims about "our work"
**Slide 8**: Fix environment modeling sentence: "In complex systems, modeling environment interactions symbolically is prohibitively difficult." Remove forward references to our projects.

### A5. Slide 9 (Thesis Statement) — CUT
- Delete file `09-thesis.md`
- The thesis is now conveyed through the compressed evidence stages (slide 4) + roadmap (slide 10)

### A6. Slide 10 (Roadmap) — Revise speaker notes
- Add 15-second preamble: "These three projects map to the three evidence stages we just discussed. Mango handles detection. Artiphishell handles validation. PEACH handles confirmation."
- Mango: "ranks candidates by confidence, improving accuracy without sacrificing scalability, but does not produce formal proof of exploitability"
- Artiphishell: "the computational cost is enormous: $50,000 in LLM credits and $80,000 in Azure credits for a single 143-hour run. It also requires source code, which limits applicability to firmware"
- PEACH: "uses symbolic execution on angr's intermediate language to verify static analysis candidates with concrete proof-of-concept inputs" (generic)
- Fix ending: "Together they move us toward vulnerability analysis that is complete, accurate, and scalable"

### A7. Slide 11 (Progression) — Revise speaker notes
- PEACH: "validates specific paths flagged by static analyzers" (not "Mango has flagged")
- Remove "form a pipeline" → "The three projects trace a progression"
- Fix "both completeness and scalability" → "completeness, accuracy, and scalability"
- Remove practitioner knowledge language

---

## WORKSTREAM B: Mango Section (Slides 12-26)

### B1. Slide 12 (Mango Section Title) — Strip numbers
**New notes**: "Mango was published at USENIX Security 2024. It addresses the first stage: scaling vulnerability detection. Where prior work analyzes a small fraction of firmware binaries, Mango analyzes every one. We will walk through three key innovations: rich expressions for precise data-flow tracking, sink-to-source analysis for scope reduction, and assumed non-impact for aggressive pruning of irrelevant function calls."

### B2. Slide 13 (Firmware Architecture) — Simplify
**New notes**: "Most firmware uses Type I architecture: embedded Linux with user-space ELF binaries. Over 86% of images follow this pattern. The binaries expose network services: web interfaces, UPnP protocols, custom daemons. Each binary runs as a separate process. The challenge for vulnerability analysis is that these binaries interact through shared state, and a single-binary tool has limited visibility into those cross-process connections."
- Remove: IPC specifics, NVRAM detail (save for slide 15)
- Remove: "analyze one binary at a time" claim
- Remove: bottom bar annotation about processes

### B3. Slide 15 (Motivating Example) — Rework for NVRAM introduction
- Rework to introduce NVRAM as a concept (like original USENIX presentation)
- Add: HTTPD launches DLNAD; "through an HTTP request"
- Focus on HOW NVRAM works as shared state, not how Mango discovers it
- Remove Mango-specific process language

### B4. Slide 16 (Prior Work) — Rename from Karonte
- Title: "Prior Work" or "Scope-Reduction Approaches"
- Change "Karonte" → "prior work" in speaker notes
- Explain: symbolic path exploration on every binary is not scalable; prior work invented the BDG as a scope-reduction heuristic
- Remove BDG pipeline pop-up animation (last animation step)

### B5. Slide 17 (SaTC) — Verify numbers
- Verify 131 binaries, 3.6%, 33 bugs, 32.77% TPR against the SaTC paper
- No visual changes unless numbers are wrong

### B6. Slide 18 — Tentative Venn diagram
- DEFERRED: implement only if time permits and visual is clean

### B7. Slide 20 (Rich Expressions) — CUT, merge into slide 21
- Delete file `20-rich-expressions.md`
- Integrate into slide 21
- Remove "practitioner reasoning encoded" language

### B8. Slide 21 (MangoDFA) — Expand with rich values
- Primary explanation of both MangoDFA and rich expressions
- Add provenance chain visual (fgets→snprintf→system) with rich expression annotations
- Notes: rich values track full transformation history, not just tainted/not-tainted bits

### B9. Slide 22 (Sink-to-Source) — Minor revision
- "only a handful of critical ones" → "only the relevant function calls"
- Brief mention of trace identification before backwards execution

### B10. Slide 23 (Assumed Non-Impact) — Trim
- Remove "at scale the ratio is much higher"
- Remove ARM register specifics; say "calling convention recovery using angr"
- Remove "8 minutes per binary is tractable"

### B11. Slide 25 (Large-Scale Eval) — REPLACE with ablation chart
- Replace with Mango time ablation bar chart:
  - No Modifications: 1,575s
  - Sink-to-Source: 632s
  - Assumed Nonimpact: 345s
  - Both: 275s
- Notes: "The ablation study shows each optimization's contribution. Without modifications, average analysis time is 1,575 seconds per binary. Sink-to-source cuts that by 60%. Assumed non-impact reduces it further. Combined, average per-binary time drops to 275 seconds, about 4.5 minutes. Both optimizations are necessary; neither alone is sufficient."

### B12. Slide 26 (Mango Summary) — Revise
- Remove "precise" from summary headline
- This is where 27x, 166, 8 min land for the first time
- Tighter notes; no full recap

---

## WORKSTREAM C: Artiphishell Section (Slides 27-45)

### C1. Slide 27 (Artiphishell Section Title) — Reframe transition
**New notes**: "Mango showed we can scale detection. But detection without validation produces noise. The next question: can we combine multiple analysis techniques to produce stronger evidence? Artiphishell coordinates fuzzing, static analysis, and machine learning through a shared reasoning framework, operating on source code which carries full type information and call graphs. The combinatorial approach produces validation that no single technique achieves alone."

### C2. Slide 28 (AIxCC) — Redesign
- Remove SystemD from target list
- Targets: Linux Kernel, NGINX, Tika, Jenkins, SQLite (from DARPA image)
- **DARPA numbers reconciliation**: The DARPA overview image shows SEMIFINAL numbers (42 teams, 5 challenge projects, 59 synthetic vulnerabilities). The current slide uses FINALS numbers (28 repositories, 53 challenge projects, 63 injected vulnerabilities). Artiphishell competed in BOTH. Use finals numbers for the main presentation (those are the competition results we report) but note the semifinal context in speaker notes if relevant.
- Add visual distinction between full scan and delta scan
- Redesign away from stat-grid dashboard
- Add resource constraints (referenced from the DARPA image: 3 nodes, 64 cores, 256GB RAM each, $100 AI budget per round)

### C3. Slide 29 (Autonomous Requirements) — Revise
- Remove/soften SARIF report format ("submissions are packaged into a bundle")
- Remove scoring model / fourth-power accuracy penalty and red box
- ADD resource constraints box: "8-hour delta rounds / 12-hour full rounds / $50K LLM credits / $80K Azure credits / 143 hours autonomous"
- Bottom note: time-bounded design forced every architectural decision

### C4. Slide 30 (Multi-Technique) — Revise convergence description
- LLM bug finders (QSeed & DGuy) create reaching/crashing inputs
- Fuzzers consume those seeds but are not directly informed by LLM findings
- Cross-referencing happens through patches to distinguish symptom vs root cause

### C-MOVE. Slide 42 (Fuzzing Not Enough) — Move to after slide 30
**Clarified position** (from critic): immediately after slide 30, before slide 31.
- Flow becomes: convergence (conceptual, slide 30) → 54% stat (empirical, slide 42) → architecture (implementation, slide 31)
- This motivates the architecture with hard data

### C5. Slide 31 (Architecture) — Add progressive animation [MUST-HAVE]
- Step 1: Target Preparation (left box)
- Step 2: Static analysis column (Pre Analysis)
- Step 3: Dynamic analysis columns + Seeds Pool
- Step 4: Root-cause & Patching (right section)
- Step 5: Analysis Graph (bottom) + connecting arrows
- Add libfuzzer to Traditional Fuzzing column

### C6a. NEW: "Target Preparation" slide (insert after architecture)
- 4-box pipeline: Builder → Analyzer → Indexer → DiffGuy
- Builder: compiles with instrumentation (sanitizers, coverage)
- Analyzer: extracts CFGs and call graphs
- Indexer: builds searchable code indices for LLM agents
- DiffGuy: tracks delta changes between versions
- Animation: reveal each box on click [NICE-TO-HAVE; static diagram acceptable]

### C6b. NEW: "Static Analysis" section slide (insert after preprocessing)
**Added per critic Issue 4**: Dedicated slide for static analysis pipeline.
- Visual: CodeQL + Semgrep → LLM validation/ranking → Analysis Graph POIs → Directed Fuzzing
- Notes: "Static analysis runs CodeQL and Semgrep across the full codebase. The results feed into an LLM-based ranking layer that sorts findings by severity and filters likely false positives. Surviving warnings enter the Analysis Graph as Points of Interest. Those POIs seed directed fuzzing: AIJON generates annotations that steer the fuzzer toward flagged locations."
- This replaces the current slide 38 content; slide 38 can be deleted or repurposed
- Animation: reveal each pipeline stage on click [NICE-TO-HAVE]

### C7. Slide 32 (Analysis Graph) — Remove practitioner knowledge references

### C8. Slides 33-36 (Dynamic Analysis) — Reorder
- **New order**: LLM Seed (was 35) → Coverage (was 33) → Grammar (was 34) → Directed/iJon (36)
- LLM seed generation first: QSeed and DGuy produce reaching inputs that bootstrap other fuzzers
- Coverage slide: add libfuzzer alongside AFL++ and Jazzer
- iJon slide: remove "most novel component"; check iJon paper for annotation example

### C9. Slide 37 (Dynamic Summary) — Clarify DGuy role
- Discovery Guy is part of the LLM-PoV pipeline, not the entire fuzzing pipeline

### C10. Slide 38 (Static Analysis) — REPLACED by C6b
- Delete this file; its content is superseded by the new static analysis section slide (C6b)
- If C6b proves insufficient, fold remaining detail into speaker notes

### C11. Slide 39 (RCA) — Progressive reveal [NICE-TO-HAVE]
- Add click-through if time permits
- If deferred: keep current visual but revise speaker notes

### C12. Slide 40 (Patching) — Revise
- Clarify Patcher Y does internal root cause refinement from Komushi
- Replace sanitizer pass with bypass check (LLM re-bypass attempt)
- Fix "both" language

### C13. Slide 41 (Results) — CUT
- Delete file `41-results.md`

### C14. Slide 43 (Zero-Days) — Revise
- Fix "both" language
- Emphasize: 23 bugs / 7 zero-days despite $50K LLM + $80K Azure
- Frame resource cost prominently

### C15. Slide 44 (Artiphishell Summary) — Revise to end on gap
- Remove "This is what proposed work addresses" and bottom transition arrow
- Remove "critical lesson for this thesis"
- New ending: "Even with $50,000 in LLM credits and $80,000 in Azure compute, we found 23 bugs and 7 zero-days. The full lifecycle works on source code. How do we scale this to binary-only firmware without that resource overhead?"
- Remove practitioner knowledge references

### C16. Slide 45 (Remaining Gap) — REPURPOSE (changed from CUT)
**Rationale** (from critic): Without this slide, the Artiphishell→PEACH transition has no bridge.
**Change**: Keep the two-card layout (Mango limitation + Artiphishell limitation) but:
- Remove the PEACH bridge box at the bottom
- Remove "PEACH bridges that gap" text
- Just show two cards with their limitations side by side and "THE GAP" label
- Speaker notes: "On the left, Mango gives us scalable detection but no proof of reachability. On the right, Artiphishell proves the full lifecycle works but only with source code, and at enormous computational cost. The gap sits between them: thousands of binary-only alerts with no concrete evidence of exploitability."
- Let PEACH section title (slide 46) serve as the resolution

---

## WORKSTREAM D: PEACH Section (Slides 46-53)

### D1. Slide 46 (Section Title) — Bigger text, chapter format
- Use "Chapter 3" style with larger title
- Notes: "static analysis candidates" (not "Mango's static candidates")

### D2. Slide 47 (Validation Gap) — Simplify
- Reduce text density; fewer blocker items, more whitespace
- Reframe: insufficiency of single-technique analysis, not experienced analyst mental model
- Notes: "A single analysis technique leaves gaps. Static analysis flags paths but cannot prove they execute. Fuzzing proves execution but only for paths it reaches. Symbolic execution proves reachability but collapses at scale. The question: can we combine directed symbolic execution with static analysis results to validate candidates efficiently?"

### D3. Slide 48 (Why SymEx Fails) — Fix rendering bug
- Debug missing symbolic execution visualization

### D4. Slide 49 (Design Choices) — Clarify cross-binary
- "We do not propagate constraints across the binary boundary. Instead, we ensure that at the NVRAM set point in the setter binary, the value satisfies a valid constraint set. When PEACH analyzes the getter binary, it starts from that validated state."

### D5. Slide 53 (Complete Pipeline) — CUT
- Delete file `53-complete-pipeline.md`

---

## WORKSTREAM E: Conclusion + Fixes

### E1. Slide 55 (Timeline) — Fix team name
- Change "Team Atlanta" → "Team Shellphish" in speaker notes

### E2. Slide 57 (Contributions) — Remove practitioner framing
- Update speaker notes: remove "encode practitioner reasoning at every stage"
- **Update SVG visual**: change bottom text "Practitioner knowledge encoded at each stage" → "Detection, coordination, and proof: a complete analysis pipeline"
- New closing notes: "Together, these three projects cover the full detection-to-confirmation cycle. Scan everything. Coordinate techniques. Prove exploitability."

### E3. Slide 58 (Closing) — Remove practitioner framing

### E4. CLAUDE.md — Remove practitioner knowledge thesis framing
- Remove: "The central argument: skilled analysts find vulnerabilities through specific forms of reasoning..."
- Replace with: "The central argument: complete, accurate, and scalable vulnerability analysis is achievable by composing specialized tools in a staged pipeline where each stage compensates the weaknesses of others."
- Update project descriptions to match

---

## Renumbering Map (After All Changes)

Cuts: 9, 20, 38, 41, 53 (5 files deleted)
Additions: 3 splits into 3a+3b (+1), new preprocessing slide (+1), new static analysis slide (+1) = +3
Slide 42 moves to after slide 30 (renumber required)
Net: 58 - 5 + 3 = 56 files

### Slide 38 Handling (Critic Issue #1)
Delete `38-static-analysis.md` entirely. The new static analysis slide (C6b) is a NEW file inserted after the preprocessing slide, NOT an in-place edit of 38.

### Slide 42 Movement Mechanics (Critic Issue #4)
During execution, rename `42-fuzzing-not-enough.md` → `30b-fuzzing-not-enough.md` (sorts after 30, before 31). All other files keep original names until the global renumber pass.

### Execution Model (Critic Issue #3)
Phase 1 (parallel): All content edits, new file creation, and file deletions within each workstream. New files use temporary sort-friendly names (e.g., `31a-preprocessing.md`, `31b-static-analysis.md`).
Phase 2 (sequential): Global renumber of all files to clean 01-56 sequence.

### Full OLD → NEW Mapping

| Old File | Action | New # | New Name |
|----------|--------|-------|----------|
| 01-title | keep | 01 | 01-title |
| 02-vulns-at-scale | keep | 02 | 02-vulns-at-scale |
| 03-metrics-trap | SPLIT | 03 | 03-maximizing-completeness |
| (new from split) | NEW | 04 | 04-maximizing-accuracy |
| 04-evidence-stages | compress | 05 | 05-evidence-stages |
| 05-tradeoff | edit | 06 | 06-tradeoff |
| 06-detection-gap | edit | 07 | 07-detection-gap |
| 07-fuzzing-gap | edit | 08 | 08-fuzzing-gap |
| 08-symex-gap | edit | 09 | 09-symex-gap |
| 09-thesis | DELETE | — | — |
| 10-roadmap | edit | 10 | 10-roadmap |
| 11-progression | edit | 11 | 11-progression |
| 12-mango-section | edit | 12 | 12-mango-section |
| 13-firmware-arch | edit | 13 | 13-firmware-arch |
| 14-firmware-linux | keep | 14 | 14-firmware-linux |
| 15-motivating-example | edit | 15 | 15-motivating-example |
| 16-symex-doesnt-scale | edit | 16 | 16-prior-work |
| 17-satc-approach | verify | 17 | 17-satc-approach |
| 18-two-challenges | keep | 18 | 18-two-challenges |
| 19-mango-approach | keep | 19 | 19-mango-approach |
| 20-rich-expressions | DELETE | — | — |
| 21-mangodfa | edit | 20 | 20-mangodfa |
| 22-sink-to-source | edit | 21 | 21-sink-to-source |
| 23-assumed-nonimpact | edit | 22 | 22-assumed-nonimpact |
| 24-eval-karonte | keep | 23 | 23-eval-karonte |
| 25-eval-large-scale | REPLACE | 24 | 24-ablation |
| 26-mango-summary | edit | 25 | 25-mango-summary |
| 27-artiphishell-section | edit | 26 | 26-artiphishell-section |
| 28-aixcc | edit | 27 | 27-aixcc |
| 29-autonomous-requirements | edit | 28 | 28-autonomous-requirements |
| 30-multi-technique | edit | 29 | 29-multi-technique |
| 42-fuzzing-not-enough | MOVE | 30 | 30-fuzzing-not-enough |
| 31-architecture | edit | 31 | 31-architecture |
| (new) preprocessing | NEW | 32 | 32-preprocessing |
| (new) static analysis | NEW | 33 | 33-static-analysis |
| 32-analysis-graph | edit | 34 | 34-analysis-graph |
| 35-dyn-seed | REORDER | 35 | 35-dyn-seed |
| 33-dyn-coverage | REORDER | 36 | 36-dyn-coverage |
| 34-dyn-grammar | REORDER | 37 | 37-dyn-grammar |
| 36-dyn-directed | keep | 38 | 38-dyn-directed |
| 37-dyn-summary | edit | 39 | 39-dyn-summary |
| 38-static-analysis | DELETE | — | — |
| 39-rca | edit | 40 | 40-rca |
| 40-patching | edit | 41 | 41-patching |
| 41-results | DELETE | — | — |
| 43-zero-days | edit | 42 | 42-zero-days |
| 44-artiphishell-summary | edit | 43 | 43-artiphishell-summary |
| 45-remaining-gap | edit | 44 | 44-remaining-gap |
| 46-proposed-section | edit | 45 | 45-proposed-section |
| 47-validation-gap | edit | 46 | 46-validation-gap |
| 48-why-symex-fails | edit | 47 | 47-why-symex-fails |
| 49-design-choices | edit | 48 | 48-design-choices |
| 50-system-arch | keep | 49 | 49-system-arch |
| 51-prelim-results | keep | 50 | 50-prelim-results |
| 52-planned-eval | keep | 51 | 51-planned-eval |
| 53-complete-pipeline | DELETE | — | — |
| 54-timeline-section | keep | 52 | 52-timeline-section |
| 55-phd-timeline | edit | 53 | 53-phd-timeline |
| 56-remaining-work-hidden | keep | 54 | 54-remaining-work-hidden |
| 57-contributions | edit | 55 | 55-contributions |
| 58-closing | edit | 56 | 56-closing |

---

## Animation Priority

| Item | Animation | Priority | Fallback |
|------|-----------|----------|----------|
| C5 (Architecture) | 5-step reveal | MUST-HAVE | N/A |
| C6a (Preprocessing) | 4-box reveal | NICE-TO-HAVE | Static diagram |
| C6b (Static Analysis) | Pipeline reveal | NICE-TO-HAVE | Static diagram |
| C11 (RCA) | Tool-by-tool | NICE-TO-HAVE | Revise notes only |
| B4 (Slide 16) | Remove BDG popup | MUST-HAVE | N/A |
| C8 (Dyn reorder) | No new anims | N/A | N/A |

---

## Execution Order

Parallel workstreams (no cross-dependencies):
- **WS-A** (Introduction slides 3-11)
- **WS-B** (Mango slides 12-26)
- **WS-C** (Artiphishell slides 27-45)
- **WS-D** (PEACH slides 46-53)
- **WS-E** (Conclusion + fixes)

Sequential post-steps:
1. Renumber all slide files per the OLD → NEW mapping table above
2. Post-renumber audit: grep speaker notes for stale slide references
3. Rebuild presentation (`cd presentation && python3 build.py`)
4. Verify build succeeds + slide count = 56
