
## Filename: 02_ini_simulation_simple_reg.R
## Description: Ini file for the whole simulation
## Author: Anna-Carolina Haensch

## Maintainer: Anna-Carolina Haensch (anna-carolina.haensch@gesis.org)

## Software version: R 3.3.3

## Creation: 2017-11-20
## Last updated on: 2018-05-09

###
# ATTENTION: Takes about 10 hours to run on the 
# maschine of the author - all simulations for the article 
# are run in the loop. The superpopulation simulations are especially 
# time-intensive. Delete them from the list of simulation combinations
# if it pleases you. This should speed things up.
###




#  ------------------------------------------------------------------------
# 0. Preliminaries --------------------------------------------------------
#  ------------------------------------------------------------------------

  
# Clear
rm(list = ls())

#Set Directory 
#setwd("/home/hpc/pr63mi/di49koy/Dissertatiom/crosssecma")
#setwd("//tsclient/N/mannheim/src/ch/cross_sec_sim")

# Install Packages if needed
if (!require("survey")) install.packages("survey")
if (!require("lme4")) install.packages("lme4")
if (!require("optimx")) install.packages("optimx")
if (!require("metafor")) install.packages("metafor")
if (!require("sjstats")) install.packages("sjstats")
if (!require("Hmisc")) install.packages("Hmisc")

if (!require("parallel")) install.packages("parallel")
if (!require("reshape2")) install.packages("reshape2")
if (!require("MASS")) install.packages("MASS")

if (!require("ggplot2")) install.packages("ggplot2")
if (!require("ggthemes")) install.packages("ggthemes")
if (!require("ggpubr")) install.packages("ggpubr")
if (!require("cowplot")) install.packages("cowplot")
if (!require("xtable")) install.packages("xtable")


# Load Packages
library("survey")   # Analytical packages
library("lme4")
library("metafor")
library("sjstats")
library("Hmisc")
library("optimx")

library("parallel") # Needed for simulation
library("reshape2")
library("MASS")

library("ggplot2")  # Plot packages
library("ggthemes")
library("ggpubr")
library("cowplot")
library("xtable") #Tables




#  ------------------------------------------------------------------------
# 1. Simulation -----------------------------------------------------------
#  ------------------------------------------------------------------------



# 1.1 Population Data Creation  -------------------------------------------
#  ------------------------------------------------------------------------

# There are different data generating models implemented.

list.data.creation <- list.files(path = "100_data_creation/")

#[1] "01_the_simple_case.R"            
#[2] "02_heterogeneity_of_intercepts.R"              
#[3] "03_heterogenity_of_slopes.R"                 
#[4] "04_diff_x_means_per_strata.R"                      
#[5] "05_diff_x_means_per_strata_y_heterogeneity.R"     
#[6] "06_diff_x_means_u_high_cor.R"         
#[7] "07_diff_x_means_y_heterogeneity_u_high_cor.R"
#[8] "08_superpopulation_diff_slope.R"
#[9] "09_heterogeneity_of_both_coefficients.R"
#[10] "10_superpopulation_diff_intercept.R"
#[11] "10_superpopulation_diff_intercept25.R"



# 1.2 Data Sampling and Design Weights ------------------------------------
#  ------------------------------------------------------------------------

# There are also different sampling mechanisms implemented.

source("200_data_samp_weight/setups_sampling.R")

#[1] "setup1.5"    Sampling depending on strata, all 5 s. sizes equal
#[2] "setup1.20"   Sampling depending on strata, all 20 s. sizes equal
#[3] "setup1.500"  Sampling depending on strata,  5 s. sizes different
#[4] "setup2.5"    Not used in article
#[5] "setup2.20"   Not used in article
#[6] "setup2.500"  Not used in final article
#[7] "setup3.5"    Endogenous sampling, all 5 s. sizes equal
#[8] "setup3.20"   Endogenous sampling, all 20 s. sizes equal
#[9] "setup4.5"    Not used in article
#[10] "setup4.20"  Not used in article
#[11] "setup4.500" Not used in article
#[12] "setup1.5.super" Sampling depending on strata, all 5 s. sizes equal, supp.
#[13] "setup5.5"  Sampling depending on strata+Endogenous sampling
#[14] "setup1.5.extreme"  Sampling depending on strata, but high cov for weights
#[15] "setup4.10000" Very differnt survey sizes
#[16] "setup6.5"  Sampling depending on strata+Endogenous sampling, high cov w.      
#[17] "setup1.25.super" Sampling depending on str., all 25 s. sizes equal, supp.

# The article looks at the following combinations. 

# WA = Web Appendix

