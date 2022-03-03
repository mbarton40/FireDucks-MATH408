#This creates a data frame that is alphabetically sorted unadjusted data.
All_Unadj_DF <- U11ATI_Wide

for (i in UnadjNameListWide){
  if (i != "U11ATI_Wide"){
    curr_var <- get(i)
    
    All_Unadj_DF <- rbind(All_Unadj_DF, curr_var)
  }
}

rm(curr_var, i)