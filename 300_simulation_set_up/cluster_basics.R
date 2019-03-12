## Filename: ~/300_simulation_set_ups/cluster_basics.R
## Description: Load all the basic stuff for parallel clusters
## Author: Anna-Carolina Haensch

## Maintainer: Anna-Carolina Haensch (anna-carolina.haensch@gesis.org)

## Creation: 2017-11-20

### 



# Calculate the number of cores
no.cores <- detectCores() - 1

# Initiate cluster
cl <- makeCluster(no.cores)

# Transfer needed data into clusters
clusterExport(cl, "data.pop")
clusterExport(cl, "list.setup")
clusterExport(cl, "setup.sim")
clusterExport(cl, "samp.prob.0")
clusterExport(cl, "samp.prob.1")
clusterExport(cl, "samp.prob.2")
clusterExport(cl, "samp.prob.endo")
clusterExport(cl, "samp.prob.endo.2")
clusterExport(cl, "samp.prob.1.500")
clusterExport(cl, "samp.prob.2.500")
clusterExport(cl, "samp.prob.endo.500")
clusterExport(cl, "samp.prob.endo.2.500")
clusterExport(cl, "samp.prob.endo.2.10000")
clusterExport(cl, "samp.prob.both")
clusterExport(cl, "samp.prob.both.weak")
clusterExport(cl, "samp.prob.1.extreme")
clusterExport(cl, "samp.prob.2.extreme")


# Load needed packages into clusters
clusterEvalQ(cl, library(survey))
clusterEvalQ(cl, library(metafor)) 
clusterEvalQ(cl, library(sjstats))
clusterEvalQ(cl, library(lme4))


# Lists of packages and functions needed in the clusters
package.list<-c("survey","metafor","parallel", "reshape2")
funktionen.list<-c("StdErrCoef","RegressionNoWeights",
                   "RegressionWeights", 
                   "RegressionWeightsK",
                   "RegressionWeightsRedress", 
                   "RegressionWeightsKRedress",
                   "RegressionFE",
                   "RegressionWeightsFE", 
                   "RegressionWeightsKFE",
                   "RegressionWeightsRedressFE", 
                   "RegressionWeightsKRedressFE",
                   "RegressionWeightsRedressPostall",
                   "RegressionWeightsRE",
                   "RegressionWeightsREB",
                   "RegressionWeightsREslope",
                   "RegressionWeightsREBslope",
                   "RegressionRE",
                   "SampleSurvey","EstimateK")

# Needed functions for Analysis
source("400_functions/regression.R")
source("400_functions/std_err_coef.R")
source("400_functions/korn_weighting_schemes.R")
source("400_functions/sample_survey.R")

# Transfer Functions into Clusters
for (i in funktionen.list){
  clusterExport(cl, i)
}

# Get the Simulation function into the clusters 
source("400_functions/simulation.R")
clusterExport(cl, "SimulationSetup")


# Analysis of Population Data (correct coefficients)
mod.pop <- lm(data.pop$y~data.pop$x)
mean(data.pop$u>0)