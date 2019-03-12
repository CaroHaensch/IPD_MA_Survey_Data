## Filename: ~/500_data_visualization/04_comparison_tau.R
## Description: Visualization of simulation results
## Author: Anna-Carolina Haensch


## Maintainer: Anna-Carolina Haensch (anna-carolina.haensch@gesis.org)

## Creation: 2017-11-23

# Clear


# Melt the matrix to  createggplot density plot
erg.int.tau$refseq <- rownames(erg.int.tau)
erg.int.tau.melt <- melt(erg.int.tau)


erg.slope.tau$refseq <- rownames(erg.slope.tau)
erg.slope.tau.melt <- melt(erg.slope.tau)

tokeep<-which(erg.slope.tau.melt$refseq=="IPD 1 St RE weighted A trans" |
                erg.slope.tau.melt$refseq=="IPD 1 St RE weighted B trans"|
                erg.slope.tau.melt$refseq=="IPD 2 St weighted RE"|
                erg.slope.tau.melt$refseq=="IPD 1 St RE")

erg.int.tau.melt <- erg.int.tau.melt[tokeep,]
erg.slope.tau.melt  <- erg.slope.tau.melt [tokeep,]

erg.int.tau.melt$value <- sqrt(erg.int.tau.melt$value)
erg.slope.tau.melt$value <- sqrt(erg.slope.tau.melt$value)

# Plot results as density plots
plot.erg.int.tau<- ggplot(aes(x = value, colour = refseq, 
                                 linetype = refseq, size=refseq), 
                             data = erg.int.tau.melt)

plot.erg.int.tau<- plot.erg.int.tau+ 
  scale_size_manual(values=c(1, 1,
                             1, 1),
                    labels = c("1 St. RE unweighted    ", "1 St. RE weighted tr. A  ",
                               "1 St. RE weighted tr. B.   ", "2 St. RE weighted    "),
                    guide = guide_legend(title = NULL))+
  scale_linetype_manual(values=c("longdash", "solid", 
                                 "solid", "dashed"),                      
                        labels = c("1 St. RE unweighted    ", "1 St. RE weighted tr. A  ",
                                   "1 St. RE weighted tr. B.   ", "2 St. RE weighted    "),
                        
                        guide = guide_legend(title = NULL))+
  scale_color_manual(values=c("#E69F00",
                              "#0072B2",
                              "#CC79A7",
                              "#009E73"),
                     labels = c("1 St. RE unweighted    ", "1 St. RE weighted tr. A  ",
                                "1 St. RE weighted tr. B.   ", "2 St. RE weighted    "),
                     guide = guide_legend(title = NULL))+
  labs(x = "Estimate", y = "Density")+
  theme(legend.text=element_text(size=24),
        legend.position="bottom",
        axis.text=element_text(size=24),
        axis.title.y = element_text(size = 24),
        axis.title.x = element_text(size = 24),
        legend.key.size =  unit(0.4, "in"))   
plot.erg.int.tau<- plot.erg.int.tau+ 
  stat_density(geom="line", position="identity")

plot.erg.int.tau


plot.erg.slope.tau <- ggplot(aes(x = value, colour = refseq, 
                                   linetype = refseq, size=refseq), 
                               data = erg.slope.tau.melt)


plot.erg.slope.tau <- plot.erg.slope.tau + 
  scale_size_manual(values=c(1, 1,
                             1, 1),
                    labels = c("1 St. RE unweighted    ", "1 St. RE weighted tr. A  ",
                               "1 St. RE weighted tr. B.   ", "2 St. RE weighted    "),
                    guide = guide_legend(title = NULL))+
  scale_linetype_manual(values=c("longdash", "solid", 
                                 "solid", "dashed"),                      
                        labels = c("1 St. RE unweighted    ", "1 St. RE weighted tr. A  ",
                                   "1 St. RE weighted tr. B.   ", "2 St. RE weighted    "),
                        
                        guide = guide_legend(title = NULL))+
  scale_color_manual(values=c("#E69F00",
                              "#0072B2",
                              "#CC79A7",
                              "#009E73"),
                     labels = c("1 St. RE unweighted    ", "1 St. RE weighted tr. A  ",
                                "1 St. RE weighted tr. B.   ", "2 St. RE weighted    "),
                     guide = guide_legend(title = NULL))+
  labs(x = "Estimate", y = "Density")+
  theme(legend.text=element_text(size=24),
        legend.position="bottom",
        axis.text=element_text(size=24),
        axis.title.y = element_text(size = 24),
        axis.title.x = element_text(size = 24),
        legend.key.size =  unit(0.4, "in"))  

plot.erg.slope.tau <- plot.erg.slope.tau + 
  stat_density(geom="line", position="identity")


### Look into Plots 

# Show results plot

plot.erg.int.tau
plot.erg.slope.tau

# Save plots
pdf(paste0("plots/pub_",name.dataset,"_",name.setup,"_tau_int.pdf"), 
    width = 16, 
    height = 12)
print(plot.erg.int.tau)
dev.off()

pdf(paste0("plots/pub_",name.dataset,"_",name.setup,"_tau_slope.pdf"), 
    width = 16, 
    height = 12)
print(plot.erg.slope.tau)
dev.off()

