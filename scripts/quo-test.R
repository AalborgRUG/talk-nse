library(dplyr)
library(rlang)

f1 <- function(x, group_var) {
  group_var <- enquo(group_var)
  print(group_var)

  x %>%
    group_by(!! group_var) %>%
    summarise_all(mean)
}

f2 <- function(x, group_var) {
  group_var <- quo(!! sym(group_var))
  print(group_var)

  x %>%
    group_by(!! group_var) %>%
    summarise_all(mean)
}

f1(iris, Species)
f2(iris, "Species")

lapply(letters[1:3], assign, value = "tmp", envir = environment())
