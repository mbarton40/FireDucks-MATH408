library(readr)
dat_orig <- read_csv("SeriesReport-202201271325.csv",
skip = 7)
View(dat_orig)

# read.table
# read.delim

head(dat_orig)
tail(dat_orig)
View(dat_orig)
names(dat_orig)
dat_orig$Period
dat_orig$Value

# Way to store and manage time series in R
# base R ts objects
x <- ts(data      = dat_orig$Value, 
        start     = c(1992, 1), 
        frequency = 12)
class(x)
plot(x)

# lets remove pandemic period
x_preCovid <- window(x     = x, 
                     start = c(1992, 1), 
                     end   = c(2019, 12))
plot(x_preCovid)




