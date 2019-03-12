
## Filename: /400_functions/korn_weighting_schemes.R
## Description: Implements the Korn/Grauband 1999 weighting transformations

## Author: Anna-Carolina Haensch
## Maintainer: Anna-Carolina Haensch (anna-carolina.haensch@gesis.org)

## Creation: 2017-11-23


#' EstimateK-function
#' 
#' This is function that takes variances of an observed variable that was 
#' measured in different surveys and calculate the revision parameter k to 
#' revise the weights in a combined dataset.
#' Korn and Graubard (1999) proposed four different approaches to revise the 
#' weights, each simpler than the one before. We will provide all four of them.
#'
#'
#' @param list.weights List of vectors with the weights from the different 
#' datasets.
#' @param var Optional.
#' Vector of the variance of the observed variable per dataset.
#' @param usevar If you want to use the most complicated formula use "yes".
#'
#' @return
#' Returns a matrix with four columns and as many rows as included surveys. 
#' The first column returns the parameters k_j calculated with the most 
#' complicated formula (p.282, formula 8.2-2), which minmizes the variance of 
#' the point estimate for the observed variable y. This formula can be 
#' simplified by assuming that the y are independent and identically distributed
#' with the same variance This results in the second column of k estimates based
#' on the formula on p.282, 8.2-4. We can simplify things further by assuming 
#' that the coefficients of variation of the weights are approximately equal. 
#' We then obtain column three which is based on formula 8.2-5. If we disregard 
#' the weights in calculating the revision completely, we obtain column 4 based 
#' on the very simple formula 8.2-6 on page 283. 
#'
#' @examples 
#' var<-rnorm(n = 3,mean = 1,sd = 0.5)
#' list.weights<-list(rnorm(n = 100,mean = 1,sd = 1),
#'                   rnorm(n = 1000,mean = 1,sd = 1),
#'                   rnorm(n = 1000,mean = 1,sd = 1))
#' EstimateK(list.weights = list.weights, usevar = "no")
#' 
EstimateK<-function(list.weights, usevar="no", var=NULL){
  
  # Number of Studies
  kNoStudies<-length(list.weights)

  # Coefficient of Variation Function
  cov.var <- function(x) {
      vc<-sd(x, na.rm=TRUE)/mean(x, na.rm=TRUE)
      vc<-(vc^2+1)/length(x)
  }
  
  # Apply to all surveys
  cov.weights.trans<-sapply(list.weights, cov.var)
  
  # Summarize weights per survey
  summ.weights<-sapply(list.weights, sum)
  # Number of observations for each survey
  length.weights<-sapply(list.weights, length)
  
  # The next data.frame Binding will give an error if we do not have a 
  # var object. Since not all survey data can provide one, we take an empty 
  # dummy vector instead in that case. We do not need the var object for
  # kj2, kj3, kj4, only for kj1.
  if (usevar!="yes"){
    var<-vector(length=kNoStudies)
  }
  
  #Bind data together
  dat.k.needed<-data.frame(summ.weights=summ.weights, 
                           var=var,
                           cov.weights.trans=cov.weights.trans,
                           length.weights=length.weights)
  
  # Estimate kj1 Function
  Estk<-function(dat.k.needed){
    k<-sum(summ.weights)/(kNoStudies*dat.k.needed[1])*
      (1-dat.k.needed[2]/(sum(var)))
    return(k)
  }
  
  #Estimate kj2 Function
  Estk2<-function(dat.k.needed){
    k<-sum(summ.weights)/(kNoStudies*dat.k.needed[1])*
      (1-(dat.k.needed[3])/(sum(cov.weights.trans)))
    return(k)
  }
  
  #Estimate kj3 Function
  Estk3<-function(dat.k.needed){
    k<-sum(summ.weights)/(kNoStudies*dat.k.needed[1])*
      (dat.k.needed[4]/sum(length.weights))
    return(k)
  }
  
  #Estimate kj4 Function
  Estk4<-function(dat.k.needed){
    k<-(dat.k.needed[4]/sum(length.weights))
    return(k)
  }
  
  # Apply the function on the data provided
  kj2<-apply(dat.k.needed, MARGIN = 1, Estk2)
  kj3<-apply(dat.k.needed, MARGIN = 1, Estk3)
  kj4<-apply(dat.k.needed, MARGIN = 1, Estk4)
  
  kjs<-cbind(kj2,kj3,kj4)
  
  if (usevar=="yes"){
    kj1<-apply(dat.k.needed, MARGIN = 1, Estk)
    kjs<-cbind(kj1,kj2,kj3,kj4)
  }

  # Return results
  return(kjs)

}


