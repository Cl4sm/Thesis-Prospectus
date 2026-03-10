# Karonte

**Citation:** Redini et al., 2020
**Role in your thesis:** Primary comparison target for [[Operation Mango]]

## What It Does
First tool to model multi-binary interactions in IoT firmware through static analysis. Tracks data flows across binary boundaries using environment variables and NVRAM as IPC channels.

## Key Limitation
Uses Binary Dependence Graph (BDG) to restrict analysis to network-reachable binaries. On the Karonte dataset (49 firmware images), analyzes only 5 binaries per firmware on average (out of ~174 total). Misses vulnerabilities in non-border binaries.

## Mango's Advantage
Mango analyzed all 3,599 binaries vs Karonte's 312. Found 203 true positives Karonte missed. 22x faster per-binary.

## Related
- [[SaTC]]
- [[Operation Mango]]
- [[Chapter 2 - Related Work]]
