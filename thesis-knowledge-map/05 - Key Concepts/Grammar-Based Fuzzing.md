# Grammar-Based Fuzzing

A major component of [[Artiphishell]]'s vulnerability discovery stage. Byte-level mutation (AFL++) cannot penetrate structured input formats (XML, HTTP, SQL). Grammar-based fuzzing generates inputs that are structurally valid but semantically adversarial.

## The Pipeline (built around Nautilus)

### Grammar Composer
Automatically detects input formats via fingerprint database. Handles hierarchical/nested formats (XML inside HTTP).

### Grammar-guy
LLM-driven grammar refinement. Three strategies:
1. Random selection of unreached functions → targeted grammar modification
2. Callable-pair analysis → grammars reaching specific call chains
3. Extrapolation using LLM's knowledge of the target format

### Grammar-agent
Fully LLM-guided exploration. Maintains goal functions to reach, iteratively generates grammars, persists state (goals, coverage maps, memories) across sessions so it can learn.

### Grammaroomba
Local coverage maximization within already-reached functions. Prioritizes by cyclomatic complexity, nesting depth, exception handling.

### Revolver Mutator
Synchronizes grammars from all sources, feeds them to AFL++/Jazzer through RON serialization. Watchtower monitors for new grammars.

## Interaction with [[Analysis Graph]]
New grammars and their coverage profiles are stored in the Analysis Graph. Other agents (especially LLuMinar) use this to know which code has been reached and which hasn't.

## Related
- [[Artiphishell]]
- [[Multi-Agent Architecture]]
- [[Analysis Graph]]
