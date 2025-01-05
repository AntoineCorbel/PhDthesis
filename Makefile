.PHONY: all clean

OUTDIR = out

all: $(OUTDIR)/thesis.pdf

$(OUTDIR)/thesis.pdf: main.tex
	@mkdir -p $(OUTDIR)
	pdflatex -output-directory=$(OUTDIR) main.tex
	cp bibliography.bib $(OUTDIR)
	cd $(OUTDIR) && bibtex main
	pdflatex -output-directory=$(OUTDIR) main.tex
	pdflatex -output-directory=$(OUTDIR) main.tex
	mv $(OUTDIR)/main.pdf .

clean:
	rm -rf $(OUTDIR)/*.aux $(OUTDIR)/*.log $(OUTDIR)/*.out $(OUTDIR)/*.toc $(OUTDIR)/*.bbl $(OUTDIR)/*.blg $(OUTDIR)/*.pdf $(OUTDIR)/*.synctex.gz