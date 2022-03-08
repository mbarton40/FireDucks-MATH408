source("TS_FullSource.R")

set.seed(3322)
intToSample <- 2:325
numOfSamples <- 10
colIndexSample <- sample(intToSample, numOfSamples)
colIndexSampleSorted <- sort(colIndexSample)

sampleMean_Unadj_DF <- All_Unadj_DF[,1] %>%
  cbind(All_Unadj_DF[,colIndexSampleSorted]) %>%
  rename("TS_Names" = ".") %>%
  mutate(TS_Sample_Means = rowMeans(sampleMean_Unadj_DF[,2:(numOfSamples+1)]))

our_mean_cluster <- function(m, numSeries = 5){
  orderedMeans <- sampleMean_Unadj_DF %>%
    mutate(AbsDiff = abs(TS_Sample_Means - m)) %>%
    arrange(AbsDiff)
  
  return(orderedMeans[1:numSeries,])
}

our_mean_cluster(30000)

#Df col1=names/ col2-sample mean /col3-abs diff from input mean