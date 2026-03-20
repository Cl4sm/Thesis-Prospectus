---
type: content
title: "The Remaining Gap"
---

### Mango

- Scalable binary-only detection ✓
- Candidates unvalidated ✗

### Artiphishell

- Autonomous full lifecycle ✓
- Requires source code ✗

**Missing piece:** formal validation of binary-only static candidates

???

So we've built two systems that each solve different parts of the problem. Mango scales vulnerability detection across binary-only firmware, which is critical when you're scanning thousands of devices, but it can't tell you whether those candidates are actually exploitable. Artiphishell shows the full lifecycle works (detection through patching) but it requires source code, which most firmware vendors do not give us.

This creates an asymmetry. Mango finds many candidates, but in binaries. Artiphishell proves the full pipeline, but only on source. The missing piece is the formal validation of those binary-only candidates. We need to know which of Mango's thousands of alerts are actually reachable.

That's the gap the proposed work addresses.
