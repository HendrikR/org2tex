# TODO: do this with rubber, latexmk or similar.
LATEX=pdflatex -synctex=4
ZENTRAL != echo *.org
all: $(ZENTRAL:.org=.pdf)

# .tex is regared as "intermediate" by /make/ and deleted. Do not want.
.SECONDARY: $(ZENTRAL:.org=.tex)

%.tex: %.org
	./org2tex.sh $< > $@
%.pdf: %.tex # %.toc %.blg %.bbl
	$(LATEX) $<
%.aux %.toc: %.tex
	$(LATEX) $<
%.blg %.bbl: %.aux ../literatur.bib
	bibtex $<
# delete all the files created by latex.
clean:
	rm -f *.pdf
	rm -f *.aux
	rm -f *.bbl
	rm -f *.blg
	rm -f *.log
	rm -f *.toc
