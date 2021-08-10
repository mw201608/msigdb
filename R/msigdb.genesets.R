#Author: Minghui Wang
msigdb.genesets = function(sets = NULL, type = c('symbols', 'entrez'), species = c('human', 'mouse'), return.data.frame = FALSE){
	type = match.arg(type)
	species = match.arg(species)
	if(is.null(sets)) sets = msigdb.collections
	if(! all(sets %in% msigdb.collections)) stop('Invalid values for argument sets\n')
	if(species == 'mouse' && type == 'entrez') stop('Only symbols type is supported for mouse\n')
	rdsfile = file.path(system.file("extdata", package = "msigdbi"), paste0('msigdb.v7.4.', type, '.', species, '.RDS'))
	obj = readRDS(rdsfile)
	genesetlistfile = file.path(system.file("extdata", package = "msigdbi"), 'msigdb.v7.4.geneset.list.RDS')
	genesetlist = readRDS(genesetlistfile)
	genesetlist = genesetlist[sets]
	idx = match(unlist(genesetlist), names(obj$genesets))
	obj$genesets = obj$genesets[idx]
	obj$geneset.names = obj$geneset.names[idx]
	obj$geneset.descriptions = obj$geneset.descriptions[idx]
	names(obj$genesets) = obj$geneset.names = unlist(lapply(1:length(genesetlist), function(i){
		paste(names(genesetlist)[i], genesetlist[[i]], sep = ':')
	}))
	if(return.data.frame == FALSE) return(obj)
	data.frame(genes = unlist(obj[[1]]), set = rep(obj[[2]], times = sapply(obj[[1]], length)), stringsAsFactors = FALSE)
}
#
msigdb.genesets_old_version = function(sets=NULL, type=c('symbols', 'entrez'), species=c('human','mouse'), return.data.frame=FALSE){
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
		f=file.path(system.file("extdata", package="msigdb"),gmtfiles[s])
		f1=paste0(f,'.RDS') #see convert.gmt2RDS for save gmt in RDS format
		if(file.exists(f1)){
			res=readRDS(f1)
		}else{
			res=read.gmt(f)
		}
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
	if(return.data.frame==FALSE) return(obj)
	go1=lapply(1:length(obj$genesets),function(i) data.frame(genes=obj$genesets[[i]],set=names(obj$genesets)[i],stringsAsFactors=FALSE))
	unique(do.call(rbind,go1))
}
#
