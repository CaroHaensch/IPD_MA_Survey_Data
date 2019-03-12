
## Filename: ~/600_simulation_performance/simple_performance.R
## Description: Evaluation of the performance of diff. approaches
## Author: Anna-Carolina Haensch

## Maintainer: Anna-Carolina Haensch (anna-carolina.haensch@gesis.org)

## Creation: 2017-11-30



# Performance (calculate Bias, standard error, rmse and coverage)
bias <- vector(mode = "numeric", length = length(rownames(erg.int.point)))
stderr <- vector(mode = "numeric", length = length(rownames(erg.int.point)))
rmse <- vector(mode = "numeric", length = length(rownames(erg.int.point)))
cov <- vector(mode = "numeric", length = length(rownames(erg.int.point)))

# Bind together, both for intercepts and slope
data.performance.int <- 
  data.performance.slope <- 
  data.frame(bias = bias, stderr = stderr, rmse = rmse, cov = cov, 
             row.names = rownames(erg.int.point))

# Bias function
Bias<-function(x, true.value){
  bias.value <- mean(x) - true.value
  return(bias.value)
}

# MSE function
MSE<-function(x, true.value){
  bias.value <- mean(x) - true.value
  rmse.value <- sqrt(bias.value^2+var(x))
  return(rmse.value)
}


# Extract coefficients from model
mod.pop.coef <- coef(mod.pop)


## Performance intercept-wise
data.performance.int$bias <- apply(erg.int.point[,1:M], 1, 
                             function(x) Bias(x, mod.pop.coef[1]))

data.performance.int$stderr <- apply(erg.int.point[,1:M], 1, 
                             function(x) sqrt(var(x)))

data.performance.int$rmse <- apply(erg.int.point[,1:M], 1, 
                            function(x) MSE(x, mod.pop.coef[1]))

# Coverage needs a bit more efforts
og.int<-data.frame()
ug.int<-data.frame()
cov.int<-data.frame()
for (j in 1:length(rownames(erg.int.point))){
for (i in 1:M){
  ug.int[j,i] <- erg.int.point[j,i] - 1.96*erg.int.std.err[j,i]
  og.int[j,i] <- erg.int.point[j,i] + 1.96*erg.int.std.err[j,i]
  if(mod.pop.coef[1] < og.int[j,i] & mod.pop.coef[1] > ug.int[j,i]){
    cov.int[j,i] <- 1
  }else {
    cov.int[j,i] <- 0
}
}
}
rownames(cov.int) <- rownames(erg.int.point)
data.performance.int$cov <- apply(cov.int, 1, mean)




## Performance slope-wise

data.performance.slope$bias <- apply(erg.slope.point[,1:M], 1, 
                                   function(x) Bias(x, mod.pop.coef[2]))

data.performance.slope$stderr <- apply(erg.slope.point[,1:M], 1, 
                                     function(x) sqrt(var(x)))

data.performance.slope$rmse <- apply(erg.slope.point[,1:M], 1, 
                                   function(x) MSE(x, mod.pop.coef[2]))

og.slope <- data.frame()
ug.slope <- data.frame()
cov.slope <- data.frame()

for (j in 1:length(rownames(erg.int.point))){
  for (i in 1:M){
    ug.slope[j,i] <- erg.slope.point[j,i] - 1.96*erg.slope.std.err[j,i]
    og.slope[j,i] <- erg.slope.point[j,i] + 1.96*erg.slope.std.err[j,i]
    if(mod.pop.coef[2] < og.slope[j,i] & mod.pop.coef[2] > ug.slope[j,i]){
      cov.slope[j,i] <- 1
    }else {
      cov.slope[j,i] <- 0
    }
  }
}
rownames(cov.slope) <- rownames(erg.slope.point)
data.performance.slope$cov <- apply(cov.slope, 1, mean)




