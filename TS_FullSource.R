#Bringing in libraries.
library(tidyverse)
library(lubridate)
library(rio)
library(stringr)
library(stringi)
library(dtw)
library(idendr0)
library(dendextend)
library(ggplot2)
library(ggdendro)

#Drawing in the data file URLs.
source("TS_DataFiles.R")

#Drawing all data in, filtering out ones we dont want to look at
#and create an organized data frame of Unadj TS
source("TS_AutoReadAndSplit.R")
source("TS_FilterCategories.R")
source("TS_UnadjDataFrame.R")

#Draws in the Sample Mean and ANOVA Test Function. (Wasn't the best direction in the end, but great coding experience)
source("TS_SampleMeansAndANOVA.R")

#Draws in a Graphing Function for the TS graphs
source("TS_Graphing.R")

#Runs Dynamic Time Warping HC Average on All Time Series if user wants :)
DTW_Question <- readline("Do you want to run DTW? Type 'NO' if you dont want to. Otherwise, hit 'ENTER' ")
if (DTW_Question == ""){
  source("TS_DTW.R")
}

if (DTW_Question == "NO"){
  print("You selected 'NO'. If you want to run it in the future, simply type 'source('TS_DTW.R')' in the console!")
}
rm(DTW_Question)


