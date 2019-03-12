
## Filename: 100_data_creation/11_superpopulation_diff_intercept.R
## Description: Create Super-Populations
## Author: Anna-Carolina Haensch

## Maintainer: Anna-Carolina Haensch (anna-carolina.haensch@gesis.org)

## Software version: R 3.4.1

## Creation: 2017-11-20
## Last updated on: 2018-01-10



# Number obs ####
kN <- 1000000

# Variable X
x <- rnorm(n = kN*25, mean = 0, sd = 10)


# Superopoulation parameters (slope)
set.seed(19230923)
alphasuper<-rnorm(n = 25, mean = 0, sd = 400)
alphasuper<-c(rep(x = alphasuper[1],kN),
              rep(x = alphasuper[2],kN),
              rep(x = alphasuper[3],kN),
              rep(x = alphasuper[4],kN),
              rep(x = alphasuper[5],kN),
              rep(x = alphasuper[6],kN),
              rep(x = alphasuper[7],kN),
              rep(x = alphasuper[8],kN),
              rep(x = alphasuper[9],kN),
              rep(x = alphasuper[10],kN),
              rep(x = alphasuper[11],kN),
              rep(x = alphasuper[12],kN),
              rep(x = alphasuper[13],kN),
              rep(x = alphasuper[14],kN),
              rep(x = alphasuper[15],kN),
              rep(x = alphasuper[16],kN),
              rep(x = alphasuper[17],kN),
              rep(x = alphasuper[18],kN),
              rep(x = alphasuper[19],kN),
              rep(x = alphasuper[20],kN),
              rep(x = alphasuper[21],kN),
              rep(x = alphasuper[22],kN),
              rep(x = alphasuper[23],kN),
              rep(x = alphasuper[24],kN),
              rep(x = alphasuper[25],kN))


# Strata (Slopes) ####
gamma<-c(rep(x = 800,kN/5),
         rep(x = 450,kN/5),
         rep(x = 0,kN/5),
         rep(x = -450,kN/5),
         rep(x = -800,kN/5))
gamma<-rep(gamma, 25)

# Variable Y
set.seed(19230920)
y <- alphasuper + gamma + 10 * x + rnorm(kN*25,0,70)

# Variable Superpopulation
superpopname<-c(rep(x = "a",kN),
                rep(x = "b",kN),
                rep(x = "c",kN),
                rep(x = "d",kN),
                rep(x = "e",kN),
                rep(x = "f",kN),
                rep(x = "g",kN),
                rep(x = "h",kN),
                rep(x = "i",kN),
                rep(x = "j",kN),
                rep(x = "k",kN),
                rep(x = "l",kN),
                rep(x = "m",kN),
                rep(x = "n",kN),
                rep(x = "o",kN),
                rep(x = "p",kN),
                rep(x = "q",kN),
                rep(x = "r",kN),
                rep(x = "s",kN),
                rep(x = "t",kN),
                rep(x = "u",kN),
                rep(x = "v",kN),
                rep(x = "w",kN),
                rep(x = "x",kN),
                rep(x = "y",kN))

# Save
data.pop<-data.frame(x=x,y=y, superpopname=superpopname)
name.dataset<-"superpopulation_intercept_25"

# Analysis of Population Data (correct coefficients)
mod.pop.1 <- lmer(y~x+(1|superpopname),
                  data=data.pop[sample(1:25000000,1000000),])
mod.pop<-fixef(mod.pop.1)
