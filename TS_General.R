#This is a general script that we work on that allows us to try different functions
#and our 'main' working environment.

#Sourcing EVERYTHING!
source("TS_FullSource.R")

#TS Graphing Function
graphing_ts()

#Interactive Plot (FIXED AND WORKING)
idendro(h = DTW_All_Unadj_HC,
        hscale = 3.5, vscale = 2.3,
        cex = 1.25,
        mai = c(1,1,1,3))

#SampleMeansANOVA Cluster Function
# our_mean_cluster(m = 30000, numSeries = 2, numOfSamples = 100)

#Printing our Dendrogram to PNG
# png("Graphs/Full_Dendro.png",width=1920,height=1080)
# ggdendrogram(DTW_All_Unadj_HC, rotate = FALSE, theme_dendro = FALSE, cex = 0.75, )
# dev.off()

#Internal plotting (not as interactive and labels are small)
# plot(DTW_All_Unadj_HC,
#      main = "Unadjusted TS DTW",
#      hang = -1,
#      cex = 0.5)
