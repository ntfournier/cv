#!/bin/bash

# For all args will put words in bold.
# This is usefull to highlight good experience when applying to different places.

cp cv.tex cv-bold.tex
for tech in "$@"
do
	sed -i 's,'"$tech"',\\textbf{'"$tech"'},' cv-bold.tex
done

# Set english (default)
sed -i 's,\\newcommand{\\inEnglish}\[1\]{},\\newcommand{\\inEnglish}\[1\]{#1},' cv-bold.tex
sed -i 's,\\newcommand{\\inFrench}\[1\]{#1},\\newcommand{\\inFrench}\[1\]{},' cv-bold.tex

pdflatex cv-bold.tex
mv -f cv-bold.pdf vincent_fournier_cv_en.pdf

# Set french (default)
sed -i 's,\\newcommand{\\inEnglish}\[1\]{#1},\\newcommand{\\inEnglish}\[1\]{},' cv-bold.tex
sed -i 's,\\newcommand{\\inFrench}\[1\]{},\\newcommand{\\inFrench}\[1\]{#1},' cv-bold.tex

pdflatex cv-bold.tex
mv -f cv-bold.pdf vincent_fournier_cv_fr.pdf

# Reset to english for CVS
sed -i 's,\\newcommand{\\inEnglish}\[1\]{},\\newcommand{\\inEnglish}\[1\]{#1},' cv-bold.tex
sed -i 's,\\newcommand{\\inFrench}\[1\]{#1},\\newcommand{\\inFrench}\[1\]{},' cv-bold.tex