# Data generating | Sampling | Simulation Number in Article 
# [3]             | [16]     | Nr. 1
# [3]             | [13]     | Nr. 2 
# [5]             | [15]     | Nr. 3
# [11]            | [17]     | Nr. 4
# [8]             | [17]     | Nr. 5 
# [4]             | [1]      | Nr. 6 (WA)
# [4]             | [7]      | Nr. 7 (WA)
# [5]             | [7]      | Nr. 8 (WA)
# [3]             | [1]      | Nr. 9 (WA)
# [3]             | [13]     | Nr. 10 (WA)
# [7]             | [7]      | Nr. 11 (WA)


combinations <- as.data.frame(
  matrix(data = 
           c(3,16,
             3,13,
             5,15,
             11,17,
             8,17,
             4,1,
             4,7,
             5,7,
             3,1,
             3,13,
             7,7
             ),
         ncol = 2,
         byrow = T))

for (i in 1:nrow(combinations)){

number.data.creation <- combinations[i,1]
source(file = paste0("100_data_creation/", 
                     list.data.creation[number.data.creation]))

# Define patterns of sampling probabilities

# Sampling prob. depending on strata
source("200_data_samp_weight/01_diff_strata_probs.R")

# Endogeneous sampling
source("200_data_samp_weight/02_endogeneous_sampling.R")

# Endogeneous sampling
source("200_data_samp_weight/03_diff_strata_and_endo_sampling.R")

number.sampling <- combinations[i,2]
setup.sim <- list.setup[[number.sampling]]
name.setup <- names(list.setup)[[number.sampling]]



# 1.3 Simulation ----------------------------------------------------------
#  ------------------------------------------------------------------------

# Number of repetitions
M<-1000

# Set up the clusters, export the functions, libraries etc. to the clusters
source("300_simulation_set_up/cluster_basics.R")

# Run the Simulation 

list.erg.sim.test<-list()
clusterSetRNGStream(cl, 12031992)
list.erg.sim.test<-parLapply(cl, 
                      1:M, 
                      function(i) SimulationSetup(data.pop = data.pop,
                                                   setup = setup.sim,
                                                   kN = 1000000))

# Stop the clusters
stopCluster(cl)

# Unlist

erg.int.point <- as.data.frame(sapply(X = list.erg.sim.test, 
                                      FUN = function(x)  x[[1]][1,]))
erg.slope.point <- as.data.frame(sapply(X = list.erg.sim.test, 
                                        FUN = function(x)  x[[1]][2,]))

erg.int.std.err <- as.data.frame(sapply(X = list.erg.sim.test, 
                                        FUN = function(x)  x[[2]][1,]))
erg.slope.std.err <- as.data.frame(sapply(X = list.erg.sim.test, 
                                          FUN = function(x)  x[[2]][2,]))

erg.int.tau <- as.data.frame(sapply(X = list.erg.sim.test, 
                                    FUN = function(x)  x[[3]][1,]))
erg.slope.tau <- as.data.frame(sapply(X = list.erg.sim.test, 
                                      FUN = function(x)  x[[3]][2,]))

# Save results

save(list = c("erg.int.point", "erg.int.std.err",
              "erg.slope.point", "erg.slope.std.err", 
              "erg.int.tau", "erg.slope.tau",
              "name.dataset", "name.setup","mod.pop"),
     file = paste0("results/", name.dataset, "_", name.setup,
                   "_results_vector.Rdata"))


}




#  ------------------------------------------------------------------------
# 2. Create basic density plots -------------------------------------------
#  ------------------------------------------------------------------------

# Take all the Rdata files with results that were created and create some 
# basic plots



# # 2.1 Load dataset --------------------------------------------------------
# # -------------------------------------------------------------------------
# 
# list.results <- list.files(path = "results/")
# 
# for (i in 1:length(list.results)){
#   
#   load(file = paste0("results/", list.results[i]))
# 
#   
#   
# # 2.2 Visualization of results --------------------------------------------
# #  ------------------------------------------------------------------------
#   
# # Build the plots for the Simulation results
# source("500_density_plots/simulation_all_methods.R")
#   
#   
# # Build the plots for the Simulation results, Simple Version
# source("500_density_plots/simulation_without_FE_and_single_surveys.R")
#   
# }

# Plots specifically created for the article




# Focus on differences between 1Stage and 2-Stage
load(file = 
       "results/heterogeneity_of_slopes_setup5.5_results_vector.Rdata")
source(file = 
         "500_density_plots/01_comparison_weights_no_weights.R")
rm(list = ls())

# Closer look at tau
load(file = 
       "results/superpopulation_intercept_25_setup1.25.super_results_vector.Rdata")
source(file = 
           "500_density_plots/05_comparison_tau.R")
rm(list = ls())

# Linear model with exogenous sampling
load(file = 
       "results/diff_x_means_per_strata_setup1.5_results_vector.Rdata")
