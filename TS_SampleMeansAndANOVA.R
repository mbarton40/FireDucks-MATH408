source("TS_FullSource.R")

#Gets the function ready to run samples.
set.seed(3322)
intToSample <- 2:325

#A function that takes a mean, sample size, and the number of series you want,
#produces a random sample and takes the mean for each time series and abs diff
#from the given mean.
our_mean_cluster <- function(m, numOfSamples = 10, numSeries = 5){
  #Takes the input for number of samples and finds the index of those in
  #relation to the dates
  colIndexSample <- sample(intToSample, numOfSamples)
  colIndexSampleSorted <- sort(colIndexSample)
  
  #Takes a random sample from the data frame containing all TS
  sampleMean_Unadj_DF <- All_Unadj_DF[,1] %>%
    cbind(All_Unadj_DF[,colIndexSampleSorted]) %>%
    rename("TS_Names" = ".") %>%
    mutate(TS_Sample_Means = rowMeans(sampleMean_Unadj_DF[,2:(numOfSamples+1)]))
  
  #Takes the absolute difference between input mean and sample mean and
  #adds a column containing that to the df
  orderedMeans <- sampleMean_Unadj_DF %>%
    mutate(AbsDiff = abs(TS_Sample_Means - m)) %>%
    arrange(AbsDiff)
  
  return(orderedMeans[1:numSeries,])
}

our_mean_cluster(30000)


#Df col1=names/ col2-sample mean /col3-abs diff from input mean