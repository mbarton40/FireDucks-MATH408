#This file contains functions to plot our DTW Hclust by our own clusters

#Interactive Plot
idendro(h = DTW_All_Unadj_HC,
        hscale = 3.5, vscale = 2.3,
        cex = 1.25,
        mai = c(1,1,1,3))


#Printing a 'regular' dendrogram to PNG
png("Graphs/Full_Dendro_test.png",width=1920,height=1080)
ggdendrogram(DTW_All_Unadj_HC,
             rotate = FALSE, 
             theme_dendro = FALSE, 
             cex = 0.75)
dev.off()

#Internal plotting (not as interactive and labels are small)
ggdendrogram(DTW_All_Unadj_HC,
             rotate = FALSE, 
             theme_dendro = FALSE, 
             cex = 0.75)

#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=#

#Color coding labels for the dendrogram for better viewing
DTW_All_Unadj_Dend <- as.dendrogram(DTW_All_Unadj_HC)

DTW_All_Colors <- c(2, 3, 4, 5, 6, 7, 8, "darkgreen",
                    "deeppink4", "darkcyan", "plum2",
                    "mediumpurple1", "orange4", 1)

DTW_All_Labels <- labels(DTW_All_Unadj_Dend)

#Defining clusters
C1 <- c("UMTMTI", "UMXDTI", "UMTUTI", "UMXTNO", "UMXTVS", "UDXDTI", "UMDMTI",
        "UMDMTI", "UMXTTI", "UMXTTI", "UMXTTI", "UMXDNO", "UMXDVS", "UMTMNO",
        "UMTMVS")

C2 <- c("UDXTTI", "UMNMTI", "UMNMNO", "UMNMVS", "UDXDNO", "UDXDVS", "UMDMNO",
        "UMDMVS")

C3 <- c("U36STI", "UNXATI", "UCOGNO", "UCOGVS", "UCOGTI", "UTCGTI", "UMTUNO", 
        "UCNGTI", "UNDETI", "UCNGVS", "UMTUVS", "UDXTNO", "UDXTVS")

C4 <- c("UTCGNO", "U36SNO", "U25STI", "U36SVS", "UTCGVS", "UNDENO", "UNDEVS")

C5 <- c("U34STI", "UITITI")

C6 <- c("UNAPTI", "UMVPNO", "UMVPVS", "UCMSNO", "UCMSVS", "U11STI", "U32STI")

C7 <- c("UNXANO", "UNXAVS", "U11SVS", "U25SVS", "UODGTI", "U33STI", "UCMSTI")

C8 <- c("UBTPNO", "UBTPVS", "U12STI", "U39STI", "U26STI", "UBTPTI")

C9 <- c("U35STI", "U22STI", "U22SVS", "U31SNO", "U31SVS", "U26SVS", "U11CVS",
        "U31ATI", "U36BVS", "U12ATI", "U25BVS")

C10 <- c("UNAPNO", "UDEFNO", "UNAPVS", "UDAPTI", "U39SVS", "U27STI", "U34KTI",
         "UANMTI", "U12SVS", "U21STI", "UDEFVS", "U35SNO", "U35SVS")

C11 <- c("U24ATI", "U24STI", "U24AVS", "U24SVS")

C12 <- c("UCDGNO", "UCDGVS", "U25BTI", "U31STI", "UODGNO", "UODGVS", "UCDGTI",
         "UMVPTI", "U32SNO", "U32SVS", "U33SNO", "U33SVS")

C13 <- c("U34SVS", "UITIVS", "U34SNO", "UITINO")

Cluster_Name_List <- c("C1", "C2", "C3", "C4", "C5", "C6", "C7", "C8", "C9",
                       "C10", "C11", "C12", "C13", "Unclustered")

#Giving a color to each label/time series
DTW_Label_Colors <- c()

for (i in DTW_All_Labels){
  if (i %in% C1){
    DTW_Label_Colors <- append(DTW_Label_Colors, DTW_All_Colors[1])
    next
  }
  if (i %in% C2){
    DTW_Label_Colors <- append(DTW_Label_Colors, DTW_All_Colors[2])
    next
  }
  if (i %in% C3){
    DTW_Label_Colors <- append(DTW_Label_Colors, DTW_All_Colors[3])
    next
  }
  if (i %in% C4){
    DTW_Label_Colors <- append(DTW_Label_Colors, DTW_All_Colors[4])
    next
  }
  if (i %in% C5){
    DTW_Label_Colors <- append(DTW_Label_Colors, DTW_All_Colors[5])
    next
  }
  if (i %in% C6){
    DTW_Label_Colors <- append(DTW_Label_Colors, DTW_All_Colors[6])
    next
  }
  if (i %in% C7){
    DTW_Label_Colors <- append(DTW_Label_Colors, DTW_All_Colors[7])
    next
  }
  if (i %in% C8){
    DTW_Label_Colors <- append(DTW_Label_Colors, DTW_All_Colors[8])
    next
  }
  if (i %in% C9){
    DTW_Label_Colors <- append(DTW_Label_Colors, DTW_All_Colors[9])
    next
  }
  if (i %in% C10){
    DTW_Label_Colors <- append(DTW_Label_Colors, DTW_All_Colors[10])
    next
  }
  if (i %in% C11){
    DTW_Label_Colors <- append(DTW_Label_Colors, DTW_All_Colors[11])
    next
  }
  if (i %in% C12){
    DTW_Label_Colors <- append(DTW_Label_Colors, DTW_All_Colors[12])
    next
  }
  if (i %in% C13){
    DTW_Label_Colors <- append(DTW_Label_Colors, DTW_All_Colors[13])
    next
  }
  else{
    DTW_Label_Colors <- append(DTW_Label_Colors, DTW_All_Colors[14])
  }
}

#Assigning the colors and size to the dendrogram
labels_colors(DTW_All_Unadj_Dend) <- DTW_Label_Colors
labels_cex(DTW_All_Unadj_Dend) <- 0.75

#Exporting to PNG
png("Graphs/DTW_Avg_Dendro_Color_VS_TI_NO.png",width=1920,height=1080)
plot(DTW_All_Unadj_Dend, cex = 0.75, horiz = F)
legend("topright",                           
        Cluster_Name_List,
        lty = 1,
        col = DTW_All_Colors,
        cex = 2,
        )
dev.off()
