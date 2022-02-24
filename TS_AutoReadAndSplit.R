library(tidyverse)
library(lubridate)
library(rio)

source("TS_DataFiles.R")

count_ts = 0

for (i in dataFiles_URL){
  FileNameToRead <- i
  
  BaseFile <- import(FileNameToRead,
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
    pre_Covid_AS <- After_Split %>%
      slice_head(n = 28)
    assign(x = j, value = pre_Covid_AS)
    temp_Long_1 <- gather(pre_Covid_AS, Month, Value, January:December, factor_key = TRUE)
    temp_Long_2 <- temp_Long_1 %>%
      mutate(Month = substring(Month,1,3)) %>%
      mutate(MonYear = str_c(Month,"-",year))
    temp_Long_3 <- temp_Long_2 %>%
      arrange(year)
    temp_Long_4 <- temp_Long_3 %>%
      select(MonYear,Value)
    temp_Long_5 <- ts(data = temp_Long_4$Value)
    assign(x = paste(j,"_ts", sep = ""), value = temp_Long_5)
    
    count_ts = count_ts + 1
   
  }
  
  rm(After_Split, pre_Covid_AS, BaseFile, temp_Long_1, temp_Long_2, temp_Long_3,
     temp_Long_4, temp_Long_5, WideData, WideData_Unadjusted,
     i, j, FileNameToRead, TSnameList_Unadjusted)

}