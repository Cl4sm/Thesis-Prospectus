# Chapter 5: Proposed Work — AIL Symbolic Execution

**Status:** Drafted (~6k chars)
**File:** `prospectus/chapters/05-proposed-work.tex`
**Target length:** 5-10 pages

This chapter IS (or can be) the official 20-page proposal. It's the most important chapter for the committee.

## Current Structure
1. Motivation — Why Mango and Artiphishell both need something more
2. AIL Background — angr's IR pipeline (native → VEX → AIL)
3. Proposed Approach — 3 thrusts
4. Preliminary Results — 15-30% fewer SMT constraints
5. Expected Contributions — 4 items
6. Timeline — 13-month plan
7. Plan for Defense

## The Three Thrusts

### Thrust 1: AIL Symbolic Execution Engine
Build symex on AIL instead of VEX IR. Benefits: type info, structured control flow, simpler memory model. Implemented as angr plugin.

### Thrust 2: MangoDFA Integration
Wire AIL-SE into Mango as phase 2. Phase 1: MangoDFA (fast, scalable, imprecise). Phase 2: AIL-SE validates candidates (slow, precise). Best of both worlds.

### Thrust 3: Guided Symbolic Exploration
Use Mango's vulnerability context paths as starting points. Use Artiphishell's coverage data to prioritize. This is the "connective tissue" that ties all 3 projects together.

## What the Committee Will Probe
- **Feasibility:** Can you actually build this in 13 months? What's the biggest technical risk?
- **Novelty:** How is this different from just running angr's existing symex engine on the AIL stage?
- **Evaluation plan:** What benchmarks? What baselines? How do you measure improvement over VEX-based symex?
- **Connection strength:** Is Thrust 3 (Artiphishell integration) real or hand-waving?

## What Needs Strengthening
- **Preliminary results:** The 15-30% constraint reduction claim needs more backing. What functions? What binaries? Show a concrete example
- **Technical detail on AIL-SE:** How do you handle loops? What's the path merging strategy? How do you model library functions?
- **Evaluation plan:** Spell out the experiments. Firmware benchmark datasets. Head-to-head comparisons
- **Timeline:** Insert actual dates, not just "months 1-3"

## Related
- [[AIL Symbolic Execution]] (project overview)
- [[Unifying Theme]] — this chapter must close the narrative arc
- [[angr Framework]] — the infrastructure this builds on
- [[Operation Mango]] — the direct predecessor
