---
name: research-paper-architect
description: |
  A*-venue research paper assistant: ideation, lit review, LaTeX skeleton, experiment design, diagrams (HTML→PDF), section drafting with strict voice/style rules, and Obsidian knowledge base. Trigger when the user wants to write a paper, structure an argument, do a literature review or gap analysis, design experiments, create academic diagrams, draft LaTeX sections, or build a research vault. Also trigger on "paper", "submission", "conference paper", "related work", "evaluation section", or any top-venue workflow. Default: cybersecurity (S&P, USENIX Security, CCS, NDSS); works for any CS subfield. Uses cybersec-citation-assistant when available.
---

# Research Paper Architect

A modular skill for producing A*-venue-quality research papers. Each phase is independently invocable. The skill enforces strict writing quality throughout, driven by a Voice DNA style guide that prevents the hollow, over-hedged prose that gets papers desk-rejected.

## How This Skill Works

Seven phases, each callable on its own or as part of a guided sequence. The user says what they need; you figure out which phase applies and run it. If the user has a raw idea, start at Phase 1. If they already have a draft and need experiment help, jump to Phase 4.

**Critical rule:** This is a collaborative process. Every phase involves asking the user questions, presenting options, giving counterexamples, and getting explicit approval before producing output. Do not silently generate a full paper. Write incrementally, get feedback, revise.

**Before writing anything**, read `references/voice-dna-rules.md` in this skill's root. Every piece of LaTeX output must comply with those rules. No exceptions.

## Phase 1: Ideation & Novelty Stress-Test

**Trigger:** User has a research idea and wants to develop it, or says something like "I have this idea for a paper about X."

**Goal:** Crystallize a novel contribution statement that would survive peer review at an A* venue.

### Workflow

1. **Extract the core idea.** Ask the user to explain the idea in 2-3 sentences. If they ramble, distill it: "So the core claim is: [X]. Is that right?"

2. **Identify the contribution type.** Research contributions fall into a few categories; understanding which one shapes everything downstream:
   - **New technique/system** — you built something that works better
   - **New formalization** — you modeled something that wasn't modeled before
   - **New empirical finding** — you measured something nobody measured
   - **New combination** — you combined existing things in a non-obvious way that produces emergent value
   - **Systematization** — you organized a messy subfield (SoK papers)

3. **Stress-test novelty.** This is where you earn your keep. For each claim the user makes, push back:
   - "What's the closest existing work to this? How is yours different?"
   - "If a reviewer says 'this is just X + Y bolted together,' what's your defense?"
   - "What specific thing does your approach enable that was impossible (or impractical) before?"
   - Run a quick literature search using the citation assistant scripts (if available) to check for prior art. Present what you find and ask the user to differentiate.

4. **Draft the contribution statement.** Write 3-5 bullet points, each a concrete, falsifiable claim. Example:
   ```
   We make the following contributions:
   \begin{itemize}
   \item A novel data-flow analysis (\name{}) that tracks value transformation
         history through Rich Expressions, enabling scalable taint analysis
         on stripped binaries without function summaries.
   \item An evaluation on 7 firmware images showing \name{} analyzes 27$\times$
         more binaries than SaTC in comparable time, with an average
         per-binary analysis time of 8 minutes vs. 6.56 hours.
   \item Discovery of 56 previously unknown vulnerabilities, including 14
         confirmed CVEs.
   \end{itemize}
   ```
   Each bullet must contain a number, a comparison, or a concrete artifact. "We propose a novel approach" is not a contribution; it is a wish.

5. **Define the narrative arc.** Every strong paper has a story:
   - What's the **problem**? (1-2 sentences, with a number showing scale/impact)
   - What's the **gap** in existing work? (What do current tools miss, and why?)
   - What's the **insight**? (The key observation that makes your approach work)
   - What's the **approach**? (How the insight becomes a system/method)
   - What's the **evidence**? (Experiments that prove the claims)

   Write this as a one-paragraph "elevator pitch" and get user approval before proceeding.

6. **Output:** Save the contribution statement and narrative arc to the project knowledge base (Phase 7).

## Phase 2: Literature Review & Gap Analysis

**Trigger:** User needs related work, background, or says "what's the state of the art in X."

**Goal:** Build a structured understanding of the research landscape, identify the gap your paper fills, and produce a positioning matrix.

### Workflow

