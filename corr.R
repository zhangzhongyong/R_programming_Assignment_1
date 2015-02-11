corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  cor_num<-numeric()
  id_nobs<-complete("specdata")
  test_index<-id_nobs$nobs>=threshold
  new_frame<-id_nobs[test_index,]
 # if(length(test_index[test_index])==0){
  #  return(numeric())
  #}
  
  for(i in new_frame$id){
    filename<-paste(i,'csv',sep=".")
    file_dir<-paste(directory,filename,sep='/')
    data<-read.csv(file_dir)
    temp<-cor(data$sulfate,data$nitrate,"na.or.complete")
    cor_num<-append(cor_num,temp)
  }
  cor_num
}