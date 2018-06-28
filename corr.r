corr <- function(directory, threshold = 0) {
  full_files <- list.files(directory, full.names = TRUE)
  result1 <- numeric()
  
  for (i in 1:length(full_files)) {
    newData1 <- read.csv(full_files[i])
    
    data_sum <- sum((!is.na(newData1$sulfate)) & (!is.na(newData1$nitrate)))
    
    if (data_sum > threshold) {
      tmpData <- newData1[which(!is.na(newData1$sulfate)), ]
      
      subnewData1 <- tmpData[which(!is.na(tmpData$nitrate)), ]
      
      result1 <- c(result1, cor(subnewData1$sulfate, subnewData1$nitrate))
    }
  }
  
  result1
}