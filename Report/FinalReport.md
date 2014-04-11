# STA 6714 Final Project

Author: Robert Norberg

Due: April 23, 2014

Date Ran: April 09, 2014

----







## Executive Summary (1 Page) 


## Data Preparation

### Exploration






All of the data is read in as either numeric or integer data, but some of the variables have low cardinality, suggesting they might be better treated as nominal or ordinal data. Several features had only one value (*feat47*, *feat48*, *feat49*, *feat50*, and *feat51*). Since these do not provide any information about the target, I deleted them. 




I decided to treat any variable with a cardinality of 2 as a nominal variable and those with a cardinality of 10 or less as an ordinal variable. 




The variables effected are summarized in the table below.

|    &nbsp;    |  Cardinality  |  Class  |
|:------------:|:-------------:|:-------:|
|  **feat4**   |       3       | Ordinal |
|  **feat8**   |       3       | Ordinal |
|  **feat12**  |       3       | Ordinal |
|  **feat17**  |       5       | Ordinal |
|  **feat29**  |       2       | Nominal |
|  **feat30**  |       2       | Nominal |
|  **feat31**  |       3       | Ordinal |
|  **feat35**  |       2       | Nominal |
|  **feat36**  |       2       | Nominal |
|  **feat43**  |       2       | Nominal |
|  **feat52**  |       2       | Nominal |
|  **feat55**  |       2       | Nominal |
|  **feat56**  |       3       | Ordinal |
|  **feat66**  |       3       | Ordinal |
|  **feat69**  |       3       | Ordinal |
|  **feat75**  |       3       | Ordinal |
|  **feat76**  |       4       | Ordinal |


I noticed several variables that had a very large number of 0 values. It seems that in some cases variables were given a value of 0 instead of a missing value. Take for example **feat26** whose distribution is shown below.

![Distribution of feat26](C:/Users/Robert/cloud/Classes/Data Prep/Final Project/Figures/Exploratory/feat26.png)

Other variables 





### Missing Values Indicators and MVP

### Missing Value Imputation 

### Transformations 

### Outliers 

## Model Building

## Model Performance 

### Model performance evaluation 

#### ROC curve

#### c statistics

#### Validation Sum Squares

### Variable Importance 

### Variable Impact to the Target Variable 

## Conclusions 

-----

## Works Cited

Dowle M, Short T, Srinivasan SLwcfA and Saporta R (2013).
_data.table: Extension of data.frame for fast indexing, fast
ordered joins, fast assignment, fast grouping and list columns._.
R package version 1.8.10, <URL:
http://CRAN.R-project.org/package=data.table>.

Wickham H (2009). _ggplot2: elegant graphics for data analysis_.
Springer New York. ISBN 978-0-387-98140-6, <URL:
http://had.co.nz/ggplot2/book>.

Dar<U+663C><U+3E33>czi G (2013). _pander: An R Pandoc Writer_. R
package version 0.3.8, <URL:
http://cran.r-project.org/package=pander>.

Andrew A, Zvoleff A, Diggs B, Pereira C, Wickham H, Jeon H, Arnold
J, Stephens J, Hester J, Cheng J, Keane J, Allaire J, Toloe J,
Takahashi K, Kuhlmann M, Caballero N, Salkowski N, Ross N,
Vaidyanathan R, Cotton R, Francois R, Brouwer S, Bernard Sd, Wei
T, Lamadon T, Torsney-Weir T, Davis T, Zhu W, Wu W and Xie Y
(2013). _knitr: A general-purpose package for dynamic report
generation in R_. R package version 1.5, <URL:
http://yihui.name/knitr/>.

Xie Y (2013). _Dynamic Documents with R and knitr_. Chapman and
Hall/CRC. ISBN 978-1482203530, <URL: http://yihui.name/knitr/>.

Xie Y (2013). "knitr: A Comprehensive Tool for Reproducible
Research in R." In Stodden V, Leisch F and Peng RD (eds.),
_Implementing Reproducible Computational Research_. Chapman and
Hall/CRC. ISBN 978-1466561595, <URL:
http://www.crcpress.com/product/isbn/9781466561595>.

