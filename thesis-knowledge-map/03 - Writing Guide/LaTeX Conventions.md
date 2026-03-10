# LaTeX Conventions

## Document Setup
- Class: `report`, 12pt, 1-inch margins, double spacing
- Style: matches ASU/Marzieh's formatting
- Chapter titles: centered, uppercase
- Figures in `prospectus/figures/`, referenced via `\graphicspath{{figures/}}`

## Bibliography
- Uses `natbib` with `plainnat` style
- BUT: bibliography entries are manually written as `\bibitem` in `frontmatter/references.tex`
- This is NOT a `.bib` file. Do not try to use BibTeX
- When adding new citations: append `\bibitem{key}` entries to `frontmatter/references.tex`
- Cite with `\cite{key}` in text

## Build Commands
All from `prospectus/` directory:
```bash
# Full build (two passes for cross-refs/TOC)
make

# Quick single pass
make once

# Clean
make clean
```

Windows: `build.bat` (or `build.bat once`, `build.bat clean`)

Output: `prospectus/main.pdf`

## File Structure
```
prospectus/
├── main.tex                    ← root document
├── chapters/
│   ├── 01-introduction.tex
│   ├── 02-related-work.tex
│   ├── 03-mango.tex           ← longest chapter
│   ├── 04-artiphishell.tex    ← needs most new writing
│   └── 05-proposed-work.tex
├── frontmatter/
│   ├── titlepage.tex
│   └── references.tex          ← hand-written bibliography
├── figures/
│   └── mango-flat.pdf          ← (and other figures)
├── Makefile
└── build.bat
```

## Related
- [[Chapter 2 - Related Work]] — citation-heavy chapter
- [[Thesis Structure Overview]]
