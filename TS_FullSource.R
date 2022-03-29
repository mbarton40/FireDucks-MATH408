#Bringing in libraries for better functionality.
library(tidyverse)
library(lubridate)
library(rio)
library(stringr)
library(stringi)
library(dtw)
library(idendr0)
library(dendextend)

#Drawing in the data file URLs.
source("TS_DataFiles.R")

#Drawing all data in, filtering out ones we dont want to look at
#and create an organized data frame of Unadj TS
source("TS_AutoReadAndSplit.R")
source("TS_FilterCategories.R")
source("TS_UnadjDataFrame.R")

#Draws in the Sample Mean and ANOVA Test Function.
source("TS_SampleMeansAndANOVA.R")

#Draws in a Graphing Function for the TS graphs
source("TS_Graphing.R")

#Runs Dynamic Time Warping HC Average on All Time Series if user wants :)
source("TS_DTW.R")
