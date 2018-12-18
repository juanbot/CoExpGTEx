
#' initDbGTEx - Initialization of the package so the GTEx networks can be used with
#' CoExpNets
#'
#' @param mandatory
#'
#' @return
#' @export
#'
#' @examples
initDbGTEX = function(mandatory=F){
  the.dir = system.file("", "gtexv6", package = "CoExpGTEx")
  nets = getGTExTissues()
  for(net in nets){
    addNet(which.one="gtexv6",
           tissue=net,
           netfile=getGTExNet(net),
           ctfile=paste0(the.dir,"/",getGTExNet(net),"_celltype.csv"),
           gofile=paste0(the.dir,"/",getGTExNet(net),"_gprof.csv"),
           expdatafile=paste0(the.dir,"/",
                  getGTExNet(net),".resids.rds"),
           overwrite=mandatory)
  }
}

#' gteGTExNet - Accessing a network object directly
#'
#' @param tissue One of the labels that can be obtained by calling getGTExTissues() method
#' to refer to a specific network within the package
#'
#' @return The RDS full file name to the network
#' @export
#'
#' @examples
getGTExNet = function(tissue){

  the.dir = system.file("", "gtexv6", package = "CoExpGTEx")
  files = list.files(the.dir)

  net.file = files[grep(paste0("net",tissue,"\\.\\d+\\.it\\.50\\.rds$"),files)]
  if(length(net.file) == 0)
    return(NULL)

  return(paste0(the.dir,net.file))
}

#' Title
#'
#' @return
#' @export
#'
#' @examples
getGTExTissues = function(){

  the.dir = system.file("", "gtexv6", package = "CoExpGTEx")
  files = list.files(the.dir)

  net.files = files[grep("net\\w+\\.\\d+\\.it\\.50\\.rds$",files)]
  net.files = gsub("net","",net.files)
  net.files = gsub(".\\d+\\.it\\.50\\.rds$","",net.files)

  return(net.files)
}

