## Arguments in R Programming Language – Get a Deep Insight!
## Ref: https://data-flair.training/blogs/r-arguments-introduction/

## Function inside function in R
## Ref: https://stackoverflow.com/questions/62359099/function-inside-function-in-r

TestFUN1 <- function(x,y,a=2,b=4) {
  z = a*(x+2*y) + b
  return(z)
}


TestFUN2 <- function(x,y,...) {
  z = TestFUN1(x,y,...)
  # z = TestFUN1(x,y,a=2,b=4)
  # z = TestFUN1(x,y)
  return(z)
}


Result <- TestFUN2(x=1,y=2,a=4)
