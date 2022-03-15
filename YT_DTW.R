library(tidyverse)
library(rio)


#Time series clustering

# Data 
url_data <- "http://kdd.ics.uci.edu/databases/synthetic_control/synthetic_control.data"
data <- read.table(url_data, header = F, sep = "")
str(data)
plot(data[,60], type = 'l')
j <- c(5, 105, 205, 305, 405, 505)
sample <- t(data[j,])
plot.ts(sample,
        main = "Time-series Plot",
        col = 'blue',
        type = 'b')

# Data preparation
n <- 10
s <- sample(1:100, n)
i <- c(s,100+s, 200+s, 300+s, 400+s, 500+s)
d <- data[i,]
str(d)
view(d)

pattern <- c(rep('Normal', n),
             rep('Cyclic', n),
             rep('Increasing trend', n),
             rep('Decreasing trend', n),
             rep('Upward shift', n),
             rep('Downward shift', n))

view(pattern)
class(pattern)

# Calculate distances
library(dtw)
distance <- dist(d, method = "DTW")

# Hierarchical clustering
hc <- hclust(distance, method = 'average')
plot(hc,
     labels = pattern,
     cex = 0.7,
     hang = -1,
     col = 'blue')
rect.hclust(hc, k=4)
