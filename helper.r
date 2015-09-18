#helper.r function
loadPac <- function(filelist){
  
  success_loaded <- character(0)
  failure_loaded <- character(0)
  for(file in filelist){
    if(!do.call(require, list(file))){
      do.call(install.packages, list(file))
      if(!do.call(require, list(file))){ # fail
        failure_loaded <- c(failure_loaded, file)
      }else{ # success
        success_loaded <- c(success_loaded,file)
      }
    }else{ # success
      success_loaded<- c(success_loaded, file)
    }
  }
  print(paste(c("Loaded:", success_loaded),collapse=" "))
  print(paste(c("Failed:", failure_loaded),collapse=" "))
}