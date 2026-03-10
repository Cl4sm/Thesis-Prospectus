# Artiphishell Writing Strategy

This is the most important writing guidance in the vault. Chapter 4 must be entirely original text because you led the project but did not write the paper.

## The Constraint
- Published paper (`Artiphishell.pdf`) is **reference only**
- Every sentence must be your own
- You cannot restructure or adapt the paper the way you can with [[Chapter 3 - Mango Chapter]]

## The Advantage
This is actually a strength. You get to write fresh for a dissertation audience. You're not compressing a 12-page paper into 25 pages; you're telling the story from scratch, from YOUR perspective as project lead.

## Strategy: Write as the Architect

Frame every section around decisions you made and why:

### Architecture Section
- "I designed the pipeline as 4 stages because..."
- "We chose pydatatask over [alternatives] because..."
- "The [[Analysis Graph]] serves as shared memory because message-passing would have..."
- What went wrong with early designs? What got ripped out and replaced?

### Each Component Section
For each agent/tool (AFL++, Nautilus, LLuMinar, Kumushi, DyVA, patchers):
1. What problem does it solve in the pipeline?
2. How does it interact with the [[Analysis Graph]]?
3. What design tradeoffs did you face?
4. What worked and what didn't?

### Evaluation Section
- AIxCC scoring breakdown: VDS, PRS, SAS, BDL
- Per-challenge results if available (SQLite, Jenkins, Linux netfilter)
- Comparison to other teams (if public)
- Ablation: which components contributed most?

### Lessons Learned
This section is already strong. Expand with:
- Specific failure modes you encountered
- The evolution of the validation pipeline (what broke before you added FuzzPass/CriticPass?)
- How would you redesign the system if you started over?

## Voice Checklist for This Chapter
- [ ] Every claim about architecture references a concrete decision you made
- [ ] Physical verbs: "bolted on," "ripped out," "wired together," "stripped back"
- [ ] No em dashes
- [ ] No [[Banned Phrases]]
- [ ] Parenthetical asides for honest assessments: "(this worked better in theory than practice)"
- [ ] Specific numbers wherever possible
- [ ] Forward-reference to [[AIL Symbolic Execution]] in the lessons learned

## What to Pull from the Paper (as reference)
You can look at `Artiphishell.pdf` for:
- Component names and their correct spellings
- Numerical results (scoring, timing)
- Algorithm details you want to describe in your own words
- Figure concepts (but redraw them)

You CANNOT copy or closely paraphrase any text.

## Suggested Writing Order
1. Architecture and orchestration (this is YOUR design)
2. Lessons learned (this is YOUR reflection)
3. Preprocessing (straightforward to describe)
4. Vulnerability discovery (largest section, most components)
5. Root cause analysis (Kumushi + DyVA)
6. Patching and validation
7. Evaluation (may need to gather data)

## Related
- [[Artiphishell]] (project overview)
- [[Chapter 4 - Artiphishell Chapter]]
- [[Multi-Agent Architecture]]
- [[Voice DNA Rules]]
