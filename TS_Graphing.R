#This function plots time series given as a name

graphing_ts <- function(ts_names){
  
  names_with_ts <- paste(ts_names,"_ts", sep = "")
  ts_names_chr <- as.character(ts_names)
  
  min_bound <- min(get(names_with_ts[1]))
  max_bound <- max(get(names_with_ts[1]))
  
  for (i in names_with_ts){
    if (i != ts_names[1]){
      curr_ts <- get(i)
      min_curr_ts <- min(curr_ts)
      max_curr_ts <- max(curr_ts)
      if (min_curr_ts < min_bound){
        min_bound <- min_curr_ts
      }
      if (max_curr_ts > max_bound){
        max_bound <- max_curr_ts
      }
    }
  }
  
  plotting_count = 0
  color_count = 0
  for (i in names_with_ts){
    curr_ts <- get(i)
    
    if (plotting_count == 0){
      plot(curr_ts, 
           col = color_count,
           main = paste(ts_names_chr, "Time Series Plot"),
           ylab = "Value",
           ylim = c(min_bound,max_bound))
      color_count = color_count + 1
      plotting_count = plotting_count + 1
    }
    
    if (plotting_count != 0){
      lines(curr_ts, col = color_count)
      color_count = color_count + 1
    }
    legend("bottomright",                           
           ts_names_chr,
           lty = 1,
           col = 0:color_count+1,
           cex = 1)
  }
}
