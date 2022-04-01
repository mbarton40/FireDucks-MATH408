#This creates a data frame that is alphabetically sorted unadjusted data.

#Assigns the first time series to the data frame
All_Unadj_DF <- get(UnadjNameListWide_Keep[1])

#Iterates through the rest of the time series and puts them in the data frame
for (i in UnadjNameListWide_Keep){
  if (i != UnadjNameListWide_Keep[1]){
    curr_var <- get(i)
    
    All_Unadj_DF <- rbind(All_Unadj_DF, curr_var)
  }
}

length_of_AUDF <- length(All_Unadj_DF)

for (i in 2:length_of_AUDF){
  All_Unadj_DF[,i] = as.numeric(All_Unadj_DF[,i])
}

rm(curr_var, i, length_of_AUDF)
