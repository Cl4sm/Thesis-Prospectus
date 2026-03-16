#!/bin/bash
# Generate a LaTeX paper skeleton
# Usage: bash generate_latex_skeleton.sh "Paper Title" "Author Names" output_dir
#
# Creates a template-agnostic LaTeX project with section stubs

set -euo pipefail

TITLE="${1:?Usage: generate_latex_skeleton.sh <title> <authors> <output_dir>}"
AUTHORS="${2:?Usage: generate_latex_skeleton.sh <title> <authors> <output_dir>}"
OUTPUT_DIR="${3:?Usage: generate_latex_skeleton.sh <title> <authors> <output_dir>}"

mkdir -p "${OUTPUT_DIR}/sections"
mkdir -p "${OUTPUT_DIR}/figures"

# Main document
cat > "${OUTPUT_DIR}/main.tex" << MAINEOF
\\documentclass[12pt]{article}

% Core packages
\\usepackage[margin=1in]{geometry}
\\usepackage{graphicx}
\\graphicspath{{figures/}}
\\usepackage{booktabs}
\\usepackage{amsmath,amssymb}
\\usepackage{algorithm}
\\usepackage{algpseudocode}
\\usepackage{listings}
\\usepackage{xspace}
\\usepackage{hyperref}
\\usepackage[numbers]{natbib}
\\usepackage{xcolor}

% Custom commands
\\newcommand{\\name}{\\textsc{SystemName}\\xspace}
\\newcommand{\\ie}{\\textit{i.e.}\\xspace}
\\newcommand{\\eg}{\\textit{e.g.}\\xspace}
\\newcommand{\\cf}{\\textit{cf.}\\xspace}
\\newcommand{\\etal}{\\textit{et al.}\\xspace}

