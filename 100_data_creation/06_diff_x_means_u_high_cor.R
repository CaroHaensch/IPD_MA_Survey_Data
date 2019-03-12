

## Filename: ~/100_data_creation/06_diff_x_means_u_high_cor.R
## Description: Creating a Population with different X means per stratum, U
##              variable to poststratify

## Author: Anna-Carolina Haensch
## Maintainer: Anna-Carolina Haensch (anna-carolina.haensch@gesis.org)

## Creation: 2017-12-05



# Number obs ####
kN <- 1000000

# Var x
x <- c(rnorm(n = kN/5, mean = -20, sd = 10),
       rnorm(n = kN/5, mean = -10, sd = 10),
       rnorm(n = kN/5, mean = 0, sd = 10),
       rnorm(n = kN/5, mean = 10, sd = 10),
       rnorm(n = kN/5, mean = 20, sd = 10))

# Strata (Slopes) ####
# no stratum effects!
gamma<-vector()

# Var Y
mu <- rep(0,2)
Sigma <- matrix(150, nrow = 2, ncol = 2) + diag(2)*(30)
Sigmaq2<-Sigma^2
rawvars <- mvrnorm(n = kN, mu = mu, Sigma = Sigmaq2)
e <- rawvars[,1]
u <- rawvars[,2]
u2 <- rawvars[,2]>0
cor(e,u2)
y <- 10*x + e

#Save and check
data.pop<-data.frame(x=x,y=y, u=u)
cor(data.pop$y, data.pop$u)
cor(data.pop$y, data.pop$x)
name.dataset<-"diff_x_means_per_strata_u_high_cor"

# Analysis of Population Data (correct coefficients)
mod.pop <- lm(data.pop$y~data.pop$x)
mean(data.pop$u>0)
