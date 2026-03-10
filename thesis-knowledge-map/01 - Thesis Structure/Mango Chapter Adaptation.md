# Mango Chapter Adaptation

Guide for converting the USENIX Security '24 paper into Chapter 3.

## What You Have
- Published paper: `mango_usenix24.pdf` (12-page conference format)
- Paper source: `mango-paper/paper/` (LaTeX source, figures)
- Literature review notes: `mango-paper/literature review/`
- Ideas file: `mango-paper/ideas.md` (analysis improvements, future work)
- Current draft: `prospectus/chapters/03-mango.tex` (~64k chars, already the longest chapter)

## What's Already Done
The chapter draft is substantial. It already restructures the paper into dissertation format with expanded sections.

## What to Expand

### Rich Expressions (core innovation)
The conference paper compressed this. In the dissertation:
- Full formal definition of the value domain
- Step-by-step walkthrough of a complete trace
- More examples showing what Rich Expressions can and can't distinguish
- Compare explicitly to traditional taint bits

### Ablation Study
Conference papers always compress these. Add:
- Full data tables
- Per-optimization breakdown (what happens without Sink-to-Source? Without Assumed Nonimpact?)
- Analysis of why each optimization helps

### Large-Scale Results
10,834 TruPoCs across 770,374 binaries. Characterize:
- Vulnerability distribution by vendor
- Most common vulnerability patterns
- Distribution of CWE-78 vs CWE-121
- Examples of interesting cross-binary flows

### Limitations (from `ideas.md`)
The ideas file suggests ongoing work:
- NVRAM variable resolution improvements
- Global variable filtering (no writes, no XREFS)
- Process calling IPC (if program A is vuln via argv, can program B call it?)
- Better source categorization (argv, nvram, read)

These are honest limitations that strengthen the chapter and motivate [[AIL Symbolic Execution]].

## Figures
Check `mango-paper/artifacts/` for any supplementary figures or data not used in the paper.

## Related
- [[Operation Mango]]
- [[Chapter 3 - Mango Chapter]]
- [[MangoDFA]]
