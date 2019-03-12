
## Filename: ~/100_data_creation/01_the_simple_case.R
## Description: Creating a Population with no nothing per stratum
## Author: Anna-Carolina Haensch

## Maintainer: Anna-Carolina Haensch (anna-carolina.haensch@gesis.org)

## Creation: 2017-11-18



# Number obs ####
kN <- 1000000

# Var X
x <- rnorm(n = kN, mean = 0, sd = 10)

# Var Y
y <- 10*x + rnorm(n = kN,mean = 0,sd= 200)

# Save
data.pop<-data.frame(x=x,y=y)
name.dataset<-"the_simple_case"

# Analysis of Population Data (correct coefficients)
mod.pop <- lm(data.pop$y~data.pop$x)
mean(data.pop$u>0)