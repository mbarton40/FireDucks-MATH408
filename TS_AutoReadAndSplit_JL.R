library(readxl)
library(tidyverse)

dataFiles <- list("TSShipments_2-3-2022.xls","TSInventoriesToShipments_2-8-2022.xls",
                  "TSNewOrders_2-8-2022.xlsx", "TSTotalInventories_2-8-2022.xls",
                  "TSUnfilledOrders_2-8-2022.xls", "TSUnfilledOrdersToShipments_2-8-2022.xls")

count_ts = 0

for (i in dataFiles){
  FileNameToRead <- i
  
  BaseFile <- read_excel(FileNameToRead,
                         col_names = FALSE, 
                         col_types = c("text", "text", "numeric", "numeric", "numeric",
                                       "numeric", "numeric", "numeric",
                                       "numeric", "numeric", "numeric",
                                       "numeric", "numeric", "numeric"))
  
  WideData <- BaseFile %>% 
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
  
  WideData_Unadjusted <- WideData %>% 
    filter(substr(WideData$names, 1, 1) == "U")
  
  #Function that splits the large wide data frame
  #into individual data frames based on name
  
  splitTSdf <- function(x){
    TSdf <- WideData_Unadjusted %>% 
      filter(names == x)
    return(TSdf)
  }
  
  TSnameList_Unadjusted <- unique(WideData_Unadjusted$names)
  
  #This for loop takes the Wide Data Frame for unadjusted Data and splits it into
  #smaller data frames and then organizes them into Time Series data format.
  
  
  for (j in TSnameList_Unadjusted){
    After_Split <- assign(x = j, value = splitTSdf(j))
    temp_Long_1 <- After_Split %>%
      gather(Month, Value, January:December, factor_key = TRUE) %>%
      mutate(Month = substring(Month,1,3)) %>%
      mutate(MonYear = str_c(Month,"-",year)) %>%
      arrange(year) %>%
      select(MonYear,Value) %>%
      ts(Vale, 
         start = c(1992,1),
         frequency = 12,
         end = c(2019,12)) %>%
    assign(x = j, value = temp_Long_5)
    
    count_ts = count_ts + 1
  }
  
  rm(After_Split)
  rm(BaseFile)
  rm(temp_Long_1)
  rm(temp_Long_2)
  rm(temp_Long_3)
  rm(temp_Long_4)
  rm(temp_Long_5)
  rm(WideData)
  rm(WideData_Unadjusted)
  rm(i)
  rm(j)
  rm(FileNameToRead)
  rm(TSnameList_Unadjusted)
  
}

# print(count_ts)
