#Bringing in libraries for better functionality
library(tidyverse)
library(lubridate)
library(rio)

All_Unadj_DF <- U11ATI_Wide

for (i in UnadjNameListWide){
  curr_var <- get(i)
  
  All_Unadj_DF <- rbind(All_Unadj_DF, curr_var)
  
}

#rm(curr_var)

view(All_Unadj_DF)



#FUCK U34GVS!

y <- c("U", "G")

x <- match(1, str_detect("C", y))
x
class(x)
