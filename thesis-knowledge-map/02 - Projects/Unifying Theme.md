# Unifying Theme

## The Core Argument

Detection scales. Validation does not. The central unsolved problem in automated vulnerability discovery is the gap between "this might be a bug" and "this is a confirmed, exploitable vulnerability." Each project in this dissertation attacks that gap with a progressively stronger form of validation evidence.

## The Narrative Arc

```
  PARTIAL               CONVERGENT           FORMAL
  VALIDATION            VALIDATION           VALIDATION
  ┌──────────┐    ┌──────────────┐    ┌──────────────┐
  │  Mango   │───▶│ Artiphishell │───▶│   AIL-SE     │
  │  (Rich   │    │  (multi-tech │    │  (symbolic   │
  │  Exprs)  │    │  convergence)│    │   feasibility│
  │          │    │              │    │   + concrete  │
  │          │    │              │    │    inputs)    │
  └──────────┘    └──────────────┘    └──────────────┘
       │                 │                    │
       └─────────────────┴────────────────────┘
         "From Detection to Validation"
```

## How They Connect

### Mango: Partial Validation
- Bakes validation into detection itself
- Rich Expressions carry exploitability evidence, not just taint bits
- A Rich Expression reaching `system()` tells you *how* the value was constructed: was it constrained by `itoa()`? Concatenated raw? Truncated?
- This is stronger evidence than a taint bit, but it cannot prove path feasibility
- **Limitation:** Candidates carry evidence but no proof → motivates formal validation

### Artiphishell: Convergent Validation
- Validates through multi-technique agreement
- When fuzzing crashes on a function that LLM scanning also flagged, and RCA localizes the bug, and a patch fixes it: that's convergent evidence
- The [[Analysis Graph]] enables this by sharing state across all agents
- Proves that combining static + dynamic beats either alone
- **Limitation:** Convergence is strong evidence but not formal proof; complex candidates still need principled feasibility analysis

### AIL-SE: Formal Validation
- Targeted symbolic execution on paths Mango already flagged
- AIL carries recovered types and structured control flow → tighter constraints
- Produces concrete triggering inputs (proof of exploitability) or proves infeasibility (eliminates false positives)
- Coverage data from Artiphishell-style fuzzing guides path prioritization (Thrust 3)

### All Three Together
The dissertation tells the story of **what it takes to automatically confirm a vulnerability is real:**
1. **Mango** detects candidates with partial evidence attached (Rich Expressions)
2. **Artiphishell** shows that convergent evidence from independent techniques provides strong validation
3. **AIL-SE** provides formal validation through symbolic feasibility, closing the gap completely

## Thesis Statement
> This dissertation argues that the gap between automated vulnerability detection and confirmed exploitation can be closed through progressively stronger forms of validation evidence: value-level reasoning that filters implausible candidates during static analysis, multi-technique convergence that builds confidence through independent corroboration, and symbolic feasibility analysis that produces concrete triggering inputs.

## Anticipating Committee Questions

**"Why are these three projects a coherent dissertation?"**
They form a progression along the validation evidence spectrum: partial evidence (Mango's Rich Expressions) → convergent evidence (Artiphishell's multi-technique agreement) → formal evidence (AIL-SE's symbolic feasibility). Each project's limitations reveal what the next form of evidence must provide.

**"The Artiphishell connection seems weak."**
Artiphishell is the project that demonstrates what validation looks like when you orchestrate multiple techniques. Its central scientific contribution is showing that convergent evidence from independent analyses provides strong validation. Thrust 3 makes the technical connection concrete: coverage data from fuzzing guides AIL-SE's symbolic exploration.

**"This is really two dissertations: firmware analysis and CRS."**
The common thread is the detection-validation gap, which appears identically at the firmware level (Mango's candidates need validation) and the source level (Artiphishell's detections need confirmation through convergence). The gap is fundamental to automated vulnerability discovery regardless of the target.

## Related
- [[Operation Mango]]
- [[Artiphishell]]
- [[AIL Symbolic Execution]]
- [[Defense Presentation]]
