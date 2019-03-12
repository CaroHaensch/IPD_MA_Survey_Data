## Filename: ~/500_data_visualization/simulation_without_FE_and_single_surveys.R
## Description: Visualization of simulation results
## Author: Anna-Carolina Haensch


## Maintainer: Anna-Carolina Haensch (anna-carolina.haensch@gesis.org)

## Creation: 2017_11-23



# Extract various estimates, depending on type (point/variance) and 
# coefficient (intercept/slope)
erg.int.point <- as.data.frame(sapply(X = list.erg.sim.test, 
                                      FUN = function(x)  x[[1]][1,]))
erg.slope.point <- as.data.frame(sapply(X = list.erg.sim.test, 
                                        FUN = function(x)  x[[1]][2,]))

erg.int.std.err <- as.data.frame(sapply(X = list.erg.sim.test, 
                                        FUN = function(x)  x[[2]][1,]))
erg.slope.std.err <- as.data.frame(sapply(X = list.erg.sim.test, 
                                          FUN = function(x)  x[[2]][2,]))



# Melt the matrix to  createggplot density plot
erg.int.point$refseq <- rownames(erg.int.point)
erg.int.point.melt <- melt(erg.int.point)

erg.int.std.err$refseq <- rownames(erg.int.std.err)
erg.int.std.err.melt <- melt(erg.int.std.err)

erg.slope.point$refseq <- rownames(erg.slope.point)
erg.slope.point.melt <- melt(erg.slope.point)

erg.slope.std.err$refseq <- rownames(erg.slope.std.err)
erg.slope.std.err.melt <- melt(erg.slope.std.err)


# Choose which methods to keep and which to delete
todelete<-which(erg.slope.std.err.melt$refseq=="Survey 1 unweighted"|
        erg.slope.std.err.melt$refseq=="Survey 2 unweighted"|
        erg.slope.std.err.melt$refseq=="Survey 1 weighted"|
        erg.slope.std.err.melt$refseq=="Survey 2 weighted"|
        erg.slope.std.err.melt$refseq=="Survey 1 poststrat"|
        erg.slope.std.err.melt$refseq=="Survey 2 poststrat"|
        erg.slope.std.err.melt$refseq=="IPD 2 St weighted RE"|
        erg.slope.std.err.melt$refseq=="IPD 2 St poststrat RE"|
        erg.slope.std.err.melt$refseq=="IPD 1 FE St poststrat"|
        erg.slope.std.err.melt$refseq=="IPD 1 FE St transf poststrat"|
        erg.slope.std.err.melt$refseq=="IPD 1 FE St transf weighted"|
        erg.slope.std.err.melt$refseq=="IPD 1 FE St unweighted"|
        erg.slope.std.err.melt$refseq=="IPD 1 FE St weighted"|
        erg.slope.std.err.melt$refseq=="IPD 1 St FE poststrat"|
        erg.slope.std.err.melt$refseq=="IPD 1 St FE transf poststrat"|
        erg.slope.std.err.melt$refseq=="IPD 1 St FE transf weighted"|
        erg.slope.std.err.melt$refseq=="IPD 1 St FE unweighted"|
        erg.slope.std.err.melt$refseq=="IPD 1 St FE weighted"|
        erg.slope.std.err.melt$refseq=="IPD 1 St RE unweighted"|
          erg.slope.std.err.melt$refseq=="IPD 1 St RE weighted"|
          erg.slope.std.err.melt$refseq=="IPD 1 St RE poststrat")

erg.int.point.melt<-erg.int.point.melt[-todelete,]
erg.int.std.err.melt<-erg.int.std.err.melt[-todelete,]
erg.slope.point.melt<-erg.slope.point.melt[-todelete,]
erg.slope.std.err.melt<-erg.slope.std.err.melt[-todelete,]



# Plot results as density plots

# Intercept point plot

plot.erg.int.point <- ggplot(aes(x = value, colour = refseq, 
                                 linetype = refseq), 
            data = erg.int.point.melt)

if("u" %in% colnames(data.pop)) {
  
  plot.erg.int.point <- plot.erg.int.point + 
    scale_linetype_manual(values=
              c("twodash","F1","longdash","dotdash","solid","dotted",
                "dotdash", "solid", "dotted"))+
    scale_color_manual(values=
              c("#0072B2", "#0072B2", "#0072B2", "#0072B2","#0072B2","#0072B2",
                           "#009E73", "#009E73", "#009E73"))
  
}else{
  
  plot.erg.int.point <- plot.erg.int.point + 
    scale_linetype_manual(values=c("longdash", "solid", "dotted",
                                   "solid", "dashed"))+
    scale_color_manual(values=c("#0072B2", "#0072B2", "#0072B2",
                                "#009E73", "#009E73"))
  
}

