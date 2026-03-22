---
type: content
title: "Mango — Summary"
---

### What Mango Achieves

- **Scalable detection** across every binary (27x more than SaTC)
- **Precise value tracking** via Rich Expressions
- **8 min/binary** average — practical at scale
- **70% true positive rate** — vendors accept findings
- **166 exploitable vulnerabilities** confirmed

### What Remains

- Candidates lack concrete Proof-of-Concept
- Path feasibility unknown: is it reachable?

*Mango scales detection. Next: confirm these findings.*

???

Mango delivers scalable, precise vulnerability detection. We analyze every binary, not just border binaries or frontend-matched ones. Rich Expressions track full transformation history, reducing false positives. Eight minutes per binary makes this practical at scale. Environment Resolution links cross-binary NVRAM flows. We found 166 exploitable vulnerabilities with a 70 percent true positive rate. These are real bugs in real firmware. But Mango stops at static analysis. A Mango alert says: attacker input flows from source X through transformations Y to sink Z. We have high confidence in that path. What we don't know: is that path actually reachable? Can an attacker really trigger it? Mango candidates are hypotheses. Vendors ask for PoCs, concrete triggering inputs that demonstrate the vulnerability. Static analysis cannot provide that. That's the next challenge.
