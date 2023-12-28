#!/bin/bash
lines=$( cat people.csv | wc -l)
for p in $( seq 1 $lines )
do
	person=$(cat people.csv | head -$p | tail -1)
	file="deck${p}.tex"

	cat templateTex.txt > $file
	sed "s/<Name>/$person/g" $file > "finalDeck${p}.tex"
	pdflatex "finalDeck${p}.tex"
done
mkdir pdfs
mv *.pdf pdfs
rm finalDeck*
rm deck*
pdfunite pdfs/final* out.pdf

