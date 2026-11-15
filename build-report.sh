#!/usr/bin/env bash
# IPBeja report template: Markdown → PDF via Pandoc + XeLaTeX
# Usage: ./build-report.sh path/to/report.md [output.pdf]
# Runs from repo root so relative paths (fonts/, resources/, main.bib) resolve.

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ $# -lt 1 ]]; then
  echo "Usage: $0 <input.md> [output.pdf]"
  exit 1
fi

INPUT_MD="$(realpath "$1")"
OUTPUT_PDF="${2:-${INPUT_MD%.md}.pdf}"
OUTPUT_DIR="$(dirname "$OUTPUT_PDF")"
mkdir -p "$OUTPUT_DIR"
OUTPUT_PDF="$(realpath "$OUTPUT_DIR")/$(basename "$OUTPUT_PDF")"

WORKDIR="$(mktemp -d)"
trap 'rm -rf "$WORKDIR"' EXIT

cp "$REPO_ROOT/latexmkrc" "$WORKDIR/"
cp -r "$REPO_ROOT/fonts" "$WORKDIR/"
cp -r "$REPO_ROOT/resources" "$WORKDIR/"
cp "$REPO_ROOT/main.bib" "$WORKDIR/" 2>/dev/null || true

BASENAME="$(basename "${OUTPUT_PDF%.pdf}")"
TEX_FILE="$WORKDIR/$BASENAME.tex"

echo "Generating LaTeX from $INPUT_MD ..."
pandoc "$INPUT_MD" \
  --from=markdown \
  --to=latex \
  --standalone \
  --template="$REPO_ROOT/pandoc-template.tex" \
  --top-level-division=chapter \
  --syntax-highlighting=none \
  --biblatex \
  --output="$TEX_FILE"

echo "Compiling PDF with XeLaTeX ..."
cd "$WORKDIR"
latexmk -xelatex -interaction=nonstopmode -halt-on-error \
  "$BASENAME.tex"

cp "$WORKDIR/$BASENAME.pdf" "$OUTPUT_PDF"
echo "Done: $OUTPUT_PDF"