
## Filename: ~/800_example_plots/04_diff_x.R
## Description: Data Visualisation to show the non-exis effects of diff strata x
## Author: Dastan Jasim, Anna-Carolina Haensch

## Maintainer: Anna-Carolina Haensch (anna-carolina.haensch@gesis.org)

## Creation: 2017-12-17

# Get data
source("100_data_creation/04_diff_x_means_per_strata.R")

# Get data from strata
data.strata1 <- data.pop[1:200,]
mod.strata1 <- lm(data.strata1$y~data.strata1$x)

data.strata2 <- data.pop[200001:200200,]
mod.strata2 <- lm(data.strata2$y~data.strata2$x)

data.strata3 <- data.pop[400001:400200,]
mod.strata3 <- lm(data.strata3$y~data.strata3$x)

data.strata4 <- data.pop[600001:600200,]
mod.strata4 <- lm(data.strata4$y~data.strata4$x)

data.strata5 <- data.pop[800001:800200,]
mod.strata5 <- lm(data.strata5$y~data.strata5$x)

# Save predictions of the model in the new data frame 
# together with variable you want to plot against
data.strat1.predicted  <-  data.frame(y = predict(mod.strata1, data.strata1), 
                                      x = data.strata1$x)

data.strat2.predicted  <-  data.frame(y = predict(mod.strata2, data.strata2), 
                                      x = data.strata2$x)

data.strat3.predicted  <-  data.frame(y = predict(mod.strata3, data.strata3), 
                                      x = data.strata3$x)

data.strat4.predicted  <-  data.frame(y = predict(mod.strata4, data.strata4), 
                                      x = data.strata4$x)

data.strat5.predicted  <-  data.frame(y = predict(mod.strata5, data.strata5), 
                                      x = data.strata5$x)

# This is the predicted line of multiple linear regression
# colors from: http://www.cookbook-r.com/Graphs/Colors_(ggplot2)/
diffx<-ggplot(data = data.strata1, aes(x = x, y = y)) + 
  geom_point(color = '#999999', data = data.strata1, aes(x = x, y = y)) +
  geom_line(color = '#999999', data = data.strat1.predicted, aes(x = x, y = y))+
  geom_point(color = '#E69F00', data = data.strata2, aes(x = x, y = y)) +
  geom_line(color = '#E69F00', data = data.strat2.predicted, aes(x = x, y = y))+
  geom_point(color = '#56B4E9', data = data.strata3, aes(x = x, y = y)) +
  geom_line(color = '#56B4E9', data = data.strat3.predicted, aes(x = x, y = y))+
  geom_point(color = '#D55E00', data = data.strata4, aes(x = x, y = y)) +
  geom_line(color = '#D55E00', data = data.strat4.predicted, aes(x = x, y = y))+
  geom_point(color = '#F0E442', data = data.strata5, aes(x = x, y = y)) +
  geom_line(color = '#F0E442', data = data.strat5.predicted, aes(x = x, y = y))

# Save
pdf(paste0("plots/diffx_plot.pdf"), width = 8, height = 5)
print(diffx)
dev.off()

