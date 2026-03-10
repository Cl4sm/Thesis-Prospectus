# [Saluki](https://www.ndss-symposium.org/wp-content/uploads/2018/07/bar2018_19_Gotovchits_paper.pdf)

### __Overview__
- Uses static taint analysis
- developed uflux: static analysis technique for path-sensitive, context-sensitive recovery of data
- created domain-specific language to express security properties as formal specifications
- works on COTS, x86, x86-64, and ARM
- CWEs:
    - CWE-89 (SQL Injection)
    - CWE-337/676 (Predictable Seed in PRNG)
    - CWE-252 (Unchecked Return Values)

### __uflux__
- generates data dependency facts in a path and context sensitive manner
- executes in an emulator catching all reads and writes to registers/memory
- can start at any instruction and re-execute with different program state
- no need for OS or runtime support
- dances around the topic of scalability
- evaluated against Coreutils for correctness

### __Policy Specifications__
- i.e. `read(x) should not flow into a system(cmd)`
- "We have developed a policy language
that abstracts out binary specific details such as calling
conventions, registers, etc. from the policy itself"

### __Logic Engine__
- for checking security properties over ex-
plicit data dependence facts and implicit control dependence
along paths.

### __Listed Contributions__
1. A new approach for collecting path- and context-sensitive
data dependency information called μflux
2.  verification framework comprising (a) a sound logic
system, (b) a security policy language, and (c) a solver
decision procedure. The framework enables efficient, decidable detection of common taint-style (data dependence)
vulnerability patterns.
3. An experimental evaluation where we use Saluki for
vulnerability discovery. We demonstrate vulnerability
specifications, discovering 6 zero-day vulnerabilities in five
different vendor SOHO router products across 5 different
CWEs. We also use Saluki to find known vulnerabilities
in the Linux kernel, OpenSSL (Heartbleed), Pidgin, and
C++ compiled binaries.
4. An open source implementation. Saluki currently
supports the ARM, x86, and x86-64 architectures,
and can parse ELF, PE, and in general any exe-
cutable format that IDA Pro can parse.2 It is avail-
able at https://github.com/BinaryAnalysisPlatform/bap-
plugins/tree/master/saluki

### __Run Procedure__
- Loads in the specification
- Gets IR from BAP
- Runs uflex to collect data flow facts from all sources
- Runs solver over policies, program, and collected facts and verifies with logic system based on DSL
- Outputs condensed taint path of non-property holding paths

### __Evaluation__
- Ubuntu 14.04 LTS virtual machine with an Intel i7 2.2GHz CPU core and 6GB RAM.
- Tested 5 unique security policies for taint vulnerabilities and found 6 zero-days in 5 COTS binaries
- Evaluated on known vulnerabilities found in previous work in source code (5 binaries)
- Discovered strictly more vulnarbilities when uflux was run with flood execution
- Fast: blank policy takes 54 seconds on average per binary
- Quick overview of each zero-day
- Case study of Heartbleed
- No view of what heartbleed output looked like


### __Limitations__
- Must use custom specification language
- Specifies specific source to sink and constraints (limiting in scope)
- Bound by pre-determined number of instructions to execute (Default is 10 million)
- Breaks at unhandled library functions and indirect jumps
- Can execute possible infeasible branches


### __Strengths__
- Specifies specific source to sink and constraints (limits false positives)
- Can choose to execute either branch or flood execution (default is flood)
- Gives example of policy violation
- Can model unchecked return values i.e. using failed returns of `malloc`
- Verifies logic with concrete simulation
- Can execute from any starting point
- Very fast, much more so than other solutions

---

## __Comparison to Operation Mango__
- Mango finds many sources for a given sink
- Mango can only do flood execution (non-deterministic branch evaluation)
- Mango will continue execution even when hitting undefined library functions
- Mango does not look for SQL Injection or Weak PRNG seed
- Both Saluki and Mango can't reason about buffer size but can alert to common idioms (i.e. tainted `strcpy`)
- Both explore potentially infeasible branches