% TODO command (remove before submission)
\\newcommand{\\todo}[1]{\\textcolor{red}{[TODO: #1]}}

\\title{${TITLE}}
\\author{${AUTHORS}}

\\begin{document}

\\maketitle

\\begin{abstract}
% BRIEF: 200-300 words. Structure: problem (2 sentences) → gap (1-2 sentences)
% → approach (2-3 sentences) → key results (2-3 sentences with numbers).
\\todo{Write abstract last, after all sections are complete.}
\\end{abstract}

\\input{sections/01-introduction}
\\input{sections/02-background}
\\input{sections/03-design}
\\input{sections/04-implementation}
\\input{sections/05-evaluation}
\\input{sections/06-discussion}
\\input{sections/07-related-work}
\\input{sections/08-conclusion}

\\bibliographystyle{plainnat}
% \\bibliography{references}  % uncomment when using BibTeX
% Or use inline thebibliography:
\\begin{thebibliography}{99}
\\todo{Add references}
\\end{thebibliography}

\\end{document}
MAINEOF

# Section: Introduction
cat > "${OUTPUT_DIR}/sections/01-introduction.tex" << 'EOF'
\section{Introduction}
\label{sec:introduction}

% BRIEF: 1.5-2 pages. Structure:
% P1: Problem statement with scale/impact numbers
% P2: What existing approaches do and why they fall short
% P3: Your insight and approach (the "aha" moment)
% P4: Your contributions (bulleted list with concrete claims)
% P5 (optional): Paper organization

% P1: Problem
\todo{State the problem. Include a number showing scale or impact.}

% P2: Gap
\todo{What do existing tools/techniques do? What do they miss? Be specific.}

% P3: Insight + Approach
\todo{What observation makes your approach work? Describe the approach in 3-4 sentences.}

% P4: Contributions
We make the following contributions:
\begin{itemize}
    \item \todo{Contribution 1: technique/system with a concrete description}
    \item \todo{Contribution 2: evaluation result with numbers}
    \item \todo{Contribution 3: artifact or finding}
\end{itemize}
EOF

# Section: Background
cat > "${OUTPUT_DIR}/sections/02-background.tex" << 'EOF'
\section{Background}
\label{sec:background}

% BRIEF: 1-1.5 pages. Give the reader enough context to understand Section 3.
% Don't teach a textbook. Only include background that's directly needed.
% If a threat model is needed, put it here.

\todo{Background content}

% \subsection{Threat Model}
% \label{sec:threat-model}
% \todo{Define adversary capabilities, assumptions, and scope.}
EOF

# Section: Design
cat > "${OUTPUT_DIR}/sections/03-design.tex" << 'EOF'
\section{Design}
\label{sec:design}

% BRIEF: 3-4 pages. The core technical contribution.
% Start with a high-level overview (preferably with a figure), then detail each component.
% Structure: Overview → Component A → Component B → ...
% Each subsection should explain WHAT the component does, WHY it's designed this way,
% and HOW it works (in that order).

\subsection{Overview}
\label{sec:overview}

% BRIEF: High-level architecture. Reference Figure 1.
% \begin{figure}[t]
%     \centering
%     \includegraphics[width=\columnwidth]{system-architecture}
%     \caption{\name{} architecture overview. \todo{Describe the figure.}}
%     \label{fig:architecture}
% \end{figure}

\todo{System overview}
EOF

# Section: Implementation
cat > "${OUTPUT_DIR}/sections/04-implementation.tex" << 'EOF'
\section{Implementation}
\label{sec:implementation}

% BRIEF: 0.5-1 page. Engineering details that matter for reproducibility.
% Lines of code, language, frameworks, key libraries.
% Don't repeat design decisions from Section 3.

\todo{Implementation details}
EOF

# Section: Evaluation
cat > "${OUTPUT_DIR}/sections/05-evaluation.tex" << 'EOF'
\section{Evaluation}
\label{sec:evaluation}

% BRIEF: 3-4 pages. Structure by research questions.
% Start with "We evaluate \name{} to answer the following research questions:"
% then RQ1, RQ2, RQ3 as subsections.
% Include: setup (hardware, dataset, configuration), methodology, results, analysis.

We evaluate \name{} to answer the following research questions:
\begin{itemize}
    \item \textbf{RQ1:} \todo{First research question}
    \item \textbf{RQ2:} \todo{Second research question}
    \item \textbf{RQ3:} \todo{Third research question (ablation)}
\end{itemize}

\subsection{Experimental Setup}
\label{sec:setup}

\todo{Hardware, dataset, baselines, configuration, methodology.}

\subsection{RQ1: \todo{Title}}
\label{sec:rq1}

\todo{Results and analysis for RQ1.}

\subsection{RQ2: \todo{Title}}
\label{sec:rq2}

\todo{Results and analysis for RQ2.}

\subsection{RQ3: \todo{Title}}
\label{sec:rq3}

\todo{Results and analysis for RQ3.}

\subsection{Threats to Validity}
\label{sec:threats}

\todo{Internal, external, and construct validity threats.}
EOF

# Section: Discussion
cat > "${OUTPUT_DIR}/sections/06-discussion.tex" << 'EOF'
\section{Discussion}
\label{sec:discussion}

% BRIEF: 0.5-1 page. Limitations, future work, broader implications.
% Be honest about what your system can't do. Reviewers respect honesty.

\todo{Limitations and discussion}
EOF

# Section: Related Work
cat > "${OUTPUT_DIR}/sections/07-related-work.tex" << 'EOF'
\section{Related Work}
\label{sec:related-work}

% BRIEF: 1.5-2 pages. Organize by THEME, not by paper.
% Each paragraph covers a group of related papers.
% End each paragraph by explaining how your work differs from that group.

\todo{Related work organized by theme}
EOF

# Section: Conclusion
cat > "${OUTPUT_DIR}/sections/08-conclusion.tex" << 'EOF'
\section{Conclusion}
\label{sec:conclusion}

% BRIEF: 0.5 page. Restate contributions (not the approach).
% Optional: one sentence on future directions.

\todo{Conclusion}
EOF

# Makefile
cat > "${OUTPUT_DIR}/Makefile" << 'EOF'
.PHONY: all once clean

all:
	pdflatex -interaction=nonstopmode main.tex
	pdflatex -interaction=nonstopmode main.tex

once:
	pdflatex -interaction=nonstopmode main.tex

clean:
	rm -f main.pdf main.aux main.log main.out main.toc main.bbl main.blg
EOF

echo "LaTeX skeleton created at: ${OUTPUT_DIR}"
echo "Files:"
find "${OUTPUT_DIR}" -type f | sort
echo ""
echo "Build with: cd ${OUTPUT_DIR} && make"
