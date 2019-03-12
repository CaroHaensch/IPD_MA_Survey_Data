

## Filename: ~/200_data_samp_weight/01_diff_strata_probs.R
## Description: One strata level, samples from five strata, calculates design w.

## Author: Anna-Carolina Haensch
## Maintainer: Anna-Carolina Haensch (anna-carolina.haensch@gesis.org)

## Creation: 2017-11-18



# Sampling probs ####

# SRS, n=1000
samp.prob.0 <- c(rep(1/1000*1, kN/5),
                 rep(1/1000*1, kN/5),
                 rep(1/1000*1, kN/5),
                 rep(1/1000*1, kN/5),
                 rep(1/1000*1, kN/5))

# SRS, n=2000
samp.prob.0.500 <- c(rep(1/500*1, kN/5),
                 rep(1/500*1, kN/5),
                 rep(1/500*1, kN/5),
                 rep(1/500*1, kN/5),
                 rep(1/500*1, kN/5))

# Sampling depending on strata, n=1000
samp.prob.1 <- c(rep(1/1000*(1/4), kN/5),
                 rep(1/1000*(3/4), kN/5),
                 rep(1/1000*1, kN/5),
                 rep(1/1000*(5/4), kN/5),
                 rep(1/1000*(7/4), kN/5))


# Sampling depending on strata, n=1000
samp.prob.1.extreme <- c(rep(1/1000*(1/20), kN/5),
                 rep(1/1000*(10/20), kN/5),
                 rep(1/1000*1, kN/5),
                 rep(1/1000*(30/20), kN/5),
                 rep(1/1000*(39/20), kN/5))

# Sampling depending on strata, n=2000
samp.prob.1.500 <- c(rep(1/500*(1/4), kN/5),
                 rep(1/500*(3/4), kN/5),
                 rep(1/500*1, kN/5),
                 rep(1/500*(5/4), kN/5),
                 rep(1/500*(7/4), kN/5))

# Sampling depending on strata, n=100
samp.prob.1.10000 <- c(rep(1/10000*(1/4), kN/5),
                     rep(1/10000*(3/4), kN/5),
                     rep(1/10000*1, kN/5),
                     rep(1/10000*(5/4), kN/5),
                     rep(1/10000*(7/4), kN/5))

# Sampling depending on strata, n=1000, reversed prob order
samp.prob.2 <- c(rep(1/1000*(7/4), kN/5),
                 rep(1/1000*(5/4), kN/5),
                 rep(1/1000*1, kN/5),
                 rep(1/1000*(3/4), kN/5),
                 rep(1/1000*(1/4), kN/5))

# Sampling depending on strata, n=1000, reversed prob order
samp.prob.2.extreme <- c(rep(1/1000*(39/20), kN/5),
                 rep(1/1000*(30/20), kN/5),
                 rep(1/1000*1, kN/5),
                 rep(1/1000*(10/20), kN/5),
                 rep(1/1000*(1/20), kN/5))

# Sampling depending on strata, n=2000, reversed prob order
samp.prob.2.500 <- c(rep(1/500*(7/4), kN/5),
                 rep(1/500*(5/4), kN/5),
                 rep(1/500*1, kN/5),
                 rep(1/500*(3/4), kN/5),
                 rep(1/500*(1/4), kN/5))




