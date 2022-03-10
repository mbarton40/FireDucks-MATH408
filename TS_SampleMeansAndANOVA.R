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
  
  #Takes the first 5/or inputted number and stores to df.
  PCTS <- (orderedMeans[1:numSeries,])
  
  #ANOVA Test (1-way)
  PCTS_MeansAndNames <- PCTS %>%
    select(TS_Names, TS_Sample_Means)
  
  view(PCTS_MeansAndNames)
  
  #Pass/Fail List of TS that are either good with H0 or H1
  #Plot the list if it passes, if not return NOTHING
  
}

our_mean_cluster(30000)



#TESTING BELOW:
m = 30000
numSeries = 5
numOfSamples = 10

colIndexSample <- sample(intToSample, numOfSamples)
colIndexSampleSorted <- sort(colIndexSample)

sampleMean_Unadj_DF <- All_Unadj_DF[,1] %>%
  cbind(All_Unadj_DF[,colIndexSampleSorted]) %>%
  rename("TS_Names" = ".") %>%
  mutate(TS_Sample_Means = rowMeans(sampleMean_Unadj_DF[,2:(numOfSamples+1)]))

orderedMeans <- sampleMean_Unadj_DF %>%
  mutate(AbsDiff = abs(TS_Sample_Means - m)) %>%
  arrange(AbsDiff)

PCTS <- (orderedMeans[1:numSeries,])

#ANOVA Test (1-way)
PCTS_MandN <- PCTS %>%
  select(TS_Names, TS_Sample_Means)




PCTS_SampleMeanANOVA = aov(TS_Sample_Means ~ TS_Names, data = PCTS_MandN)

summary(PCTS_SampleMeanANOVA)
#Pass/Fail List of TS that are either good with H0 or H1
#Plot the list if it passes, if not return NOTHING


