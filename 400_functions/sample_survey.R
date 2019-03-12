
## Filename: ~/400_functions/sample_survey.R
## Description: Sample strata for the simulation
## Author: Anna-Carolina Haensch

## Maintainer: Anna-Carolina Haensch (anna-carolina.haensch@gesis.org)

## Creation: 2017-11-20


#' @param data.pop The population, out of which a sample is drawj
#' @param kN Number of obs in Population
#' @param prob Proportion of the population that is drawn.
#' @param samp.prob Probability vector with which the obs are drawn
#'
#' @return Dataset with the drawn survey data
SampleSurvey<-function(data.pop, kN, prop, samp.prob){

# Bind Data together ####
data.pop$samp.prob <- samp.prob



selc <- sample(1:kN, kN*prop, prob = samp.prob)

# Hypothetical Survey Data ####
data.survey <- data.pop[selc,]
data.survey$weights <- 1/data.survey$samp.prob



if("u" %in% colnames(data.pop)) {
  
  prop.redress <- vector(length = kN*prop)
  # Dichotomisieren
  data.survey$u[data.survey$u<0] <- 0
  data.survey$u[data.survey$u>0] <- 1
  prop.redress[data.survey$u>0] <- (mean(data.survey$u)*kN*prop)/
                                    (mean(data.pop$u>0)*kN)
  prop.redress[data.survey$u<=0] <- ((1-mean(data.survey$u))*kN*prop)/
                                     ((1-mean(data.pop$u>0))*kN)
  data.survey$weights.redress <- 1/prop.redress
}

return(data.survey)

}
