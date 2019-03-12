
## Filename: ~/100_data_creation/05_diff_x_means_per_strata_y_heterogeneity.R
## Description: Creating a Population with different X means and diff y
## std.err per stratum
## Author: Anna-Carolina Haensch

## Maintainer: Anna-Carolina Haensch (anna-carolina.haensch@gesis.org)

## Creation: 2017-11-18



# Number obs ####
kN <- 1000000

# Variable X
set.seed(234234)
x <- c(rnorm(n = kN/5, mean = -20, sd = 10),
       rnorm(n = kN/5, mean = -10, sd = 10),
       rnorm(n = kN/5, mean = 0, sd = 10),
       rnorm(n = kN/5, mean = 10, sd = 10),
       rnorm(n = kN/5, mean = 20, sd = 10))



# Variable Y

set.seed(234232224)
y <- 10*x + c(rnorm(n = kN/5, mean = 0, sd = 10),
              rnorm(n = kN/5, mean = 0, sd = 25),
              rnorm(n = kN/5, mean = 0, sd = 100),
              rnorm(n = kN/5, mean = 0, sd = 155),
              rnorm(n = kN/5, mean = 0, sd = 200))


# Save
data.pop<-data.frame(x=x,y=y)
name.dataset<-"diff_x_means_per_strata_heterogeneity"


# Analysis of Population Data (correct coefficients)
mod.pop <- lm(data.pop$y~data.pop$x)
mean(data.pop$u>0)
