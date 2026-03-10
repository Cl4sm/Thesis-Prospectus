# SaTC

**Citation:** Chen et al., 2021
**Role in your thesis:** Primary comparison target for [[Operation Mango]]

## What It Does
Extends [[Karonte]]'s approach by using keywords from front-end files (JavaScript, PHP) to locate entry points in back-end binaries. Finds more true positives per binary than Karonte.

## Key Limitation
Restricts analysis to binaries matching frontend keywords. On the Karonte dataset, touched 131 binaries out of 3,599. Spent 6.5 hours per binary on average. Misses vulnerabilities in binaries without keyword matches (like the dlnad example).

## The dlnad Example
SaTC misses the `httpd` → NVRAM → `dlnad` command injection because `dlnad` has too few frontend keyword references to be selected as a border binary.

## Mango's Advantage
Mango analyzed 27x more binaries in comparable total time. Found 56 true positives SaTC missed. 8 min per binary vs 6.5 hours.

## Related
- [[Karonte]]
- [[Operation Mango]]
- [[Environment Resolution]]
