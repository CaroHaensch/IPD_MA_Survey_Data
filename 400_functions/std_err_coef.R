
## Filename: ~/400_functions/std_err_coef.R
## Description: Get the standard errors out of a regression model object

## Author: Anna-Carolina Haensch
## Maintainer: Anna-Carolina Haensch (anna-carolina.haensch@gesis.org)

## Creation: 2017-11-188


StdErrCoef <- function(x){
  std.err <- sqrt(diag(vcov(x)))
  return(std.err)
}
