## Filename: ~/500_data_visualization/simulation_all_methods.R
## Description: Visualization of simulation results
## Author: Anna-Carolina Haensch


## Maintainer: Anna-Carolina Haensch (anna-carolina.haensch@gesis.org)

## Creation: 2017-11-23


# 
# # Extract various estimates, depending on type (point/variance) and 
# # coefficient (intercept/slope)
# erg.int.point <- as.data.frame(sapply(X = list.erg.sim.test, 
#                                       FUN = function(x)  x[[1]][1,]))
# erg.slope.point <- as.data.frame(sapply(X = list.erg.sim.test, 
#                                         FUN = function(x)  x[[1]][2,]))
# 
# erg.int.std.err <- as.data.frame(sapply(X = list.erg.sim.test, 
#                                         FUN = function(x)  x[[2]][1,]))
# erg.slope.std.err <- as.data.frame(sapply(X = list.erg.sim.test, 
#                                           FUN = function(x)  x[[2]][2,]))
# 
# erg.int.tau <- as.data.frame(sapply(X = list.erg.sim.test, 
#                                         FUN = function(x)  x[[3]][1,]))
# erg.slope.tau <- as.data.frame(sapply(X = list.erg.sim.test, 
#                                           FUN = function(x)  x[[3]][2,]))

# Melt the matrix to  createggplot density plot
erg.int.point$refseq <- rownames(erg.int.point)
erg.int.point.melt <- melt(erg.int.point)

erg.int.std.err$refseq <- rownames(erg.int.std.err)
erg.int.std.err.melt <- melt(erg.int.std.err)

erg.slope.point$refseq <- rownames(erg.slope.point)
erg.slope.point.melt <- melt(erg.slope.point)

erg.slope.std.err$refseq <- rownames(erg.slope.std.err)
erg.slope.std.err.melt <- melt(erg.slope.std.err)



### Plot results as density plots

# Intercept point plot 

plot.erg.int.point <- ggplot(aes(x = value, colour = refseq, 
                                 linetype = refseq), 
            data = erg.int.point.melt)

if("u" %in% colnames(data.pop)) {
  plot.erg.int.point <- plot.erg.int.point + 
    scale_linetype_manual(values=
                      c("twodash","longdash","dotdash","solid","dotted",
                        "twodash","F1",
                        "longdash","dotdash","solid",
                        "longdash","dotdash","solid","dotted",
                        "12345678", "dotdash", "solid", "dashed","dotted",
                        "dotdash", "solid", "dotted",
                        "dotdash", "solid", "dotted"
                              ))+
    scale_color_manual(values=
                c("cyan","cyan","cyan","cyan","cyan",
                "#0072B2", "#0072B2", 
                "#CC79A7","#CC79A7","#CC79A7",
                "#0072B2", "#0072B2","#0072B2","#0072B2",
                "#009E73", "#009E73", "#009E73","#009E73", "#009E73",
                "#D55E00", "#D55E00","#D55E00",
                "#E69F00", "#E69F00","#E69F00"))
}else{
  plot.erg.int.point <- plot.erg.int.point + 
    scale_linetype_manual(values=c("longdash", "solid", "dotted",
                                   "longdash", "solid",
                                  "longdash", "solid", "dotted",
                                  "solid", "dashed", "dotted",
                                  "solid", "dotted",
                                  "solid", "dotted"))+
    scale_color_manual(values=c("cyan","cyan","cyan",
                                "#CC79A7","#CC79A7",
                                "#0072B2", "#0072B2", "#0072B2",
                                "#009E73", "#009E73","#009E73",
                                "#D55E00", "#D55E00",
                                "#E69F00", "#E69F00"))
}
plot.erg.int.point <- plot.erg.int.point + geom_density()







# Slope point plot 

plot.erg.slope.point <- ggplot(aes(x = value, colour = refseq, 
                                    linetype = refseq), 
                                    data = erg.slope.point.melt)

if("u" %in% colnames(data.pop)) {
  plot.erg.slope.point <- plot.erg.slope.point + 
    scale_linetype_manual(values=
                            c("twodash","longdash","dotdash","solid","dotted",
                              "twodash","F1",
                              "longdash","dotdash","solid",
                              "longdash","dotdash","solid","dotted",
                              "12345678", "dotdash", "solid", "dashed","dotted",
                              "dotdash", "solid", "dotted",
                              "dotdash", "solid", "dotted"
                            ))+
    scale_color_manual(values=
                         c("cyan","cyan","cyan","cyan","cyan",
                           "#0072B2", "#0072B2", 
                           "#CC79A7","#CC79A7","#CC79A7",
                           "#0072B2", "#0072B2","#0072B2","#0072B2",
                           "#009E73", "#009E73", "#009E73","#009E73", "#009E73",
                           "#D55E00", "#D55E00","#D55E00",
                           "#E69F00", "#E69F00","#E69F00"))
}else{
  plot.erg.slope.point <- plot.erg.slope.point + 
    scale_linetype_manual(values=c("longdash", "solid", "dotted",
                                   "longdash", "solid",
                                   "longdash", "solid", "dotted",
                                   "solid", "dashed", "dotted",
                                   "solid", "dotted",
                                   "solid", "dotted"))+
    scale_color_manual(values=c("cyan","cyan","cyan",
                                "#CC79A7","#CC79A7",
                                "#0072B2", "#0072B2", "#0072B2",
                                "#009E73", "#009E73","#009E73",
                                "#D55E00", "#D55E00",
                                "#E69F00", "#E69F00"))

}
plot.erg.slope.point <- plot.erg.slope.point + geom_density()





