## Filename: ~/700_performance_tables/latex_tables.R
## Description: Create LaTeX Tables
## Author: Anna-Carolina Haensch

## Maintainer: Anna-Carolina Haensch (anna-carolina.haensch@gesis.org)

## Creation: 2018-05-07

### 


M <- 1000
source("600_simulation_performance/simple_performance.R")

data.performance.int.wh <- data.performance.int[c(5:6,8,10),]
data.performance.slope.wh <- data.performance.slope[c(5:6,8,10),]




#  ------------------------------------------------------------------------
# 1. When and how 
#  ------------------------------------------------------------------------


bias.i <- abs(data.performance.int.wh$bias)
stderr.i <- abs(data.performance.int.wh$stderr)
rmse.i <- abs(data.performance.int.wh$rmse)
cov.i <- abs(data.performance.int.wh$cov)

bias.s <- abs(data.performance.slope.wh$bias)
stderr.s <- abs(data.performance.slope.wh$stderr)
rmse.s <- abs(data.performance.slope.wh$rmse)
cov.s <- abs(data.performance.slope.wh$cov)


gr <- cbind(bias.i, stderr.i, rmse.i, cov.i, bias.s, stderr.s, rmse.s, cov.s)
gra <- as.data.frame(gr)
row.names(gra) <- rownames(data.performance.int.wh)
colnames(gra) <- c("Bias","Stand. Err.", "RMSE","Cov.",
                    "Bias","Stand. Err.", "RMSE","Cov.")
print(xtable(gra),booktabs=T,
            file = paste0("performance_tables/", name.dataset, "_", 
                               name.setup, ".tex"))

# ------------------------------------------------------------------------
# 2. Poststrat
#  ------------------------------------------------------------------------

if("IPD 1 St poststrat" %in% rownames(erg.int.point)) {
M <- 1000
source("600_simulation_performance/simple_performance.R")



tokeep<-which(rownames(erg.int.point)=="IPD 2 St FE poststrat"|
              rownames(erg.int.point)=="IPD 2 St FE weighted"|
              rownames(erg.int.point)=="IPD 1 St unweighted"|
              rownames(erg.int.point)=="IPD 1 St weighted"|
              rownames(erg.int.point)=="IPD 1 St poststrat"|
              rownames(erg.int.point)=="IPD 1 St poststrat over all s")


data.performance.int.ps <- data.performance.int[tokeep,]
data.performance.slope.ps <- data.performance.slope[tokeep,]

bias.i <- abs(data.performance.int.ps$bias)
stderr.i <- abs(data.performance.int.ps$stderr)
rmse.i <- abs(data.performance.int.ps$rmse)
cov.i <- abs(data.performance.int.ps$cov)

bias.s <- abs(data.performance.slope.ps$bias)
stderr.s <- abs(data.performance.slope.ps$stderr)
rmse.s <- abs(data.performance.slope.ps$rmse)
cov.s <- abs(data.performance.slope.ps$cov)


gr <- cbind(bias.i, stderr.i, rmse.i, cov.i, bias.s, stderr.s, rmse.s, cov.s)
gra <- as.data.frame(gr)
row.names(gra) <- rownames(data.performance.int.ps)
colnames(gra) <- c("Bias","Stand. Err.", "RMSE","Cov.",
                   "Bias","Stand. Err.", "RMSE","Cov.")
print(xtable(gra),booktabs=T,
      file = paste0("performance_tables/", name.dataset, "_", 
                    name.setup, "focus_poststr.tex"))
}

