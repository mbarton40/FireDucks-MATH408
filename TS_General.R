#Sourcing EVERYTHING!
source("TS_FullSource.R")

#TS Graphing Function
graphing_ts()

#Interactive Plot (FIXED AND WORKING)
idendro(h = DTW_All_Unadj_HC,
        hscale = 3.5, vscale = 2.3,
        cex = 1.25,
        mai = c(1,1,1,3),
        main = "Unadjusted TS DTW")

#SampleMeansANOVA Cluster Function
# our_mean_cluster(m = 30000, numSeries = 2, numOfSamples = 100)

#Internal plotting (not as interactive and labels arent working)
# plot(DTW_All_Unadj_HC,
#      main = "Unadjusted TS DTW",
#      cex = 0.75,
#      hang = -1,
#      cex = 0.5)


