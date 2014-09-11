#!/bin/bash

######################
# Generate the Thesis
######################

rubber --pdf Thesis.tex
pdftotext Thesis.pdf

# Article 13.6: In principle, the dissertation should not exceed
# 100,000 words.  On behalf of the Doctorate Board, the Dean may allow
# this limit to be exceeded at the written request of the PhD
# candidate.
words=`pdftotext Thesis.pdf - | wc -w`
if [ $words -gt 100000 ]
then
    echo "$words words is too much, needs to be less than 100000."
    exit 1
else
    echo "$words words is good"
fi

# Article 16.1: The dissertation should contain a title page stating
# the given names and family name of the author as registered at the
# Register Office, as well as an index and the required registers.
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

# Article 16.2: In all cases, the names of the supervisor, the
# co-supervisor and the other members of the PhD Committee are stated
# on the reverse of the title page together with their functions.
if grep "Prof. dr. J.N. Kok" Thesis.txt
then
    echo "Joost Kok was found in the Thesis."
else
    echo "Joost Kok was not found in the Thesis!"
    exit 1
fi
if grep "Dr. Ir. F.J. Verbeek" Thesis.txt
then
    echo "Fons Verbeek was found in the Thesis."
else
    echo "Fons Verbeek was not found in the Thesis!"
    exit 1
fi

# Article 16.3: If so required and with the restraint customary for
# acknowledgements in international scientific literature, the
# institution which has financially supported or facilitated the
# dissertation may be mentioned at the foot of the page as referred to
# in paragraph 2.
if grep "research was supported by the Cyttron project" Thesis.txt
then
    echo "Cyttron project was found in the Thesis."
else
    echo "Cyttron project was not found in the Thesis."
    exit 1
fi

# Article 17.1: A brief curriculum vitae of the author should be
# included at the end of the dissertation.
if grep "Curriculum vitae" Thesis.txt
then
    echo "Curriculum vitae was found in the Thesis."
else
    echo "Curriculum vitae was not found in the Thesis."
    exit 1
fi

# Article 17.2: This curriculum vitae should state:
# a. date of birth,
# b. place of birth,
# c. the period of pre-university education or its equivalent and the
#    institutions where this was followed,
# d. any qualifications pertaining to the diplomas obtained,
# e. details of professional duties after completing the academic education,
#    and
# f. if appropriate, the institute at which the PhD research was conducted.
if grep "9 mei 1978" Thesis.txt
then
    echo "Date of birth found in the Thesis"
else
    echo "Date of birth not found in the Thesis."
    exit 1
fi
if grep "Oud-Beijerland" Thesis.txt
then
    echo "Place of birth found in the Thesis"
else
    echo "Place of birth not found in the Thesis."
    exit 1
fi
if grep "Universiteit Leiden" Thesis.txt
then
    echo "Universiteit Leiden found in the Thesis"
else
    echo "Universiteit Leiden not found in the Thesis."
    exit 1
fi
if grep "BSc" Thesis.txt
then
    echo "BSc found in the Thesis"
else
    echo "BSc not found in the Thesis."
    exit 1
fi
if grep "MSc" Thesis.txt
then
    echo "MSc found in the Thesis"
else
    echo "MSc not found in the Thesis."
    exit 1
fi
if grep "Media Technology" Thesis.txt
then
    echo "Media Technology found in the Thesis"
else
    echo "Media Technology not found in the Thesis."
    exit 1
fi
if grep "Zest Software" Thesis.txt
then
    echo "Zest Software found in the Thesis"
else
    echo "Zest Software not found in the Thesis."
    exit 1
fi
if grep "RMPI" Thesis.txt
then
    echo "RMPI found in the Thesis"
else
    echo "RMPI not found in the Thesis."
    exit 1
fi
