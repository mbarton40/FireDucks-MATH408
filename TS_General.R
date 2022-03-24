source("TS_FullSource.R")

our_mean_cluster(m = 25000, numSeries = 2, numOfSamples = 100)
mean(U11ATI_ts)
graphing_ts(ts_names = c("UCDGVS", "UCDGNO"))

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






plot(UTCGTI_ts, 
     col = "black",
     main = "UTCGTI and UMTMWI",
     ylab = "Value")


lines(UMTMWI_ts, col = "red")

# 580,000 is height difference between U36ZUO and U25SFI
# between 880,000 is difference between UTCGTI and UMTMWI 


legend("bottomright",                           
       c("UTCGTI", "UMTMWI"),
       lty = 1,
       col = 1:2,
       cex = 1)




