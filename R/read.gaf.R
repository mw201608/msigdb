#Author: Minghui Wang
read.gaf=function(filename='http://geneontology.org/gene-associations/gene_association.mgi.gz'){
#ftp://ftp.informatics.jax.org/pub/reports/gene_association.mgi
	down=FALSE
	if(grepl('^ftp:\\/\\/',filename) || grepl('^http:\\/\\/',filename)){
		temp <- tempfile()
        code=download.file(filename,temp)
		if(code != 0) stop(paste('Fail to download',filename))
		inf=temp
		down=TRUE
	}else{
		if(! file.exists(filename)) stop('File ',filename,' not available\n')
		inf=filename
	}
	if(grepl('\\.gz$',filename)){
		conn=gzfile(inf,'r')
	}else{
		conn=file(inf,'r')
	}
	dat=read.table(conn,sep='\t',as.is=TRUE,header=FALSE,quote="",comment.char='!')[,c(2,3,5)]
	close(conn)
	if(down) unlink(temp)
	colnames(dat)=c('ID','Symbol','GO.ID')
	unique(dat)
}
