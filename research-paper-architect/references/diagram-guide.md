# Diagram Rendering Guide

## Rendering Pipeline

All diagrams follow the same pipeline: HTML source → browser render → PDF output.

### Tool: Chromium headless rendering

The render script uses Chromium in headless mode to capture an HTML page as a PDF. This produces crisp vector graphics suitable for publication.

```bash
bash "${SKILL_ROOT}/scripts/render_diagram.sh" input.html output.pdf [width_px] [height_px]
```

Default dimensions: 1200x800px. For column-width figures, use 600x400. For full-page figures, use 1200x800.

## Design Principles

### Color Palette (Publication-Friendly)

Use this palette for consistency across all figures. It is colorblind-safe and prints well in grayscale.

| Role | Hex | Name | Grayscale |
|------|-----|------|-----------|
| Primary | #2563EB | Blue-600 | Dark gray |
| Secondary | #DC2626 | Red-600 | Medium gray |
| Tertiary | #059669 | Emerald-600 | Medium-light |
| Accent | #D97706 | Amber-600 | Light gray |
| Neutral BG | #F3F4F6 | Gray-100 | Very light |
| Border | #6B7280 | Gray-500 | Medium |
| Text | #111827 | Gray-900 | Near-black |

### Typography
- Labels: 14px sans-serif (Arial, Helvetica)
- Sublabels: 11px
- Titles: 16px bold
- All text must be readable at 50% zoom (simulates print size)

### Layout Rules
- Minimum 20px padding around all elements
- Arrows: 2px stroke, pointed heads, labeled when ambiguous
- Boxes: rounded corners (4px radius), 1px border, light fill
- Group related components with dashed borders and a group label

## Diagram Type Templates

### 1. System Architecture

HTML structure:
```html
<div class="architecture">
  <div class="component" style="...">
    <div class="component-label">Component Name</div>
    <div class="component-detail">Brief description</div>
  </div>
  <svg class="arrow"><!-- connection --></svg>
</div>
```

Key elements: components as rounded boxes, arrows showing data/control flow, color coding by subsystem, clear input/output boundaries.

### 2. Data Flow Diagram

Shows transformation pipeline from source to sink. Use horizontal layout (left-to-right) for linear flows, vertical for branching.

Key elements: source nodes (rounded), transform nodes (rectangular), sink nodes (rounded, different color), data labels on arrows.

### 3. Threat Model Diagram

Shows trust boundaries, assets, and attacker capabilities.

Key elements: dashed lines for trust boundaries, red for attacker-controlled components, green for trusted components, labeled attack vectors.

### 4. Evaluation Charts

For quantitative results. Use Chart.js or pure SVG.

Bar charts: grouped bars for comparison, error bars when applicable, baseline highlighted.
Line charts: for scaling experiments, log scale when ranges span orders of magnitude.
CDF plots: for distribution comparisons.
Heatmaps: for correlation or coverage matrices.

### 5. Algorithm Layout

Pseudocode with visual annotations. Use a code-like monospace layout with colored highlights for key operations.

### 6. Comparison Tables

Feature comparison matrices. Use checkmarks (✓), crosses (✗), and partial marks (◐) with a legend.

### 7. Timeline / Gantt

Horizontal bars showing phases, dependencies, and milestones. Good for showing experiment workflow or system pipeline stages.

## Quality Checklist

Before finalizing any diagram:
- [ ] Readable at column width (3.5 inches / ~8.5cm)
- [ ] All text ≥ 8pt when printed
- [ ] Colorblind-safe (test with a simulator or ensure grayscale works)
- [ ] No text clipping or overflow
- [ ] Caption written (caption goes BELOW figures, ABOVE tables)
- [ ] Referenced in text with \ref{}
- [ ] PDF output is vector (not rasterized)
