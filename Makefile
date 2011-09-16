OutPut ?= output
RM ?= rm -f
RMDIR ?= rm -rf
PDFVIEW ?= evince
#M is the folder contains tex files, and related images
M ?= .
BuildDir ?= $(M)
TemplateFolder ?= progressbar
TemplateFiles =  beamercolorthemeprogressbar.sty \
		 beamerfontthemeprogressbar.sty \
		 beamerinnerthemeprogressbar.sty \
		 beamerouterthemeprogressbar.sty \
		 beamerthemeprogressbar.sty \
		 linuxfb-logo.bb \
		 linuxfb-logo.png 

include $(M)/config.mk

WorkDir = $(shell pwd)
TemplateFilePaths = $(addprefix $(TemplateFolder)/, $(TemplateFiles))
Latex ?= pdflatex
LatexOpt ?= ""
${OutPut}:
	mkdir -p $@

%.pdf: $(BuildDir)/%.pdf
	cp $< $@

$(BuildDir)/%.pdf: $(M)/%.tex template
	cd $(dir $@); \
	${Latex} ${LatexOpt} $(notdir $<); \
	${Latex} ${LatexOpt} $(notdir $<)
	du -h $@

%: $(BuildDir)/%.pdf ${OutPut}
	cp $< ${OutPut}/
	${PDFVIEW} ${OutPut}/$@.pdf

.PHONY: template
template: $(TemplateFilePaths)
	@if [ ! -d $(BuildDir) ]; then \
	    echo "Create build dir";\
	    mkdir -p $(BuildDir); \
	fi
	cp -f $(TemplateFilePaths) $(BuildDir)/

.PHONY: templateclean
templateclean:
	rm -f $(addprefix $(BuildDir)/, $(TemplateFiles))

.PHONY: clean
clean: templateclean
	cd $(BuildDir); \
	${RM} *.aux *.log *.nav *.out *.snm *.toc *.pdf *.vrb

.PHONY: cleanall
cleanall: clean
	${RMDIR} ${OutPut}


