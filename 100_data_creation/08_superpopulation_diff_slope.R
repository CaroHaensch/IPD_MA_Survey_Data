
## Filename: 100_data_creation/08_superpopulation_diff_slope.R
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
gammasuper<-rnorm(n = 25, mean = 0, sd = 10)
gammasuper<-c(rep(x = gammasuper[1],kN),
              rep(x = gammasuper[2],kN),
              rep(x = gammasuper[3],kN),
              rep(x = gammasuper[4],kN),
              rep(x = gammasuper[5],kN),
              rep(x = gammasuper[6],kN),
              rep(x = gammasuper[7],kN),
              rep(x = gammasuper[8],kN),
              rep(x = gammasuper[9],kN),
              rep(x = gammasuper[10],kN),
              rep(x = gammasuper[11],kN),
              rep(x = gammasuper[12],kN),
              rep(x = gammasuper[13],kN),
              rep(x = gammasuper[14],kN),
              rep(x = gammasuper[15],kN),
              rep(x = gammasuper[16],kN),
              rep(x = gammasuper[17],kN),
              rep(x = gammasuper[18],kN),
              rep(x = gammasuper[19],kN),
              rep(x = gammasuper[20],kN),
              rep(x = gammasuper[21],kN),
              rep(x = gammasuper[22],kN),
              rep(x = gammasuper[23],kN),
              rep(x = gammasuper[24],kN),
              rep(x = gammasuper[25],kN))


# Strata (Slopes) ####
gamma<-c(rep(x = 70,kN/5),
         rep(x = 35,kN/5),
         rep(x = 0,kN/5),
         rep(x = -35,kN/5),
         rep(x = -70,kN/5))
gamma<-rep(gamma, 25)

# Variable Y
set.seed(19230920)
y <- 0 + (gammasuper+gamma) * x + rnorm(kN*25,0,70)

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
name.dataset<-"superpopulation_slope"

# Analysis of Population Data (correct coefficients)
mod.pop <- lmer(y~1+x+(x|superpopname),
                data=data.pop,REML = T,  lmerControl(
                  optimizer ='optimx', optCtrl=list(method='nlminb')))
mod.pop<-fixef(mod.pop)
