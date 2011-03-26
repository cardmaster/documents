CC_LATEX ?= pdflatex
PDF_VIEWER ?= okular

Target ?= gitflow
OtherFiles = images/branching.png

Pdf = ${Target}.pdf
Tex = ${Target}.tex
${Target}: ${Pdf}
	${PDF_VIEWER} $<

${Pdf}: ${Tex} ${OtherFiles}
	${CC_LATEX} gitflow
	${CC_LATEX} gitflow

CleanUp ?= *.aux *.log *.nav *.out *.snm *.toc *.vrb 
clean: 
	rm -rf ${CleanUp}

distclean: clean
	rm -rf ${Pdf}

.PHONY: clean
.PHONY: distclean ${Target}
