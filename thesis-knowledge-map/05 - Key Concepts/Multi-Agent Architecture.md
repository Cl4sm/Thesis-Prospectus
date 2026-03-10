# Multi-Agent Architecture

The design pattern at the heart of [[Artiphishell]]. Multiple specialized AI agents, each handling a different piece of the vulnerability lifecycle, coordinated through shared state.

## Why Multi-Agent?
No single technique finds everything. Fuzzing is good at crashes but bad at structured inputs. LLMs are good at code understanding but unreliable at precise analysis. Static analysis finds candidates but can't confirm them. The multi-agent approach runs them all and lets them feed each other.

## Artiphishell's Agent Inventory

### Preprocessing Agents
- Builder, Analyzer, Indexer

### Discovery Agents
- AFL++ (coverage-guided fuzzing)
- Nautilus pipeline (grammar-based fuzzing: Grammar Composer, Grammar-guy, Grammar-agent, Grammaroomba, Revolver Mutator)
- LLuMinar (LLM vulnerability scanner)
- AIJON (LLM-annotated AFL++)
- QuickSeed (LLM seed generation)
- Discovery Guy + JimmyPwn (sink-based LLM exploration)

### Analysis Agents
- Kumushi (statistical root cause)
- DyVA (interactive LLM debugger)

### Patching Agents
- PatcherY (constrained)
- PatcherQ (free-form + CriticPass)

## Coordination via [[Analysis Graph]]
The agents don't talk to each other directly. They read from and write to a shared data structure. This keeps them loosely coupled while allowing information to flow.

## Design Tension: Constrained vs. Free-Form
PatcherY (procedural, constrained LLM role) vs. PatcherQ (maximum LLM freedom) exemplifies the core design question in AI agent systems: how much autonomy do you give the LLM?

## Lessons for the Dissertation
This architecture is what distinguishes Artiphishell from a bag of tools. The [[Unifying Theme]] argues that the future of vulnerability discovery is orchestrating diverse techniques. AIL-SE is one more technique that could slot into this kind of architecture.

## Related
- [[Artiphishell]]
- [[Analysis Graph]]
- [[Artiphishell Writing Strategy]]
