
## Filename: /200_data_samp_weight/setups_sampling.R
## Description: Set up strings, to be evaluated in function
## Author: Anna-Carolina Haensch

## Maintainer: Anna-Carolina Haensch (anna-carolina.haensch@gesis.org)

## Creation: 20.11.2017
## Last updated on: 08.12.2017

###

# What now follows is a long list of different combination of surveys with
# different specifications. 
# The instructions will then be parsed in the single clusters and run.

### List of setups

# setup1.5 
# setup1.20 
# setup1.500  
# setup2.5 
# setup2.20 
# setup2.500 
# setup3.5 
# setup3.20  
# setup4.5 
# setup4.20 
# setup4.500 
# setup1.5.super



setup1.5 <- "data.survey.1 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.1)

          data.survey.2 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.1)

          data.survey.3 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.2)

          data.survey.4 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.2)

          data.survey.5 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.2)

          # Bind surveys together
          list.data.survey <- list(data.survey.1, data.survey.2, 
                              data.survey.3, data.survey.4, data.survey.5)"


setup1.5.super <- "data.survey.1 <- SampleSurvey(data.pop = data.pop[1:kN,],
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.1)

          data.survey.2 <- SampleSurvey(data.pop = data.pop[(kN*1+1):(kN*2),],
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.1)

          data.survey.3 <- SampleSurvey(data.pop = data.pop[(kN*2+1):(kN*3),],
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.1)

          data.survey.4 <- SampleSurvey(data.pop = data.pop[(kN*3+1):(kN*4),],
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.1)

          data.survey.5 <- SampleSurvey(data.pop = data.pop[(kN*4+1):(kN*5),],
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.1)

          # Bind surveys together
          list.data.survey <- list(data.survey.1, data.survey.2, 
                              data.survey.3, data.survey.4, data.survey.5)"

setup1.25.super <- "data.survey.1 <- SampleSurvey(data.pop = data.pop[1:kN,],
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.1)

          data.survey.2 <- SampleSurvey(data.pop = data.pop[(kN*1+1):(kN*2),],
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.1)

          data.survey.3 <- SampleSurvey(data.pop = data.pop[(kN*2+1):(kN*3),],
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.1)

          data.survey.4 <- SampleSurvey(data.pop = data.pop[(kN*3+1):(kN*4),],
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.1)

          data.survey.5 <- SampleSurvey(data.pop = data.pop[(kN*4+1):(kN*5),],
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.1)

          data.survey.6 <- SampleSurvey(data.pop = data.pop[(kN*5+1):(kN*6),],
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.1)

          data.survey.7 <- SampleSurvey(data.pop = data.pop[(kN*6+1):(kN*7),],
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.1)

          data.survey.8 <- SampleSurvey(data.pop = data.pop[(kN*7+1):(kN*8),],
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.1)

          data.survey.9 <- SampleSurvey(data.pop = data.pop[(kN*8+1):(kN*9),],
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.1)

          data.survey.10 <- SampleSurvey(data.pop = data.pop[(kN*9+1):(kN*10),],
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.1)

          data.survey.11 <- SampleSurvey(data.pop = data.pop[(kN*10+1):(kN*11),],
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.1)

          data.survey.12 <- SampleSurvey(data.pop = data.pop[(kN*11+1):(kN*12),],
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.1)

          data.survey.13 <- SampleSurvey(data.pop = data.pop[(kN*12+1):(kN*13),],
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.1)

          data.survey.14 <- SampleSurvey(data.pop = data.pop[(kN*13+1):(kN*14),],
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.1)

          data.survey.15 <- SampleSurvey(data.pop = data.pop[(kN*14+1):(kN*15),],
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.1)

          data.survey.16 <- SampleSurvey(data.pop = data.pop[(kN*15+1):(kN*16),],
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.1)

          data.survey.17 <- SampleSurvey(data.pop = data.pop[(kN*16+1):(kN*17),],
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.1)

          data.survey.18 <- SampleSurvey(data.pop = data.pop[(kN*17+1):(kN*18),],
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.1)

          data.survey.19 <- SampleSurvey(data.pop = data.pop[(kN*18+1):(kN*19),],
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.1)

          data.survey.20 <- SampleSurvey(data.pop = data.pop[(kN*19+1):(kN*20),],
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.1)

          data.survey.21 <- SampleSurvey(data.pop = data.pop[(kN*20+1):(kN*21),],
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.1)

          data.survey.22 <- SampleSurvey(data.pop = data.pop[(kN*21+1):(kN*22),],
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.1)

          data.survey.23 <- SampleSurvey(data.pop = data.pop[(kN*22+1):(kN*23),],
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.1)

          data.survey.24 <- SampleSurvey(data.pop = data.pop[(kN*23+1):(kN*24),],
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.1)

          data.survey.25 <- SampleSurvey(data.pop = data.pop[(kN*24+1):(kN*25),],
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.1)

          # Bind surveys together
          list.data.survey <- list(data.survey.1, data.survey.2, 
                              data.survey.3, data.survey.4, data.survey.5,
                              data.survey.6, data.survey.7, 
                              data.survey.8, data.survey.9, data.survey.10,
                              data.survey.11, data.survey.12, 
                              data.survey.13, data.survey.14, data.survey.15,
                              data.survey.16, data.survey.17, 
                              data.survey.18, data.survey.19, data.survey.20,
                              data.survey.21, data.survey.22, 
                              data.survey.23, data.survey.24, data.survey.25)"


