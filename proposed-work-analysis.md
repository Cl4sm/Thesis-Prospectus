# How SEFCOM Prospectuses Present Proposed Work

An analysis of 6 ASU SEFCOM prospectus documents, focused on how each author structured and presented their proposed/future work sections. Prepared for Wil Gibbs to inform the design of his own proposed work chapter.

---

## The Two-Part Structure (Dominant Pattern)

Five of six prospectuses use the same two-part architecture for proposed work. Understanding this pattern is the single most important takeaway.

**Part A: A dedicated "Planned" chapter** that presents the proposed project as a self-contained mini-paper, written in the same style as the completed-work chapters. This is the substantive proposal.

**Part B: A brief "Completed and Planned Work" chapter** that follows immediately after, serving as a one-page summary/status update listing completed publications and remaining work. This is the bookkeeping chapter.

The key insight: the real persuasion happens in Part A. Part B is just a checklist.

---

## Document-by-Document Breakdown

### Erik Trickel (2023) — 154 pages, 5 completed + 1 planned project

**Part A — Ch 5: "Planned: Automated Platform for Extracting Browser Fingerprints" (pp. 90–94, ~5 pages)**

Erik's planned chapter is the cleanest example of the mini-paper format. It has four subsections that mirror a full paper:

- **5.1 Introduction** (~1 page): Bridges from the completed work by noting what his prior chapters *didn't* cover (fraud browsers), then motivates the proposed project. Uses first person ("I have already covered... However, I have not explored...").
- **5.2 Design** (~1 page): Presents the system architecture with a figure showing the pipeline. Describes the technical approach concretely (test suites, feature extraction phase, JavaScript statement sorting).
- **5.3 Planned Evaluation** (~1.5 pages): Describes three specific experiments with concrete methodology. Each experiment has a clear setup and success criteria. Includes details like "5-10 fraud browsers commonly observed" and collaboration with a financial institution.
- **5.4 Related Work** (~1 page): Brief positioning against existing approaches, explaining what prior work lacks that this project addresses.

**Part B — Ch 6: "Completed and Planned Work" (p. 95, ~1 page):** Bullet list of completed publications with venues, then a short paragraph on planned work status.

**What makes it effective:** The chapter reads like a workshop paper draft. The evaluation section is particularly strong because it names concrete experiments rather than vaguely gesturing at "we will evaluate."

---

### Faezeh Kalantari (2022) — 120 pages, 4 completed + 1 planned project

**Part A — Ch 5: "Planned: Automated Platform for Extracting Browser Fingerprints" (pp. 90–94, ~5 pages)**

Faezeh's structure is nearly identical to Erik's (they were labmates working in adjacent areas). Same four subsections:

- **5.1 Introduction** (~1 page): Bridges from completed chapters by identifying an unexplored dimension (fraud browsers exploiting stolen fingerprints). Motivates the automation need by noting manual analysis becomes obsolete with new browser releases.
- **5.2 Design** (~1 page): System architecture figure plus description of the feature extraction pipeline. Concrete technical details (JavaScript prototype auditing, `Object.getOwnProperties()` usage).
- **5.3 Planned Evaluation** (~1.5 pages): Three numbered experiments with specific methodology. Includes real-world deployment plan (collaboration with a financial institution, testing on their gift-card purchase portal for one week). Also includes a "Performance" sub-evaluation.
- **5.4 Related Work** (~1 page): Positions against BrowserPrint, Azad et al., JavaScript template attacks, Google Picasso, Laperdrix et al.

**Part B — Ch 6: "Completed and Planned Work" (p. 95, ~1 page):** Lists two completed publications with venues, then a paragraph on planned work progress.

**What makes it effective:** The evaluation plan is the strongest of all documents reviewed. Naming specific fraud browsers (MultiLogin, Che browser, LinkenSphere) and a real deployment partner makes the proposal feel grounded rather than speculative.

---

### Eric Sun (2022) — 129 pages, 4 completed + 1 planned project

**Part A — Ch 5: "Planned: An Analysis of the Phishing Reporting Ecosystem" (pp. 98–99, ~1–2 pages)**

Eric's planned chapter is notably shorter than Erik's or Faezeh's. The introduction motivates the project (phishing reporting ecosystem analysis) but the chapter is quite brief, relying more on the bridge from Ch 4's conclusion to set up the motivation.

**Part B — Ch 6: "Completed and Planned Work" (pp. 100–102, ~2 pages):** Lists completed publications, planned work status, and references follow immediately.

**Bridge technique (Ch 4 → Ch 5):** Eric's Ch 4 conclusion paragraph explicitly motivates the next research direction, creating narrative momentum into the planned chapter. This is a useful technique: the final completed-work chapter does some of the motivational heavy lifting for the proposed work.

**What makes it notable:** This is the shortest planned-work chapter in the set. It demonstrates that the mini-paper format can be compressed when the motivation is established elsewhere. However, this is likely the minimum viable version; more detail would strengthen the proposal.

---

### Penghui Zhang (2020) — 67 pages, CEN program (not CS)

**Structure: Ch 6 "Completed and Planned Work" only (~2 pages)**

Penghui's prospectus does *not* have a dedicated planned-work chapter in the mini-paper format. Instead, Ch 6 serves as a combined summary of completed and planned work. The planned portion describes ongoing research directions in paragraph form without the Introduction/Design/Evaluation subsection structure.

**What makes it different:** This is the only prospectus that lacks the mini-paper planned chapter. It may reflect CEN program norms rather than CS/SEFCOM conventions, or an earlier era's expectations. The planned work reads more like a future-work section of a paper than a standalone proposal.

