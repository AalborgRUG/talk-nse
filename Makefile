# Makefile for talk-nse
# ------------------------------------------------------------------------------

# Main files
SLIDES = index
CSS = custom.css

# Directories
SUBDIR = input
RDIR = scripts
FIGDIR = figs

# Flags
R_OPTS = --slave --vanilla


# Source files -----------------------------------------------------------------

# Child files
RMD_INPUT := $(wildcard $(SUBDIR)/*.Rmd)

# R scripts
R_FIG := $(wildcard $(RDIR)/figs/*.R)
# R_INPUT := $(wildcard $(RDIR)/input/*.R)

# Output files -----------------------------------------------------------------

# Out files, indicating run status of scripts
FIG_OUT := $(R_FIG:.R=.Rout)
DEPS_OUT := $(RDIR)/deps.Rout
OUT := $(FIG_OUT) $(DEPS_OUT)

# SVG figures
SVGFIGS := $(wildcard $(FIGDIR)/*.svg)

# Rules ------------------------------------------------------------------------

# Slideshow
slides: $(SLIDES).html

presentation: $(SLIDES).html
	firefox $< &

$(SLIDES).html: $(SLIDES).Rmd $(RMD_INPUT) $(CSS) $(OUT) deps
	Rscript $(R_OPTS) -e "rmarkdown::render('$<', 'xaringan::moon_reader')"

figures: $(FIG_OUT)

# R script file rule
%.Rout: %.R
	Rscript $(R_OPTS) $<
	touch $@

# Package dependencies
deps: $(DEPS_OUT)

# Delete figures and out-files
clean:
	rm -fv $(SVGFIGS)
	rm -fv $(OUT)

# Set phony targets
.PHONY: deps slides presentation figures clean
