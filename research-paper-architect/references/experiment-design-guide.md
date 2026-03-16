# Experiment Design Guide

## Philosophy

Experiments exist to convince skeptical reviewers that your claims are true. Every experiment must tie to a specific contribution claim. Every metric must measure something the claim asserts. If you can't draw a line from experiment → claim, cut the experiment.

## The Claim-Experiment Matrix

Before designing anything, build this matrix:

| Claim | Research Question | Experiment Type | Baselines | Metrics |
|-------|-------------------|-----------------|-----------|---------|
| C1: Our tool finds more bugs than X | RQ1: Detection coverage | Comparative | X, Y, Z | True positives, false positives, unique bugs |
| C2: Our tool scales to N binaries | RQ2: Scalability | Scaling study | X, time baseline | Analysis time, memory, binaries completed |
| C3: Key technique T contributes to performance | RQ3: Ablation | Ablation study | Full system, system without T | Same as RQ1/RQ2 |

## Experiment Types

### Comparative Evaluation
Compare your system against state-of-the-art baselines on the same dataset.

Requirements:
- At least 2 baselines (ideally the top 1-2 systems from the last 3 years)
- Same dataset, same hardware, same configuration where possible
- If you can't reproduce baseline results, cite their published numbers and note the difference in setup
- Report absolute numbers, not just percentages

### Scalability Study
Show how your system behaves as input size grows.

Requirements:
- At least 5 data points on the scaling axis
- Log-scale axes when ranges span orders of magnitude
- Include both time and memory
- Show where baselines break down (timeout, crash, OOM)

### Ablation Study
Remove or disable key components of your system to show each one contributes.

Requirements:
- One ablation per key technique/component
- Compare against the full system (not against baselines)
- Same dataset and metrics as the comparative evaluation
- Statistical significance if applicable (multiple runs, confidence intervals)

### Case Study
Deep dive into specific instances where your system succeeds (or fails).

Requirements:
- At least 2-3 case studies, covering both success and failure
- Enough detail that a reader could reproduce the analysis
- Explain WHY the system succeeded or failed, not just that it did

### User Study (if applicable)
Show that humans benefit from your tool.

Requirements:
- IRB approval (mention this)
- At least 10 participants for quantitative claims
- Describe participant demographics and experience level
- Both quantitative metrics and qualitative feedback

## Metrics Selection

### For Bug-Finding Tools
- True positives (confirmed vulnerabilities)
- False positives (and false positive rate)
- Unique bugs (found by your tool but not by baselines)
- Time to first bug
- CVEs obtained (if applicable)

### For Analysis Tools
- Precision and recall (against ground truth if available)
- Analysis time (per-unit and total)
- Memory consumption
- Code coverage (if relevant)
- Scalability: # of units analyzed successfully

### For Defense Systems
- Security: attack success rate with/without defense
- Performance overhead (latency, throughput, memory)
- Compatibility: % of programs that work correctly under the defense
- False alarm rate

## Statistical Rigor

- Run experiments 3-5 times when randomness is involved (fuzzing, sampling)
- Report mean ± standard deviation, or median + IQR for skewed distributions
- Use appropriate tests: Mann-Whitney U for comparing two groups, Vargha-Delaney A̧₁₂ for effect size in fuzzing
- State the significance level (α = 0.05 unless justified otherwise)
- For fuzzing specifically: follow the guidelines from "Evaluating Fuzz Testing" (Klees et al., CCS 2018)

## Threats to Validity

Every evaluation section must include a threats-to-validity discussion. Common categories:

### Internal Validity
- Could bugs in your implementation explain the results?
- Are there confounding variables? (e.g., different hardware, different compiler versions)
- Is your ground truth actually correct?

### External Validity
- Does your dataset represent real-world usage?
- Would results hold on different architectures, languages, or domains?
- How sensitive are results to configuration parameters?

### Construct Validity
- Do your metrics actually measure what you claim?
- Is "number of bugs found" a good proxy for "security improvement"?
- Could your metric be gamed? (e.g., finding many duplicates of the same bug)

## Practical Constraints

When designing experiments, be honest about what's feasible:
- How much compute time do you have?
- Can you actually get the baseline tools running?
- Is the dataset publicly available, or do you need to create one?
- Do you need IRB approval?

It's better to have 3 well-executed experiments than 6 sloppy ones. If an experiment would take 3 months of compute and you have 2 weeks, propose a smaller version that still tests the claim, and acknowledge the limitation.

## Presenting Results

### Tables
- Column headers: metric names with units
- Bold the best result per metric
- Include a "Total" or "Average" row
- Note any timeouts or crashes (don't silently exclude them)

### Figures
- Bar charts for discrete comparisons (tools, configurations)
- Line charts for continuous relationships (time vs. input size)
- Box plots for distributions (multiple runs of fuzzing)
- CDF plots for comparing distributions directly
- Always include axis labels with units
- Always include a legend (even if it seems obvious)
