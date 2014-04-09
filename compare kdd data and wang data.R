# Compare kdd cup data downloaded from online with Dr. Wang's data supplied for the project

library(data.table)

setwd('C:/Users/Robert/cloud/Classes/Data Prep/Final Project')

kddtrain <- fread('data_kddcup04/phy_train.dat')
wangtrain <- fread('SASData/phy_train.csv', na.strings=c('999', '9999'))
all.equal(wangtrain, kddtrain)

kddtest <- fread('data_kddcup04/phy_test.dat')
wangtest <- fread('SASData/phy_test.csv')
setnames(kddtest, c('exampleid', 'target', names(wangtest)[2:79]))
wangtest <- wangtest[, target:=as.numeric(NA)] 
wangtest <- wangtest[, names(kddtest), with=F]
all.equal(wangtest, kddtest)
