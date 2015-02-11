
# part 1
pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  
  filenames<-paste(formatC(id,width=3,flag="0"),"csv", sep=".")
  dir_file<-paste(directory,filenames,sep="/")
  n<-0
  total<-0
  for(item in dir_file){
    rawdata<-read.csv(item)
    single_data<-rawdata[,pollutant]
    process<-single_data[!is.na(single_data)]
    n<-n+length(process)
    total<-total+sum(process)
  }
  total/n
}

# test 
#pollutantmean("specdata", "sulfate", 1:10)
## [1] 4.064
#pollutantmean("specdata", "nitrate", 70:72)
## [1] 1.706
#pollutantmean("specdata", "nitrate", 23)
## [1] 1.281


  