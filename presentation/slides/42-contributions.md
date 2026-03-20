---
type: content
title: "Thesis Contributions"
---

- **Operation Mango** — Scales firmware vulnerability detection to every binary (27x prior work). USENIX Security '24.
- **Artiphishell** — Demonstrates the full autonomous vulnerability lifecycle on real-world software. DEF CON '25.
- **AIL Symbolic Execution** — (Proposed) Bridges the detection-confirmation gap with concrete triggering inputs.

Together: a path from "scan everything" to "prove exploitability"

???

Let me summarize the three contributions. Operation Mango scales firmware vulnerability detection to every binary in a firmware image, achieving 27 times better coverage than prior work. It's published and peer-reviewed.

Artiphishell demonstrates that the full vulnerability lifecycle is automatable: detection, root cause analysis, patch synthesis, and verification all working together. It's already been presented at DEF CON.

The proposed work, AIL Symbolic Execution, bridges the detection-confirmation gap. It takes Mango's candidates and validates them with formal proof, synthesizing concrete triggering inputs that vendors can act on.

Together, these three projects form a complete path. You can scan everything at scale. Then you can validate what matters, with proof. Finally, you can demonstrate exploitability. That's the thesis.
