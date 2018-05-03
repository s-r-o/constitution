all:
	pdflatex -halt-on-error -interaction nonstopmode -draftmode constitution.tex
	pdflatex -halt-on-error -interaction nonstopmode constitution.tex

tidy:
	rm -f *.log *.aux *.out *.toc

clean: tidy
	rm -f *.pdf
