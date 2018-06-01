# Dependency script, ensures all dependencies are met prior to
# knitting/sourcing the documents in this repo

if (!"devtools" %in% installed.packages()) {
  install.packages("devtools")
}

deps <- list(
  "here"     = quote(install.packages("here")),
  "rlang"    = quote(install.packages("rlang")),
  "jsvm"     = quote(devtools::install_github("janusvm/jsvm")),
  "xaringan" = quote(devtools::install_github("yihui/xaringan")),
  "emo"      = quote(devtools::install_github("hadley/emo"))
)

installed <- names(deps) %in% installed.packages()

# Install missing packages
for (i in seq_along(deps)) {
  if (!installed[i]) eval(deps[[i]])
}
