---
type: content
title: "Two Challenges: Precision and Scalability"
---

### Precision

- Traditional taint tracking = **1 bit** (tainted or not)
- Cannot distinguish: "tainted and passed through `strlen()`" vs. "tainted and passed directly to `system()`"
- Result: overtainting, false positives

### Scalability

- Analyzing every callee in every binary causes exponential blowup
- Prior tools sacrifice coverage (BDG expansion, keyword matching) to stay tractable
- **Mango's goal:** analyze every binary while maintaining precision

???

Mango solves two problems. First, precision. Traditional taint analysis tracks a single bit: is this value tainted or not? It cannot distinguish between tainted data that was passed through strlen, which just measures it, versus tainted data passed directly to system, which executes it. The second distinction is critical for reducing false positives. A human analyst makes that distinction all the time: "this value came from user input, passed through a filtering function, and reached the sink." The value carries its history. Second, scalability. If you analyze every callee in every binary, the search space explodes exponentially. Karonte builds a dependency graph from border binary seeds and expands through shared IPC keys, but the resulting graph of 5 to 15 binaries still faces path explosion in symbolic execution. SaTC avoids symbolic execution but restricts scope to binaries matching frontend keywords. Both sacrifice coverage to stay tractable. Mango's goal is to analyze every binary while solving both problems: tracking precise transformations and avoiding the scalability blowup.
