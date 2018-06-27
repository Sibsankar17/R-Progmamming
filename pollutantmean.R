
pollutantmean <- function(directory, pollutant, id=1:332){
  
  allfile <- list.files(path=directory, full.names = TRUE)
  all_data <- do.call(rbind, lapply(allfile, read.csv))
  result <- subset(all_data, ID >= range(id)[1] & ID <= range(id)[2], select = pollutant )
   mean(na.omit(result)[[1]])
                      
}