---

### Kyle Zeng (2025) — 20 pages, compact format

**Ch 5: "Plan For Defense" (~2–3 pages)**

Kyle's prospectus is the most compact in the set. His "Plan For Defense" chapter serves as a combined summary, listing completed and remaining work with a defense timeline. There is no separate mini-paper chapter for planned work, likely because his prospectus is structured as a shorter document overall.

**What makes it notable:** Demonstrates that the two-part pattern is not mandatory. A compact prospectus can use a single summary chapter. However, Kyle's is an outlier in length (20 pages vs. 67–154 for others).

---

### Marzieh Bitaab (2025) — 139 pages, 7 completed projects

**Ch 8: "Conclusion and Future Work" (pp. 114–115, ~2 pages)**

Marzieh's prospectus has the most completed projects (7 chapters of published work) but the shortest proposed-work section. Her "Future Implications" subsection is approximately one page, sketching future research directions without the mini-paper structure.

**What makes it different:** With 7 completed projects, the weight of evidence shifts toward the completed body of work. The future-work section functions more as a thematic coda than a research proposal. This reflects a prospectus where the completed work already demonstrates dissertation-level contribution and the proposed work is a minor extension.

---

## Structural Patterns and Takeaways

### Pattern 1: The Mini-Paper Planned Chapter (recommended for Wil)

Used by: Erik, Faezeh, Eric Sun (abbreviated form)

The planned-work chapter mirrors the structure of completed-work chapters:

| Section | Purpose | Typical Length |
|---------|---------|---------------|
| Introduction | Bridge from completed work; motivate the gap | ~1 page |
| Design / Approach | System architecture, technical details, figures | ~1 page |
| Planned Evaluation | Numbered experiments with concrete methodology | ~1–2 pages |
| Related Work | Position against existing approaches | ~0.5–1 page |

Total: ~4–6 pages.

This format works because it signals that the proposed work is already well-defined and feasible. The committee reads it as "this person knows what they're going to build and how they'll evaluate it."

### Pattern 2: The Summary-Only Chapter

Used by: Penghui, Kyle, Marzieh

A 1–2 page chapter that lists completed work, describes planned directions in paragraph form, and sometimes includes a timeline. This works when the completed work already carries the argument (Marzieh with 7 projects) or the document is intentionally compact (Kyle).

### The Bridge Technique

Used effectively by: Erik, Faezeh, Eric Sun

Each completed-work chapter's conclusion paragraph explicitly introduces the next research question, creating a narrative thread that runs through the entire prospectus. The planned-work chapter's introduction then picks up this thread. This avoids the feeling of "here are three unrelated papers plus a random fourth idea."

Erik and Faezeh both open their planned chapters with variations of "I have already covered X in this dissertation. However, I have not explored Y." This two-sentence pattern (completed → gap) is simple and effective.

### Evaluation Specificity

The strongest planned chapters (Erik, Faezeh) include:
- **Numbered experiments** (Experiment 1, 2, 3) rather than vague evaluation goals
- **Concrete metrics** and success criteria
- **Real-world deployment plans** (collaboration with financial institutions)
- **Specific tools/systems** to compare against
- **Dataset descriptions** or collection methodology

The weakest (Eric Sun's abbreviated version) gesture at evaluation without this level of detail.

---

## Recommendations for Wil's Proposed Work Chapter

Given that Wil has 2 completed projects (Operation Mango at USENIX Security '24, Artiphishell at DEF CON 2025) and 1 proposed project (Symbolic Execution on AIL / "full-reach"), the Erik/Faezeh template is the right model. Specifically:

1. **Use the mini-paper format** for the proposed AIL symbolic execution chapter. Include Introduction, Design/Approach, Planned Evaluation, and Related Work subsections.

2. **Bridge from Artiphishell's chapter** into the proposed work by identifying what the Analysis Graph approach revealed but couldn't fully solve (path feasibility validation), then frame AIL symbolic execution as the natural next step.

3. **Write numbered experiments** for the evaluation plan. For example: Experiment 1 could test whether AIL symbolic execution confirms MangoDFA's static candidates; Experiment 2 could measure triggering-input generation rates; Experiment 3 could compare against existing symbolic execution approaches on a benchmark suite.

4. **Include a system figure** showing the AIL symbolic execution pipeline, similar to how Erik and Faezeh included architecture diagrams.

5. **Follow with a short "Completed and Planned Work" chapter** (1 page) listing the two publications and the status of the proposed work.

6. **Use the two-sentence bridge pattern** at the start of the proposed chapter: "The preceding chapters addressed detection (Mango) and multi-technique coordination (Artiphishell). Neither, however, produces formal proof that a flagged path is reachable and triggerable."

---

## Length Comparison

| Author | Total Pages | Planned Chapter Pages | Summary Chapter Pages |
|--------|------------|----------------------|----------------------|
| Erik Trickel | 154 | ~5 (mini-paper) | ~1 |
| Faezeh Kalantari | 120 | ~5 (mini-paper) | ~1 |
| Eric Sun | 129 | ~1–2 (abbreviated) | ~2 |
| Penghui Zhang | 67 | — | ~2 (combined) |
| Kyle Zeng | 20 | — | ~2–3 (combined) |
| Marzieh Bitaab | 139 | — | ~2 (conclusion) |

The sweet spot for a mini-paper planned chapter is 4–6 pages. Combined with a 1-page summary chapter, the total proposed-work section runs 5–7 pages.
