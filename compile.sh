#!/bin/bash

# Set english (default)
sed -i 's,\\newcommand{\\inEnglish}\[1\]{},\\newcommand{\\inEnglish}\[1\]{#1},' cv.tex
sed -i 's,\\newcommand{\\inFrench}\[1\]{#1},\\newcommand{\\inFrench}\[1\]{},' cv.tex

pdflatex cv.tex
mv -f cv.pdf vincent_fournier_cv_en.pdf

# Set french (default)
sed -i 's,\\newcommand{\\inEnglish}\[1\]{#1},\\newcommand{\\inEnglish}\[1\]{},' cv.tex
sed -i 's,\\newcommand{\\inFrench}\[1\]{},\\newcommand{\\inFrench}\[1\]{#1},' cv.tex

pdflatex cv.tex
mv -f cv.pdf vincent_fournier_cv_fr.pdf

# Reset to english for CVS
sed -i 's,\\newcommand{\\inEnglish}\[1\]{},\\newcommand{\\inEnglish}\[1\]{#1},' cv.tex
sed -i 's,\\newcommand{\\inFrench}\[1\]{#1},\\newcommand{\\inFrench}\[1\]{},' cv.tex

