# #convert msigdb human genesets to other species by ortholog mapping
# convert.msigdb.genesets=function(source.species='human',target.species='mouse'){
# 	if(!file.exists(target.species)) dir.create(target.species)
# 	gmtfiles=list.files(source.species,'.symbols.gmt$')
# 	for(f in gmtfiles){
# 		cat('Read',paste(source.species,f,sep='/'),'...\n')
# 		obj=read.gmt(paste(source.species,f,sep='/'))
# 		allGenes=obj$genesets[[1]]
# 		for(i in 2:length(obj$genesets)){
# 			allGenes=union(allGenes,obj$genesets[[i]])
# 		}
# 		homology=unique(orthology::orthology(switch(target.species,mouse='MouseHuman',fly='FlyHuman',worm='WormHuman'), Source='human', query=allGenes)[,c('Query','Target')])
# 		genesets=lapply(obj$genesets,function(x){
# 			homology[homology$Query %in% x,'Target']
# 		})
# 		ni = sapply(genesets, length) > 0
# 		obj$geneset.descriptions=obj$geneset.descriptions[ni]
# 		obj$geneset.names=obj$geneset.names[ni]
# 		obj$genesets=genesets[ni]
# 		write.gmt(obj,paste(target.species,f,sep='/'))
# 		cat('File',f,'processed\n')
# 	}
# }
#To convert msigdb gmt format into RDS, list all necessary gmt files and combine by combine.gmt.files. To create mouse orthology version, run convert.human.to.mouse.
get.gmt.geneset.names = function(files){
	x = lapply(files, function(x) read.gmt(x)$geneset.names)
	names(x) = files
	x
}
combine.gmt.files = function(files){
	obj = list()
	for(f in files){
		gmt = read.gmt(f)
		if(length(obj) == 0){
			obj = gmt
			next
		}
		obj[[1]] = c(obj[[1]], gmt[[1]])
		obj[[2]] = c(obj[[2]], gmt[[2]])
		obj[[3]] = c(obj[[3]], gmt[[3]])
	}
	obj
}
# convert.human.to.mouse <- function(x){
# 	#x is an object returned from read.gmt or combine.gmt.files
# 	data(geneinfo_human, package = 'nichenetr')
# 	hg <- unique(unlist(x$genesets))
# 	mg <- nichenetr:::convert_human_to_mouse_symbols(hg)
# 	x$genesets <- lapply(x$genesets, function(x){
# 		x = as.vector(mg[match(x, hg)])
# 		x[!is.na(x)]
# 	})
# 	x
# }
