#!/bin/bash
# Render an HTML diagram to PDF using Chromium headless mode
# Usage: bash render_diagram.sh input.html output.pdf [width_px] [height_px]
#
# Requires: chromium-browser or google-chrome or chromium

set -euo pipefail

INPUT="${1:?Usage: render_diagram.sh <input.html> <output.pdf> [width] [height]}"
OUTPUT="${2:?Usage: render_diagram.sh <input.html> <output.pdf> [width] [height]}"
WIDTH="${3:-1200}"
HEIGHT="${4:-800}"

# Find Chromium
CHROME=""
for candidate in chromium-browser chromium google-chrome google-chrome-stable; do
    if command -v "$candidate" &>/dev/null; then
        CHROME="$candidate"
        break
    fi
done

if [ -z "$CHROME" ]; then
    echo "Error: No Chromium/Chrome browser found. Install chromium-browser."
    echo "  apt-get install -y chromium-browser"
    echo "  or: snap install chromium"
    exit 1
fi

# Convert relative path to absolute
INPUT_ABS="$(cd "$(dirname "$INPUT")" && pwd)/$(basename "$INPUT")"
OUTPUT_ABS="$(cd "$(dirname "$OUTPUT")" 2>/dev/null && pwd)/$(basename "$OUTPUT")" || OUTPUT_ABS="$OUTPUT"

echo "Rendering: ${INPUT} → ${OUTPUT} (${WIDTH}x${HEIGHT})"

"$CHROME" \
    --headless \
    --disable-gpu \
    --no-sandbox \
    --print-to-pdf="$OUTPUT_ABS" \
    --window-size="${WIDTH},${HEIGHT}" \
    --no-pdf-header-footer \
    --run-all-compositor-stages-before-draw \
    --virtual-time-budget=5000 \
    "file://${INPUT_ABS}" \
    2>/dev/null

if [ -f "$OUTPUT_ABS" ]; then
    echo "Success: ${OUTPUT_ABS}"
    echo "Size: $(du -h "$OUTPUT_ABS" | cut -f1)"
else
    echo "Error: PDF was not created. Check that the HTML file is valid."
    exit 1
fi
