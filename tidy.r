# library(ggplot2)
# library(tibble)
# library(tidyr)
# library(readr)
# library(purrr)
# library(dplyr)
library(tidyverse)
library(MASS)
library(survival)
library(fitdistrplus)
library(goftest)

set.seed(pi)
x<-rnorm(1000)
method<-c("mle", "mme", "mge")
results<-vector()
for(i in 1:length(method)){
  x.fit<-fitdist(x,"norm",method=method[i])
  xx<-c(x.fit$estimate,x.fit$aic,x.fit$bic)
  results<-cbind(results, xx)
}
colnames(results)<-c("mle", "mme", "mge")
results
