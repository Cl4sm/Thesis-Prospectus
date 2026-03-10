# Chapter 4: Artiphishell

**Status:** Drafted (~13k chars) but needs significant expansion
**File:** `prospectus/chapters/04-artiphishell.tex`
**Source:** `Artiphishell.pdf` (DEF CON '25) — for REFERENCE ONLY
**Target length:** 25-30 pages

## The Critical Constraint

You led this project but did NOT write the paper. All prospectus content must be original. The published paper is reference material, not source text.

See [[Artiphishell Writing Strategy]] for the full approach.

## Current Structure
1. Motivation — AIxCC competition, the autonomy challenge
2. Architecture — 4-stage pipeline, pydatatask orchestration
3. Preprocessing — Builder, Analyzer, Indexer
4. Vulnerability Discovery — AFL++, grammar-based fuzzing, LLuMinar, other components
5. Root Cause Analysis — Kumushi (statistical), DyVA (LLM debugging)
6. Patching — PatcherY (constrained), PatcherQ (free-form), validation pipeline
7. Competition Results
8. Lessons Learned

## What's Already Good
- The voice matches your style well (parenthetical asides, physical verbs like "bolted on")
- Clear organizational structure mirroring the pipeline
- The lessons learned section is strong and connects forward to Ch. 5

## What Needs Expansion
- **Your role narrative:** More specific about what YOU designed, built, directed. Concrete decisions you made and why
- **Architecture rationale:** Why pydatatask? What alternatives were considered? Why this particular agent decomposition?
- **Analysis Graph depth:** This is the connective tissue; show how data flows between agents with concrete examples
- **Evaluation:** Need quantitative results beyond "advanced to semi-finals." Per-challenge breakdown, comparison to other teams if available
- **Figures:** System architecture diagram, Analysis Graph schema, pipeline flow

## Related
- [[Artiphishell Writing Strategy]]
- [[Artiphishell]] (project overview)
- [[Multi-Agent Architecture]]
- [[Analysis Graph]]
