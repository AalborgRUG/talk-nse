# Makefile for talk-nse
# --------------------------------------------------------------------------

# Main files
SLIDES = docs/index
CSS = docs/custom.css
NOTES = notes

# Directories
RDIR = scripts
FIGDIR = figs

# Flags
R_OPTS = --slave --vanilla


# Source files -------------------------------------------------------------------------------------

# R scripts
R_FIG := $(wildcard $(RDIR)/figs/*.R)
R_INPUT := $(wildcard $(RDIR)/input/*.R)

# Output files -------------------------------------------------------------------------------------

# Out files, indicating run status of scripts
FIG_OUT := $(R_FIG:.R=.Rout)
DEPS_OUT := $(RDIR)/deps.Rout
OUT := $(FIG_OUT) $(DEPS_OUT)

# SVG figures
SVGFIGS := $(wildcard $(FIGDIR)/*.svg)

# Rules --------------------------------------------------------------------------------------------

# Slideshow
presentation: $(SLIDES).html
	firefox $< &

slides: $(SLIDES).html
$(SLIDES).html: $(SLIDES).Rmd $(CSS) $(OUT)
	Rscript -e "rmarkdown::render('${SLIDES}.Rmd', 'xaringan::moon_reader')"

# R script file rule
%.Rout: %.R
	Rscript $(R_OPTS) $<
	touch $@


# Delete figures
clean-figs:
	rm -fv $(SVGFIGS)
	rm -fv $(FIG_OUT)

# Set phony targets
.PHONY: deps slides presentation \
clean-figs
