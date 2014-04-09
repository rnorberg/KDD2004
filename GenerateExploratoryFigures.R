path <- file.path(getwd(), 'Figures', 'Exploratory')
setwd(path)

library(ggplot2)
theme_set(theme_bw(base_size=18))
theme_update(panel.grid.major=element_line(colour="#CCCCCC", size=0.3),
             panel.grid.minor=element_line(colour="grey96", size=0.7))

mynames <- grep('feat', names(train), value=T)
train[, target:=factor(target)]
sapply(mynames, function(x){
  p <- ggplot(train, aes_string(x=x, fill='target'))+
    geom_bar()
  ggsave(p, file=paste0(x, '.png'))
})


