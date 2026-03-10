# Chapter 2: Related Work

**Status:** Drafted (~5k chars)
**File:** `prospectus/chapters/02-related-work.tex`
**Target length:** 8-12 pages

## Current Sections
1. Static Analysis for Firmware — Karonte, SaTC, DTaint, Saluki, Arbiter, TChecker, Semgrep
2. Dynamic Analysis and Firmware Rehosting — Firmadyne, FirmAE, Avatar, Greenhouse (co-authored!), HALucinator, DICE, FIRM-AFL, Snipuzz, FirmFuzz
3. Symbolic Execution — King 1976, KLEE, angr, FIE, Firmalice, StraightTaint, TaintPipe
4. AI for Security Analysis — CGC, AIxCC, multi-agent CRS architectures

## What Needs Work
- **AI/LLM section is thin.** Expand with: LLM vulnerability detection papers (e.g., VulDeePecker, LineVul, or more recent LLM-based), LLM for fuzzing (FuzzGPT, ChatAFL), LLM patching, agent architectures for security
- **CRS section:** Describe other AIxCC teams' approaches if public. Compare to Artiphishell's architecture
- **Symbolic execution:** Discuss Veritesting, SAGE, Driller (concolic), Mayhem for comparison
- **Cross-referencing:** Each subsection should end with a sentence connecting to your contribution. E.g., "Karonte's BDG filtering misses vulnerabilities that [[Operation Mango]] finds by analyzing all binaries"

## Citation Inventory
All citations use `\bibitem` in `frontmatter/references.tex`. When adding new ones, append there (not a .bib file). See [[LaTeX Conventions]].

## Related
- [[Operation Mango]] — positions against Karonte, SaTC
- [[Artiphishell]] — positions against CGC, other CRS
- [[AIL Symbolic Execution]] — positions against VEX-based symex
- [[Greenhouse]] — you co-authored this, mention it
