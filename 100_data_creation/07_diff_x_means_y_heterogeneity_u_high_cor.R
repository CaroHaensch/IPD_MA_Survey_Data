
## Filename: ~/100_data_creation/07_diff_x_means_y_heterogeneity_u_high_cor.R
## Description: Creating a Population with different X means and diff y
## std.err per stratum
## Author: Anna-Carolina Haensch

## Maintainer: Anna-Carolina Haensch (anna-carolina.haensch@gesis.org)

## Creation: 2017_12_05

# Number obs ####
kN <- 1000000

# Variable x
x <- c(rnorm(n = kN/5, mean = -20, sd = 10),
       rnorm(n = kN/5, mean = -10, sd = 10),
       rnorm(n = kN/5, mean = 0, sd = 10),
       rnorm(n = kN/5, mean = 10, sd = 10),
       rnorm(n = kN/5, mean = 20, sd = 10))


# Error term e
e<-c(rnorm(n = kN/5, mean = 0, sd = 10),
  rnorm(n = kN/5, mean = 0, sd = 25),
  rnorm(n = kN/5, mean = 0, sd = 100),
  rnorm(n = kN/5, mean = 0, sd = 155),
  rnorm(n = kN/5, mean = 0, sd = 200))


# Poststratification variable U
u<-e+rnorm(n = kN, mean=0, sd=125)

# Variable Y
y <- 10*x + e
cor(e, u)
cor(y, u)
cor(x, y)

# Save
data.pop<-data.frame(x=x,y=y, u=u)
name.dataset<-"diff_x_means_per_strata_y_heterogeneity_u_high_cor"

# Analysis of Population Data (correct coefficients)
mod.pop <- lm(data.pop$y~data.pop$x)
mean(data.pop$u>0)
