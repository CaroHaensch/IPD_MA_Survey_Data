## Filename: ~/200_data_samp_weight/02_endogeneous_sampling.R
## Description: Creation of endogenous sampling probabilities
## Author: Anna-Carolina Haensch


## Maintainer: Anna-Carolina Haensch (anna-carolina.haensch@gesis.org)

## Creation: 24.11.2017
## Last updated on: 29.11.2017

###

# Create error term (with correct coefficients) to later calculate probabilites
# for endogenous sampling
data.pop$error.term<-data.pop$y-data.pop$x*10
(max(data.pop$error.term)-min(data.pop$error.term))/5

# First endognous sampling profile, n=1000
samp.prob.endo<- vector(length = 10^6)
samp.prob.endo[data.pop$error.term <= 
                 quantile(data.pop$error.term,probs = c(0.2))] <- 1/1000*(1/4)
samp.prob.endo[quantile(data.pop$error.term,probs = c(0.2)) < 
                 data.pop$error.term & data.pop$error.term <= 
                 quantile(data.pop$error.term,probs = c(0.4))] <- 1/1000*(3/4)
samp.prob.endo[quantile(data.pop$error.term,probs = c(0.4)) < 
                 data.pop$error.term & data.pop$error.term <= 
                 quantile(data.pop$error.term,probs = c(0.6))] <- 1/1000
samp.prob.endo[quantile(data.pop$error.term,probs = c(0.6)) < 
                 data.pop$error.term & data.pop$error.term <= 
                 quantile(data.pop$error.term,probs = c(0.8))] <- 1/1000*(5/4)
samp.prob.endo[quantile(data.pop$error.term,probs = c(0.8)) < 
                 data.pop$error.term & data.pop$error.term <= 
                 quantile(data.pop$error.term,probs = c(1))] <- 1/1000*(7/4)

#  First endognous sampling profile but for n=2000, instead of n=1000
samp.prob.endo.500 <- vector(length = 10^6)
samp.prob.endo.500[data.pop$error.term <= 
                     quantile(data.pop$error.term,
                              probs = c(0.2))] <- 1/500*(1/4)
samp.prob.endo.500[quantile(data.pop$error.term,probs = c(0.2)) < 
                     data.pop$error.term & data.pop$error.term <= 
                     quantile(data.pop$error.term,
                              probs = c(0.4))] <- 1/500*(3/4)
samp.prob.endo.500[quantile(data.pop$error.term,probs = c(0.4)) < 
                     data.pop$error.term & data.pop$error.term <= 
                     quantile(data.pop$error.term,
                              probs = c(0.6))] <- 1/500
samp.prob.endo.500[quantile(data.pop$error.term,probs = c(0.6)) < 
                     data.pop$error.term & data.pop$error.term <= 
                     quantile(data.pop$error.term,
                              probs = c(0.8))] <- 1/500*(5/4)
samp.prob.endo.500[quantile(data.pop$error.term,probs = c(0.8)) < 
                     data.pop$error.term & data.pop$error.term <= 
                     quantile(data.pop$error.term,
                              probs = c(1))] <- 1/500*(7/4)

# Second endognous sampling profile, n=1000
samp.prob.endo.2<- vector(length = 10^6)
samp.prob.endo.2[data.pop$error.term <= 
                   quantile(data.pop$error.term,probs = c(0.2))] <- 1/1000*(7/4)
samp.prob.endo.2[quantile(data.pop$error.term,probs = c(0.2)) < 
                   data.pop$error.term & data.pop$error.term <= 
                   quantile(data.pop$error.term,probs = c(0.4))] <- 1/1000*(5/4)
samp.prob.endo.2[quantile(data.pop$error.term,probs = c(0.4)) < 
                   data.pop$error.term & data.pop$error.term <= 
                   quantile(data.pop$error.term,probs = c(0.6))] < -1/1000
samp.prob.endo.2[quantile(data.pop$error.term,probs = c(0.6)) < 
                   data.pop$error.term & data.pop$error.term <= 
                   quantile(data.pop$error.term,probs = c(0.8))] <- 1/1000*(3/4)
