library(rlang)
library(jsvm)
library(here)

filename <- here("figs", paste0(whoami(), ".svg"))
e <- expr(for (i in 1:10) {
  i^2
})
expr2tikz(!!e, filename)
