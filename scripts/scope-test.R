a <- 1

f1 <- function() {
  print(environment())
  b <- 2
  f2 <- function() {
    print(environment())
    c <- 3
    f3 <- function() {
      print(environment())
      a + b + c
    }
    f3()
  }
  f2()
}
