library(rlang)
library(jsvm)
library(here)

filename <- here("figs", paste0(whoami(), ".svg"))
e <- expr(({1}))
expr2tikz(!!e, filename)
