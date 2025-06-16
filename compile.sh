#!/bin/bash

# Name of your main tex file (without .tex extension)
MAIN_FILE="main"

# First pass
pdflatex -interaction=nonstopmode $MAIN_FILE.tex

# Second and third pass for cross-references
pdflatex -interaction=nonstopmode $MAIN_FILE.tex
pdflatex -interaction=nonstopmode $MAIN_FILE.tex

echo "✅ Done! PDF generated: $MAIN_FILE.pdf"
