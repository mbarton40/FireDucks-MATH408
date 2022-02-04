library(readxl)
totalShipment <- read_excel("TSShipmentDataUSCensusBureau.xls",
col_names = FALSE, col_types = c("text",
"text", "numeric", "numeric", "numeric",
"numeric", "numeric", "numeric",
"numeric", "numeric", "numeric",
"numeric", "numeric", "numeric"))
# View(totalShipment)


class(totalShipment)

library(tidyverse)

totalShipment2 <- totalShipment %>% 
  rename(names = ...1, 
         year = ...2,
         January = ...3,
         February = ...4,
         March = ...5,
         April = ...6,
         May = ...7,
         June = ...8, 
         July = ...9,
         August = ...10, 
         September = ...11,
         October = ...12, 
         November = ...13, 
         December = ...14)

namesGrouped <- unique(x = totalShipment2$names)
View(namesGrouped)
namesGroupedUnadjusted <- totalShipment2 %>% 
  filter(substr(totalShipment2$names, 1, 1) == "U")

newdf <- function(x){
  df <- namesGroupedUnadjusted %>% 
    filter(names == x)
  return(df)
}

unadjustedNames <- unique(namesGroupedUnadjusted$names)

for (i in unadjustedNames){
  print(i)
  print(newdf(i))
  assign(x = i, value = newdf(i))
}
