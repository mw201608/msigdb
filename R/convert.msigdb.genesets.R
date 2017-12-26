#convert msigdb human genesets to other species by ortholog mapping
convert.msigdb.genesets=function(source.species='human',target.species='mouse'){
	if(!file.exists(target.species)) dir.create(target.species)
	gmtfiles=list.files(source.species,'.symbols.gmt$')
	for(f in gmtfiles){
		cat('Read',paste(source.species,f,sep='/'),'...\n')
		obj=read.gmt(paste(source.species,f,sep='/'))
		allGenes=obj$genesets[[1]]
		for(i in 2:length(obj$genesets)){
			allGenes=union(allGenes,obj$genesets[[i]])
		}
		homology=unique(orthology::orthology(switch(target.species,mouse='MouseHuman',fly='FlyHuman',worm='WormHuman'), Source='human', query=allGenes)[,c('Query','Target')])
		genesets=lapply(obj$genesets,function(x){
			homology[homology$Query %in% x,'Target']
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
