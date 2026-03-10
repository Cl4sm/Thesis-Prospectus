# Chapter 1: Introduction

**Status:** Drafted (~8k chars)
**File:** `prospectus/chapters/01-introduction.tex`
**Target length:** 5-8 pages

## Current Structure
1. The Problem — IoT scale, Mirai, the gap between vulnerability count and tool capacity
2. Three Challenges — Scalability, Autonomy, Precision
3. Thesis Statement
4. Contributions — One paragraph per project
5. Background — Binary analysis, taint analysis, symbolic execution, LLMs for security

## What's Working
- The "3 walls" framing is clean and maps directly to the 3 projects
- Background subsections cover the right primitives
- Voice matches [[Voice DNA Rules]] well (physical verbs, no fluff, parenthetical asides)

## What Needs Work
- **Motivating example:** Consider adding a concrete vulnerability story that spans all 3 dimensions (something Mango found but couldn't validate, that would benefit from symbolic execution)
- **Numbers:** The 15 billion / 30 billion IoT device stats need citations
- **AIxCC context:** The paragraph introducing AIxCC could connect more explicitly to [[Artiphishell]]
- **Background depth:** Symbolic execution background could mention path explosion mitigations more specifically since [[AIL Symbolic Execution]] builds on them

## Key Connections
- Thesis statement → [[Unifying Theme]]
- Scalability wall → [[Operation Mango]]
- Autonomy wall → [[Artiphishell]]
- Precision wall → [[AIL Symbolic Execution]]
- Background/angr → [[angr Framework]]
- Background/taint → [[MangoDFA]]
