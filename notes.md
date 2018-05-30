# Non-standard Evaluation in R

Notes for preparing talk for R Usergroup Aalborg on non-standard evaluation and metaprogramming.

## Keyword brainstorm

- `base` vs. `rlang`
  + table overview of functions that do the same (or similar things), e.g.
    * `quote` and `rlang::expr` (and `rlang::quo`)
    * `substitute` and `rlang::enexpr`(and `rlang::enquo`)
- differences between `quote` and `substitute` 
- programming with `dplyr`
- quosures, expressions, strings
- expressions, names, symbols
- practical examples of usages 
- environments and the scoping rules of R
- what are environments? what objects are environment-like, and how can that be used?
- which environment are we in? (e.g. when `lapply`-ing)
- `list2env`
- `lobstr::ast`
- hacks and tricks (e.g. `globalVariables` trick to quiet R CMD check, see `rVCFMTSM`)


## Useful links

- https://adv-r.hadley.nz/meta.html
- https://dplyr.tidyverse.org/articles/programming.html
- https://edwinth.github.io/blog/nse/
- http://www.onceupondata.com/2017/08/12/my-first-steps-into-the-world-of-tidyeval/
- http://mnielsen.github.io/notes/parentheses/index.html
