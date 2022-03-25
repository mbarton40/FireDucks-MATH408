#This function initializes a seed and creates the function for SampleMeans/ANOVA

#Gets the function ready to run samples.
seed <- as.integer(readline(prompt = "Enter the seed you want used for Sample Means Function: "))
set.seed(seed)
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
    rename("TS_Names" = ".")
  
  sampleMean_Unadj_DF <- sampleMean_Unadj_DF %>%
    mutate(TS_Sample_Means = rowMeans(sampleMean_Unadj_DF[,2:(numOfSamples+1)]))
  
  #Takes the absolute difference between input mean and sample mean and
  #adds a column containing that to the df
  orderedMeans <- sampleMean_Unadj_DF %>%
    mutate(AbsDiff = abs(TS_Sample_Means - m)) %>%
    arrange(AbsDiff)
  
  #Prepping data for ANOVA test
  PCTS <- (orderedMeans[1:numSeries,])
  PCTS_T <- as.data.frame(t(PCTS))
  names_compared <- PCTS_T[1,]
  colnames(PCTS_T) <- PCTS_T[1,]
  PCTS_T <- PCTS_T[-1,]
  
  pre_ANOVA_PCTS <- gather(PCTS_T, "TS_Names", "Value")
  
  #ANOVA Test (1-way)
  PCTS_SampleMeanANOVA = aov(Value ~ TS_Names, data = pre_ANOVA_PCTS)
  #print(summary(PCTS_SampleMeanANOVA))
  
  #Pass/Fail List of TS that are either good with H0 or H1 at 0.95 Conf. Level
  names_compared_str <- toString(names_compared)
  names_compared_chr <- as.character(names_compared)
  
  p_val <- (summary(PCTS_SampleMeanANOVA)[[1]][1,5])
  
  if (p_val >= 0.95){
    print(paste(names_compared_str,"have F value of",p_val,
                "and thus pass the first ANOVA test on their sample means"))
    
    
    #Since these passed the ANOVA, we are plotting in this step
    
    names_compared_ts <- paste(names_compared,"_ts", sep = "")
    
    #This finds the best plotting bounds
    min_bound <- min(get(names_compared_ts[1]))
    max_bound <- max(get(names_compared_ts[1]))
    
    for (i in names_compared_ts){
      if (i != names_compared_ts[1]){
        curr_ts <- get(i)
        min_curr_ts <- min(curr_ts)
        max_curr_ts <- max(curr_ts)
        if (min_curr_ts < min_bound){
          min_bound <- min_curr_ts
        }
        if (max_curr_ts > max_bound){
          max_bound <- max_curr_ts
        }
      }
    }
    
    #Initializing variables and begins plotting
    plotting_count = 0
    color_count = 0
    for (i in names_compared_ts){
      curr_ts <- get(i)
      
      if (plotting_count == 0){
        plot(curr_ts, 
             col = color_count,
             main = paste(names_compared_str, "Time Series Plot"),
             ylab = "Value",
             ylim = c(min_bound,max_bound))
        color_count = color_count + 1
        plotting_count = plotting_count + 1
      }
      
      if (plotting_count != 0){
        lines(curr_ts, col = color_count)
        color_count = color_count + 1
      }
      legend("bottomright",                           
             names_compared_chr,
             lty = 1,
             col = 0:color_count+1,
             cex = 1)
    }
  }
  
  if (p_val < 0.95){
    print(paste(names_compared_str,"have F value of",p_val,
                "and thus DO NOT pass the first ANOVA test on their sample means"))
  }
}
