#This script contains all urls to data and sets the variable 'dataFiles_URL' to those URLs for easy calling

TS_Shipments <- "https://www.census.gov/manufacturing/m3/prel/historical_data/histshts/naics/naicsvsp.xls"
TS_NO <- "https://www.census.gov/manufacturing/m3/prel/historical_data/histshts/naics/naicsnop.xls"
TS_UO <- "https://www.census.gov/manufacturing/m3/prel/historical_data/histshts/naics/naicsuop.xls"
TS_TI <- "https://www.census.gov/manufacturing/m3/prel/historical_data/histshts/naics/naicsinvp.xls"
TS_ItS <- "https://www.census.gov/manufacturing/m3/prel/historical_data/histshts/naics/naicsisp.xls"
TS_UOtS <- "https://www.census.gov/manufacturing/m3/prel/historical_data/histshts/naics/naicsusp.xls"

dataFiles_URL <- list(TS_Shipments, TS_NO, TS_UO, TS_TI, TS_ItS, TS_UOtS)