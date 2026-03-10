# angr Framework

The binary analysis framework that underpins both [[Operation Mango]] and [[AIL Symbolic Execution]].

## IR Pipeline
```
Native instructions (ARM, MIPS, x86)
    ↓ lifting
VEX IR (from Valgrind) — architecture-independent, low-level
    ↓ decompilation
AIL (angr Intermediate Language) — recovered types, structured control flow
```

## What angr Provides
- CFG recovery
- Function identification
- Calling convention analysis
- Prototype recovery
- VEX-based symbolic execution (existing)
- AIL decompilation pipeline

## Role in Mango
[[MangoDFA]] is built on top of angr. Uses angr for:
- Binary lifting
- CFG recovery
- Calling convention and prototype recovery
- Function identification

## Role in AIL-SE
[[AIL Symbolic Execution]] will operate on AIL (the decompilation-level IR) instead of VEX. Benefits:
- Recovered types reduce constraint ambiguity
- Structured control flow enables smarter path exploration
- Simpler memory model (variable references vs raw load/store)
- Direct compatibility with MangoDFA results

## Key People
- Yan Shoshitaishvili ([[Committee]] member) — created angr
- This is a strategic advantage: your committee member built the framework your work extends

## Related
- [[Operation Mango]]
- [[AIL Symbolic Execution]]
- [[MangoDFA]]
