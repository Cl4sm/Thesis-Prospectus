# Analysis Graph

The central data structure in [[Artiphishell]] that serves as shared memory for all agents.

## What It Stores
- **Function metadata:** signatures, call graphs, complexity metrics, reachability from harness entry points
- **Coverage data:** which paths have been reached, linked to the grammars and inputs that reached them
- **Vulnerability findings:** crashes, sanitizer reports, SARIF results
- **Grammar corpus:** all generated grammars with their coverage profiles

## Why It Matters
The Analysis Graph is what makes agents useful to each other. When a grammar-based fuzzer reaches previously unseen functions, that information is visible to all other agents. LLM scanners can prioritize newly-reached code. Other fuzzers can reuse successful grammars.

Without this shared state, the agents are just running in parallel without coordination. That's the difference between a multi-agent system and a collection of independent tools.

## Design Decision
You (Wil) chose shared-memory over message-passing. Why? Discuss this in [[Artiphishell Writing Strategy|the Artiphishell chapter]]. Possible reasons: loose coupling, agents can run at different speeds, any agent can query any past result, simpler than event-driven coordination.

## Connection to Proposed Work
The Analysis Graph could also store [[AIL Symbolic Execution]] results, making them available to all agents. This is part of Thrust 3 (guided exploration): fuzzing coverage data from the Analysis Graph prioritizes symbolic exploration paths.

## Related
- [[Artiphishell]]
- [[Multi-Agent Architecture]]
- [[Grammar-Based Fuzzing]]
