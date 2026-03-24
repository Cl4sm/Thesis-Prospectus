# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

# Overview

5th-year ASU SEFCOM PhD student's (Wil Gibbs) thesis prospectus in cybersecurity. The prospectus has two deliverables: a written document and a 45-minute defense presentation.

## Committee
Adam Doupe - Co-Chair
Fish Wang - Co-Chair
Yan Shoshitaishvili - Member
Adil Ahmad - Member

## Thesis Structure

The dissertation ties together three projects under the theme of leveraging practitioner knowledge for scalable and autonomous vulnerability discovery. The central argument: complete, accurate, and scalable vulnerability analysis is achievable by composing specialized tools in a staged pipeline where each stage compensates the weaknesses of others.

1. **Operation Mango** (completed, published USENIX Security '24) — handles the detection stage. Rich Expressions track transformation history (not just taint bits), capturing the same judgment a human analyst applies when tracing data flows from source to sink. The published paper is `mango_usenix24.pdf`; source materials are in `mango-paper/`.
2. **Artiphishell** (completed, DEF CON 2025) — handles the validation stage. Autonomous CRS for DARPA AIxCC where fuzzing, LLM scanning, root-cause analysis, and patching coordinate through a shared Analysis Graph, mirroring how experienced security teams cross-reference independent techniques. The published paper is `Artiphishell.pdf`. **Wil led the project but did not write the paper; all prospectus content must be original.**
3. **Proposed work: Symbolic Execution on AIL** (working title "full-reach") — handles the confirmation stage. Symbolic execution on angr's AIL intermediate language to validate MangoDFA's static candidates with concrete triggering inputs, automating the mental simulation practitioners perform when assessing whether a flagged path is reachable.

## Build Commands

The LaTeX project lives in `prospectus/`. All build commands must be run from that directory.

```bash
# Full build (two pdflatex passes for cross-refs/TOC)
cd prospectus && make

# Quick single-pass build
cd prospectus && make once

# Clean build artifacts
cd prospectus && make clean
```

On Windows (no Make): `cd prospectus && build.bat` (or `build.bat once`, `build.bat clean`).

Output: `prospectus/main.pdf`

## Project Layout

- `prospectus/` — LaTeX project (the primary workspace)
  - `main.tex` — root document, pulls in all chapters and frontmatter
  - `chapters/01-introduction.tex` through `chapters/05-proposed-work.tex`
  - `frontmatter/titlepage.tex`, `frontmatter/references.tex` (hand-written `thebibliography`, not BibTeX)
  - `figures/` — PDF/image figures (e.g., `mango-flat.pdf`)
  - `Makefile` / `build.bat` — build scripts
- `wiki/` — separate git repo with reference material (prior SEFCOM proposals, dissertations, comp exams from labmates)
- `mango-paper/` — separate git repo with Operation Mango paper source and literature review
- `thesis-knowledge-map/` — Obsidian vault with 42 interconnected markdown files for thesis writing guidance
  - `00 - Home/` — entry point (`Home.md`)
  - `01 - Thesis Structure/` — chapter-by-chapter writing guides (Chapters 1-5, Mango Chapter Adaptation)
  - `02 - Projects/` — project summaries (Operation Mango, Artiphishell, AIL Symbolic Execution, Unifying Theme)
  - `03 - Writing Guide/` — Voice DNA rules, banned phrases, Artiphishell writing strategy, writing samples, LaTeX conventions
  - `04 - Reference Examples/` — notes on reference proposals, dissertations, and comp exams from wiki/
  - `05 - Key Concepts/` — technical concept pages (MangoDFA, Rich Expressions, Sink-to-Source, Assumed Nonimpact, TruPoCs, Analysis Graph, etc.)
  - `06 - Action Items/` — master checklist, defense presentation plan, timeline
- `prospectus_plan.md` — master checklist and detailed outline for the prospectus
- `voice-dna.md` — writing style guide (must be followed for all written output)
- `ai-cyber-phish.txt`, `cyber-challenge-phish.txt` — research notes

## Writing Rules

All written output must follow `voice-dna.md`. Key constraints:
- Write technically and academically. No informality.
- No em dashes. Use commas, periods, colons, semicolons, or parentheses.
- Never use banned phrases listed in `voice-dna.md` (e.g., "delve", "leverage", "in today's", "it's worth noting", the "Not X. Y." pattern).
- Use physical verbs for abstract processes ("stripped back" not "simplified").
- All citations must reference real, verifiable academic works.

## LaTeX Conventions

- Document class: `report` with 12pt, 1-inch margins, double spacing
- References use `natbib` with `[numbers]` style; bibliography entries are manually written in `frontmatter/references.tex` (not a `.bib` file)
- Chapter formatting matches ASU/Marzieh's style: centered, uppercase titles; "CHAPTER" label in TOC
- Page numbers: bottom-center throughout (both front matter and body)
- Front matter uses roman numerals (abstract = page i); body uses arabic
- Title page is unnumbered; blank page follows before abstract
- Figures go in `prospectus/figures/` and are referenced via `\graphicspath{{figures/}}`
- When adding new citations, append `\bibitem` entries to `frontmatter/references.tex`

## Abstract

The abstract lives inline in `main.tex` (not a separate file). It follows the detection→validation progression: opens by framing the detection-validation gap, then one paragraph per project showing progressively stronger validation evidence (partial → convergent → formal). Marzieh's reference abstract is ~300 words across 4 paragraphs. Current abstract is ~230 words. Kyle's proposal has no abstract.

## Introduction Length Target

Reference intro word counts: Kyle (~485), Marzieh (~1,637), Erik (~1,450). Current intro is ~1,436 words. Target range is 1,400-1,650 words. Background material belongs in individual chapters, not the introduction.