source(file = 
         "500_density_plots/01_comparison_weights_no_weights.R")
rm(list = ls())

# Linear model with endogenous sampling
load(file = 
       "results/diff_x_means_per_strata_setup3.5_results_vector.Rdata")
source(file = 
         "500_density_plots/01_comparison_weights_no_weights.R")
rm(list = ls())

# Linear model with endogenous sampling, heterogenous Y
load(file = 
       "results/diff_x_means_per_strata_heterogeneity_setup3.5_results_vector.Rdata")
source(file = 
         "500_density_plots/01_comparison_weights_no_weights.R")
rm(list = ls())


# Heterogeneity of slopes model with exogenous sampling (strata sampling)
load(file = 
       "results/heterogeneity_of_slopes_setup1.5_results_vector.Rdata")
source(file = 
         "500_density_plots/01_comparison_weights_no_weights.R")
rm(list = ls())

# Heterogeneity of effects model with endogenous sampling+strata sampling
load(file = 
       "results/heterogeneity_of_slopes_setup6.5_results_vector.Rdata")
source(file = 
         "500_density_plots/01_comparison_weights_no_weights.R")
rm(list = ls())


# Closer look at Poststratification
load(file = 
       "results/diff_x_means_per_strata_y_heterogeneity_u_high_cor_setup3.5_results_vector.Rdata")
source(file = 
         "500_density_plots/02_focus_poststrat.R")
rm(list = ls())


# Closer look at Poststratification
load(file = 
       "results/diff_x_means_per_strata_heterogeneity_setup4.10000_results_vector.Rdata")
source(file = 
         "500_density_plots/03_focus_transform.R")
rm(list = ls())





#  ------------------------------------------------------------------------
# 3. Create performance tables --------------------------------------------
#  ------------------------------------------------------------------------



# Focus on differences between 1Stage and 2-Stage
load(file = 
       "results/heterogeneity_of_slopes_setup5.5_results_vector.Rdata")
source(file = 
         "700_performance_tables/011_latex_weighting_when_and_how.R")
rm(list = ls())

# Focus on study heterogeneity
load(file = 
       "results/superpopulation_slope_setup1.25.super_results_vector.Rdata")
source(file = 
         "700_performance_tables/012_latex_superpopulation.R")
rm(list = ls())


load(file = 
 "results/superpopulation_intercept_25_setup1.25.super_results_vector.Rdata")
source(file = 
         "700_performance_tables/012_latex_superpopulation.R")
rm(list = ls())


# Linear model with exogenous sampling
load(file = "results/diff_x_means_per_strata_setup1.5_results_vector.Rdata")
source(file = 
         "700_performance_tables/011_latex_weighting_when_and_how.R")
rm(list = ls())

# Linear model with endogenous sampling
load(file = "results/diff_x_means_per_strata_setup3.5_results_vector.Rdata")
source(file = 
         "700_performance_tables/011_latex_weighting_when_and_how.R")
rm(list = ls())

# Linear model with endogenous sampling, y heterogenous
load(file = 
       "results/diff_x_means_per_strata_heterogeneity_setup3.5_results_vector.Rdata")
source(file = 
         "700_performance_tables/011_latex_weighting_when_and_how.R")
rm(list = ls())

# Linear heterogeneity of effects model with exoegnous sampling
load(file = 
       "results/heterogeneity_of_slopes_setup1.5_results_vector.Rdata")
source(file = 
         "700_performance_tables/011_latex_weighting_when_and_how.R")
rm(list = ls())

# Linear heterogeneity of effects model with endogenous sampling
load(file = 
       "results/heterogeneity_of_slopes_setup6.5_results_vector.Rdata")
source(file = 
         "700_performance_tables/011_latex_weighting_when_and_how.R")
rm(list = ls())

# Linear model with endogenous sampling, focus on poststratification
load(file = 
       "results/diff_x_means_per_strata_y_heterogeneity_u_high_cor_setup3.5_results_vector.Rdata")
source(file = 
         "700_performance_tables/011_latex_weighting_when_and_how.R")
rm(list = ls())


# Linear model with endogenous sampling, focus on transformation because of 
# different survey sizes
load(file = 
       "results/diff_x_means_per_strata_heterogeneity_setup4.10000_results_vector.Rdata")
source(file = "700_performance_tables/013_latex_transform.R",local = T)
rm(list = ls())


#  ------------------------------------------------------------------------
# 4. Create example plots  ------------------------------------------------
#  ------------------------------------------------------------------------

# These plots are needed for the more techinical subsections.

list.examples <- list.files(path = "800_example_plots/")
list.examples <- list.examples[-7]

for (i in 1:length(list.examples)){
  
  source(file = paste0("800_example_plots/", list.examples[i]), local=T)

}


