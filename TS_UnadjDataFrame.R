#This creates a data frame that is alphabetically sorted unadjusted data.

All_Unadj_DF <- get(UnadjNameListWide[1])

for (i in UnadjNameListWide){
  if (i != UnadjNameListWide[1]){
    curr_var <- get(i)
    
    All_Unadj_DF <- rbind(All_Unadj_DF, curr_var)
  }
}

for (i in 2:325){
  All_Unadj_DF[,i] = as.numeric(All_Unadj_DF[,i])
}

rm(curr_var, i)
