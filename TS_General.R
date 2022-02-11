source("TS_AutoReadAndSplit.R")

plot(U11AVS, 
     col=2,
     ylim = c(3000,12000),
     main = "U11AVS vs U11BVS Time Series",
     ylab = "Value")
lines(U11BVS,
      col= 3)
legend("bottomright",                           
       c("U11AVS","U11BVS"),
       lty = 1,
       col = 2:3,
       cex = 1)
