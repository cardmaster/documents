PDF_VIEWER ?= okular
Pdf ?= ${Target}.pdf
Tex ?= ${Target}.tex

include view.mk
include pdf.mk
include clean.mk

