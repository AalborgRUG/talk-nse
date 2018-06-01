library(rlang)
library(jsvm)
library(here)

filename <- here("figs", paste0(whoami(), ".svg"))
e <- expr(y <- 2 * x)
expr2tikz(!!e, filename)
