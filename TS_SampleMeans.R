source("TS_FullSource.R")

set.seed(3322)
intToSample <- 2:325
numOfSamples <- 10
colIndexSample <- sample(var, numOfSamples)
colIndexSampleSorted <- sort(colIndexSample)

sampleMean_Unadj_DF <- All_Unadj_DF[,1] %>%
  cbind(All_Unadj_DF[,colIndexSampleSorted]) %>%
  rename("TS_Names" = ".")

  
our_mean_cluster <- function(m, numSeries = 5, plotResult = FALSE){
  orderedmeans <- sampleMean_Unadj_DF %>%
    group_by(TS_Names) %>%
    summarise(seriesMean = rowMeans())
  
  
}


orderedmeans <- sampleMean_Unadj_DF %>%
  group_by(TS_Names) %>%
  summarise(TS_Sample_Mean = rowMeans(sampleMean_Unadj_DF[,2:(numOfSamples+1)]))
