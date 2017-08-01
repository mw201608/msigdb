#Author: Minghui Wang
read.gmt=function(filename){
	if(! file.exists(filename)) stop('File ',filename,' not available\n')
	dat=readLines(filename)
	n=length(dat)
	res=list(genesets=vector(mode = "list", length = n),geneset.names=vector(mode = "character", length = n),geneset.descriptions=vector(mode = "character", length = n))
	for(i in 1:n){
		s=strsplit(dat[i],'\t')[[1]]
		res$genesets[[i]]=s[-c(1:2)]
		res$geneset.names[i]=s[1]
		res$geneset.descriptions[i]=s[2]
	}
	names(res$genesets)=res$geneset.names
	res
}
#
write.gmt=function(obj,filename){
	conn=file(filename,'w')
	for(i in 1:length(obj$genesets)){
		cat(obj$geneset.names[i],obj$geneset.descriptions[i],obj$genesets[[i]],file=conn,sep='\t')
		cat('\n',file=conn)
	}
	close(conn)
	return(invisible())
}
