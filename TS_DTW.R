source("TS_FullSource.R")

DTW_All_Unadj_DF <- All_Unadj_DF
rownames(DTW_All_Unadj_DF) <- DTW_All_Unadj_DF[,1]
DTW_All_Unadj_DF <- DTW_All_Unadj_DF[,-1]

DTW_All_Unadj_Dist <- dist(DTW_All_Unadj_DF, method = "DTW")

DTW_All_Unadj_HC <- hclust(DTW_All_Unadj_Dist, method = "average")

#Internal plotting (not as interactive)
# plot(DTW_All_Unadj_HC,
#      main = "Unadjusted TS DTW",
#      xlim = c(1,25), ylim = c(0, 1000000))

idendro(h = DTW_All_Unadj_HC, zoomFactor = 1/240, hscale = 2.5, vscale = 2.5)

###

DTW_All_Unadj_DF_Small <- head(All_Unadj_DF, 25)
rownames(DTW_All_Unadj_DF_Small) <- DTW_All_Unadj_DF_Small[,1]
DTW_All_Unadj_DF_Small <- DTW_All_Unadj_DF_Small[,-1]

DTW_All_Unadj_Dist_Small <- dist(DTW_All_Unadj_DF_Small, method = "DTW")

DTW_All_Unadj_HC_Small <- hclust(DTW_All_Unadj_Dist_Small, method = "average")

idendro(h = DTW_All_Unadj_HC_Small, zoomFactor = 1/240, hscale = 150)


#URL for idendr0 package details: 
#https://rdrr.io/cran/idendr0/man/idendro.html#:~:text=To%20zoom%20in%20a%20specific%20region%2C%20right%20click,zoomed%20dendrogram%2C%20middle%20click%20and%20drag%20the%20mouse.