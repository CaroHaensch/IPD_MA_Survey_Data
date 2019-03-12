## Filename: ~/700_performance_tables/latex_tables_transform.R
## Description: Create LaTeX Tables
## Author: Anna-Carolina Haensch

## Maintainer: Anna-Carolina Haensch (anna-carolina.haensch@gesis.org)

## Creation: 2018-05-07

### 



M <- 1000
source("600_simulation_performance/superpopulation_performance.R")



tokeep<-which(rownames(erg.int.point)=="IPD 1 St weighted"|
                rownames(erg.int.point)=="IPD 1 St unweighted"|
                rownames(erg.int.point)=="IPD 1 St transf weighted")


data.performance.int.re <- data.performance.int[tokeep,]
data.performance.slope.re <- data.performance.slope[tokeep,]

bias.i <- abs(data.performance.int.re$bias)
stderr.i <- abs(data.performance.int.re$stderr)
rmse.i <- abs(data.performance.int.re$rmse)
cov.i <- abs(data.performance.int.re$cov)

bias.s <- abs(data.performance.slope.re$bias)
stderr.s <- abs(data.performance.slope.re$stderr)
rmse.s <- abs(data.performance.slope.re$rmse)
cov.s <- abs(data.performance.slope.re$cov)


gr <- cbind(bias.i, stderr.i, rmse.i, cov.i, bias.s, stderr.s, rmse.s, cov.s)
gra <- as.data.frame(gr)
row.names(gra) <- rownames(data.performance.int.re)
colnames(gra) <- c("Bias","Stand. Err.", "RMSE","Cov.",
                   "Bias","Stand. Err.", "RMSE","Cov.")
print(xtable(gra),booktabs=T,
      file = paste0("performance_tables/", name.dataset, "_", 
                    name.setup, "focus_trans.tex"))