samp.prob.endo.2[quantile(data.pop$error.term,probs = c(0.8)) < 
                   data.pop$error.term & data.pop$error.term <= 
                   quantile(data.pop$error.term,probs = c(1))] <- 1/1000*(1/4)

# Second endognous sampling profile, n=2000
samp.prob.endo.2.500<- vector(length = 10^6)
samp.prob.endo.2.500[data.pop$error.term <= 
                   quantile(data.pop$error.term,probs = c(0.2))] <- 1/500*(7/4)
samp.prob.endo.2.500[quantile(data.pop$error.term,
                              probs = c(0.2)) < 
                   data.pop$error.term & data.pop$error.term <= 
                   quantile(data.pop$error.term,probs = c(0.4))] <- 1/500*(5/4)
samp.prob.endo.2.500[quantile(data.pop$error.term,
                              probs = c(0.4)) < 
                   data.pop$error.term & data.pop$error.term <= 
                   quantile(data.pop$error.term,probs = c(0.6))] < -1/500
samp.prob.endo.2.500[quantile(data.pop$error.term,probs = c(0.6)) < 
                   data.pop$error.term & data.pop$error.term <= 
                   quantile(data.pop$error.term,probs = c(0.8))] <- 1/500*(3/4)
samp.prob.endo.2.500[quantile(data.pop$error.term,probs = c(0.8)) < 
                   data.pop$error.term & data.pop$error.term <= 
                   quantile(data.pop$error.term,probs = c(1))] <- 1/500*(1/4)

#  Seond endognous sampling profile but for n=10000, instead of n=1000
samp.prob.endo.2.10000 <- vector(length = 10^6)
samp.prob.endo.2.10000[data.pop$error.term <= 
                         quantile(data.pop$error.term,
                                  probs = c(0.2))] <- 1/10000*(7/4)
samp.prob.endo.2.10000[quantile(data.pop$error.term,probs = c(0.2)) < 
                         data.pop$error.term & data.pop$error.term <= 
                         quantile(data.pop$error.term,
                                  probs = c(0.4))] <- 1/10000*(5/4)
samp.prob.endo.2.10000[quantile(data.pop$error.term,probs = c(0.4)) < 
                         data.pop$error.term & data.pop$error.term <= 
                         quantile(data.pop$error.term,
                                  probs = c(0.6))] <- 1/10000
samp.prob.endo.2.10000[quantile(data.pop$error.term,probs = c(0.6)) < 
                         data.pop$error.term & data.pop$error.term <= 
                         quantile(data.pop$error.term,
                                  probs = c(0.8))] <- 1/10000*(3/4)
samp.prob.endo.2.10000[quantile(data.pop$error.term,probs = c(0.8)) < 
                         data.pop$error.term & data.pop$error.term <= 
                         quantile(data.pop$error.term,
                                  probs = c(1))] <- 1/10000*(1/4)

#  Extreme sampling mechanism
samp.prob.endo.extreme<- vector(length = 10^6)
samp.prob.endo.extreme[data.pop$error.term <= 
                         quantile(data.pop$error.term,
                                  probs = c(0.2))] <- 1/1000*(1/8)
samp.prob.endo.extreme[quantile(data.pop$error.term,
                                probs = c(0.2)) < 
                         data.pop$error.term & data.pop$error.term <= 
                         quantile(data.pop$error.term,
                                  probs = c(0.4))] <- 1/1000*(3/8)
samp.prob.endo.extreme[quantile(data.pop$error.term,
                                probs = c(0.4)) < 
                         data.pop$error.term & data.pop$error.term <= 
                         quantile(data.pop$error.term,
                                  probs = c(0.6))] <- 1/1000
samp.prob.endo.extreme[quantile(data.pop$error.term,probs = c(0.6)) < 
                         data.pop$error.term & data.pop$error.term <= 
                         quantile(data.pop$error.term,
                                  probs = c(0.8))] <- 1/1000*(11/8)
samp.prob.endo.extreme[quantile(data.pop$error.term,
                                probs = c(0.8)) < 
                         data.pop$error.term & data.pop$error.term <= 
                         quantile(data.pop$error.term,
                                  probs = c(1))] <- 1/1000*(15/8)