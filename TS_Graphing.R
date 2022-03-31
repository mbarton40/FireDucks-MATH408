#This function plots multiple time series up to 15 (based on colors configs)

graphing_ts <- function(){
  #This prompts the user to get the first of the ts names they want plotted
  ts_names <- c(as.character(readline(prompt = "Enter the name of a time series you want plotted: ")))
  
  #This enters a while loop to capture all ts names they want plotted
  keep_going = TRUE
  while (keep_going == TRUE) {
    curr_name <- as.character(readline(prompt = "Enter the name of a time series you want plotted (When finished, hit 'ENTER'): "))
    if (curr_name != ''){
      ts_names <- append(ts_names, curr_name)
    }
    else{
      keep_going = FALSE
    }
  }
  
  #This is a quick error check to make sure the user needed to exit due to a typing mistake.
  #If they are satisfied with their entries, it continues the program.
  quick_check <- as.character(readline(prompt = "If you made any mistakes while typing the plots, please type 'EXIT'. Otherwise, hit 'ENTER': "))
  
  if (quick_check != 'EXIT'){
    
    #Creating a vector to store colors
    colors <- c(1, 2, 3, 4, 5, 6, 7, 8, "darkgreen",
                "deeppink4", "darkcyan", "plum2",
                "mediumpurple1", "orange4", "seagreen1")
    
    #Creates a few useful ways of storing the names
    names_with_ts <- paste(ts_names,"_ts", sep = "")
    ts_names_chr <- as.character(ts_names)
    ts_names_str <- toString(ts_names)
  
    
  #This finds the best plotting bounds
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
    #Initializing plotting and color counts and begins plotting
    first_plot_flag = 0
    color_count = 0
    for (i in names_with_ts){
      curr_ts <- get(i)
      
      if (first_plot_flag == 0){
        plot(curr_ts, 
             col = colors[color_count],
             #main = paste(ts_names_str, "Time Series Plot"),
             ylab = "Value",
             ylim = c(min_bound,max_bound))
        color_count = color_count + 1
        first_plot_flag = first_plot_flag + 1
      }
      
      if (first_plot_flag != 0){
        lines(curr_ts, 
              col = colors[color_count])
        color_count = color_count + 1
      }
      legend("bottomright",                           
             ts_names_chr,
             lty = 1,
             col = colors[1:color_count],
             cex = 1)
    }
    
    #A PNG prompt to see if they want the exported picture
    photo_test <- as.character(readline(prompt = "If you DO NOT want this exported to PNG, type 'NO'. Otherwise, enter the name you want for the PNG file of the graph: "))
    if (photo_test !='NO'){
      photo_name <- photo_test
      png_name_dir <- paste("Graphs/",photo_name, ".png", sep = "")
      png(png_name_dir,width=1200,height=600)
      
      #Running previous code again to capture it in the file
      first_plot_flag = 0
      color_count = 0
      for (i in names_with_ts){
        curr_ts <- get(i)
        
        if (first_plot_flag == 0){
          plot(curr_ts, 
               col = colors[color_count],
               #main = paste(ts_names_str, "Time Series Plot"),
               ylab = "Value",
               ylim = c(min_bound,max_bound))
          color_count = color_count + 1
          first_plot_flag = first_plot_flag + 1
        }
        
        if (first_plot_flag != 0){
          lines(curr_ts, 
                col = colors[color_count])
          color_count = color_count + 1
        }
        legend("bottomright",                           
               ts_names_chr,
               lty = 1,
               col = colors[1:color_count],
               cex = 1)
      }
        dev.off()
    }
  }
}  
