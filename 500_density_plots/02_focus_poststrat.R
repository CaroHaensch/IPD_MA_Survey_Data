## Filename: ~/500_data_visualization/
## 02_poststratification.R
## Description: Visualization of simulation results
## Author: Anna-Carolina Haensch


## Maintainer: Anna-Carolina Haensch (anna-carolina.haensch@gesis.org)

## Creation: 2017-11-23

# Clear


# Melt the matrix to  createggplot density plot
erg.int.point$refseq <- rownames(erg.int.point)
erg.int.point.melt <- melt(erg.int.point)

erg.int.std.err$refseq <- rownames(erg.int.std.err)
erg.int.std.err.melt <- melt(erg.int.std.err)

erg.slope.point$refseq <- rownames(erg.slope.point)
erg.slope.point.melt <- melt(erg.slope.point)

erg.slope.std.err$refseq <- rownames(erg.slope.std.err)
erg.slope.std.err.melt <- melt(erg.slope.std.err)

# Which results are needed
tokeep<-which(erg.slope.std.err.melt$refseq=="IPD 1 St weighted"|
                erg.slope.std.err.melt$refseq=="IPD 1 St poststrat"|
                erg.slope.std.err.melt$refseq=="IPD 1 St poststrat over all s"|
                erg.slope.std.err.melt$refseq=="IPD 2 St FE poststrat")

erg.int.point.melt<-erg.int.point.melt[tokeep,]
erg.int.std.err.melt<-erg.int.std.err.melt[tokeep,]
erg.slope.point.melt<-erg.slope.point.melt[tokeep,]
erg.slope.std.err.melt<-erg.slope.std.err.melt[tokeep,]



                 

# Plot results as density plots
plot.erg.int.point <- ggplot(aes(x = value, colour = refseq, 
                                 linetype = refseq, size=refseq), 
                             data = erg.int.point.melt)

plot.erg.int.point <- plot.erg.int.point + 
  scale_size_manual(values=c(1.3, 1.3,
                             1.3, 1.3),
                    labels = c("1 St. poststrat   ",
                               "1 St. poststrat all s.    ", 
                               "1 St. weighted    ",
                               "2 St. poststrat    "),
                    guide = guide_legend(title = NULL))+
  scale_linetype_manual(values=c("solid","dashed",
                                 "solid","dashed"),
                        labels = c("1 St. poststrat   ",
                                   "1 St. poststrat all s.    ", 
                                   "1 St. weighted    ",
                                   "2 St. poststrat    "),
                        guide = guide_legend(title = NULL))+
  scale_color_manual(values=c("#E69F00",
                              "#0072B2",
                              "#CC79A7",
                              "#009E73"),  
                     labels = c("1 St. poststrat   ",
                              "1 St. poststrat all s.    ", 
                              "1 St. weighted    ",
                                "2 St. poststrat    "),
                     guide = guide_legend(title = NULL))+
  labs(x = "Estimate", y = "Density")+
  theme(legend.text=element_text(size=24),
        legend.position="bottom",
        axis.text=element_text(size=24),
        axis.title.y = element_text(size = 24),
        axis.title.x = element_text(size = 24),
        legend.key.size =  unit(0.4, "in")
        )  

plot.erg.int.point <- plot.erg.int.point + 
  stat_density(geom="line", position="identity")+
  geom_vline(xintercept=0)




plot.erg.slope.point <- ggplot(aes(x = value, colour = refseq, 
                                   linetype = refseq, size=refseq), 
                               data = erg.slope.point.melt)


plot.erg.slope.point <- plot.erg.slope.point + 
  scale_size_manual(values=c(1.3, 1.3,
                             1.3, 1.3),
                    labels = c("1 St. poststrat   ",
                               "1 St. poststrat all s.    ", 
                               "1 St. weighted    ",
                               "2 St. poststrat    "),
                    guide = guide_legend(title = NULL))+
  scale_linetype_manual(values=c("solid","dashed",
                                 "solid","dashed"),
                        labels = c("1 St. poststrat   ",
                                   "1 St. poststrat all s.    ", 
                                   "1 St. weighted    ",
                                   "2 St. poststrat    "),
                        guide = guide_legend(title = NULL))+
  scale_color_manual(values=c("#E69F00",
                              "#0072B2",
                              "#CC79A7",
                              "#009E73"),  
                     labels = c("1 St. poststrat   ",
                                "1 St. poststrat all s.    ", 
                                "1 St. weighted    ",
                                "2 St. poststrat    "),
                     guide = guide_legend(title = NULL))+
  labs(x = "Estimate", y = "Density")+
  theme(legend.text=element_text(size=24),
        legend.position="bottom",
        axis.text=element_text(size=24),
        axis.title.y = element_text(size = 24),
        axis.title.x = element_text(size = 24),
        legend.key.size =  unit(0.4, "in")) 


