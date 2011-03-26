CleanUp ?= *.aux *.log *.nav *.out *.snm *.toc *.vrb 
clean: 
	rm -rf ${CleanUp}
distclean: clean
	rm -rf ${Pdf}
.PHONY: clean
.PHONY: distclean
