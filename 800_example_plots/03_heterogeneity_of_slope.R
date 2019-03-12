
## Filename: ~/800_example_plots/03_heterogeneity_of_slope.R
## Description: Data Visualisation to show the effects of diff strata slopes
## Author: Dastan Jasim

## Maintainer: Anna-Carolina Haensch (anna-carolina.haensch@gesis.org)

## Creation: 2017-11-23

###

# Get data
source("100_data_creation/03_heterogeneity_of_slopes.R")

# Get data from strata
data.strata1 <- data.pop[1:500,]
mod.strata1 <- lm(data.strata1$y~data.strata1$x)

data.strata2 <- data.pop[200001:200500,]
mod.strata2 <- lm(data.strata2$y~data.strata2$x)

data.strata3 <- data.pop[400001:400500,]
mod.strata3 <- lm(data.strata3$y~data.strata3$x)

data.strata4 <- data.pop[600001:600500,]
mod.strata4 <- lm(data.strata4$y~data.strata4$x)

data.strata5 <- data.pop[800001:800500,]
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
heteroslope <- ggplot(data = data.strata1, aes(x = x, y = y)) + 
  geom_point(color = '#999999', data = data.strata1, aes(x = x, y = y)) +
  geom_line(color = '#999999', data = data.strat1.predicted, aes(x = x, y = y))+
  geom_point(color = '#E69F00', data = data.strata2, aes(x = x, y = y)) +
  geom_line(color = '#E69F00', data = data.strat2.predicted, aes(x = x, y = y))+
  geom_point(color = '#56B4E9', data = data.strata3, aes(x = x, y = y)) +
  geom_line(color = '#56B4E9', data = data.strat3.predicted, aes(x = x, y = y))+
  geom_point(color = '#D55E00', data = data.strata4, aes(x = x, y = y)) +
  geom_line(color = '#D55E00', data = data.strat4.predicted, aes(x = x, y = y))+
  geom_point(color = '#F0E442', data = data.strata5, aes(x = x, y = y)) +
  geom_line(color = '#F0E442', data = data.strat5.predicted, aes(x = x, y = y))+
  scale_y_continuous(limits = c(-500, 500))+
  scale_x_continuous(limits = c(0, 20))

# Save
pdf(paste0("plots/heterogeneity_slope_plot.pdf"), width = 8, height = 2.5)
print(heteroslope)
dev.off()

