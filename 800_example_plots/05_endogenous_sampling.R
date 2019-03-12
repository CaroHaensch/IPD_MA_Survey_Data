
## Filename: ~/800_example_plots/05_endogeneous_sampling.R
## Description: Data Visualisation to show the effects of endogenous sampling
## Author: Anna-Carolina Haensch

## Maintainer: Anna-Carolina Haensch (anna-carolina.haensch@gesis.org)

## Creation: 2017-11-23

###

# Create data
kN <- 1000000
x <- rnorm(n = kN, mean = 0, sd = 10)
gamma<-vector()
e<-rnorm(n = kN,mean = 0,sd= 200)
y <- 10*x + e
data.pop<-data.frame(x=x,y=y, e=e)
data.pop.viz <- data.pop[1:1000,]
mod.viz <- lm(data.pop.viz$y~data.pop.viz$x)
data.pop.predicted <- data.frame(y = predict(mod.viz, data.pop.viz), 
                                 x = data.pop.viz$x)


# Create plot
endsamp<-ggplot() + 
  geom_point(data = data.pop.viz, aes(x = x, y = y,color = (e-(min(e)))),
             show.legend = F) +
  geom_line(color = "#D55E00",data = data.pop.predicted, aes(x = x, y = y))+
  scale_colour_gradient2(low="white", high="#0072B2")+
  geom_abline(color = "blueviolet",intercept = 250,slope = 10.2,alpha = 0.7)+
  coord_cartesian(xlim = c(-25, 25))

# Save
pdf(paste0("plots/endogenous_sampling_plot.pdf"), width = 8, height = 5)
print(endsamp)
dev.off()

  