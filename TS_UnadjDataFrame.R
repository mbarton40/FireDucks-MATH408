#Bringing in libraries for better functionality
library(tidyverse)
library(lubridate)
library(rio)

All_Unadj_DF <- U11ATI_Wide

for (i in UnadjNameListWide){
  curr_var <- get(i)
  
  All_Unadj_DF <- rbind(All_Unadj_DF, curr_var)
  
}

view(All_Unadj_DF)


view(curr_var)

#FUCK U34GVS!