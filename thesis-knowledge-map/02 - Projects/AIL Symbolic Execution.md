# AIL Symbolic Execution (Proposed Work)

**Status:** Proposed (preliminary prototype exists)
**Working title:** "full-reach"
**Dimension:** Precision

## One-Sentence Summary
A symbolic execution engine on angr's AIL intermediate language that validates static findings from MangoDFA, bridging the gap between scalable-but-imprecise static analysis and precise-but-expensive dynamic analysis.

## Why AIL Instead of VEX?

angr already has symbolic execution on VEX IR. AIL is different because:

| Property | VEX IR | AIL |
|---|---|---|
| Architecture independence | Yes | Yes |
| Type information | None | Recovered from decompilation |
| Control flow | Flat (basic blocks) | Structured (loops, conditionals) |
| Memory model | Raw load/store | Variable-like references |
| Constraint complexity | Higher | 15-30% fewer SMT constraints |

The key insight: operating at a higher-level IR means tighter constraints, fewer infeasible paths, and smarter exploration strategies.

## Three Research Thrusts

### Thrust 1: AIL-SE Engine
Build the engine as an angr plugin. Handle:
- Symbolic evaluation of AIL statements
- Path constraint generation using recovered types
- Path merging exploiting structured control flow
- Memory modeling with reduced ambiguity

### Thrust 2: MangoDFA Integration
Two-phase pipeline:
1. MangoDFA sweeps all binaries (fast, scalable, some false positives)
2. AIL-SE validates each candidate (targeted, precise, expensive)

This is the "best of both worlds" pitch.

### Thrust 3: Guided Exploration
Cross-pollination from all 3 projects:
- From [[Operation Mango]]: vulnerability context paths as starting points
- From [[Artiphishell]]: coverage data and crash analysis to prioritize paths
- This thrust is the "connective tissue" of the dissertation

## Preliminary Results
- Prototype does basic-block-level symbolic evaluation of AIL statements
- 15-30% fewer SMT constraints vs VEX on small binary functions
- **Need:** More backing data, larger experiments, concrete examples

## Open Technical Questions
- How to handle loops? (Bounded unrolling? Widening?)
- Path merging strategy for AIL's structured control flow?
- Library function modeling at the AIL level?
- How to seed symbolic state from Mango's Rich Expressions?
- Integration API between MangoDFA output and AIL-SE input?

## Timeline
| Period | Milestone |
|---|---|
| Months 1-3 | AIL-SE engine prototype |
| Months 4-6 | MangoDFA integration and hybrid framework |
| Months 7-9 | Firmware benchmark evaluation |
| Months 10-12 | Guided exploration + dissertation writing |
| Month 13+ | Defense |

## Connections
- Builds on [[angr Framework]] (AIL pipeline)
- Validates [[MangoDFA]] results (Rich Expressions → path constraints)
- Uses [[Artiphishell]] coverage data (Thrust 3)
- Positioned against: VEX-based symex, [[Arbiter]], Driller
- Chapter: [[Chapter 5 - Proposed Work]]
- [[Unifying Theme]] — this closes the narrative arc
