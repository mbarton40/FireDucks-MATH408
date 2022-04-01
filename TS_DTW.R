#This code sets up the dataframe and creates a hclust using average DTW

#This sets up the DF for the DTW
DTW_All_Unadj_DF <- All_Unadj_DF
rownames(DTW_All_Unadj_DF) <- DTW_All_Unadj_DF[,1]
DTW_All_Unadj_DF <- DTW_All_Unadj_DF[,-1]

#Lets the user know that this does take a while and not to do anything while it is running.
print("Dynamic Time Warping is running... do not close RStudio or run anything until you see 'There were # warnings'")

#Running the DTW and an 'Average' hierarchical cluster
DTW_All_Unadj_Dist <- dist(DTW_All_Unadj_DF, method = "DTW")

DTW_All_Unadj_HC <- hclust(DTW_All_Unadj_Dist, method = "average")