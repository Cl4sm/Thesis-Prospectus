# Thesis Prospectus - Makefile
# Wil Gibbs | ASU SEFCOM
#
# Usage:
#   make       - Build the PDF (two pdflatex passes for cross-refs/TOC)
#   make once  - Single pdflatex pass (faster, refs may be stale)
#   make clean - Remove ALL artifacts including PDF (so next 'make' rebuilds)

MAIN     = main
TEX      = pdflatex
TEXFLAGS = -interaction=nonstopmode -halt-on-error
SOURCES  = $(MAIN).tex \
           frontmatter/titlepage.tex \
           frontmatter/references.tex \
           chapters/01-introduction.tex \
           chapters/02-related-work.tex \
           chapters/03-mango.tex \
           chapters/04-artiphishell.tex \
           chapters/05-proposed-work.tex

.PHONY: all once clean

# Default: two passes for cross-references and TOC
all: $(MAIN).pdf

$(MAIN).pdf: $(SOURCES)
	$(TEX) $(TEXFLAGS) $(MAIN).tex
	$(TEX) $(TEXFLAGS) $(MAIN).tex

# Single pass (faster iteration)
once:
	$(TEX) $(TEXFLAGS) $(MAIN).tex

# Remove everything so 'make' will rebuild from scratch
clean:
	-rm -f $(MAIN).pdf
	-rm -f $(MAIN).aux $(MAIN).log $(MAIN).out $(MAIN).toc
	-rm -f $(MAIN).lof $(MAIN).lot $(MAIN).bbl $(MAIN).blg
	-rm -f $(MAIN).nav $(MAIN).snm $(MAIN).vrb
	-rm -f $(MAIN).fdb_latexmk $(MAIN).fls $(MAIN).synctex.gz