1. **Scope the search.** Ask the user:
   - What are the 2-3 most relevant keywords/topics?
   - Any papers you already know are related? (These seed the search.)
   - What year range? (Default: last 5-7 years for techniques, broader for foundational work.)

2. **Search systematically.** Use the cybersec-citation-assistant scripts if available:
   ```bash
   bash "${CYBERSEC_CITATION_SKILL}/scripts/s2_bulk_search.sh" "QUERY" "2019-" 30
   ```
   If the citation skill isn't available, use web search as fallback but flag that results aren't venue-validated.

   Run multiple queries covering different facets of the problem. For a paper on "symbolic execution for firmware," you'd search:
   - `"symbolic execution binary analysis firmware"`
   - `"static analysis IoT vulnerability detection"`
   - `"path feasibility constraint solving binary"`

3. **Build a positioning matrix.** For each related paper, extract:
   - **What it does** (1 sentence)
   - **Key technique** (the mechanism)
   - **Limitation** (what it can't do that your work addresses)
   - **Venue + year** (for quality assessment)

   Present this as a table to the user. Ask: "Are there papers missing from this? Anything I've miscategorized?"

4. **Identify the gap.** From the matrix, articulate what no existing paper does. This should connect directly to the contribution statement from Phase 1.

5. **Draft the related work narrative.** Related work sections are not literature dumps. They tell a story: "Here's what exists → here's what each line of work contributes → here's what's still missing → that's what we do." Structure it into subsections by theme, not by paper.

   Generate LaTeX for the related work section, following Voice DNA rules. Each paragraph should cover a theme (not a single paper), cite 3-5 papers, and end with the gap that group of papers leaves open.

6. **Output:** Related work LaTeX section + positioning matrix saved to knowledge base.

## Phase 3: Paper Structure & LaTeX Skeleton

**Trigger:** User wants to structure a paper, or says "help me outline this paper."

**Goal:** Generate a complete LaTeX skeleton with section outlines, argument flow annotations, and per-section writing briefs.

### Workflow

1. **Determine paper type and venue constraints.** Ask:
   - What kind of paper? (systems, measurement, formalization, SoK)
   - Approximate page limit? (Default: 13 pages for USENIX-style, 12 for IEEE)
   - Any venue-specific requirements? (anonymization, ethics section, etc.)

2. **Generate the section structure.** Standard systems security paper structure (adapt for other types):
   ```
   1. Introduction (1.5-2 pages)
   2. Background / Threat Model (1-1.5 pages)
   3. Design / Approach (3-4 pages)
   4. Implementation (0.5-1 page)
   5. Evaluation (3-4 pages)
   6. Discussion / Limitations (0.5-1 page)
   7. Related Work (1.5-2 pages)
   8. Conclusion (0.5 page)
   ```

3. **Write per-section briefs.** For each section, generate:
   - **Purpose:** What this section must accomplish
   - **Key points:** 3-5 bullets of what to cover
   - **Argument flow:** How this section connects to the one before and after it
   - **Target length:** Word/page count
   - **Pitfalls:** Common mistakes for this section type

4. **Generate LaTeX skeleton.** Template-agnostic LaTeX with:
   - `\section{}` and `\subsection{}` structure
   - `% BRIEF: ...` comments with the writing brief for each section
   - Placeholder `\label{}` and `\ref{}` for cross-references
   - Placeholder `\cite{}` for where citations will go
   - Figure/table placeholders with captions describing what should go there

5. **Review with user.** Present the skeleton and briefs. Ask: "Does this structure make sense for your paper? Anything you'd move, add, or cut?"

6. **Output:** LaTeX skeleton file + section briefs saved to knowledge base.

## Phase 4: Experiment Design

**Trigger:** User needs help designing experiments, or says "how should I evaluate this."

**Goal:** Design experiments that fully and convincingly evaluate the core idea. Impactful, thorough, and practically executable within the user's constraints.

### Workflow

1. **Understand the claims.** Pull the contribution statement from Phase 1 (or ask the user). Every experiment must tie to a specific claim. If a claim has no experiment, it's unsupported. If an experiment ties to no claim, it's wasted space.

2. **Design the evaluation structure.** For each claim, propose:
   - **Research question:** "RQ1: Does X outperform Y in terms of Z?"
   - **Methodology:** How to measure (benchmark suite, dataset, user study, formal proof)
   - **Baselines:** What to compare against (always include state-of-the-art + ablation)
   - **Metrics:** What numbers to report (precision, recall, time, coverage, etc.)
   - **Dataset/benchmark:** What to run on (existing benchmarks preferred; justify new ones)

3. **Search for baselines.** Use the citation assistant to find the current state-of-the-art tools/systems in the relevant area. For each baseline, note:
   - Is the tool/code publicly available?
   - What dataset did the original paper use?
   - What metrics did they report?
   - Can you reproduce their results?

4. **Propose the experiment set.** Present a table:
   ```
   | RQ | Claim | Method | Baselines | Metrics | Dataset |
   ```
   Ask the user: "These experiments would take approximately [X time]. Any that should be cut for practicality? Any missing?"

5. **Threats to validity.** For each experiment, identify:
   - **Internal:** Could something else explain the result?
   - **External:** Does this generalize beyond the specific test set?
   - **Construct:** Are the metrics actually measuring what we claim?

6. **Design evaluation tables and figures.** For each experiment, sketch:
   - What the results table will look like (columns, rows, metrics)
   - What figures would show (bar charts for comparison, line charts for scaling, etc.)
   - How to present statistical significance if needed

7. **Output:** Experiment design document + placeholder LaTeX tables/figures saved to knowledge base.

## Phase 5: Diagrams (HTML → PDF)

**Trigger:** User needs diagrams, or says "make me a figure for X."

**Goal:** Produce publication-quality diagrams rendered from HTML to PDF.

### Diagram Types

Read `references/diagram-guide.md` for the full rendering pipeline. The skill supports:

1. **System architecture diagrams** — components, connections, data flow
2. **Data flow diagrams** — source → transform → sink paths
3. **Threat model diagrams** — trust boundaries, attack surfaces, adversary capabilities
4. **Evaluation charts** — bar charts, line charts, heatmaps, CDF plots
5. **Algorithm layout diagrams** — pseudocode with visual annotation of key steps
6. **Comparison tables** — feature matrices, quantitative comparison tables
7. **Timeline/Gantt diagrams** — project phases, experiment sequencing

### Workflow

1. **Understand the figure's purpose.** Ask:
   - What point does this figure make? (Every figure must have a "takeaway.")
   - Where in the paper does it go? (This determines size and detail level.)
   - What's the caption? (Write the caption first; it clarifies what the figure must show.)

2. **Draft the diagram.** Generate an HTML file using clean CSS and SVG/canvas elements. Use:
   - Consistent color palette (read `references/diagram-guide.md` for the default palette)
   - Clear labels, no tiny text
   - Publication-friendly: looks good in grayscale, works at column width

3. **Render to PDF.** Use the rendering script:
   ```bash
   bash "${SKILL_ROOT}/scripts/render_diagram.sh" input.html output.pdf [width_px] [height_px]
   ```

4. **Review with user.** Show the rendered PDF. Ask: "Does this communicate the right thing? Anything to add, remove, or rearrange?"

5. **Output:** PDF figure + source HTML saved to knowledge base figures/ directory.

## Phase 6: Section Writing

**Trigger:** User wants to write or revise a specific section, or says "help me write the introduction."

**Goal:** Produce LaTeX section text at A*-venue quality, following Voice DNA rules strictly.

### Before Writing

1. **Read `references/voice-dna-rules.md`** — this is non-negotiable.
2. Pull context from the knowledge base: contribution statement, related work, experiment design.
3. Ask the user: "What's the key point of this section? Any specific things you want to include or avoid?"

### Writing Process

1. **Write a first draft.** Generate LaTeX for the section. Follow these principles:
   - **Lead with the point.** First sentence of every paragraph states the claim or finding. Supporting evidence follows.
   - **Be concrete.** Numbers, system names, specific techniques. Never "significant improvement"; always "27x more binaries in comparable time."
   - **Vary structure.** Mix short declarative sentences with longer explanatory ones. Use parenthetical asides for editorial commentary.
   - **No throat-clearing.** Cut any sentence that could be removed without losing information.
   - **Physical verbs.** "stripped back" not "simplified," "bolted on" not "added," "sanded down" not "improved."

2. **Self-check against Voice DNA.** Before presenting to the user, verify:
   - [ ] No em dashes anywhere (use commas, colons, semicolons, parentheses)
   - [ ] No banned phrases (check the full list in voice-dna-rules.md)
   - [ ] No "Not X. Y." pattern or any variant
   - [ ] No "delve," "leverage," "utilize," "robust," "landscape," "realm"
   - [ ] No "In today's..." or "It's worth noting..."
   - [ ] Numbers as digits with commas
   - [ ] Every claim has a citation placeholder or concrete evidence
   - [ ] No padding; every sentence carries information

3. **Present to user.** Show the LaTeX draft. Explain your choices: "I structured this section around [X] because [Y]. The opening paragraph establishes [Z]."

4. **Revise collaboratively.** Based on feedback, revise. Multiple rounds are expected and normal.

5. **Output:** LaTeX section file saved to knowledge base.

## Phase 7: Knowledge Base Generation

**Trigger:** User wants to create a project vault, or this phase runs automatically as other phases produce output.

**Goal:** Generate a per-project Obsidian vault with interconnected markdown files, PDF snippets, and writing guides.

### Vault Structure

```
project-name/
├── 00 - Home/
│   └── Home.md                 # Project overview, contribution statement, links to all sections
├── 01 - Paper Structure/
│   ├── Section Outline.md      # Full paper outline with writing briefs
│   ├── Argument Flow.md        # How sections connect logically
│   └── [per-section].md        # One file per section with detailed notes
├── 02 - Literature/
│   ├── Positioning Matrix.md   # Comparison table of all related work
│   ├── Gap Analysis.md         # What's missing in existing work
│   └── [paper-notes]/          # One file per important related paper
├── 03 - Experiments/
│   ├── Experiment Plan.md      # Full experiment design document
│   ├── Baselines.md            # Baseline systems and their characteristics
│   └── [per-RQ].md             # One file per research question
├── 04 - Concepts/
│   └── [concept].md            # One file per key technical concept
├── 05 - Figures/
│   ├── Figure Index.md         # All figures with captions and locations
│   └── [figure sources + PDFs]
├── 06 - Writing Guide/
│   ├── Voice DNA.md            # Style rules for this project
│   ├── Banned Phrases.md       # The kill list
│   └── Writing Samples.md      # Examples of good writing from this project
└── 07 - Action Items/
    ├── Master Checklist.md     # What's done, what's pending
    └── Timeline.md             # Deadlines and milestones
```

### Workflow

1. **Initialize the vault.** When the user starts a new project, run:
   ```bash
   bash "${SKILL_ROOT}/scripts/init_vault.sh" "project-name" "/output/path"
   ```

2. **Populate from phases.** As each phase produces output, the corresponding vault section gets updated. Phase 1 populates Home.md and Concepts/. Phase 2 populates Literature/. And so on.

3. **Cross-link aggressively.** Use `[[wikilinks]]` throughout. Every concept page should link to the papers that discuss it. Every paper note should link to the concepts it introduces.

4. **Include PDF snippets.** For key related papers, extract the most relevant figures and tables as PDFs and store them in the Literature folder with annotations.

5. **Output:** Complete Obsidian vault directory.

## Integration with Citation Assistant

When the `cybersec-citation-assistant` skill is available (check for its scripts at the standard skill path), use its search and venue-evaluation scripts for all literature operations. The citation assistant handles:
- Semantic Scholar API searches with venue quality assessment
- CORE ranking lookups for any venue
- Author H-index and citation impact
- DOI → BibTeX generation
- arXiv/ePrint citability assessment

If the citation assistant is not available, fall back to web search but clearly flag to the user that venue quality has not been validated.

## Adapting for Non-Security Domains

The default configuration targets systems security. To adapt for other CS subfields:

1. **Venue hierarchy:** Ask the user which venues are top-tier in their subfield. Build a custom ranking.
2. **Paper structure:** Some fields prefer different structures (ML papers often have "Problem Setup" instead of "Threat Model"). Adapt accordingly.
3. **Experiment norms:** ML papers need ablations and statistical significance bars. Systems papers need scalability evaluations. Formal methods papers need proofs. Ask the user what their community expects.
4. **Citation norms:** Some fields cite heavily (50+ refs); others are sparser (25-30). Match the target venue's norms.

## Quality Bar

Every output from this skill targets acceptance at an A* venue. That means:

- **Claims match evidence.** No overclaiming. If the evaluation shows 2x improvement, don't say "significant" unless you define what significant means.
- **Related work is fair.** Describe prior work accurately. Acknowledge what it does well before explaining its limitations.
- **Writing is precise.** Every sentence carries information. No padding, no filler, no "it is well known that."
- **Figures are clear.** A reviewer skimming figures and captions should understand the paper's main results.
- **Experiments are reproducible.** State versions, configurations, hardware, seeds, and runtime.
