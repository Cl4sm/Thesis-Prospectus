---
type: content
title: "Mango — Summary"
---

### What Mango Achieves

- **Scalable detection** across every binary in a firmware image (27x more than SaTC)
- **Precise value tracking** via Rich Expressions (not binary taint bits)
- **8 min/binary** average — practical for large-scale deployment
- **TruPoC ranking** prioritizes alerts by attacker reachability (70% true positive rate)
- **166 confirmed exploitable vulnerabilities** across 1,698 firmware images

### What Remains

- Candidates are static hypotheses — **no concrete Proof-of-Concept**
- Path feasibility is unknown: is the flagged path actually reachable?
- Vendors reject reports without PoCs

*Mango scales detection. Next: can we confirm these findings?*

???

Mango delivers scalable, precise vulnerability detection. We analyze every binary, not just border binaries or frontend-matched ones. Rich Expressions track full transformation history, reducing false positives. Eight minutes per binary makes this practical at scale. Environment Resolution links cross-binary NVRAM flows. We found 166 exploitable vulnerabilities with a 70 percent true positive rate. These are real bugs in real firmware. But Mango stops at static analysis. A Mango alert says: attacker input flows from source X through transformations Y to sink Z. We have high confidence in that path. What we don't know: is that path actually reachable? Can an attacker really trigger it? Mango candidates are hypotheses. Vendors ask for PoCs, concrete triggering inputs that demonstrate the vulnerability. Static analysis cannot provide that. That's the next challenge.
