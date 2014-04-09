### PCA on missing variable indicators

library(data.table)
train <- fread('Data/WANGphy_train.csv')

# create missing value indicators
sapply(names(train), function(x){
  dat <- with(train, get(x))
  if(sum(is.na(dat))>0){
    newname <- paste0('I', x)
    train[, as.character(newname):=is.na(dat)]
  }
})


# PCA of the predictor space
myCols <- grep('I', names(train), value=T)
tmp <- train[, myCols, with=F]

# Determine Number of Factors to Extract
library(nFactors)
ev <- eigen(cor(mydata)) # get eigenvalues
ap <- parallel(subject=nrow(mydata),var=ncol(mydata), rep=100, cent=.05)
nS <- nScree(x=ev$values, aparallel=ap$eigen$qevpea)
plotnScree(nS)

fit <- princomp(tmp, cor=T) # PCA fit
biplot(fit) # biplot
summary(fit)

## It looks like you can divide it into 3 components:
# feat55/fea