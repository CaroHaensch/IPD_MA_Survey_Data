
## Filename: ~/100_data_creation/04_diff_x_means_per_strata.R
## Description: Creating a Population with different X means per stratum
## Author: Anna-Carolina Haensch

## Maintainer: Anna-Carolina Haensch (anna-carolina.haensch@gesis.org)

## Creation: 2017-11-18



# Number obs ####
kN <- 1000000

# Variable x
x <- c(rnorm(n = kN/5, mean = -20, sd = 10),
      rnorm(n = kN/5, mean = -10, sd = 10),
      rnorm(n = kN/5, mean = 0, sd = 10),
      rnorm(n = kN/5, mean = 10, sd = 10),
      rnorm(n = kN/5, mean = 20, sd = 10))

# Strata (Slopes) ####

# no stratum effects!
gamma<-vector()

# Variable Y
y <- 10*x + rnorm(n = kN,mean = 0,sd= 200)

# Save 
data.pop<-data.frame(x=x,y=y)
name.dataset<-"diff_x_means_per_strata"


# Analysis of Population Data (correct coefficients)
mod.pop <- lm(data.pop$y~data.pop$x)
mean(data.pop$u>0)