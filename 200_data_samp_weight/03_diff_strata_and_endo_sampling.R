
## Filename: ~/200_data_samp_weight/03_diff_strata_and_endo_sampling.R
## Description: Creation of comb. starta prob+endo sampl.
## Author: Anna-Carolina Haensch


## Maintainer: Anna-Carolina Haensch (anna-carolina.haensch@gesis.org)

## Creation: 24.11.2017
## Last updated on: 29.11.2017

###

# Create error term (with correct coefficients) to later calculate probabilites
# for endogenous sampling
data.pop$error.term<-data.pop$y-data.pop$x*10

# Endogenous sampling
samp.prob.endo<- vector(length = 10^6)
samp.prob.endo[data.pop$error.term <= 
                 quantile(data.pop$error.term,probs = c(0.2))] <- (1/4)
samp.prob.endo[quantile(data.pop$error.term,probs = c(0.2)) < 
                 data.pop$error.term & data.pop$error.term <= 
                 quantile(data.pop$error.term,probs = c(0.4))] <- (3/4)
samp.prob.endo[quantile(data.pop$error.term,probs = c(0.4)) < 
                 data.pop$error.term & data.pop$error.term <= 
                 quantile(data.pop$error.term,probs = c(0.6))] <- 1
samp.prob.endo[quantile(data.pop$error.term,probs = c(0.6)) < 
                 data.pop$error.term & data.pop$error.term <= 
                 quantile(data.pop$error.term,probs = c(0.8))] <- (5/4)
samp.prob.endo[quantile(data.pop$error.term,probs = c(0.8)) < 
                 data.pop$error.term & data.pop$error.term <= 
                 quantile(data.pop$error.term,probs = c(1))] <- (7/4)

# Strata prob
samp.prob.1 <- c(rep(1/1000*(7/4), kN/5),
                 rep(1/1000*(5/4), kN/5),
                 rep(1/1000*1, kN/5),
                 rep(1/1000*(3/4), kN/5),
                 rep(1/1000*(1/4), kN/5))

#Combine
samp.prob.both <- samp.prob.1*samp.prob.endo 

# CV Calculation
sd(samp.prob.both, na.rm=TRUE)/mean(samp.prob.both, na.rm=TRUE)*100

# Endogenous sampling
data.pop$error.term<-data.pop$y-data.pop$x*10
samp.prob.endo.weak<- vector(length = 10^6)
samp.prob.endo.weak[data.pop$error.term <= 
                 quantile(data.pop$error.term,probs = c(0.2))] <- (2/3)
samp.prob.endo.weak[quantile(data.pop$error.term,probs = c(0.2)) < 
                 data.pop$error.term & data.pop$error.term <= 
                 quantile(data.pop$error.term,probs = c(0.4))] <- (3/4)
samp.prob.endo.weak[quantile(data.pop$error.term,probs = c(0.4)) < 
                 data.pop$error.term & data.pop$error.term <= 
                 quantile(data.pop$error.term,probs = c(0.6))] <- 1
samp.prob.endo.weak[quantile(data.pop$error.term,probs = c(0.6)) < 
                 data.pop$error.term & data.pop$error.term <= 
                 quantile(data.pop$error.term,probs = c(0.8))] <- (5/4)
samp.prob.endo.weak[quantile(data.pop$error.term,probs = c(0.8)) < 
                 data.pop$error.term & data.pop$error.term <= 
                 quantile(data.pop$error.term,probs = c(1))] <- (4/3)

# Strata prob
samp.prob.1.weak <- c(rep(1/1000*(4/3), kN/5),
                 rep(1/1000*(5/4), kN/5),
                 rep(1/1000*1, kN/5),
                 rep(1/1000*(3/4), kN/5),
                 rep(1/1000*(2/3), kN/5))

# Combination
samp.prob.both.weak <- samp.prob.1.weak*samp.prob.endo.weak

# CV Calculation
sd(samp.prob.both.weak, na.rm=TRUE)/mean(samp.prob.both.weak, na.rm=TRUE)*100