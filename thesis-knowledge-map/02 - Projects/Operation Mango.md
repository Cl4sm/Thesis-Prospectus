# Operation Mango

**Published:** USENIX Security 2024
**Paper:** `mango_usenix24.pdf`
**Source materials:** `mango-paper/`
**Dimension:** Scalability

## One-Sentence Summary
A static data-flow analysis engine that scales taint-style vulnerability discovery to entire firmware corpora by analyzing all binaries, not just border binaries.

## Core Innovations

### [[MangoDFA]]
The analysis engine. Three key ideas:
- **[[Rich Expressions]]** — Track full value transformation history, not just taint bits. Can distinguish `sprintf(buf, "ls %s", itoa(input))` (safe) from `snprintf(buf, 50, "echo hello %s", input)` (vulnerable)
- **[[Sink-to-Source Analysis]]** — Trace backward from sinks instead of forward from sources. Only touches program parts relevant to each bug
- **[[Assumed Nonimpact]]** — Skip function callees that cannot affect tracked values. Dramatically reduces analysis time

### [[TruPoCs]]
Ranked alerts that separate triggerable vulnerabilities from ordinary bugs. Based on reachability from attacker-controlled input.

### [[Environment Resolution]]
Tracks data flow across binary boundaries via NVRAM, environment variables, and IPC channels. Finds the cross-binary bugs that Karonte and SaTC miss.

## Key Numbers
| Metric | Mango | SaTC | Karonte |
|---|---|---|---|
| Binaries analyzed (Karonte dataset) | 3,599 | 131 | 312 |
| Avg per-binary time | 8 min | 6.5 hrs | 3.0 hrs |
| TPs SaTC missed | 56 | — | — |
| TPs Karonte missed | 203 | — | — |
| Large-scale: firmware images | 1,698 | — | — |
| Large-scale: binaries | 770,374 | — | — |
| Large-scale: TruPoCs | 10,834 | — | — |
| Verified exploitable | 166 | — | — |

## Limitations (Honest Assessment)
- Cannot reason about path feasibility → false positives → motivates [[AIL Symbolic Execution]]
- Assumed Nonimpact breaks on structs passed by value (wrong calling convention recovery)
- Global struct member access resolution is imprecise
- Only handles CWE-78 (command injection) and CWE-121 (stack buffer overflow)

## Connections
- Built on [[angr Framework]]
- Positions against [[Karonte]], [[SaTC]], [[DTaint]], [[Saluki]], [[Arbiter]]
- False positives motivate [[AIL Symbolic Execution]] (proposed work)
- Sink-to-Source approach provides starting points for symbolic exploration (Thrust 2)
- Chapter: [[Chapter 3 - Mango Chapter]]
