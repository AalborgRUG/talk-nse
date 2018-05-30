library(rlang)
library(lobstr)

ast(f(x, "y", 1))
View(expr(y <- x * 10))

x <- expr(read.table("important.csv", row = FALSE))
ast(!!x)

length(x)
as.list(x)

exp1 <- expression(x <- 4, x)
eval(exp1)

exp2 <- expr(g(a + b + c + d + e + f + g + h + i + j + k + l + m + n + o + p + q + r + s + t + u + v + w + x + y + z))

deparse(exp2)
expr_text(exp2)

library(dplyr)

filter_func <- function(x, filter_exp) {
  filter_exp_enq <- enquo(filter_exp)
  x %>% filter(!!filter_exp_enq)
}

filter_func(mtcars, hp == 93)

prom <- function(x, cond) {
  tryCatch(print(cond), error = function(e) print(e))
  condq <- substitute(cond)
  print(condq)
  idx <- eval(condq, x)
  x[idx, ]
}

prom(mtcars, cyl == 4)

form <- vs ~ mpg + cyl
form
class(form)
sapply(as.list(form), class)
as.list(as.list(form)[[3]])
sapply(as.list(as.list(form)[[3]]), class)
eval(as.list(as.list(form)[[3]])[[3]], mtcars)
