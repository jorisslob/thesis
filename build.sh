#!/bin/bash

latex Thesis.tex
bibtex Thesis
latex Thesis.tex
latex Thesis.tex
dvipdf Thesis.dvi
