# Sink-to-Source Analysis

A key optimization in [[MangoDFA]]. Instead of forward taint propagation (mark sources, track forward through all paths), start from sinks and trace backward.

## Why Backward?

Forward analysis: mark every `getenv()`, `recv()`, `fread()` call, propagate taint through the entire program, check if any tainted value reaches a sink. You visit everything, most of it irrelevant.

Backward analysis: start from `system()`, `strcpy()`, `execve()`, trace what feeds into them. Only touch the parts of the program that matter for each potential bug.

This mimics how human reverse engineers actually find taint-style vulnerabilities: look at the dangerous call, trace back to see if an attacker can reach it.

## Scalability Impact
Combined with [[Assumed Nonimpact]], this is why Mango can analyze 3,599 binaries where SaTC touches 131. You only do work proportional to the number of sinks and the depth of their dependencies, not proportional to program size.

## Connection to AIL-SE
Sink-to-Source provides the starting points for symbolic exploration in [[AIL Symbolic Execution]] Thrust 2. The symbolic executor doesn't explore the whole program; it validates the specific paths MangoDFA identified.

## Related
- [[MangoDFA]]
- [[Rich Expressions]]
- [[Assumed Nonimpact]]
- [[Operation Mango]]