setup1.20 <- "data.survey.1 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.1)

          data.survey.2 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.1)

          data.survey.3 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.2)

          data.survey.4 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.2)

          data.survey.5 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.2)

          data.survey.6 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.1)

          data.survey.7 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.1)

          data.survey.8 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.2)

          data.survey.9 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.2)

          data.survey.10 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.2)

          data.survey.11 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.1)

          data.survey.12 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.1)
  
          data.survey.13 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.2)

          data.survey.14 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.2)

          data.survey.15 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.2)

          data.survey.16 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.1)

          data.survey.17 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.1)

          data.survey.18 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.2)

          data.survey.19 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.2)

          data.survey.20 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.2)

          # Bind surveys together
          list.data.survey <- list(data.survey.1, data.survey.2, 
                          data.survey.3, data.survey.4, data.survey.5,
                          data.survey.6, data.survey.7, 
                          data.survey.8, data.survey.9, data.survey.10,
                          data.survey.11, data.survey.12, 
                          data.survey.13, data.survey.14, data.survey.15,
                          data.survey.16, data.survey.17, 
                          data.survey.18, data.survey.19, data.survey.20)"




setup1.500 <- "data.survey.1 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.1)

          data.survey.2 <- SampleSurvey(data.pop = data.pop,
                                        kN = kN,
                                        prop = 1/500,
                                        samp.prob = samp.prob.2.500)

          data.survey.3 <- SampleSurvey(data.pop = data.pop,
                                        kN = kN,
                                        prop = 1/500,
                                        samp.prob = samp.prob.2.500)

          # Bind surveys together
          list.data.survey <- list(data.survey.1, data.survey.2, 
                              data.survey.3)"



setup2.500 <- "data.survey.1 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.1)

          data.survey.2 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/500,
                              samp.prob = samp.prob.endo.500)

          data.survey.3 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/500,
                              samp.prob = samp.prob.endo.500)
          # Bind surveys together
          list.data.survey <- list(data.survey.1, data.survey.2, 
                              data.survey.3)"

setup4.500 <- "data.survey.1 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.endo)

          data.survey.2 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/500,
                              samp.prob = samp.prob.endo.2.500)

          data.survey.3 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/500,
                              samp.prob = samp.prob.endo.2.500)
          # Bind surveys together
          list.data.survey <- list(data.survey.1, data.survey.2, 
          data.survey.3)"


setup4.10000 <- "data.survey.1 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.endo)

          data.survey.2 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/10000,
                              samp.prob = samp.prob.endo.2.10000)

          data.survey.3 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/10000,
                              samp.prob = samp.prob.endo.2.10000)
          # Bind surveys together
          list.data.survey <- list(data.survey.1, data.survey.2, 
          data.survey.3)"

setup2.5 <- "data.survey.1 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.1)

          data.survey.2 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.endo)

          data.survey.3 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.endo)

          data.survey.4 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.endo)

          data.survey.5 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.1)
          # Bind surveys together
          list.data.survey <- list(data.survey.1, data.survey.2, 
                              data.survey.3, data.survey.4, data.survey.5)"



setup4.5 <- "data.survey.1 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.endo.2)

          data.survey.2 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.endo)

          data.survey.3 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.endo)

          data.survey.4 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.endo)

          data.survey.5 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.endo.2)
          # Bind surveys together
          list.data.survey <- list(data.survey.1, data.survey.2, 
                              data.survey.3, data.survey.4, data.survey.5)"



setup4.20 <- "data.survey.1 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.endo.2)

          data.survey.2 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.endo)

          data.survey.3 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.endo)

          data.survey.4 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.endo)

          data.survey.5 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.endo)

          data.survey.6 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.endo)

          data.survey.7 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.endo)

          data.survey.8 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.endo)

          data.survey.9 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.endo)

          data.survey.10 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.endo)

          data.survey.11 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.endo)

          data.survey.12 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.endo)

          data.survey.13 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.endo)

          data.survey.14 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.endo)

          data.survey.15 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.endo)

          data.survey.16 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.endo.2)

          data.survey.17 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.endo.2)

          data.survey.18 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.endo.2)

          data.survey.19 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.endo.2)

          data.survey.20 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.endo.2)

          # Bind surveys together
          list.data.survey <- list(data.survey.1, data.survey.2, 
          data.survey.3, data.survey.4, data.survey.5,
          data.survey.6, data.survey.7, 
          data.survey.8, data.survey.9, data.survey.10,
          data.survey.11, data.survey.12, 
          data.survey.13, data.survey.14, data.survey.15,
          data.survey.16, data.survey.17, 
          data.survey.18, data.survey.19, data.survey.20)"



