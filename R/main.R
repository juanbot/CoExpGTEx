
#' initDb - Initialization of the package so the GTEx networks can be used with
#' CoExpNets
#'
#' @param mandatory If this parameter is `TRUE` then the networks will be added no matter whether they were already there.
#'
#' @return No value
#' @export
#'
#' @examples
initDb = function(mandatory=F){
  the.dir = system.file("", "gtexv6", package = "CoExpGTEx")
  nets = getGTExTissues()
  for(net in nets){
    CoExpNets::addNet(which.one="gtexv6",
           tissue=net,
           netfile=getGTExNet(net),
           ctfile=paste0(getGTExNet(net),".celltype.csv"),
           gofile=paste0(getGTExNet(net),"_gprof.csv"),
           exprdatafile=paste0(the.dir,"/",net,".resids.rds"),
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

  return(paste0(the.dir,"/",net.file))
}

#' Title Getting all GTEx available tissues
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

generateModuleTOMs = function(out.path=NULL){
  the.dir = system.file("", "gtexv6", package = "CoExpGTEx")

  files = list.files(the.dir)
  net.files = files[grep("net\\w+\\.\\d+\\.it\\.50\\.rds$",files)]
  net.files = gsub("net","",net.files)
  net.files = gsub("\\.it\\.50\\.rds$","",net.files)
  betas = as.numeric(gsub("[a-zA-Z\\.]+","",net.files))

  tissues = getGTExTissues()

  for(tissue in tissues){
    cat("Working on",tissue,"\n")
    beta = betas[which(tissues == tissue)]
    CoExpNets::getModuleTOMs(tissue=tissue,
                             beta=beta,
                             out.path=out.path,
                             which.one="gtexv6",
                             package="CoExpGTEx",
                             instfolder="gtexv6")
  }
}
