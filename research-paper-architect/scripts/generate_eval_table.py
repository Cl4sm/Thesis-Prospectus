#!/usr/bin/env python3
"""
Generate LaTeX evaluation tables from structured experiment data.

Usage:
    python generate_eval_table.py data.json output.tex

Input JSON format:
{
    "table_type": "comparison" | "ablation" | "scaling",
    "caption": "Table caption text",
    "label": "tab:comparison",
    "columns": ["System", "Precision", "Recall", "Time (s)"],
    "highlight_best": true,
    "highlight_column": [1, 2],  // 0-indexed columns to bold-best
    "highlight_direction": "max",  // "max" or "min"
    "rows": [
        {"values": ["Our System", "0.95", "0.87", "42"], "is_ours": true},
        {"values": ["Baseline A", "0.82", "0.91", "380"], "is_ours": false},
        {"values": ["Baseline B", "0.78", "0.65", "120"], "is_ours": false}
    ],
    "notes": "Bold indicates best result per column."
}

Output: LaTeX table with booktabs formatting.
"""

import json
import sys
import os


def find_best(rows, col_idx, direction="max"):
    """Find the index of the best value in a column."""
    values = []
    for row in rows:
        try:
            values.append(float(row["values"][col_idx]))
        except (ValueError, IndexError):
            values.append(None)

    if direction == "max":
        best_val = max(v for v in values if v is not None)
    else:
        best_val = min(v for v in values if v is not None)

    return [i for i, v in enumerate(values) if v == best_val]


def generate_table(data):
    """Generate LaTeX table from structured data."""
    cols = data["columns"]
    rows = data["rows"]
    ncols = len(cols)

    # Find best values for highlighting
    best_indices = {}
    if data.get("highlight_best", False):
        highlight_cols = data.get("highlight_column", list(range(1, ncols)))
        direction = data.get("highlight_direction", "max")
        for col_idx in highlight_cols:
            best_indices[col_idx] = find_best(rows, col_idx, direction)

    # Build LaTeX
    lines = []
    lines.append("\\begin{table}[t]")
    lines.append("\\centering")
    lines.append(f"\\caption{{{data['caption']}}}")
    lines.append(f"\\label{{{data['label']}}}")

    # Column spec: first column left-aligned, rest centered
    col_spec = "l" + "c" * (ncols - 1)
    lines.append(f"\\begin{{tabular}}{{{col_spec}}}")
    lines.append("\\toprule")

    # Header
    header = " & ".join(f"\\textbf{{{c}}}" for c in cols)
    lines.append(f"{header} \\\\")
    lines.append("\\midrule")

    # Rows
    for row_idx, row in enumerate(rows):
        cells = []
        for col_idx, val in enumerate(row["values"]):
            if col_idx in best_indices and row_idx in best_indices[col_idx]:
                cells.append(f"\\textbf{{{val}}}")
            else:
                cells.append(val)
        line = " & ".join(cells) + " \\\\"
        lines.append(line)

    lines.append("\\bottomrule")
    lines.append("\\end{tabular}")

    if data.get("notes"):
        lines.append(f"\\\\[2pt]")
        lines.append(f"\\small{{{data['notes']}}}")

    lines.append("\\end{table}")

    return "\n".join(lines)


def main():
    if len(sys.argv) < 3:
        print("Usage: python generate_eval_table.py data.json output.tex")
        sys.exit(1)

    input_path = sys.argv[1]
    output_path = sys.argv[2]

    with open(input_path) as f:
        data = json.load(f)

    latex = generate_table(data)

    with open(output_path, "w") as f:
        f.write(latex)

    print(f"Table written to: {output_path}")
    print(latex)


if __name__ == "__main__":
    main()
