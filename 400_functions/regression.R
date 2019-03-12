## Filename: ~/400_functions/regression.R
## Analysis of Extreme Survey Data, Reg Y on X, weighted and not weighted
## Author: Anna-Carolina Haensch

## Maintainer: Anna-Carolina Haensch (anna-carolina.haensch@gesis.org)

## Creation: 2017-12-05

###

# Different analysis methods which only differ in some small 
# options. No second stage of an meta-analysis, only analysis on datasets
# not coefficients

# Key of Function Names:

# "Regression" = Basic Regression of Y on X
# add "FE"        = added FE for Surveys
# add "Weights"       = added Weights (Design/or Nonresponse), Weighted Reg.
# add "Redress  "     = added Poststratification Weights, Weighted Reg.
# add "K"             = transformed Weights


#' Analysis of Extreme Survey Data, Reg Y on X, not weighted
#'
#' @param data.survey Survey Data that should be analysed
#'
#' @return An summary regression object
RegressionNoWeights <- function(data.survey){
  mod.survey <- lm(data.survey$y~data.survey$x)
  return(mod.survey)
}




#' Analysis of Extreme Survey Data, Reg Y on X, not weighted plus FE
#' depending on survey
#' @param data.survey Survey Data that should be analysed
#'
#' @return An summary regression object
RegressionFE <- function(data.survey){
  mod.survey <- lm(data.survey$y~data.survey$x+data.survey$survey)
  return(mod.survey)
}




#' Analysis of Extreme Survey Data, Reg Y on X, weighted
#'
#' @param data.survey Survey Data that should be analysed
#'
#' @return An summary regression object
RegressionWeights <- function(data.survey){
  dstrat <- svydesign(id = ~1, weights = ~weights, data = data.survey)
  modsvy.survey <- svyglm(y~x, design = dstrat)
  return(modsvy.survey)
}



#' Analysis of Extreme Survey Data, Reg Y on X, weighted with trans. weights
#'
#' @param data.survey Survey Data that should be analysed
#'
#' @return An summary regression object
RegressionWeightsK <- function(data.survey){
  dstrat <- svydesign(id = ~1, weights = ~weightskj2, data = data.survey)
  modsvyk.survey <- svyglm(y~x, design = dstrat)
  return(modsvyk.survey)
}



#' Analysis of Extreme Survey Data, Reg Y on X, weighted plus FE for 
#' the different surveys
#' @param data.survey Survey Data that should be analysed
#'
#' @return An summary regression object
RegressionWeightsFE <- function(data.survey){
  dstrat <- svydesign(id = ~1, weights = ~weights, data = data.survey)
  modsvy.survey <- svyglm(y~x+survey, design = dstrat)
  return(modsvy.survey)
}



#' Analysis of Extreme Survey Data, Reg Y on X, transformed weighted plus FE
#' for the different surveys
#' @param data.survey Survey Data that should be analysed
#'
#' @return An summary regression object
RegressionWeightsKFE <- function(data.survey){
  dstrat <- svydesign(id = ~1, weights = ~weightskj2, data = data.survey)
  modsvyk.survey <- svyglm(y~x+survey, design = dstrat)
  return(modsvyk.survey)
}



#' Analysis of Extreme Survey Data, Reg Y on X, porststrat weighted
#'
#' @param data.survey Survey Data that should be analysed
#'
#' @return An summary regression object
RegressionWeightsRedress <- function(data.survey){
  dstrat <- svydesign(id = ~1, weights = ~weights.redress, data = data.survey)
  modsvyk.survey <- svyglm(y~x, design = dstrat)
  return(modsvyk.survey)
}




#' Analysis of Extreme Survey Data, Reg Y on X, transformed poststrat weighted
#'
#' @param data.survey Survey Data that should be analysed
#'
#' @return An summary regression object
RegressionWeightsKRedress <- function(data.survey){
  dstrat <- svydesign(id = ~1, weights = ~weightskj2.redress, 
                      data = data.survey)
  modsvyk.survey <- svyglm(y~x, design = dstrat)
  return(modsvyk.survey)
}




#' Analysis of Extreme Survey Data, Reg Y on X, transformed poststrat over 
#' all surveys
#' @param data.survey Survey Data that should be analysed
#'
#' @return An summary regression object
RegressionWeightsRedressPostall <- function(data.survey){
  dstrat <- svydesign(id = ~1, weights = ~weights.postall, data = data.survey)
  modsvyk.survey <- svyglm(y~x, design = dstrat)
  return(modsvyk.survey)
}




#' Analysis of Extreme Survey Data, Reg Y on X, poststrat weights with FE for
#' the different surveys
#' @param data.survey Survey Data that should be analysed
#'
#' @return An summary regression object

RegressionWeightsRedressFE <- function(data.survey){
  dstrat <- svydesign(id = ~1, weights = ~weights.redress, data = data.survey)
  modsvyk.survey <- svyglm(y~x+survey, design = dstrat)
  return(modsvyk.survey)
}




#' Analysis of Extreme Survey Data, Reg Y on X,  transformed poststrat 
#' weights with FE for the different surveys
#'
#' @param data.survey Survey Data that should be analysed
#'
#' @return An summary regression object
RegressionWeightsKRedressFE <- function(data.survey){
  dstrat <- svydesign(id = ~1, weights = ~weightskj2.redress, 
                      data = data.survey)
  modsvyk.survey <- svyglm(y~x+survey, design = dstrat)
  return(modsvyk.survey)
}



#' Analysis of Extreme Survey Data, Reg Y on X, 
#' weights with RE for the different surveys
#'
#' @param data.survey Survey Data that should be analysed
#'
#' @return An summary regression object
RegressionWeightsRE <- function(data.survey){
  modre <- summary(lmer(y~x + (1|survey),
               data=data.survey,
               weights = svywght_a))
  return(modre)
}



RegressionWeightsREB <- function(data.survey){
  modre <- summary(lmer(y~ x + (1|survey),
                        data=data.survey,
                        weights = svywght_b))
  return(modre)
}


RegressionWeightsREslope <- function(data.survey){
  modre <- summary(lmer(y~1+ x + (x|survey),
                        data=data.survey,
                        weights = svywght_a))
  return(modre)
}



RegressionWeightsREBslope <- function(data.survey){
  modre <- summary(lmer(y~1+ x + (x|survey),
                        data=data.survey,
                        weights = svywght_b))
  return(modre)
}



#' Analysis of Extreme Survey Data, Reg Y on X, 
#' not weighted with RE for the different surveys
#'
#' @param data.survey Survey Data that should be analysed
#'
#' @return An summary regression object

RegressionRE <- function(data.survey){
  modre <- summary(lmer(y~x + (1|survey),
               data=data.survey))
  return(modre)
}

