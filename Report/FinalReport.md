# STA 6714 Final Project

Author: Robert Norberg

Due: April 23, 2014

Date Ran: April 09, 2014

----







## Executive Summary (1 Page) 


## Data Preparation

### Exploration



First I did something.


```
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  0.000   0.000   0.000   0.156   0.000   2.640 
```





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
summary(train$feat1)
```

