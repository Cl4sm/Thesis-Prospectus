# Arbiter

**Citation:** Vadayath et al., 2022
**Role in your thesis:** Comparison target in [[Chapter 2 - Related Work]]

Combines static taint analysis with under-constrained symbolic execution for reachability verification. Closest to the Mango + AIL-SE hybrid approach, but only works on x86-64. IoT firmware is mostly MIPS and ARM, making Arbiter inapplicable to the firmware domain.

## Relevance
- Shows that combining static + symbolic is a valid direction (validates your proposed work)
- But architecture limitation means it doesn't compete with [[Operation Mango]] directly
- [[AIL Symbolic Execution]] will be architecture-independent via angr's AIL

## Related
- [[Operation Mango]]
- [[AIL Symbolic Execution]]
- [[Chapter 2 - Related Work]]
