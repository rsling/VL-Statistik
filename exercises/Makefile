# Roland's Make system for LaTeX.

# Compile system.
LX = xelatex

# Project name and file name parts.
PROJECT = SchaeferStatistikUebungen
OUTDIR = output

# TeX Sources to watch.
SOURCEDIR = includes/
SOURCES = main.tex $(wildcard $(SOURCEDIR)/*.tex)

# Stuff passed to XeLaTeX.
MAININCLUDE = \input{main}
MULOE=\def\SOLUTIONS{}

# XeLaTeX flags.
TEXFLAGS = -output-directory=$(OUTDIR)

INPUT01=\def\LEKTION{01}\def\TITLE{01 | Fisher-Exakt-Test}\input{uebung.tex}

# Create output dir if needed.
$(info $(shell [ ! -d $(OUTDIR) ] && mkdir -p ./$(OUTDIR)/includes))


# Phony shit.

.PHONY: uebung01 muloe01

uebung01:
	$(LX) -no-pdf -jobname=$(PROJECT)01 $(TEXFLAGS) "$(INPUT01)"
	$(LX) -jobname=$(PROJECT)01 $(TEXFLAGS) "$(INPUT01)"

muloe01:
	$(LX) -no-pdf -jobname=$(PROJECT)01Muloe $(TEXFLAGS) "$(MULOE)$(INPUT01)"
	$(LX) -jobname=$(PROJECT)01Muloe $(TEXFLAGS) "$(MULOE)$(INPUT01)"


all:	uebung01 muloe01

clean:
	cd ./output; rm -f *.adx *.and *.aux *.bbl *.blg *.idx *.ilg *.ldx *.lnd *.log *.out *.rdx *.run.xml *.sdx *.snd *.toc *.wdx *.xdv *.nav *.snm *.bcf *.vrb

