#Author: Minghui Wang
msigdb.genesets=function(sets=NULL, type=c('symbols', 'entrez'),species=c('human','mouse')){
	type=match.arg(type)
	species=match.arg(species)
	if(species=='mouse' && type=='entrez') stop('Only symbols type is supported for mouse\n')
	gmtfiles=paste(c(
		C1.CYTO='c1.all', C2.CGP='c2.cgp', C2.CP='c2.cp', C3.MIR='c3.mir', C3.TFT='c3.tft', C4.CGN='c4.cgn', C4.CM='c4.cm',
		C5.BP='c5.bp', C5.CC='c5.cc', C5.MF='c5.mf', C6.ONCOGENE='c6.all', C7.IMMUNE='c7.all',CH.HALLMARK='h.all'
	),msigdb.version(),type,'gmt',sep='.')
	gmtfiles=paste(species,gmtfiles,sep='/')
	names(gmtfiles)=msigdb.collections
	if(is.null(sets)) sets=msigdb.collections
	if(! all(sets %in% msigdb.collections)) stop('Invalid values for argument sets\n')
	obj=NULL
	for(s in sets){
		#f=file.path(system.file("extdata", package="msigdb"),gmtfiles[s])
		#res=read.gmt(f)
		f=file.path(system.file("extdata", package="msigdb"),paste0(gmtfiles[s],'.RDS')) #see convert.gmt2RDS for save gmt in RDS format
		res=readRDS(f)
		res$geneset.names=paste(s,res$geneset.names,sep=':')
		if(is.null(obj)){
			obj=res
		}else{
			obj$genesets=c(obj$genesets,res$genesets)
			obj$geneset.names=c(obj$geneset.names,res$geneset.names)
			obj$geneset.descriptions=c(obj$geneset.descriptions,res$geneset.descriptions)
		}
	}
	names(obj$genesets)=obj$geneset.names
	obj
}
#
