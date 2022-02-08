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

namesGroupedUnadjusted <- totalShipment2 %>% 
  filter(substr(totalShipment2$names, 1, 1) == "U")

newdf <- function(x){
  df <- namesGroupedUnadjusted %>% 
    filter(names == x)
  return(df)
}

unadjustedNames <- unique(namesGroupedUnadjusted$names)

for (i in unadjustedNames){
  After_Split <- assign(x = i, value = newdf(i))
  temp_Long_1 <- gather(After_Split, Month, Value, January:December, factor_key = TRUE)
  temp_Long_2 <- temp_Long_1 %>%
    mutate(Month = substring(Month,1,3)) %>%
    mutate(MonYear = str_c(Month,"-",year))
  temp_Long_3 <- temp_Long_2 %>%
    arrange(year)
  temp_Long_4 <- temp_Long_3 %>%
    select(MonYear,Value)
  temp_Long_5 <- ts(data = temp_Long_4$Value,
          start = c(1992,1),
          frequency = 12,
          end = c(2019,12))
  assign(x = i, value = temp_Long_5)
  
}

plot(U11AVS, 
     col=2,
     ylim = c(3000,12000),
     main = "U11AVS vs U11BVS Time Series",
     ylab = "Value")
lines(U11BVS,col=3)
legend("bottomright",                           
       c("U11AVS","U11BVS"),
       lty = 1,
       col = 2:3,
       cex = 1)
