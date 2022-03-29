#This code sets up the dataframe and creates a hclust using average DTW

#This quickly checks and sees if the user really wants to continue this DTW. It does take a while!

DTW_Question <- readline("Do you want to run DTW? Type 'NO' if you dont want to. Otherwise, hit 'ENTER' ")
if (DTW_Question == ""){
  #This sets up the DF for the DTW
  DTW_All_Unadj_DF <- All_Unadj_DF
  rownames(DTW_All_Unadj_DF) <- DTW_All_Unadj_DF[,1]
  DTW_All_Unadj_DF <- DTW_All_Unadj_DF[,-1]
  
  print("Dynamic Time Warping is running... do not close RStudio or run anything until you see 'There were # warnings'")
  
  DTW_All_Unadj_Dist <- dist(DTW_All_Unadj_DF, method = "DTW")
  
  DTW_All_Unadj_HC <- hclust(DTW_All_Unadj_Dist, method = "average")
}

if (DTW_Question == "NO"){
  print("You selected 'NO'. If you want to run it in the future, simply type 'source('TS_DTW.R')' in the console!")
}

rm(DTW_Question)