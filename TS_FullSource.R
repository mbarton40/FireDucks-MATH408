#Bringing in libraries for better functionality.
library(tidyverse)
library(lubridate)
library(rio)
library(stringr)
library(stringi)

#Drawing all data in and creating the organized data frame.
source("TS_AutoReadAndSplit.R")
source("TS_UnadjDataFrame.R")

#Draws in the Sample Mean function and runs over data set.
#source("TS_SampleMeans.R")