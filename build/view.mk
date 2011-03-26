#Make the Pdf file
${Target}: ${Pdf}
	${PdfViewer} ${Pdf}

.PHONY: ${Target}
