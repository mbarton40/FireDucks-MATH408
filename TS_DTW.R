#This code sets up the dataframe and creates a hclust using average DTW

DTW_All_Unadj_DF <- All_Unadj_DF
rownames(DTW_All_Unadj_DF) <- DTW_All_Unadj_DF[,1]
DTW_All_Unadj_DF <- DTW_All_Unadj_DF[,-1]

DTW_All_Unadj_Dist <- dist(DTW_All_Unadj_DF, method = "DTW")

DTW_All_Unadj_HC <- hclust(DTW_All_Unadj_Dist, method = "average")