# Assumed Nonimpact

A key optimization in [[MangoDFA]]. At each call site during data-flow analysis, decide whether the callee can affect the values being tracked. If not, skip it entirely.

## How It Works
1. Recover calling conventions and prototypes for each callee
2. At each call site, check: (a) are any pointers to tracked values passed as arguments? (b) does the return value ultimately feed into the sink?
3. If neither, assume the call has no impact and skip it

## Why It Matters
Without this, inter-function data-flow analysis enters every callee in every function along the call tree. That's exponential. Assumed Nonimpact makes it proportional to the relevant callees only.

## Loss of Soundness
The assumptions don't always hold:
- **Structs by value:** If a struct (not a pointer to a struct) is passed, calling convention recovery may be wrong, and the callee could modify tracked values through the struct
- **Global variables:** If a callee accesses a global struct member whose size is ambiguous, Mango may incorrectly skip it
- **Non-standard callees:** Functions that manipulate the stack directly (e.g., adding a constant to the stack pointer to access the caller's frame) violate the well-formed assumption

## Comparison
TChecker has a similar technique for PHP applications. Mango's novelty is adapting it for stripped binaries across multiple architectures (MIPS, ARM, x86), which is significantly harder because type info, symbol names, and structured control flow are discarded during compilation.

## Related
- [[MangoDFA]]
- [[Sink-to-Source Analysis]]
- [[Rich Expressions]]
- [[Operation Mango]]
