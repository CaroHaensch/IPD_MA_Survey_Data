
## Filename: ~/800_example_plots/11_example_extreme_poststrat_surveys.R
## Description: Data Visualisation to show the effects high COV in weights
## Author: Anna-Carolina Haensch

## Maintainer: Anna-Carolina Haensch (anna-carolina.haensch@gesis.org)

## Creation: 2018-04-16

###

# Exploration why two-stage meta-analysis is not suited for weighted
# multivariate MA

# Create data, sampling and load needed SurveySample-function
source(file = "100_data_creation/09_heterogeneity_of_both_coefficients.R")
source(file = "200_data_samp_weight/03_diff_strata_and_endo_sampling.R")
source(file = "400_functions/sample_survey.R")


#  ------------------------------------------------------------------------
# 1. First look at data ---------------------------------------------------
#  ------------------------------------------------------------------------

# How do the data look like?
# We have some observations with low inclusion probability which get a high 
# weights IF they are included.
# Obvious dev. from the normal density.

set.seed(12031)
data.survey.1<-SampleSurvey(data.pop = data.pop,
                            kN = kN,
                            prop = 1/1000,
                            samp.prob = samp.prob.both)
set.seed(123199)
data.survey.2<-SampleSurvey(data.pop = data.pop,
                            kN = kN,
                            prop = 1/1000,
                            samp.prob = samp.prob.both)
set.seed(12392)
data.survey.3<-SampleSurvey(data.pop = data.pop,
                            kN = kN,
                            prop = 1/1000,
                            samp.prob = samp.prob.both)
set.seed(12392)
data.survey.4<-SampleSurvey(data.pop = data.pop,
                            kN = kN,
                            prop = 1/1000,
                            samp.prob = samp.prob.both)
set.seed(120392)
data.survey.5<-SampleSurvey(data.pop = data.pop,
                            kN = kN,
                            prop = 1/1000,
                            samp.prob = samp.prob.both)



densplot <- ggplot(data = data.survey.1, aes(error.term)) + 
  stat_density(geom="line", position="identity",
               aes(error.term,weights=weights))+
  stat_density(geom="line", position="identity", 
               data = data.survey.2, aes(error.term, weights=weights))+
  stat_density(geom="line", position="identity", 
               data = data.survey.3, aes(error.term, weights=weights))+
  stat_density(geom="line", position="identity", 
               data = data.survey.4, aes(error.term, weights=weights))+
  stat_density(geom="line", position="identity",
               data = data.survey.5, aes(error.term, weights=weights))+
  labs(x = "Error term", 
       y = "Sum of weights")


pdf(paste0("plots/densplot.pdf"), 
    width = 8, height = 5)
print(densplot)
dev.off()



#  ------------------------------------------------------------------------
# 2. Simulation -----------------------------------------------------------
#  ------------------------------------------------------------------------


# Simulation runs, draw surveys
list.sum1 <- list()
for (i in 1:500){
  
data.survey.1<-SampleSurvey(data.pop = data.pop,
                            kN = kN,
                            prop = 1/1000,
                            samp.prob = samp.prob.both)
# Sampling frame has a high COV for the weights

list.sum1[[i]] <- data.survey.1
}


# Extract needed coefficients 
list.coef <-lapply(list.sum1, 
                   FUN = function(z) summary(svyglm(y~x, 
                  design = svydesign(id = ~1, 
                                     weights = ~weights, 
                                     data = z)))$coefficients[,1:2])


# Vectors with estimates 
slopepoint <- sapply(list.coef, FUN = function(x) x[2,1])
slopestderr <- sapply(list.coef, FUN = function(x) x[2,2])

intpoint <- sapply(list.coef, FUN = function(x) x[1,1])
intstderr <- sapply(list.coef, FUN = function(x) x[1,2])

# Share for each survey observations with a very negative error term
anteil <- sapply(list.sum1, FUN = function(z) sum(z$error.term < -700, 
                                                  weights=z$weights))

# Plot estimates against this share 
intpointanteil <- ggplot(data.frame(intpoint,anteil), 
                         aes(x = intpoint, y = anteil)) + 
  geom_point()+labs(x = "Intercept Point Estimate", 
                    y = "Share of weighted error terms under -700")
inststderranteil <- ggplot(data.frame(intstderr,anteil), 
                           aes(x = intstderr, y = anteil)) + 
  geom_point()+labs(x = "Intercept Standard Error Estimate", 
                    y = "Share of weighted error terms under -700")
slopepointanteil <- ggplot(data.frame(slopepoint,anteil), 
                           aes(x = slopepoint, y = anteil)) + 
  geom_point()+labs(x = "Slope Point Estimate", 
                    y = "Share of weighted error terms under -700")
slopestderranteil <- ggplot(data.frame(slopestderr,anteil), 
                            aes(x = slopestderr, y = anteil)) + 
  geom_point()+labs(x = "Slope Standard Error Estimate", 
                     y = "Share of weighted error terms under -700")

# We can see that there is obviously a connection. If the share is 
# high, the point estimates are smaller and the standard error bigger.


# Save results
pdf(paste0("plots/intpointanteil.pdf"), 
    width = 8, height = 5)
print(intpointanteil)
dev.off()

pdf(paste0("plots/inststderranteil.pdf"), 
    width = 8, height = 5)
print(inststderranteil)
dev.off()

pdf(paste0("plots/slopepointanteil.pdf"), 
    width = 8, height = 5)
print(slopepointanteil)
dev.off()

pdf(paste0("plots/slopepointanteil.pdf"), 
    width = 8, height = 5)
print(slopepointanteil)
dev.off()


# Plot standard errors against point estimates
slopepointstderr <- ggplot(data.frame(slopepoint,slopestderr), 
                           aes(x = slopepoint, y = slopestderr)) + 
  geom_point()+labs(x = "Slope Point Estimate", 
                    y = "Slope Standard Error Estimate")+
  labs(caption = paste0("True value: 10.0, unweighted mean: ", 
                        round(mean(slopepoint),digits=2), 
                        ", weghted mean:",
                        round(weighted.mean(slopepoint,w=1/(slopestderr^2)),
                              digits=2)))


pdf(paste0("plots/slopepointstderr2.pdf"), 
    width = 8, height = 5)
print(slopepointstderr)
dev.off()

# Again, we see a connection. We need the weights the unbiased estimates, but 
# varaince estimators get problematic. If all point estimates were weighted 
# equally we would receive an approx- unbiased estimate. However, weighting the
# point estimates with inversed-varaince, the higher point estimates get more 
# weight than appropriate.



densplot_slopes <- ggplot(data = data.frame(slopepoint,slopestderr), 
                   aes(slopepoint)) + 
  geom_density(aes(slopepoint))

pdf(paste0("plots/densplot_slopes.pdf"), 
    width = 8, height = 5)
print(densplot_slopes)
dev.off()