plot.erg.slope.point <- plot.erg.slope.point + 
  stat_density(geom="line", position="identity")+
  geom_vline(xintercept=10)

plot.erg.int.std.err <- ggplot(aes(x = value, colour = refseq, 
                                   linetype = refseq, size=refseq), 
                               data = erg.int.std.err.melt)



plot.erg.int.std.err <- plot.erg.int.std.err + 
  scale_size_manual(values=c(1.3, 1.3,
                             1.3, 1.3),
                    labels = c("1 St. poststrat   ",
                               "1 St. poststrat all s.    ", 
                               "1 St. weighted    ",
                               "2 St. poststrat    "),
                    guide = guide_legend(title = NULL))+
  scale_linetype_manual(values=c("solid","dashed",
                                 "solid","dashed"),
                        labels = c("1 St. poststrat   ",
                                   "1 St. poststrat all s.    ", 
                                   "1 St. weighted    ",
                                   "2 St. poststrat    "),
                        guide = guide_legend(title = NULL))+
  scale_color_manual(values=c("#E69F00",
                              "#0072B2",
                              "#CC79A7",
                              "#009E73"),  
                     labels = c("1 St. poststrat   ",
                                "1 St. poststrat all s.    ", 
                                "1 St. weighted    ",
                                "2 St. poststrat    "),
                     guide = guide_legend(title = NULL))+
  labs(x = "Estimate", y = "Density")+
  theme(legend.text=element_text(size=32),
        legend.position="bottom",
        axis.text=element_text(size=24),
        axis.title.y = element_text(size = 24),
        axis.title.x = element_text(size = 24),
        legend.key.size =  unit(0.4, "in"))  
plot.erg.int.std.err <- plot.erg.int.std.err + 
  stat_density(geom="line", position="identity")      




plot.erg.slope.std.err <- ggplot(aes(x = value, colour = refseq, 
                                     linetype = refseq, size=refseq), 
                                 data = erg.slope.std.err.melt)


plot.erg.slope.std.err <- plot.erg.slope.std.err + 
  scale_size_manual(values=c(1.3, 1.3,
                             1.3, 1.3),
                    labels = c("1 St. poststrat   ",
                               "1 St. poststrat all s.    ", 
                               "1 St. weighted    ",
                               "2 St. poststrat    "),
                    guide = guide_legend(title = NULL))+
  scale_linetype_manual(values=c("solid","dashed",
                                 "solid","dashed"),
                        labels = c("1 St. poststrat   ",
                                   "1 St. poststrat all s.    ", 
                                   "1 St. weighted    ",
                                   "2 St. poststrat    "),
                        guide = guide_legend(title = NULL))+
  scale_color_manual(values=c("#E69F00",
                              "#0072B2",
                              "#CC79A7",
                              "#009E73"),  
                     labels = c("1 St. poststrat   ",
                                "1 St. poststrat all s.    ", 
                                "1 St. weighted    ",
                                "2 St. poststrat    "),
                     guide = guide_legend(title = NULL))+
  labs(x = "Estimate", y = "Density")+
  theme(legend.text=element_text(size=24),
        legend.position="bottom",
        axis.text=element_text(size=24),
        axis.title.y = element_text(size = 24),
        axis.title.x = element_text(size = 24),
        legend.key.size =  unit(0.4, "in"))  


plot.erg.slope.std.err <- plot.erg.slope.std.err + 
  stat_density(geom="line", position="identity")      





### Look into Plots 

# Show results plot

plot.erg.int.point
plot.erg.slope.point
plot.erg.int.std.err
plot.erg.slope.std.err

# Save plots
pdf(paste0("plots/pub_",name.dataset,"_",name.setup,"_int_point.pdf"), 
    width = 16, 
    height = 12)
print(plot.erg.int.point)
dev.off()

pdf(paste0("plots/pub_",name.dataset,"_",name.setup,"_slope_point.pdf"), 
    width = 16, 
    height = 12)
print(plot.erg.slope.point)
dev.off()

pdf(paste0("plots/pub_",name.dataset,"_",name.setup,"_int_stderr.pdf"), 
    width = 16, 
    height = 12)
print(plot.erg.int.std.err)
dev.off()

pdf(paste0("plots/pub_",name.dataset,"_",name.setup,"_slope_stderr.pdf"), 
    width = 16, height = 12)
print(plot.erg.slope.std.err)
dev.off()



