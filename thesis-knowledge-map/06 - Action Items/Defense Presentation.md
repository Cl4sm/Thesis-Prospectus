# Defense Presentation

45-minute talk + committee grilling.

## Suggested Time Allocation

| Segment | Time | Content |
|---|---|---|
| Introduction | ~5 min | Background, motivation, [[Unifying Theme]], thesis statement |
| [[Operation Mango]] | ~15 min | MangoDFA, key innovations, results |
| [[Artiphishell]] | ~15 min | Architecture, pipeline, competition results |
| [[AIL Symbolic Execution]] | ~10 min | Proposed work, preliminary results, timeline |

## Slides to Prepare

### Opening (~5 min)
- Title slide (name, committee, date)
- The vulnerability problem (IoT scale, Mirai, AIxCC)
- The 3 walls: scalability, autonomy, precision
- Thesis statement
- PhD timeline slide (when you started, publications, comp exam, proposed timeline, target defense)

### Mango (~15 min)
- Motivating example (dlnad cross-binary vulnerability)
- Why existing tools fail (Karonte/SaTC filtering)
- MangoDFA overview: Rich Expressions, Sink-to-Source, Assumed Nonimpact
- Key figure: Mango system architecture
- Results table: 27x more binaries, 22x faster
- Large-scale results: 10,834 TruPoCs, 166 verified

### Artiphishell (~15 min)
- AIxCC challenge description
- System architecture diagram (4 stages)
- Analysis Graph as shared memory
- Key components (pick 3-4 most impressive)
- Competition results
- Lessons learned (especially static + dynamic synergy)

### Proposed Work (~10 min)
- Why AIL? (VEX vs AIL comparison)
- Three thrusts
- Preliminary results (constraint reduction)
- How all 3 projects connect (the "connective tissue" slide)
- Timeline with actual dates
- Expected contributions

## Reference Materials
- Your existing Mango USENIX presentation: `Operation Mango USENIX'24.pptx`
- Your comp exam slides: `Gibbs_Comp_Exam_copy.pptx`
- Connor's defense video: [[Reference Comp Exams]]
- Kyle's defense slides: `wiki/reference_material/dissertation/kyle_2025/defense_presentation.pdf`
- HTML defense presentation draft: `defense-presentation.html`

## Anticipate These Questions

### Coherence
- "Why are these three projects a coherent dissertation?" → See [[Unifying Theme]]
- "The Artiphishell connection to AIL-SE seems weak" → Thrust 3 makes it concrete

### Artiphishell
- "What were YOUR specific contributions vs. the team?" → Be precise about what you designed, built, directed
- "How did you compare to other AIxCC teams?" → Have numbers ready

### Proposed Work Feasibility
- "Can you build this in 13 months?" → Identify the biggest technical risk and your mitigation
- "How is this different from just running angr's existing symex?" → AIL vs VEX: type info, structured CF, simpler memory
- "What if the 15-30% constraint reduction doesn't hold on real firmware?" → Discuss fallback strategies

### Technical Depth
- "Walk me through Assumed Nonimpact on a specific binary" → Have a concrete example ready
- "How does Rich Expression composition work for nested function calls?" → Trace through an example
- "What happens when MangoDFA finds a false positive? How does AIL-SE handle it?" → Describe the two-phase pipeline

## Related
- [[Unifying Theme]]
- [[Master Checklist]]
- [[Reference Proposals]]
