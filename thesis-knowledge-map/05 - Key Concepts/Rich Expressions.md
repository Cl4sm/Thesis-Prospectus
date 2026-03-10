# Rich Expressions

A core innovation of [[MangoDFA]]. Rich Expressions are the value domain that tracks the full transformation history of data as it flows through a binary.

## Why Not Just Taint Bits?

Traditional taint analysis: "this value is tainted" (boolean). That tells you data reached the sink from a source, but not whether it's actually exploitable.

Rich Expressions: "this value is `sprintf(buf, "echo hello %s", input)` where `input` came from `getenv("USER")`." Now you know the string composition, what the attacker controls, and what they don't.

## What They Track
- Value transformations (function calls, arithmetic, string operations)
- Composition structure (format strings, concatenations)
- Constraint information (e.g., `itoa()` constrains to digits)
- Source provenance (which function introduced the value)

## Key Example
```c
sprintf(buf, "ls %s", itoa(input));
system(buf);  // Rich Expression knows itoa constrains input → NOT vulnerable

snprintf(buf, 50, "echo hello %s", input);
system(buf);  // Rich Expression sees raw input in format string → VULNERABLE
```

## Limitation
Rich Expressions track value transformations but NOT path conditions. They can't tell you whether the branch sequence required to reach a sink with a particular value is actually satisfiable. This is exactly what [[AIL Symbolic Execution]] adds.

## Related
- [[MangoDFA]]
- [[Operation Mango]]
- [[Sink-to-Source Analysis]]
