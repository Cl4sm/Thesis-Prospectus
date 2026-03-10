# Function Summaries

A technique in [[MangoDFA]] for caching analysis results of functions to avoid redundant work.

## How They Work
When MangoDFA analyzes a function, it caches:
- Calling conventions
- Function prototypes
- Accessed global variables
- The effect of the function on tracked values

At subsequent call sites to the same function, MangoDFA can reuse the summary instead of re-analyzing the function body.

## Interaction with Assumed Nonimpact
[[Assumed Nonimpact]] uses function summaries to make the skip decision: if the summary shows the function doesn't touch any tracked values, skip it.

## Related
- [[MangoDFA]]
- [[Assumed Nonimpact]]
- [[Operation Mango]]
