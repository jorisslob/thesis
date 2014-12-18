#!/bin/bash

######################
# Utility Functions
######################

function search {
    if grep -q "$1" Thesis.txt
    then
	echo -e "$1 \e[32mfound\e[0m in the Thesis"
    else
	echo -e "$1 \e[31mnot found\e[0m in the Thesis."
    fi
}

######################
# Generate the Thesis
######################

rubber --pdf -Wall Thesis.tex
pdftotext Thesis.pdf

# Article 13.6: In principle, the dissertation should not exceed
# 100,000 words.  On behalf of the Doctorate Board, the Dean may allow
# this limit to be exceeded at the written request of the PhD
# candidate.
echo
echo "Checking number of words..."
words=`pdftotext Thesis.pdf - | wc -w`
if [ $words -gt 100000 ]
then
    echo "$words words is \e[31mtoo much\e[0m, needs to be less than 100000."
else
    echo -e "$words words is \e[32mgood\e[0m"
fi

# Thesis writing marathon addition!
# At the start of the marathon I had 3895 words
# This will keep track of the words written during this marathon
echo "$(($words-4703)) words were written during the marathon"

# Article 16.1: The dissertation should contain a title page stating
# the given names and family name of the author as registered at the
# Register Office, as well as an index and the required registers.
echo
echo "Checking for required content in thesis..."
echo
search "Joris Slob"
search "Index"

# Article 16.2: In all cases, the names of the supervisor, the
# co-supervisor and the other members of the PhD Committee are stated
# on the reverse of the title page together with their functions.
search "Prof. dr. J.N. Kok"
search "Dr. Ir. F.J. Verbeek"

# Article 16.3: If so required and with the restraint customary for
# acknowledgements in international scientific literature, the
# institution which has financially supported or facilitated the
# dissertation may be mentioned at the foot of the page as referred to
# in paragraph 2.
search "research was supported by the Cyttron project"

# Article 17.1: A brief curriculum vitae of the author should be
# included at the end of the dissertation.
search "Curriculum vitae"

# Article 17.2: This curriculum vitae should state:
# a. date of birth,
# b. place of birth,
# c. the period of pre-university education or its equivalent and the
#    institutions where this was followed,
# d. any qualifications pertaining to the diplomas obtained,
# e. details of professional duties after completing the academic education,
#    and
# f. if appropriate, the institute at which the PhD research was conducted.
search "9 mei 1978"
search "Oud-Beijerland"
search "Universiteit Leiden"
search "BSc"
search "MSc"
search "Media Technology"
search "Zest Software"
search "RMPI"
search "TOPdesk"

############################
# Thesis scientific content 
############################

echo
echo "Scientific content"
echo

search "microscope"
search "OWL"
search "server"
search "client"
search "spatial"
search "temporal"
search "user interface"
search "SPARQL"
search "observer pattern"
search "namespace"
search "optical"
search "electron"
search "RDF"
search "high throughput"
search "confocal"
search "deconvolution"
search "structural metadata"
search "descriptive metadata"
search "administrative metadata"
search "my terms"
search "ontology viewer"
search "query interface"
search "master tables"
search "privacy"
search "legacy"
