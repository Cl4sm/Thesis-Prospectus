# Mango Paper

## Introduction
- Prevelance of IoT Devices
- KARONTE and SaTC
- Important to be practical and fast
    - Can be included in CI
    - Can be used to test downloaded packages/plugins in real-time
- CWEs
    - Buffer Overflow
    - Command Injection
- __Contributions__
    - New value domain for data-flow analysis to reason about integers and strings (Thanks Fish)
        - Fast and Furious
            - Backwards call trace traversal
            - Assumed Execution
    - False Positive Reduction
        - Simprocedure Handler
        - Concrete Execution
    - Implemented prototype did evaluation and found bugs
    - Releasing to the public


## Background
- Threat Model
    - Network access to Device?
    - We don't identify border binaries, what to say...
- Motivating Example
    - NETGEAR RAX30 with user-agent bug
    - Can't be found by SaTC
- __Speed of KARONTE and SaTC?__

## Design
1. Firmware Pre-processing
    - Get all symbols from elfs in firmware
2. IPC Discovery
    - Run ENV_RESOLVE on all binaries to discover NVRAM and ENV variables
3. Generate Call Traces for sink functions
4. RDA
5. Resolve values with SimProc Handlers
6. Attempt to resolve arguments at Sink locations
7. Repeat steps 3-6, increasing the call-depth from the sink until max depth reached or all resolved
8. After all traces are resolved, filter traces and print/save results

## Implementation
- Env Resolve
    - Similar to Mango except searching for only resolved values whereas mango is only unresolved
- Mango Function Handler
- Simproc Handlers
- Assumed Execution
    - Criteria for skipping/analyzing functions
- Bypassing guarded loads/stores
- Ignoring TOP valued pointers in sinks

## Evaluation
- Evaluation on KARONTE Dataset
    - Manual evaluation of results
    - Compare against SaTC Results

- Manual SaTC 7-firmware analysis
    - Compare against what bugs we did/did not find

- Case Studies
    - WD-Nas ShellEscapeArg findings
    - Netgear RAX30 Pwn2own bug

- Large Scale Eval
    - Large Scale evaluation on Greenhouse dataset

- Ablation Study
    - Show Assumed Execution speed improvements
    - Show Backwards Call-traversal speed improvement


## Limitations

### Strengths
- Requires little setup information (no specified sources, only sinks)
- String and value resolution through Simprocedure Handlers
- Assumed Execution increases Speed

### Weaknesses
- Assumed Execution could miss important functions
- Sources must originate from analyzed binary
    - KARONTE and SaTC can define sources outside

## Related Work
- KARONTE
- SaTC
- Arbiter
- Saluki

# Discussion
- Talk about dataset quality

## Conclusion
- We da best
---

## Ideas
- Could also key-pair socket port listening on 0.0.0.0 for border binaries
- Cache Mango results for libraries and then find all binaries with sinks to those vulnerable functions and run Mango on them
- Mango works on all binaries right now, maybe limit it to non-shared ELFs


### Helpers
- Arvind
- Zion
- Bonnie
- Jay
- Audrey
- Justin