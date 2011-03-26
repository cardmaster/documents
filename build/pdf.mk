#Iterface: ${Pdf} = Output file, ${Tex} = The main tex file
#${OtherFiles} = other dep file, such as images
${Pdf}: ${Tex} ${OtherFiles}
	${CC_LATEX} $<
	${CC_LATEX} $<

