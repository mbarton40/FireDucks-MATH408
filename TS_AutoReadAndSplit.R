#Bringing in libraries for better functionality
library(tidyverse)
library(lubridate)
library(rio)

#Drawing in the data file URLs
source("TS_DataFiles.R")

#Initializing name lists/variables for the loop
UnadjNameList <- c()
UnadjNameListWide <- c()

for (i in dataFiles_URL){
  #Sets a file as a temp variable and reads it in
  FileNameToRead <- i
  BaseFile <- import(FileNameToRead,
                         col_names = FALSE, 
                         col_types = c("text", "text", "numeric", "numeric", "numeric",
                                       "numeric", "numeric", "numeric",
                                       "numeric", "numeric", "numeric",
                                       "numeric", "numeric", "numeric"))
  #Renaming column names
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
  
  #Filters out adjusted data
  WideData_Unadjusted <- WideData %>% 
    filter(substr(WideData$names, 1, 1) == "U")
  
  #Function that splits the large wide data frame
  #into individual data frames based on name
  splitTSdf <- function(x){
    TSdf <- WideData_Unadjusted %>% 
      filter(names == x)
    return(TSdf)
  }
  
  #Appends a name list to create a chr list of all names of all ts
  TSnameList_Unadjusted <- unique(WideData_Unadjusted$names)
  UnadjNameList <- append(UnadjNameList, TSnameList_Unadjusted)
  
  TSnameList_Unadjusted_Wide <- paste(TSnameList_Unadjusted,"_Wide", sep = "")
  UnadjNameListWide <- append(UnadjNameListWide, TSnameList_Unadjusted_Wide)
  
  #This for loop takes the Wide Data Frame for Unadjusted Data and splits it into
  #smaller data frames and then organizes them into Time Series data format.
  
  for (j in TSnameList_Unadjusted){
    #Splits df and cuts off COVID Years...Also creates regular df object
    After_Split <- assign(x = j, value = splitTSdf(j))
    pre_Covid_AS <- After_Split %>%
      slice_head(n = 28) %>%
      slice_tail(n = 27)
    assign(x = j, value = pre_Covid_AS)
    
    #Formats data to get into ts and wide data objects
    temp_Long_1 <- gather(pre_Covid_AS, Month, Value, January:December, factor_key = TRUE)
    temp_Long_2 <- temp_Long_1 %>%
      mutate(Month = substring(Month,1,3)) %>%
      mutate(MonYear = str_c(Month,"-",year))
    temp_Long_3 <- temp_Long_2 %>%
      arrange(year)
    temp_Long_4 <- temp_Long_3 %>%
      select(MonYear,Value)
    
    #Creates time series object
    temp_Long_5 <- ts(data = temp_Long_4$Value)
    assign(x = paste(j,"_ts", sep = ""), value = temp_Long_5)
    
    #Creates a wide data object
    WideFormatDF <- as.data.frame(t(temp_Long_4))
    
    colnames(WideFormatDF) <- WideFormatDF[1,]
    WideFormatDF <- WideFormatDF[-1,]
    
    row.names(WideFormatDF) <- NULL
    curr_name <- as.data.frame(t(j))
    WideFormatDF <- cbind(curr_name, WideFormatDF)
    
    assign(x = paste(j,"_Wide", sep=""), value = WideFormatDF)
    
  }
  
  #Sorts name lists
  UnadjNameList <- sort(UnadjNameList)
  UnadjNameListWide <- sort(UnadjNameListWide)
  
  
}

#Removes unnecessary variables
rm(After_Split, pre_Covid_AS, BaseFile, temp_Long_1, temp_Long_2, temp_Long_3,
   temp_Long_4, temp_Long_5, WideFormatDF, WideData, WideData_Unadjusted,
   i, j, FileNameToRead, TSnameList_Unadjusted, TSnameList_Unadjusted_Wide,
      TS_ItS, TS_NO, TS_Shipments, TS_TI, TS_UO, TS_UOtS, dataFiles_URL)

