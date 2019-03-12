## Filename: ~/400_functions/simulation.R
## Description: Set-up of a frist Simulation
## Author: Anna-Carolina Haensch


## Maintainer: Anna-Carolina Haensch (anna-carolina.haensch@gesis.org)

## Creation: 18.11.2017
## Last updated on: 08.12.2017


#' @param data.pop The population, out of which a sample is drawj
#' @param setup String with the sample commands
#' @param kN Number of obs
#'
#' @return Point estimates and variance estimates for all methods and 
#' repetitions
SimulationSetup<-function(data.pop, setup, kN){
  
  
  
  # -------------------------------------------------------------------------
  # +++ Preparation 
  # -------------------------------------------------------------------------
  
  
  
  # -++ Draw surveys
  # -------------------------------------------------------------------------
  
  # Parse and run the setup character strings = draw the surveys from the pop.
  eval(parse(text=setup))
  
  
  
  # -++  Korn Graubach Transformation
  # -------------------------------------------------------------------------
  

  # Estimate the Korn Graubach Transformation Coeffients

  kjs <- EstimateK(list.weights = lapply(list.data.survey, 
                                          function(x) x$weights))
  
  # Apply kj2, kj3, kj4
  
  for (i in 1:length(list.data.survey)){
    list.data.survey[[i]]$weightskj2 <- kjs[i,1]*list.data.survey[[i]]$weights
  }
  for (i in 1:length(list.data.survey)){
    list.data.survey[[i]]$weightskj3 <- kjs[i,2]*list.data.survey[[i]]$weights
  }
  for (i in 1:length(list.data.survey)){
    list.data.survey[[i]]$weightskj4 <- kjs[i,3]*list.data.survey[[i]]$weights
  }

  
  
  
  # -------------------------------------------------------------------------
  # +++ Analysis
  # -------------------------------------------------------------------------
  
  
  # -++ Single Surveys
  # -------------------------------------------------------------------------
  
  
  # Analysis of Survey Data, sepearte per Dataset, not weighted
  list.mod.survey <- lapply(X = list.data.survey,
                            FUN = RegressionNoWeights)
  
  # Analysis of Survey Data, sepearte per Dataset, (perfectly) weighted
  list.modsvy.survey <- lapply(X = list.data.survey,
                               FUN = RegressionWeights)
  
  if("u" %in% colnames(data.pop)) {
  # Analysis of Survey Data, sepearte per Dataset, postratification weighted
  list.modsvy.poststrat.survey <- lapply(X = list.data.survey,
                               FUN = RegressionWeightsRedress)
  }
  
  
  
  
  # -++ Two-stage IPD meta-analysies techniques
  # -------------------------------------------------------------------------
  
  
  #--+  2-Stage Analysis of Survey Data,not weighted
  
  # Get coefficients from single surveys
  data.2st.coefs <- sapply(X = list.mod.survey,
                           FUN = coef)
  data.2st.std.err <- sapply(X = list.mod.survey,
                             FUN = StdErrCoef)
  
  # Calculate combined intercept and slope
  modrma.int <- rma(yi = data.2st.coefs[1,],
                    sei = data.2st.std.err[1,], method = "REML")
  modrma.beta1 <- rma(yi = data.2st.coefs[2,],
                      sei = data.2st.std.err[2,], method = "REML")
  
  
  #--+  2-Stage Analysis of Survey Data, (perfectly) weighted, Random Effects
  
  # Get coefficients from single surveys
  data.2stsvy.coefs <- sapply(X = list.modsvy.survey,
                              FUN = coef)
  data.2stsvy.std.err <- sapply(X = list.modsvy.survey,
                                FUN = StdErrCoef)
  
  # Calculate combined intercept and slope
  modrmasvy.int <- rma(yi = data.2stsvy.coefs[1,], 
                       sei = data.2stsvy.std.err[1,], method = "REML")
  modrmasvy.beta1 <- rma(yi = data.2stsvy.coefs[2,], 
                         sei = data.2stsvy.std.err[2,], method = "REML")
  
  
  
  #--+ 2-Stage Analysis of Survey Data, (perfectly) weighted, Fixed Effects
  
  # Get coefficients from single surveys
  data.2stsvy.coefs <- sapply(X = list.modsvy.survey,
                              FUN = coef)
  data.2stsvy.std.err <- sapply(X = list.modsvy.survey,
                                FUN = StdErrCoef)
  
  # Calculate combined intercept and slope
  modrmasvyfe.int <- rma(yi = data.2stsvy.coefs[1,], 
                       sei = data.2stsvy.std.err[1,], method = "FE")
  modrmasvyfe.beta1 <- rma(yi = data.2stsvy.coefs[2,], 
                         sei = data.2stsvy.std.err[2,], method = "FE")
  
  
  #--+ 2-Stage Analysis of Survey Data, meta-analytic part, poststrat+ RE

  if("u" %in% colnames(data.pop)) {
    
  # Get coefficients from single surveys
  data.2stsvy.poststrat.coefs <- sapply(X = list.modsvy.poststrat.survey,
                              FUN = coef)
  data.2stsvy.poststrat.std.err <- sapply(X = list.modsvy.poststrat.survey,
                                FUN = StdErrCoef)
  
  # Calculate combined intercept and slope
  modrmasvy.poststrat.int <- rma(yi = data.2stsvy.poststrat.coefs[1,], 
                       sei = data.2stsvy.poststrat.std.err[1,])
  modrmasvy.poststrat.beta1 <- rma(yi = data.2stsvy.poststrat.coefs[2,], 
                         sei = data.2stsvy.poststrat.std.err[2,])
  
  
  #--+ 2-Stage Analysis of Survey Data, meta-analytic part, poststrat, FE
  
  # Calculate combined intercept and slope
  modrmasvyfe.poststrat.int <- rma(yi = data.2stsvy.poststrat.coefs[1,], 
                               sei = data.2stsvy.poststrat.std.err[1,],
                               method="FE")
  modrmasvyfe.poststrat.beta1 <- rma(yi = data.2stsvy.poststrat.coefs[2,], 
                                 sei = data.2stsvy.poststrat.std.err[2,],
                                 method="FE")
  }
  
  
  
  
  
  # -++ Two.stage IPD meta-analysies techniques
  # -------------------------------------------------------------------------
  
  
  
  # Unlist all the survey data and create one big data matrix 
  data.ipd <- do.call("rbind", list.data.survey) 
  survey.numb<-sapply(list.data.survey, nrow)
  survey.letter<-vector()
  for (i in 1:length(survey.numb)){
    survey.letter<-c(survey.letter, rep(letters[i], survey.numb[i]))
  }
  data.ipd$survey<-as.factor(survey.letter)
  
  
  # One-Stage-IPD-Analysis Analyse with different options
  mod.ipd.1st <- RegressionNoWeights(data.ipd) # unweighted  
  modsvy.ipd.1st <- RegressionWeights(data.ipd) #weighted (perfect w.)
  modsvyk2.ipd.1st <- RegressionWeightsK(data.ipd) #weighted (trans. w.)
  
  mod.ipd.1st.fe <- RegressionFE(data.ipd) # unweighted with FE
  modsvy.ipd.1st.fe <- RegressionWeightsFE(data.ipd) # w with FE
  modsvyk2.ipd.1st.fe <- RegressionWeightsKFE(data.ipd) #tr w.FE
  mod.ipd.1st.RE <- RegressionRE(data.ipd) # unweighted with RE
  
  data.ipd.2<-scale_weights(x = data.ipd,
                            cluster.id = survey,
                            pweight = weights) #create Carle weights for mixedm
  modsvy.ipd.1st.RE <- RegressionWeightsRE(data.ipd.2) 
  # weighted with RE intercept, transformation "A"
  
  modsvy.ipd.1st.RE.B <- RegressionWeightsREB(data.ipd.2) 
  # weighted with RE intercept, transformation "B"
  
  
  modsvy.ipd.1st.RE.slope <- RegressionWeightsREslope(data.ipd.2) 
  # weighted with RE slope, transformation "A"
  
  modsvy.ipd.1st.RE.B.slope <- RegressionWeightsREBslope(data.ipd.2) 
  # weighted with RE slope, transformation "B"
   
  if("u" %in% colnames(data.pop)) {
   
    # Unlist all the survey data and create one big data matrix
    
    # Before add the transformed weights
    for (i in 1:length(list.data.survey)){
      list.data.survey[[i]]$weightskj2.redress <- kjs[i,1]*
        list.data.survey[[i]]$weights.redress
    }
    for (i in 1:length(list.data.survey)){
      list.data.survey[[i]]$weightskj3.redress <- kjs[i,2]*
        list.data.survey[[i]]$weights.redress
    }
    for (i in 1:length(list.data.survey)){
      list.data.survey[[i]]$weightskj4.redress <- kjs[i,3]*
        list.data.survey[[i]]$weights.redress
    }
    
    # now get all the data
    data.ipd <- do.call("rbind", list.data.survey) 
    survey.numb<-sapply(list.data.survey, nrow)
    survey.letter<-vector()
    for (i in 1:length(survey.numb)){
      survey.letter<-c(survey.letter, rep(letters[i], survey.numb[i]))
    }
    data.ipd$survey<-as.factor(survey.letter)
    
    
    # Analyse with different options
    modsvy.poststrat.ipd.1st <- 
      RegressionWeightsRedress(data.ipd) # poststrat weighted 
    modsvyk2.poststrat.ipd.1st <- 
      RegressionWeightsKRedress(data.ipd) # poststrat weighted (trans)
    
    modsvy.poststrat.ipd.1st.fe <- 
      RegressionWeightsRedressFE(data.ipd) # poststrat weighted + FE
    modsvyk2.poststrat.ipd.1st.fe <- 
      RegressionWeightsKRedressFE(data.ipd)# poststrat w. trans + FE
  
    # Last option (poststratify over the whole survey and then analyse)  
      prop.redress <- vector(length = length(data.ipd))
      data.ipd$u[data.ipd$u<0]<-0
      data.ipd$u[data.ipd$u>0]<-1
      prop.redress[data.ipd$u>0]<- (mean(data.ipd$u)*length(data.ipd))/
        (mean(data.pop$u>0)*kN)
      prop.redress[data.ipd$u<=0]<- ((1-mean(data.ipd$u))*length(data.ipd))/
        ((1-mean(data.pop$u>0))*kN)
      data.ipd$weights.postall<-1/prop.redress
      
      modsvy.poststrat.allpost.ipd.1st <- 
      RegressionWeightsRedressPostall(data.ipd) # poststrat over all data
      
      mod.ipd.1st.RE <- RegressionRE(data.ipd) # unweighted with RE
      
      data.ipd.2<-scale_weights(x = data.ipd,
                                cluster.id = survey,
                                pweight = weights)
      modsvy.ipd.1st.RE <- RegressionWeightsRE(data.ipd.2) # weighted with RE 
      
      
      data.ipd.3<-scale_weights(x = data.ipd,
                                cluster.id = survey,
                                pweight = weights.redress)
      modsvy.poststrat.ipd.1st.RE <- RegressionWeightsRE(data.ipd.3) 
      # poststrat withRE 

  }
 
  
  # -------------------------------------------------------------------------
  # +++ Bring all results together
  # -------------------------------------------------------------------------
  
  
  # tau zusammenbinden
  
  tau<-cbind(c(modrma.int$tau2, modrma.beta1$tau2),
        c(modrmasvy.int$tau2, modrmasvy.beta1$tau2),
        c(mod.ipd.1st.RE$varcor$survey[1], NA), 
        c(modsvy.ipd.1st.RE$varcor$survey[1], NA),
        c(modsvy.ipd.1st.RE.B$varcor$survey[1], NA),
        c(modsvy.ipd.1st.RE.slope$varcor$survey[1], NA),
        c(modsvy.ipd.1st.RE.B.slope$varcor$survey[1], NA))
  
  colnames(tau)<-c("IPD 2 St RE", "IPD 2 St weighted RE","IPD 1 St RE",
                   "IPD 1 St RE weighted A trans",
                   "IPD 1 St RE weighted B trans",
                   "IPD 1 St RE slope weighted A trans",
                   "IPD 1 St RE slope weighted B trans")
  
  # Bind Models together 
  
  # First Point estimates
  res <- cbind(list.mod.survey[[1]]$coefficients,
               list.mod.survey[[2]]$coefficients,
               list.modsvy.survey[[1]]$coefficients,
               list.modsvy.survey[[2]]$coefficients,
               mod.ipd.1st$coefficients,
               modsvy.ipd.1st$coefficients,
               modsvyk2.ipd.1st$coefficients,
               c(modrma.int$b, modrma.beta1$b),
               c(modrmasvy.int$b, modrmasvy.beta1$b),
               c(modrmasvyfe.int$b, modrmasvyfe.beta1$b),
               mod.ipd.1st.fe$coefficients[1:2],
               modsvy.ipd.1st.fe$coefficients[1:2],
               modsvyk2.ipd.1st.fe$coefficients[1:2],
               mod.ipd.1st.RE$coefficients[,1],
               modsvy.ipd.1st.RE$coefficients[,1],
               modsvy.ipd.1st.RE.B$coefficients[,1],
               modsvy.ipd.1st.RE.slope$coefficients[,1],
               modsvy.ipd.1st.RE.B.slope$coefficients[,1]
  )
  
  if("u" %in% colnames(data.pop)) {
    res <- cbind(list.mod.survey[[1]]$coefficients,
                 list.mod.survey[[2]]$coefficients,
                 list.modsvy.survey[[1]]$coefficients,
                 list.modsvy.survey[[2]]$coefficients,
                 list.modsvy.poststrat.survey[[1]]$coefficients,
                 list.modsvy.poststrat.survey[[2]]$coefficients,
                 mod.ipd.1st$coefficients,
                 modsvy.ipd.1st$coefficients,
                 modsvyk2.ipd.1st$coefficients,
                 modsvy.poststrat.ipd.1st$coefficients,
                 modsvyk2.poststrat.ipd.1st$coefficients,
                 c(modrma.int$b, modrma.beta1$b),
                 c(modrmasvy.int$b, modrmasvy.beta1$b),
                 c(modrmasvy.poststrat.int$b, modrmasvy.poststrat.beta1$b),
                 c(modrmasvyfe.int$b, modrmasvyfe.beta1$b),
                 c(modrmasvyfe.poststrat.int$b, modrmasvyfe.poststrat.beta1$b),
                 mod.ipd.1st.fe$coefficients[1:2],
                 modsvy.ipd.1st.fe$coefficients[1:2],
                 modsvyk2.ipd.1st.fe$coefficients[1:2],
                 modsvy.poststrat.ipd.1st.fe$coefficients[1:2],
                 modsvyk2.poststrat.ipd.1st.fe$coefficients[1:2],
                 modsvy.poststrat.allpost.ipd.1st$coefficients[1:2],
                 mod.ipd.1st.RE$coefficients[,1],
                 modsvy.ipd.1st.RE$coefficients[,1],
                 modsvy.poststrat.ipd.1st.RE$coefficients[,1]
    )
    }
  
  # Second variance estimates
  res.std.err <- cbind(StdErrCoef(list.mod.survey[[1]]),
                       StdErrCoef(list.mod.survey[[2]]),
                       StdErrCoef(list.modsvy.survey[[1]]),
                       StdErrCoef(list.modsvy.survey[[2]]),
                       StdErrCoef(mod.ipd.1st),
                       StdErrCoef(modsvy.ipd.1st),
                       StdErrCoef(modsvyk2.ipd.1st),
                       c(modrma.int$se, modrma.beta1$se),
                       c(modrmasvy.int$se, modrmasvy.beta1$se),
                       c(modrmasvyfe.int$se, modrmasvyfe.beta1$se),
                       StdErrCoef(mod.ipd.1st.fe)[1:2],
                       StdErrCoef(modsvy.ipd.1st.fe)[1:2],
                       StdErrCoef(modsvyk2.ipd.1st.fe)[1:2],
                       mod.ipd.1st.RE$coefficients[,2],
                       modsvy.ipd.1st.RE$coefficients[,2],
                       modsvy.ipd.1st.RE.B$coefficients[,2],
                       modsvy.ipd.1st.RE.slope$coefficients[,2],
                       modsvy.ipd.1st.RE.B.slope$coefficients[,2]
                       
  )
  
  if("u" %in% colnames(data.pop)) {
    res.std.err <- cbind(StdErrCoef(list.mod.survey[[1]]),
                         StdErrCoef(list.mod.survey[[2]]),
                         StdErrCoef(list.modsvy.survey[[1]]),
                         StdErrCoef(list.modsvy.survey[[2]]),
                         StdErrCoef(list.modsvy.poststrat.survey[[1]]),
                         StdErrCoef(list.modsvy.poststrat.survey[[2]]),
                         StdErrCoef(mod.ipd.1st),
                         StdErrCoef(modsvy.ipd.1st),
                         StdErrCoef(modsvyk2.ipd.1st),
                         StdErrCoef(modsvy.poststrat.ipd.1st),
                         StdErrCoef(modsvyk2.poststrat.ipd.1st),
                         c(modrma.int$se, modrma.beta1$se),
                         c(modrmasvy.int$se, modrmasvy.beta1$se),
                         c(modrmasvy.poststrat.int$se, modrmasvy.poststrat.beta1$se),
                         c(modrmasvyfe.int$se, modrmasvyfe.beta1$se),
                         c(modrmasvyfe.poststrat.int$se, modrmasvyfe.poststrat.beta1$se),
                         StdErrCoef(mod.ipd.1st.fe)[1:2],
                         StdErrCoef(modsvy.ipd.1st.fe)[1:2],
                         StdErrCoef(modsvyk2.ipd.1st.fe)[1:2],
                         StdErrCoef(modsvy.poststrat.ipd.1st.fe)[1:2],
                         StdErrCoef(modsvyk2.poststrat.ipd.1st.fe)[1:2],
                         StdErrCoef(modsvy.poststrat.allpost.ipd.1st)[1:2],
                         mod.ipd.1st.RE$coefficients[,2],
                         modsvy.ipd.1st.RE$coefficients[,2],
                         modsvy.poststrat.ipd.1st.RE$coefficients[,2]
    )
  }
  
  
  if("u" %in% colnames(data.pop)) {
    colnames(res.std.err) <- colnames(res) <- c("Survey 1 unweighted", 
                                                "Survey 2 unweighted", 
                                                "Survey 1 weighted", 
                                                "Survey 2 weighted",
                                                "Survey 1 poststrat", 
                                                "Survey 2 poststrat",
                                                "IPD 1 St unweighted",
                                                "IPD 1 St weighted",
                                                "IPD 1 St transf weighted",
                                                "IPD 1 St poststrat",
                                                "IPD 1 St transf poststrat",
                                                "IPD 2 St unweighted",
                                                "IPD 2 St RE weighted",
                                                "IPD 2 St RE poststrat",
                                                "IPD 2 St FE weighted",
                                                "IPD 2 St FE poststrat",
                                                "IPD 1 St FE unweighted",
                                                "IPD 1 St FE weighted",
                                                "IPD 1 St FE transf weighted",
                                                "IPD 1 St FE poststrat",
                                                "IPD 1 St FE transf poststrat",
                                                "IPD 1 St poststrat over all s",
                                                "IPD 1 St RE unweighted",
                                                "IPD 1 St RE weighted",
                                                "IPD 1 St RE poststrat")
    
  }else{
  # Give names
  colnames(res.std.err) <- colnames(res) <- c("Survey 1 unweighted", 
                                              "Survey 2 unweighted", 
                                              "Survey 1 weighted", 
                                              "Survey 2 weighted",
                                              "IPD 1 St unweighted",
                                              "IPD 1 St weighted",
                                              "IPD 1 St transf weighted",
                                              "IPD 2 St unweighted",
                                              "IPD 2 St RE weighted",
                                              "IPD 2 St FE weighted",
                                              "IPD 1 St FE unweighted",
                                              "IPD 1 St FE weighted",
                                              "IPD 1 St FE transf weighted",
                                              "IPD 1 St RE unweighted",
                                              "IPD 1 St RE weighted",
                                              "IPD 1 St RE weighted B",
                                              "IPD 1 St RE weighted slope",
                                              "IPD 1 St RE weighted B slope")
  
  }
  rownames(res.std.err) <- rownames(res) <- c("Intercept", "beta1")
  

  
  
  # Return results
  return(list(res,res.std.err, tau))
}