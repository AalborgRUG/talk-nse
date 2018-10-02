library(rlang)
library(jsvm)
library(here)

filename <- here("figs", paste0(whoami(), ".svg"))
e <- expr(if (x >= 0) {
  sqrt(x)
} else {
  0
})
expr2tikz(!!e, filename)