setup2.20 <- "data.survey.1 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.1)

            data.survey.2 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.endo)

            data.survey.3 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.endo)

            data.survey.4 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.endo)

            data.survey.5 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.1)

            data.survey.6 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.1)

            data.survey.7 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.endo)

            data.survey.8 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.endo)

            data.survey.9 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.endo)

            data.survey.10 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.1)

            data.survey.11 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.1)

            data.survey.12 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.endo)

            data.survey.13 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.endo)

            data.survey.14 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.endo)

            data.survey.15 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.1)

            data.survey.16 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.1)

            data.survey.17 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.endo)

            data.survey.18 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.endo)

            data.survey.19 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.endo)

            data.survey.20 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.1)




          # Bind surveys together
            list.data.survey <- list(data.survey.1, data.survey.2, 
                    data.survey.3, data.survey.4, data.survey.5,
                    data.survey.6, data.survey.7, 
                    data.survey.8, data.survey.9, data.survey.10,
                    data.survey.11, data.survey.12, 
                    data.survey.13, data.survey.14, data.survey.15,
                    data.survey.16, data.survey.17, 
                    data.survey.18, data.survey.19, data.survey.20)"



setup3.5 <- "data.survey.1 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.endo)

          data.survey.2 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.endo)

          data.survey.3 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.endo)

          data.survey.4 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.endo)

          data.survey.5 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.endo)
          # Bind surveys together
          list.data.survey <- list(data.survey.1, data.survey.2, 
          data.survey.3, data.survey.4, data.survey.5)"



setup3.20 <- "data.survey.1 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.endo)

          data.survey.2 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.endo)

          data.survey.3 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.endo)

          data.survey.4 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.endo)

          data.survey.5 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.endo)

          data.survey.6 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.endo)

          data.survey.7 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.endo)

          data.survey.8 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.endo)

          data.survey.9 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.endo)

          data.survey.10 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.endo)

          data.survey.11 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.endo)

          data.survey.12 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.endo)

          data.survey.13 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.endo)

          data.survey.14 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.endo)

          data.survey.15 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.1)

          data.survey.16 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.endo)

          data.survey.17 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.endo)

          data.survey.18 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.endo)

          data.survey.19 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.endo)

          data.survey.20 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.endo)




          # Bind surveys together
          list.data.survey <- list(data.survey.1, data.survey.2, 
          data.survey.3, data.survey.4, data.survey.5,
          data.survey.6, data.survey.7, 
          data.survey.8, data.survey.9, data.survey.10,
          data.survey.11, data.survey.12, 
          data.survey.13, data.survey.14, data.survey.15,
          data.survey.16, data.survey.17, 
          data.survey.18, data.survey.19, data.survey.20)"


setup5.5 <- "data.survey.1 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.both)

          data.survey.2 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.both)

          data.survey.3 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.both)

          data.survey.4 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.both)

          data.survey.5 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.both)
          # Bind surveys together
          list.data.survey <- list(data.survey.1, data.survey.2, 
          data.survey.3, data.survey.4, data.survey.5)"


setup6.5 <- "data.survey.1 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.both.weak)

          data.survey.2 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.both.weak)

          data.survey.3 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.both.weak)

          data.survey.4 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.both.weak)

          data.survey.5 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.both.weak)
# Bind surveys together
list.data.survey <- list(data.survey.1, data.survey.2, 
data.survey.3, data.survey.4, data.survey.5)"

setup1.5.extreme <- "data.survey.1 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.1.extreme)

          data.survey.2 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.1.extreme)

          data.survey.3 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.2.extreme)

          data.survey.4 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.2.extreme)

          data.survey.5 <- SampleSurvey(data.pop = data.pop,
                              kN = kN,
                              prop = 1/1000,
                              samp.prob = samp.prob.2.extreme)

          # Bind surveys together
          list.data.survey <- list(data.survey.1, data.survey.2, 
                              data.survey.3, data.survey.4, data.survey.5)"

list.setup <- list(setup1.5=setup1.5,
                 setup1.20=setup1.20,
                 setup1.500=setup1.500,
                 setup2.5=setup2.5,
                 setup2.20=setup2.20,
                 setup2.500=setup2.500,
                 setup3.5=setup3.5,
                 setup3.20=setup3.20,
                 setup4.5=setup4.5,
                 setup4.20=setup4.20,
                 setup4.500=setup4.500,
                 setup1.5.super=setup1.5.super,
                 setup5.5=setup5.5,
                 setup1.5.extreme=setup1.5.extreme,
                 setup4.10000=setup4.10000,
                 setup6.5=setup6.5,
                 setup1.25.super=setup1.25.super)
