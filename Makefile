# TITLE OF THE DOCUMENT
TITLE=proceedings
# TEX-FILE
TEXFILE=proceedings.tex
# LATEXMK PATH
LATEXMK=latexmk
# LATEX OPTIONS
TEXOPTIONS=-pdf \
			-e '$$pdf_previewer = "evince %O %S";' \
			-interaction=nonstopmode \
			-halt-on-error \
			-synctex=1 \
			--jobname=$(BUILDDIR)/$(TITLE)# \
			-output-directory=$(BUILDDIR)

# LATEX COMMAND
LATEX = $(LATEXMK) $(TEXOPTIONS) $(TEXFILE)
# PATH TO OUTPUT-FILE
PDFFILE = $(TITLE).pdf
BUILDDIR = .

all:
	pdflatex proceedings.tex
	pdflatex proceedings.tex
	pdflatex proceedings.tex
	rm proceedings.aux
	rm proceedings.log

pvc: FORCE | $(BUILDDIR)
	@$(LATEX) -pvc


FORCE:

clean:
	@$(RM) -r $(BUILDDIR)
	@echo "Cleaned"

.PHONY: clean all pvc