plot.erg.int.point <- plot.erg.int.point + geom_density()



# Slope point plot

plot.erg.slope.point <- ggplot(aes(x = value, colour = refseq, 
                                    linetype = refseq), 
                                    data = erg.slope.point.melt)

if("u" %in% colnames(data.pop)) {
  
  plot.erg.slope.point <- plot.erg.slope.point + 
  scale_linetype_manual(values=
              c("twodash","F1","longdash", "dotdash", "solid", "dotted",
                "dotdash", "solid", "dashed"
                          ))+
    scale_color_manual(values=
              c("#0072B2", "#0072B2", "#0072B2", "#0072B2","#0072B2","#0072B2",
                "#009E73", "#009E73", "#009E73"))
  
}else{
  
  plot.erg.slope.point <- plot.erg.slope.point + 
  scale_linetype_manual(values=c("longdash", "solid", "dotted",
                                 "solid", "dashed"))+
  scale_color_manual(values=c("#0072B2", "#0072B2", "#0072B2",
                              "#009E73", "#009E73"))
  

}

plot.erg.slope.point <- plot.erg.slope.point + geom_density()





# Intercept standard error plot

plot.erg.int.std.err <- ggplot(aes(x = value, colour = refseq, 
                                   linetype = refseq), 
                             data = erg.int.std.err.melt)


if("u" %in% colnames(data.pop)) {
  
  plot.erg.int.std.err <- plot.erg.int.std.err + 
  scale_linetype_manual(values=
             c("twodash","F1","longdash", "dotdash", "solid", "dotted",
             "dotdash", "solid", "dashed"))+
    scale_color_manual(values=
             c("#0072B2", "#0072B2", "#0072B2", "#0072B2","#0072B2","#0072B2",
             "#009E73", "#009E73", "#009E73"))
  
  
}else{
  
  plot.erg.int.std.err <- plot.erg.int.std.err + 
  scale_linetype_manual(values=c("longdash", "solid", "dotted",
                                 "solid", "dashed"))+
  scale_color_manual(values=c("#0072B2", "#0072B2", "#0072B2",
                              "#009E73", "#009E73"))
  
}

plot.erg.int.std.err <- plot.erg.int.std.err + geom_density()




# Slope standard error plot

plot.erg.slope.std.err <- ggplot(aes(x = value, colour = refseq, 
                                   linetype = refseq), 
                               data = erg.slope.std.err.melt)

if("u" %in% colnames(data.pop)) {
  
  plot.erg.slope.std.err <- plot.erg.slope.std.err + 
  scale_linetype_manual(values=
              c("twodash","F1","longdash", "dotdash", "solid", "dotted",
               "dotdash", "solid", "dashed"))+
    scale_color_manual(values=
              c("#0072B2", "#0072B2", "#0072B2", "#0072B2","#0072B2","#0072B2",
              "#009E73", "#009E73", "#009E73"))
  
}else{
  
  plot.erg.slope.std.err <- plot.erg.slope.std.err + 
  scale_linetype_manual(values=c("longdash", "solid", "dotted",
                                 "solid", "dashed"))+
  scale_color_manual(values=c("#0072B2", "#0072B2", "#0072B2",
                              "#009E73", "#009E73"))

}
plot.erg.slope.std.err <- plot.erg.slope.std.err + geom_density()



### Look into Plots 

# Show results plot

plot.erg.int.point
plot.erg.slope.point
plot.erg.int.std.err
plot.erg.slope.std.err


# Save plots
pdf(paste0("plots/",name.dataset,"_",name.setup,"_int_point_simp.pdf"), 
    width = 16, 
    height = 12)
plot.erg.int.point
dev.off()

pdf(paste0("plots/",name.dataset,"_",name.setup,"_slope_point_simp.pdf"), 
    width = 16, 
    height = 12)
plot.erg.slope.point
dev.off()

pdf(paste0("plots/",name.dataset,"_",name.setup,"_int_stderr_simp.pdf"), 
    width = 16, 
    height = 12)
plot.erg.int.std.err
dev.off()

pdf(paste0("plots/",name.dataset,"_",name.setup,"_slope_stderr_simp.pdf"), 
    width = 16, height = 12)
plot.erg.slope.std.err
dev.off()


