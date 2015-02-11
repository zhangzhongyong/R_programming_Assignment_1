complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  # step read all files in specdata

  idnames<-character()
  num_vector<-numeric()
for ( i in id){
  filename<-paste(formatC(i,width=3,flag="0"),"csv",sep='.')
  file_dir<-paste(directory,filename,sep='/')
  data<-read.csv(file_dir)
  test_index<-(!is.na(data$sulfate))*(!is.na(data$nitrate))
  num<-length(test_index[as.logical(test_index)])
  idnames<-append(idnames,formatC(i,width=3,flag="0"))
  num_vector<-append(num_vector,num)
  }
  data.frame(id=idnames,nobs=num_vector)
}