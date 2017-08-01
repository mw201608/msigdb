#convert msigdb human genesets to other species by ortholog mapping
convert.msigdb.genesets=function(source.species='human',target.species='mouse'){
	if(!file.exists(target.species)) dir.create(target.species)
	gmtfiles=list.files(source.species,'.symbols.gmt')
	for(f in gmtfiles){
		obj=read.gmt(paste(source.species,f,sep='/'))
		allGenes=obj$genesets[[1]]
		for(i in 2:length(obj$genesets)){
			allGenes=union(allGenes,obj$genesets[[i]])
		}
		homology=unique(orthology::orthology('MouseHuman', 'human', target.species, query=allGenes)[,c('Query','Target')])
		genesets=lapply(obj$genesets,function(x){
			homology[homology$Query == x,'Target']
		})
		obj$genesets=genesets
		write.gmt(obj,paste(target.species,f,sep='/'))
		cat('File',f,'processed\n')
	}
}
convert.gmt2RDS=function(files){
	for(f in files){
		gmt=read.gmt(f)
		saveRDS(gmt,file=sub('\\.gmt$','.gmt.RDS',f))
	}
}
