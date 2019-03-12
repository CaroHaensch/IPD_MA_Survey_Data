
## Filename: ~/800_example_plots/01_the_simple_case.R
## Description: Data Visualisation to show the effects of strata
## Author: Anna-Carolina Haensch

## Maintainer: Anna-Carolina Haensch (anna-carolina.haensch@gesis.org)

## Creation: 2017-11-23

###

# Get data
source("100_data_creation/01_the_simple_case.R")

data.pop.viz <- data.pop[1:1000,]
mod.viz <- lm(data.pop.viz$y~data.pop.viz$x)

# Save predictions of the model in the new data frame 
# together with variable you want to plot against
data.pop.predicted <- data.frame(y = predict(mod.viz, data.pop.viz), 
                           x = data.pop.viz$x)

# This is the predicted line of multiple linear regression
simple <- ggplot(data = data.pop.viz, aes(x = x, y = y)) + 
  geom_point(color = 'blue') +
  geom_line(color = 'red',data = data.pop.predicted, aes(x = x, y = y))

# Save
pdf(paste0("plots/simple_case_plot.pdf"), 
    width = 8, height = 5)
print(simple)
dev.off()

