

## Filename: ~/100_data_creation/02_heterogeneity_of_intercepts.R
## Description: Creating a Population with different Intercepts per Starum
## Author: Anna-Carolina Haensch

## Maintainer: Anna-Carolina Haensch (anna-carolina.haensch@gesis.org)

## Creation: 2017-11-18

###

# Number obs 
kN <- 1000000

# Variable x
set.seed(19230919)
x <- rnorm(n = kN, mean = 0, sd = 10)

# Strata (Intercepts)
gamma<-c(rep(x = 800,kN/5),
         rep(x = 450,kN/5),
         rep(x = 0,kN/5),
         rep(x = -450,kN/5),
         rep(x = -800,kN/5))


# Var Y
y <- 0 + gamma + 10 * x  + rnorm(kN,0,200)

# Save
data.pop<-data.frame(x=x,y=y)
name.dataset<-"heterogeneity_of_intercepts"

# Analysis of Population Data (correct coefficients)
mod.pop <- lm(data.pop$y~data.pop$x)
mean(data.pop$u>0)




