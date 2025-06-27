#!/bin/bash

# Name of the output PDF
OUTPUT="main.pdf"

# Clean up old auxiliary files
echo "Cleaning previous build files..."
rm -f *.aux *.log *.out *.toc *.lof *.lot *.bbl *.blg *.fls *.fdb_latexmk "$OUTPUT"

# Compile with pdflatex → bibtex → pdflatex x2 for cross-references
echo "Compiling LaTeX document..."
pdflatex main.tex
bibtex main || true     # Only needed if you add bibliography with BibTeX
pdflatex main.tex
pdflatex main.tex

# Final check
if [ -f "$OUTPUT" ]; then
  echo "✅ Compilation successful: $OUTPUT"
else
  echo "❌ Compilation failed."
fi
