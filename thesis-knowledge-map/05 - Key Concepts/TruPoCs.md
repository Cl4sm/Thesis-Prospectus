# TruPoCs (True PoCable Vulnerabilities)

A concept from [[Operation Mango]]. Ranked alerts that separate triggerable vulnerabilities from ordinary bugs.

## The Problem
Mango analyzes every binary in a firmware image. That produces a lot of alerts. Many are real bugs (the data flow exists) but not all are reachable by an attacker. TruPoCs prioritize alerts that are most likely exploitable.

## Ranking Criteria
- Reachability from attacker-controlled input sources
- Source type (network input ranked higher than local config)
- Sink severity (command injection ranked higher than bounded buffer copy)

## True Positive Rates
From manual analysis of a sample set:
- Command injection (CWE-78): 57% TP rate
- Buffer overflow (CWE-121): 47% TP rate
- "For every 10 command injection alerts a human analyst triages, 5 will be actual vulnerabilities"

## Scale
Large-scale dataset: 10,834 TruPoCs across 1,698 firmware images (770,374 binaries, 9 vendors). 166 verified exploitable in the manually-audited subset.

## Related
- [[MangoDFA]]
- [[Operation Mango]]
- [[Environment Resolution]]
