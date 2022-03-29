#Removing time series we dont want to look at!

UnadjNameList_Keep <- c()
UnadjNameListWide_Rem <- c()
UnadjNameListTS_Rem <- c()

for (j in UnadjNameList){
  if (!(str_detect(j, "(VS)$")) && !(str_detect(j, "(NO)$")) && !(str_detect(j, "(TI)$"))){
    curr_ts_wide_name <- paste(j,"_Wide", sep="")
    curr_ts_ts_name <- paste(j,"_ts", sep="")
    UnadjNameListWide_Rem <- append(UnadjNameListWide_Rem, curr_ts_wide_name)
    UnadjNameListTS_Rem <- append(UnadjNameListTS_Rem, curr_ts_ts_name)
  }
  if (str_detect(j, "(VS)$") || str_detect(j, "(NO)$") || str_detect(j, "(TI)$")){
    UnadjNameList_Keep <- append(UnadjNameList_Keep, j)
  }
}

UnadjNameListWide_Keep <- paste(UnadjNameList_Keep,"_Wide",sep = "")

rm(list = UnadjNameListWide_Rem)
rm(list = UnadjNameListTS_Rem)
rm(curr_ts_wide_name, curr_ts_ts_name, UnadjNameListTS_Rem, UnadjNameListWide_Rem)
