source("TS_FullSource.R")

our_mean_cluster(m = 3150, numSeries = 3, numOfSamples = 50)
mean(U11ATI_ts)


#Internal plotting (not as interactive)
plot(DTW_All_Unadj_HC,
     main = "Unadjusted TS DTW",
     cex = 0.75,
     hang = -1,
     cex = 0.5)

#Interactive Plot (FIXED AND WORKING)
idendro(h = DTW_All_Unadj_HC,
        hscale = 3.5, vscale = 2.3,
        cex = 1.25,
        mai = c(1,1,1,3),
        main = "Unadjusted TS DTW")


         #How to make a saved PNG#
# png("plotdendogram.png",width=1920,height=1080)
# par(cex = .75,font = 3)
# plot(DTW_All_Unadj_HC,
#      main = "Unadjusted TS DTW",
#      hang = -1)
# dev.off()