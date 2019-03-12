## Filename: README.txt
## Description: README
## Author: Anna-Carolina Haensch

## Maintainer: Anna-Carolina Haensch (anna-carolina.haensch@gesis.org)

## Creation: 24.11.2017
## Last updated on: 2018-04-11

This document encomprises a simulation in the folder 100-600, 700-900 produce 
refined plots for the paper that I am currently writing. The ini file is 
on the same level as this README and is called "02_ini_simulation_simple_reg.R".
This file creates all the Estimates for the different Methods for 1000 simulation
runs which are then saved under "/results". It also creates density plots for all
the results.RData. They are the same for all results files and plot all methods.
This might be too much information in some cases.
In section 3 the ini-File creates performance plots (bias, stderr)
for selected result files and methods which are presented more in detail in the 
article.


In the folder "100_data_creation" one can find various population models which 
can be used to create the wanted artificial population.

In the folder "200_data_samp_weight" one can find different sampling mechanisms
to sample from the population created in 100. In "setups_sampling" there
are different simulation profiles (ergo combination of differently drawn 
surveys). They are not yet drawn in this file but instead the profiles are
used in the simulation.

In the folder "300_simulation_set_ups" is one file. In "cluster_basics" we collect 
all the data and functions that have to be given to the clusters. 
Beware that I had 20 cores out of which I  used 16. If one has less then 5 one has 
to change the command  "no.cores <- detectCores() - 4".

In the folder "400_functions" we have several functions that I defined for 
better readable code. The "simulation"-function is the biggest, it is executed
in the clusters. All the analysis steps are inside that function.

In the folder "500_density_plots" one can find code to produce density 
plots of the point and standard error estimates for the different methods.

In the folder "600_simulation_performance" we estimate bias, rmse and coverage.

Folders 700/900 create plots for publication, 700 produce plots of bias, rmse
and coverage and
900 produces plots to show in which cases one should use weights in regressions.

The other folder without numbers hold only output, either in case of Rdata for 
the point/std.err estimates or pdfs for the plots. 



