# [Arbiter](https://www.usenix.org/system/files/sec22-vadayath.pdf)
 
### __Overview__
- Identify set of vulnerability properties applicable to static and dynamic analysis improving precision and scalability respectively
- Carefully choosing vulnerabilities with properties that can be leveraged during both static and dynamic analysis is key (allows for proper scoping during detection)
- CWEs:
    - CWE-131 (Incorrect Calculation of Buffer Size)
    - CWE-252 (Unchecked Return Value)
    - CWE-134 (Uncontrolled Format String)
    - CWE-337 (Predictable Seed in Pseudo-Random Number Generator)

### __Listed Contributions__
- We identify a specific set of vulnerability properties that
allow for the effective combination of static analysis and
dynamic analysis, especially DSE, to achieve precision
while maintaining scalability.
- We develop ARBITER, a framework that combines static
analysis and DSE to identify bugs. ARBITER operates
without any requirement for source code or build sys-
tems, and includes novel improvements to both static
and dynamic techniques. Creating specifications of new
vulnerability classes in ARBITER is inexpensive.
- We perform a large-scale evaluation of ARBITER, ana-
lyzing 76,516 binaries for four bug classes.

### __Vulnerability Discovery Techniques (Related Work)__
- Related work for White-box Static Vulnerability Analysis
- Related work for Dynamic Analysis on Binaries
- Related work for Binary Static Analysis enhanced by DSE
- Related work reaveals lack of *economic*, *scalable*, and *low-human-inference* techniques with low false positive and false negative rates

### __Vulnerability-Targeted Static Analysis__
- __Data-flow sensitive vulnerabilities (P1)__: approachable by static techniques and also allow for additional dynamic verification of data flows
- __Easily identifiable sources or sinks (P2)__: use DSE over CFG source -> sink slices to fix over-approximations and improve overall system precision
- __Control-flow-determined aliasing (P3)__: most vulnerabilities incorporate local variables accessed via the stack whose location can be determined by control-flow
- __Choosing the right techniques__: 
    - P1 defines the scope of vulnerabilities that __Arbiter__ can support and use DSE to reason about complex control flows
    - P2 defines a pre-condition to achieve high scalablity by choosing small program slices, but this lacks state information
    - P3 bypasses the aliasing issue allowing UCSE (Under Constrained Symbolic Execution)

### __Arbiter Framework__
- Input: The Binary and Vulnerability Description
- Identifying vulnerable flows: Compares the VD against the CFG and Data Dependencies resulting in paths satisfying the VD
- Verifying vulnerable conditions: UCSE to execute verified paths and recover data relationships between source and sink.
- Reducing context-based false positives: Symbolically executes slice to sink to increase context sensitivity

### __SymDFT__
- Graph-based and taint-based static analysis
- SymDFT: Focuses on precion and scalability while sacrificing soundness
- Models basic blocks in path/context-sensitive manner, registers, memory, syscalls, and fds
- Traverses BB in topological order entering callees
- Branching policy: Forced and Blanket execution. At each branch it forks and follows all paths regardless of branch feasibility collecting path predicates as emulation progresses but does not evaluate them at this stage.
- Termination: Each loop visited at most 3 times and returns abstract state when callee depth is more than 2

### __Dataflow Constraints__
- Extracts symbolic expressions at sink for data dependencies
- If constraints are satisfiable from source to sink it reports the vuln

### __Evaluation__
- Ran on Juliet dataset and manually confirmed 190 vulnerabilities in testcases that were considered safe by previous work
- a performance evaluation on the coreutils Linux binaries to measure the computational cost of different parts of our techniques
- Kubernetes cluster of Intel Xeon CPUs
at 2.30GHz, with one core and 4GB of RAM dedicated to
the analysis of each binary
- Evaluated on 76,516 binaries from x86-64 Ubuntu 18.04 repos
- We manually analyzed all of these 1095 alarms and were able to classify 1036 alarms into 636 True Positives and 400 False Positives
- Describes classes of False Positives
- Mentions responsible disclosure
- Case study of OCaml bug
- Breaks down TP and FP by CWE

Class | Alerts | True Positive | VFP | DFP | UT
---|:---:|:---:|:---:|:---:|---:
CWE-131 | 436 | 194 | 184 | 11 | 47
CWE-134 | 158 | 12 | 139 | 3 | 4
CWE-252 | 159 | 83 | 15 | 56 | 5
CWE-337 | 377 | 372 | 0 | 2 | 4

### __Comparative Evaluation__
- Compares Arbiter to other bug-finding tools
    - AFL
    - Code QL
    - Infer
    - Juliet

### __Limitations__
- Limited Soundness due to UCSE, potential to miss vulns
- Vulnerability Descriptions are necessary
- Sets callee depth to 2

### __Strengths__
- Scalability due to UCSE
- Verification of Vuln Dataflow through source -> sink constraints

---

## Comparison to Operation Mango
- Mango does not do symbolic Dataflow verification
- Arbiter doesn't mention time cost of evaluation but Mango is faster
- Mango builds context while Arbiter ignores it until the verification phase
- Mango analsis depth is at most 7 and callee depth of at most 5
- Arbiter must evaluate from source to sink and only does on a per-function level if only the sink is specified