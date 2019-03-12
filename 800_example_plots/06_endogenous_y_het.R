
## Filename: ~/800_example_plots/06_endogeneous_y_het.R
## Description: Data Visualisation to show the effects of endogenous sampling
## Author: Anna-Carolina Haensch

## Maintainer: Anna-Carolina Haensch (anna-carolina.haensch@gesis.org)

## Creation: 2017-11-23

###



# Create data
kN <- 1000
x <- c(rnorm(n = kN/5, mean = -20, sd = 10),
       rnorm(n = kN/5, mean = -10, sd = 10),
       rnorm(n = kN/5, mean = 0, sd = 10),
       rnorm(n = kN/5, mean = 10, sd = 10),
       rnorm(n = kN/5, mean = 20, sd = 10))
gamma<-vector()
e<-c(rnorm(n = kN/5, mean = 0, sd = 10),
     rnorm(n = kN/5, mean = 0, sd = 25),
     rnorm(n = kN/5, mean = 0, sd = 100),
     rnorm(n = kN/5, mean = 0, sd = 155),
     rnorm(n = kN/5, mean = 0, sd = 200))
y <- 10*x + e
data.pop.viz<-data.frame(x=x,y=y, e=e)
mod.viz <- lm(data.pop.viz$y~data.pop.viz$x)
data.pop.predicted <- data.frame(y = predict(mod.viz, data.pop.viz), 
                                 x = data.pop.viz$x)

# Create plot
endy<-ggplot(data = data.pop.viz, aes(x = x, y = y)) + 
  geom_point(aes(color = (e-(min(e)))),show.legend = F) +
  geom_line(color = "#D55E00",data = data.pop.predicted, aes(x = x, y = y))+
  geom_abline(color = "blueviolet",intercept = 125,slope = 13,alpha = 0.7)+
  scale_colour_gradient2(low="white", high="#0072B2")

#Save
pdf(file = "plots/endogenous_y_het_plot.pdf", width = 8, height = 5)
print(endy)
dev.off()
