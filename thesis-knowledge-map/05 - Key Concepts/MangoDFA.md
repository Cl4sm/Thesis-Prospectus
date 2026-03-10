# MangoDFA

The core analysis engine of [[Operation Mango]]. A context-sensitive static data-flow analysis for binary firmware.

## Three Key Ideas

### [[Rich Expressions]]
Track the full transformation history of values, not just taint bits. This lets MangoDFA reason about string composition and determine whether a value flowing into a sink is actually exploitable.

Example: `sprintf(buf, "ls %s", itoa(input)); system(buf);` — MangoDFA knows `itoa()` constrains the input to digits, so this is not a command injection. Traditional taint analysis would flag it.

### [[Sink-to-Source Analysis]]
Start from vulnerability sinks (e.g., `system()`, `strcpy()`) and trace dependencies backward. Only analyzes the parts of the program relevant to each potential bug. Mimics how human reverse engineers actually work.

### [[Assumed Nonimpact]]
At each call site, check if any tracked values are passed to the callee. If not, skip the callee entirely. This is the key scalability optimization.

Loss of soundness: assumes well-formed callees and accurate calling convention recovery. Breaks on structs passed by value and global struct member accesses where size is ambiguous.

## How It Works (Pipeline)
1. Recover CFG, calling conventions, prototypes for all functions in a binary
2. Start from each sink function
3. Trace backward through callers, building Rich Expressions
4. At each call site, apply Assumed Nonimpact to decide whether to enter callees
5. If a source is reached with an exploitable Rich Expression, generate a [[TruPoCs|TruPoC]] alert

## Value Domain
Operates on integers and fixed-length strings. Tracks:
- Concrete values where known
- Symbolic representations of transformations
- Composition history (what sprintf format strings look like)

## Connection to Proposed Work
MangoDFA's output (vulnerability context paths + Rich Expressions) feeds directly into [[AIL Symbolic Execution]] as Thrust 2. The symbolic executor validates whether those paths are feasible.

## Related
- [[Operation Mango]]
- [[angr Framework]] — MangoDFA is built on angr
- [[Chapter 3 - Mango Chapter]]
