## Arguments in R Programming Language – Get a Deep Insight!
## Ref: https://data-flair.training/blogs/r-arguments-introduction/

## Function inside function in R
## Ref: https://stackoverflow.com/questions/62359099/function-inside-function-in-r

##### Presetting ######
  rm(list = ls()) # Clean variable
  memory.limit(150000)

##### Test Function #####

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


Result2 <- TestFUN2(x=1,y=2,a=4)

#######################################################################################

#### Error ####
TestFUN1_2 <- function(x,y,a=2,b=4) {
  z = a*(2*x+4*y) + 8*b
  return(z)
}

TestFUN2_2 <- function(x,y,TestFUN1.lt="",TestFUN1_2.lt="",...) {
  if(TestFUN1.lt != ""){
    formals(TestFUN1)[names(TestFUN1.lt)] <- TestFUN1.lt
    TestFUN1 <- TestFUN1()
  }else{
    TestFUN1 <- TestFUN1(x,y,...)
  }
  if(TestFUN1_2.lt != ""){
    formals(TestFUN1_2)[names(TestFUN1_2.lt)] <- TestFUN1_2.lt
    TestFUN1_2<- TestFUN1_2()
  }else{
    TestFUN1_2 <- TestFUN1_2(x,y,...)
  }

  # try({
  #   formals(TestFUN1)[names(TestFUN1.lt)] <- TestFUN1.lt
  # })
  # try({
  #   formals(TestFUN1_2)[names(TestFUN1_2.lt)] <- TestFUN1_2.lt
  # })

  z = TestFUN1 + TestFUN1_2
  ##Bug## z = TestFUN1(x,y,a=2,b=4)
  ##Bug## z = TestFUN1(x,y)
  return(z)
}


Result2_2 <- TestFUN2_2(x=1,y=2,a=4)

TestFUN1_2.lt <- list(x=1,y=2,a=8,b=4)
Result2_2 <- TestFUN2_2(x=1,y=2,a=4,TestFUN1_2.lt = TestFUN1_2.lt)

##Bug## Result2_2 <- TestFUN2_2(TestFUN1(x=1,y=2,a=4),TestFUN1(x=1,y=2,a=4))

