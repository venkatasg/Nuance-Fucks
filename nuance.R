library(ggplot2)
library(showtext)
trace(grDevices::png, exit = quote({
    showtext::showtext_begin()
}), print = FALSE)
font_add("ConcourseT4", "Concourse T4 Regular.otf")
showtext_auto()
nuance <- read.csv('nuance.csv')

ggplot(data=nuance, mapping=aes(x=Year, y=Percent)) +
    geom_smooth(method="loess", span=10, level=0, color="pink") + 
    geom_point(color="red", size=3) +
    scale_y_continuous(labels=function(x) paste0(x,"%"),expand = c(0.1, 0)) +
    labs(x="", y="Articles that mention nuance or fine-grain", 
         caption="Source: ACL Anthology") +
    theme(text=element_text(size=16,  family="ConcourseT4"), 
          rect = element_rect(fill = "transparent"))

## on-screen device
ggsave("total.png", bg="transparent", dpi = 192)

ggplot(data=nuance, mapping=aes(x=Year, y=absPercent)) +
    geom_smooth(method="loess", span=10, level=0, color="pink") + 
    geom_point(color="red", size=3) +
    scale_y_continuous(labels=function(x) paste0(x,"%"),expand = c(0.1, 0)) +
    labs(x="", y="Articles that mention nuance or fine-grain", 
         caption="Source: ACL Anthology") +
    theme(text=element_text(size=16,  family="ConcourseT4"),
          rect = element_rect(fill = "transparent"))
ggsave("abs.png", bg="transparent", dpi = 192)