# Intercept standard error plot

plot.erg.int.std.err <- ggplot(aes(x = value, colour = refseq, 
                                   linetype = refseq), 
                             data = erg.int.std.err.melt)


if("u" %in% colnames(data.pop)) {
  plot.erg.int.std.err <- plot.erg.int.std.err + 
    scale_linetype_manual(values=
                            c("twodash","longdash","dotdash","solid","dotted",
                              "twodash","F1",
                              "longdash","dotdash","solid",
                              "longdash","dotdash","solid","dotted",
                              "12345678", "dotdash", "solid", "dashed","dotted",
                              "dotdash", "solid", "dotted",
                              "dotdash", "solid", "dotted"
                            ))+
    scale_color_manual(values=
                         c("cyan","cyan","cyan","cyan","cyan",
                           "#0072B2", "#0072B2", 
                           "#CC79A7","#CC79A7","#CC79A7",
                           "#0072B2", "#0072B2","#0072B2","#0072B2",
                           "#009E73", "#009E73", "#009E73","#009E73", "#009E73",
                           "#D55E00", "#D55E00","#D55E00",
                           "#E69F00", "#E69F00","#E69F00"))
  
}else{
  plot.erg.int.std.err <- plot.erg.int.std.err + 
    scale_linetype_manual(values=c("longdash", "solid", "dotted",
                                   "longdash", "solid",
                                   "longdash", "solid", "dotted",
                                   "solid", "dashed", "dotted",
                                   "solid", "dotted",
                                   "solid", "dotted"))+
    scale_color_manual(values=c("cyan","cyan","cyan",
                                "#CC79A7","#CC79A7",
                                "#0072B2", "#0072B2", "#0072B2",
                                "#009E73", "#009E73","#009E73",
                                "#D55E00", "#D55E00",
                                "#E69F00", "#E69F00"))
}
plot.erg.int.std.err <- plot.erg.int.std.err + geom_density()





# Slope standard error plot

plot.erg.slope.std.err <- ggplot(aes(x = value, colour = refseq, 
                                   linetype = refseq), 
                               data = erg.slope.std.err.melt)

if("u" %in% colnames(data.pop)) {
  plot.erg.slope.std.err <- plot.erg.slope.std.err + 
    scale_linetype_manual(values=
                            c("twodash","longdash","dotdash","solid","dotted",
                              "twodash","F1",
                              "longdash","dotdash","solid",
                              "longdash","dotdash","solid","dotted",
                              "12345678", "dotdash", "solid", "dashed","dotted",
                              "dotdash", "solid", "dotted",
                              "dotdash", "solid", "dotted"
                            ))+
    scale_color_manual(values=
                         c("cyan","cyan","cyan","cyan","cyan",
                           "#0072B2", "#0072B2", 
                           "#CC79A7","#CC79A7","#CC79A7",
                           "#0072B2", "#0072B2","#0072B2","#0072B2",
                           "#009E73", "#009E73", "#009E73","#009E73", "#009E73",
                           "#D55E00", "#D55E00","#D55E00",
                           "#E69F00", "#E69F00","#E69F00"))
  
}else{
  plot.erg.slope.std.err <- plot.erg.slope.std.err + 
    scale_linetype_manual(values=c("longdash", "solid", "dotted",
                                   "longdash", "solid",
                                   "longdash", "solid", "dotted",
                                   "solid", "dashed", "dotted",
                                   "solid", "dotted",
                                   "solid", "dotted"))+
    scale_color_manual(values=c("cyan","cyan","cyan",
                                "#CC79A7","#CC79A7",
                                "#0072B2", "#0072B2", "#0072B2",
                                "#009E73", "#009E73","#009E73",
                                "#D55E00", "#D55E00",
                                "#E69F00", "#E69F00"))

}
plot.erg.slope.std.err <- plot.erg.slope.std.err + geom_density()


# Save plots
pdf(paste0("plots/",name.dataset,"_",name.setup,"_int_point.pdf"), width = 16, 
    height = 12)
print(plot.erg.int.point)
dev.off()

pdf(paste0("plots/",name.dataset,"_",name.setup,"_slope_point.pdf"), width = 16, 
    height = 12)
print(plot.erg.slope.point)
dev.off()

pdf(paste0("plots/",name.dataset,"_",name.setup,"_int_stderr.pdf"), width = 16, 
    height = 12)
print(plot.erg.int.std.err)
dev.off()

pdf(paste0("plots/",name.dataset,"_",name.setup,"_slope_stderr.pdf"), 
    width = 16, height = 12)
print(plot.erg.slope.std.err)
dev.off()
