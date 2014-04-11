

```r
unique(sapply(train, class))  # all variables are either numeric or integer

mylengths <- sapply(train, function(x) length(unique(x)))
mylengths[mylengths < 20]
```


All of the data is read in as either numeric or integer data, but some of the variables have low cardinality, suggesting they might be better treated as nominal or ordinal data. Several features had only one value (*feat47*, *feat48*, *feat49*, *feat50*, and *feat51*). Since these do not provide any information about the target, I deleted them. 


```r
train[, `:=`(feat47, NULL)]
```

```
## Error: object 'train' not found
```

```r
train[, `:=`(feat48, NULL)]
```

```
## Error: object 'train' not found
```

```r
train[, `:=`(feat49, NULL)]
```

```
## Error: object 'train' not found
```

```r
train[, `:=`(feat50, NULL)]
```

```
## Error: object 'train' not found
```

```r
train[, `:=`(feat51, NULL)]
```

```
## Error: object 'train' not found
```


I decided to treat any variable with a cardinality of 2 as a nominal variable and those with a cardinality of 10 or less as an ordinal variable. 


```r
train[, `:=`(target, factor(target))]
```

```
## Error: object 'train' not found
```

```r
train[, `:=`(feat4, ordered(feat4))]
```

```
## Error: object 'train' not found
```

```r
train[, `:=`(feat8, ordered(feat8))]
```

```
## Error: object 'train' not found
```

```r
train[, `:=`(feat12, ordered(feat12))]
```

```
## Error: object 'train' not found
```

```r
train[, `:=`(feat16, ordered(feat16))]
```

```
## Error: object 'train' not found
```

```r
train[, `:=`(feat17, ordered(feat17))]
```

```
## Error: object 'train' not found
```

```r
train[, `:=`(feat29, factor(feat29))]
```

```
## Error: object 'train' not found
```

```r
train[, `:=`(feat30, factor(feat30))]
```

```
## Error: object 'train' not found
```

```r
train[, `:=`(feat31, ordered(feat31))]
```

```
## Error: object 'train' not found
```

```r
train[, `:=`(feat35, factor(feat35))]
```

```
## Error: object 'train' not found
```

```r
train[, `:=`(feat36, factor(feat36))]
```

```
## Error: object 'train' not found
```

```r
train[, `:=`(feat43, factor(feat43))]
```

```
## Error: object 'train' not found
```

```r
train[, `:=`(feat52, factor(feat52))]
```

```
## Error: object 'train' not found
```

```r
train[, `:=`(feat55, factor(feat55))]
```

```
## Error: object 'train' not found
```

```r
train[, `:=`(feat56, ordered(feat56))]
```

```
## Error: object 'train' not found
```

```r
train[, `:=`(feat66, ordered(feat66))]
```

```
## Error: object 'train' not found
```

```r
train[, `:=`(feat69, ordered(feat69))]
```

```
## Error: object 'train' not found
```

```r
train[, `:=`(feat75, ordered(feat75))]
```

```
## Error: object 'train' not found
```

```r
train[, `:=`(feat76, ordered(feat76))]
```

```
## Error: object 'train' not found
```


The variables effected are summarized in the table below.

```r
mylengths <- sapply(train, function(x) length(unique(x)))
```

```
## Error: object 'train' not found
```

```r

varsEffected <- names(train)[mylengths < 10]
```

```
## Error: object 'train' not found
```

```r
varsEffected <- varsEffected[varsEffected != "target"]
```

```
## Error: object 'varsEffected' not found
```

```r

mytable <- data.frame(Cardinality = mylengths[varsEffected])
```

```
## Error: object 'mylengths' not found
```

```r
mytable$Class <- with(mytable, ifelse(Cardinality == 2, "Nominal", "Ordinal"))
```

```
## Error: object 'mytable' not found
```

```r
library(pander)
```

```
## 
## Attaching package: 'pander'
## 
## The following object is masked from 'package:knitr':
## 
##     pandoc
```

```r
pander(mytable, style = "rmarkdown")
```

```
## Error: object 'mytable' not found
```


I noticed several places where the data were potentially censored. 