R Core Team (2013). _R: A Language and Environment for Statistical
Computing_. R Foundation for Statistical Computing, Vienna,
Austria. <URL: http://www.R-project.org/>.

R Core Team (2013). _R: A Language and Environment for Statistical
Computing_. R Foundation for Statistical Computing, Vienna,
Austria. <URL: http://www.R-project.org/>.

R Core Team (2013). _R: A Language and Environment for Statistical
Computing_. R Foundation for Statistical Computing, Vienna,
Austria. <URL: http://www.R-project.org/>.

R Core Team (2013). _R: A Language and Environment for Statistical
Computing_. R Foundation for Statistical Computing, Vienna,
Austria. <URL: http://www.R-project.org/>.

R Core Team (2013). _R: A Language and Environment for Statistical
Computing_. R Foundation for Statistical Computing, Vienna,
Austria. <URL: http://www.R-project.org/>.

R Core Team (2013). _R: A Language and Environment for Statistical
Computing_. R Foundation for Statistical Computing, Vienna,
Austria. <URL: http://www.R-project.org/>.

R Core Team (2013). _R: A Language and Environment for Statistical
Computing_. R Foundation for Statistical Computing, Vienna,
Austria. <URL: http://www.R-project.org/>.


-----

## Appendix with R code


```r
# Clear working environment
rm(list = ls())

# Options for document compilation
opts_chunk$set(echo = FALSE, warning = FALSE, message = FALSE, comment = NA, 
    fig.height = 8, fig.width = 7, fig.cap = "", results = "hide")

# Set table options for neat tables
library(pander)
panderOptions("table.split.table", 120)
panderOptions("table.split.cells", 30)

# Globally set plot parameters
library(ggplot2)
theme_set(theme_bw(base_size = 18))
theme_update(panel.grid.major = element_line(colour = "#CCCCCC", size = 0.3), 
    panel.grid.minor = element_line(colour = "grey96", size = 0.7))

library(data.table)
train <- fread("C:/Users/Robert/cloud/Classes/Data Prep/Final Project/Data/WANGphy_train.csv")
# Create bibliography to cite packages used
allLibs <- .packages()
library(knitcitations)
write.bib(allLibs, file = "Appendix.bib")
read.bib("Appendix.bib")
unique(sapply(train, class))  # all variables are either numeric or integer

mylengths <- sapply(train, function(x) length(unique(x)))
mylengths[mylengths < 20]
train[, `:=`(feat47, NULL)]
train[, `:=`(feat48, NULL)]
train[, `:=`(feat49, NULL)]
train[, `:=`(feat50, NULL)]
train[, `:=`(feat51, NULL)]
train[, `:=`(target, factor(target))]
train[, `:=`(feat4, ordered(feat4))]
train[, `:=`(feat8, ordered(feat8))]
train[, `:=`(feat12, ordered(feat12))]
train[, `:=`(feat16, ordered(feat16))]
train[, `:=`(feat17, ordered(feat17))]
train[, `:=`(feat29, factor(feat29))]
train[, `:=`(feat30, factor(feat30))]
train[, `:=`(feat31, ordered(feat31))]
train[, `:=`(feat35, factor(feat35))]
train[, `:=`(feat36, factor(feat36))]
train[, `:=`(feat43, factor(feat43))]
train[, `:=`(feat52, factor(feat52))]
train[, `:=`(feat55, factor(feat55))]
train[, `:=`(feat56, ordered(feat56))]
train[, `:=`(feat66, ordered(feat66))]
train[, `:=`(feat69, ordered(feat69))]
train[, `:=`(feat75, ordered(feat75))]
train[, `:=`(feat76, ordered(feat76))]
mylengths <- sapply(train, function(x) length(unique(x)))

varsEffected <- names(train)[mylengths < 10]
varsEffected <- varsEffected[varsEffected != "target"]

mytable <- data.frame(Cardinality = mylengths[varsEffected])
mytable$Class <- with(mytable, ifelse(Cardinality == 2, "Nominal", "Ordinal"))
library(pander)
pander(mytable, style = "rmarkdown")
```

