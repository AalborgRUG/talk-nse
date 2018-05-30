f <- function(i = 1L) {
  parent.frame(i)
}

f()
do.call(f, list())
lapply(1, f)
lapply(1:2, f)
Map(f, 1)
Map(f, 1:3)

