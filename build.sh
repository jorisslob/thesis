#!/bin/bash

# Generate the Thesis
latex Thesis.tex
bibtex Thesis
makeindex Thesis.idx
latex Thesis.tex
latex Thesis.tex
dvipdf Thesis.dvi
pdftotext Thesis.pdf


# Article 13.6: In principle, the dissertation should not exceed 100,000 words.
# On behalf of the Doctorate Board, the Dean may allow this limit to be 
# exceeded at the written request of the PhD candidate.
words=`pdftotext Thesis.pdf - | wc -w`
if [ $words -gt 100000 ]
then
    echo "$words words is too much, needs to be less than 100000."
    exit 1
else
    echo "$words words is good"
fi

# Article 16.1: The dissertation should contain a title page stating the given 
# names and family name of the author as registered at the Register Office, as 
# well as an index and the required registers.
if grep "Joris Slob" Thesis.txt
then
    echo "The name Joris Slob was found in the Thesis."    
else
    echo "The name Joris Slob was not found in the Thesis!"
    exit 1    
fi

if grep "Index" Thesis.txt
then
    echo "An index was found in the Thesis."
else
    echo "No index was found in the Thesis!"
    exit 1
fi
