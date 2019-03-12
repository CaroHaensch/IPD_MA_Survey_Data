
## Filename: ~/100_data_creation/09_heterogeneity_of_both_coefficients.R
## Description: Creating a Population with different Slopes per Starum
## Author: Anna-Carolina Haensch

## Maintainer: Anna-Carolina Haensch (anna-carolina.haensch@gesis.org)

## Creation: 2017-11-18

###


# Number obs ####
kN <- 1000000

# Variable X
x <- rnorm(n = kN, mean = 0, sd = 10)

# Strata (Slopes) ####
gamma<-c(rep(x = 70,kN/5),
         rep(x = 35,kN/5),
         rep(x = 0,kN/5),
         rep(x = -35,kN/5),
         rep(x = -70,kN/5))


alpha<-c(rep(x = 800,kN/5),
         rep(x = 450,kN/5),
         rep(x = 0,kN/5),
         rep(x = -450,kN/5),
         rep(x = -800,kN/5))

# Variable Y
set.seed(19230920)
y <- alpha + (10+gamma) * x + rnorm(kN,0,70)

# Save
data.pop<-data.frame(x=x,y=y)
name.dataset<-"heterogeneity_of_both_coefficients"



# Analysis of Population Data (correct coefficients)
mod.pop <- lm(data.pop$y~data.pop$x)
mean(data.pop$u>0)



