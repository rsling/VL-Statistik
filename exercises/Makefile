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

INPUT01=\def\LEKTION{01}\def\TITLE{01. Fisher-Exakt-Test}\input{uebung.tex}
INPUT02=\def\LEKTION{02}\def\TITLE{02. Zentraltendenz, Streuung, Standardfehler}\input{uebung.tex}
INPUT03=\def\LEKTION{03}\def\TITLE{03. Einfache Tests für Mittelwerte}\input{uebung.tex}

# Create output dir if needed.
$(info $(shell [ ! -d $(OUTDIR) ] && mkdir -p ./$(OUTDIR)/includes))


# Phony shit.

.PHONY: uebung01 muloe01 uebung02 muloe02 uebung03 muloe03

uebung01:
	$(LX) -no-pdf -jobname=$(PROJECT)01 $(TEXFLAGS) "$(INPUT01)"
	$(LX) -jobname=$(PROJECT)01 $(TEXFLAGS) "$(INPUT01)"

muloe01:
	$(LX) -no-pdf -jobname=$(PROJECT)01Muloe $(TEXFLAGS) "$(MULOE)$(INPUT01)"
	$(LX) -jobname=$(PROJECT)01Muloe $(TEXFLAGS) "$(MULOE)$(INPUT01)"

uebung02:
	$(LX) -no-pdf -jobname=$(PROJECT)02 $(TEXFLAGS) "$(INPUT02)"
	$(LX) -jobname=$(PROJECT)02 $(TEXFLAGS) "$(INPUT02)"

muloe02:
	$(LX) -no-pdf -jobname=$(PROJECT)02Muloe $(TEXFLAGS) "$(MULOE)$(INPUT02)"
	$(LX) -jobname=$(PROJECT)02Muloe $(TEXFLAGS) "$(MULOE)$(INPUT02)"

uebung03:
	$(LX) -no-pdf -jobname=$(PROJECT)03 $(TEXFLAGS) "$(INPUT03)"
	$(LX) -jobname=$(PROJECT)03 $(TEXFLAGS) "$(INPUT03)"

muloe03:
	$(LX) -no-pdf -jobname=$(PROJECT)03Muloe $(TEXFLAGS) "$(MULOE)$(INPUT03)"
	$(LX) -jobname=$(PROJECT)03Muloe $(TEXFLAGS) "$(MULOE)$(INPUT03)"


all:	uebung01 muloe01 uebung02 muloe02 uebung03 muloe03

clean:
	cd ./output; rm -f *.adx *.and *.aux *.bbl *.blg *.idx *.ilg *.ldx *.lnd *.log *.out *.rdx *.run.xml *.sdx *.snd *.toc *.wdx *.xdv *.nav *.snm *.bcf *.vrb

