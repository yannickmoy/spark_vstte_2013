.PHONY: all main.pdf

all: main.pdf

main.pdf:
	(cd dsr; ./generate.py)
	pdflatex main.tex
	bibtex main.aux
	pdflatex main.tex
	pdflatex main.tex

