source("TS_FullSource.R")

library(dtw)
library(ggplot2)
if(!require(dendextend)) install.packages("dendextend") 
library(dendextend)

#DTW_All_Unadj_DF <- as.data.frame(t(All_Unadj_DF))
#colnames(DTW_All_Unadj_DF) <- DTW_All_Unadj_DF[1,]
#DTW_All_Unadj_DF <- DTW_All_Unadj_DF[-1,]

DTW_All_Unadj_DF <- All_Unadj_DF
rownames(DTW_All_Unadj_DF) <- DTW_All_Unadj_DF[,1]
DTW_All_Unadj_DF <- DTW_All_Unadj_DF[,-1]

DTW_All_Unadj_Dist <- dist(DTW_All_Unadj_DF, method = "DTW")

DTW_All_Unadj_HC <- hclust(DTW_All_Unadj_Dist, method = 'average')

TS_Dend <- as.dendrogram(DTW_All_Unadj_HC)

labels(TS_Dend) <- UnadjNameList

plot(TS_Dend, 
     main = "Cluster?",
     cex = 0.2)