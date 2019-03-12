
## Filename: 100_data_creation/10_superpopulation_diff_intercept.R
## Description: Create Super-Populations
## Author: Anna-Carolina Haensch

## Maintainer: Anna-Carolina Haensch (anna-carolina.haensch@gesis.org)

## Software version: R 3.4.1

## Creation: 2017-11-20
## Last updated on: 2018-01-10



# Number obs ####
kN <- 1000000

# Variable X
x <- rnorm(n = kN*5, mean = 0, sd = 10)


# Superopoulation parameters (slope)
set.seed(19230923)
alphasuper <- rnorm(n = 5, mean = 0, sd = 400)
alphasuper <- c(rep(x = alphasuper[1],kN),
              rep(x = alphasuper[2],kN),
              rep(x = alphasuper[3],kN),
              rep(x = alphasuper[4],kN),
              rep(x = alphasuper[5],kN))


# Strata (Slopes) ####
gamma <- c(rep(x = 800,kN/5),
         rep(x = 450,kN/5),
         rep(x = 0,kN/5),
         rep(x = -450,kN/5),
         rep(x = -800,kN/5))
gamma <- rep(gamma, 5)

# Variable Y
set.seed(19230920)
y <- alphasuper + gamma + 10 * x + rnorm(kN*5,0,70)

# Variable Superpopulation
superpopname <- c(rep(x = "a",kN),
                rep(x = "b",kN),
                rep(x = "c",kN),
                rep(x = "d",kN),
                rep(x = "e",kN))

# Save
data.pop<-data.frame(x=x,y=y, superpopname=superpopname)
name.dataset<-"superpopulation_intercept"

# Analysis of Population Data (correct coefficients)
mod.pop.1 <- lmer(y~x+(1|superpopname),
                data=data.pop)
mod.pop<-fixef(mod.pop.1)
