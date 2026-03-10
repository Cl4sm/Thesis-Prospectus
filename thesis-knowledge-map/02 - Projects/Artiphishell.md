# Artiphishell

**Presented:** DEF CON, August 10, 2025
**Paper:** `Artiphishell.pdf` (reference only; you didn't write it)
**Competition:** DARPA AIxCC (AI Cyber Challenge)
**Dimension:** Autonomy
**Your role:** Project lead, system architect, orchestration framework

## One-Sentence Summary
A fully autonomous Cyber Reasoning System that combines coverage-guided fuzzing, grammar-based fuzzing, LLM scanning, statistical root cause analysis, and AI-driven patching through a multi-agent pipeline.

## System Architecture

```
┌─────────────────────────────────────────────────────┐
│                   pydatatask orchestration           │
├──────────┬──────────┬──────────┬───────────────────-─┤
│ PREPROC  │ DISCOVER │   RCA    │     PATCHING        │
│ Builder  │ AFL++    │ Kumushi  │ PatcherY (constrain) │
│ Analyzer │ Nautilus │ DyVA     │ PatcherQ (free)     │
│ Indexer  │ LLuMinar │          │ Validation (7-step) │
│          │ AIJON    │          │                     │
│          │ QuickSeed│          │                     │
└──────────┴──────────┴──────────┴─────────────────────┘
              ▲              │
              └──── Analysis Graph ────┘
```

## The Four Stages

### Stage 1: Preprocessing
- **Builder** — Multi-configuration compilation (ASan, UBSan, coverage, AFL++, Jazzer)
- **Analyzer** — Call graphs, function boundaries, points of interest → [[Analysis Graph]]
- **Indexer** — Searchable function metadata for LLM agents

### Stage 2: Vulnerability Discovery
- **AFL++** — Coverage-guided fuzzing, multiple instances, synchronized corpus
- **Nautilus pipeline** — [[Grammar-Based Fuzzing]] (Grammar Composer, Grammar-guy, Grammar-agent, Grammaroomba, Revolver Mutator)
- **LLuMinar** — Fine-tuned Qwen2.5-7B vulnerability scanner
- **AIJON** — AFL++ with LLM-inserted IJON annotations
- **QuickSeed** — LLM-generated targeted seeds for Java
- **Discovery Guy** — Sink-based harness discovery + JimmyPwn (Claude-based)

### Stage 3: Root Cause Analysis
- **Kumushi** — 5 approaches (stack trace, git diff, full trace, CodeQL data dependency, fuzzing invariants), weighted ranking, LLM selection of top 20
- **DyVA** — Interactive LLM debugging agent using GDB/JDB

### Stage 4: Patching
- **PatcherY** — Constrained procedural LLM patching (up to 10 iterations)
- **PatcherQ** — Free-form multi-chain-of-thought + CriticPass (GPT-o3 review)
- **Validation Pipeline** — CompilerPass → BuildCheckPass → CrashPass → TestsPass → CriticPass → RegressionPass → FuzzPass

## Key Design Decisions (YOUR decisions)
- pydatatask for orchestration (why not Airflow, Celery, custom?)
- [[Analysis Graph]] as shared memory (why not message passing?)
- Dual patcher philosophy (constrained vs free-form)
- Delta mode for incremental analysis
- 7-step validation pipeline (evolved from experience with shallow patches)

## Lessons Learned
1. Multi-agent coordination is the hard part (debugging 12+ agents writing to shared state)
2. LLM agents are inconsistent (grammar-agent swings wildly)
3. Validation is everything (FuzzPass and CriticPass catch regressions)
4. Static + dynamic synergy matters → motivates [[AIL Symbolic Execution]]

## Writing This Chapter
See [[Artiphishell Writing Strategy]] — this is all-new text.

## Connections
- Multi-agent patterns → [[Multi-Agent Architecture]]
- Coverage data → feeds into proposed work Thrust 3
- Lessons learned → directly motivate [[AIL Symbolic Execution]]
- Positioned against: CGC, other AIxCC teams
- Chapter: [[Chapter 4 - Artiphishell Chapter]]
