#Author: Minghui Wang
read.obo=function(filename='http://purl.obolibrary.org/obo/go.obo'){
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
	nEmpty=0
	dat=NULL
	n=0
	cat('Processing obo file...\n')
	while(TRUE){
		s=scan(conn,what=character(),nlines=1,quiet=TRUE,quote="")
		n=n+1
		if(length(s)==0){
			nEmpty=nEmpty+1
			if(nEmpty>10) break
			next
		}
		nEmpty=0
		if(s[1]=='[Term]'){
			s1=scan(conn,what=character(),nlines=1,quiet=TRUE,quote="")
			if(length(s1)==0) stop('Invalid input (not obo format)\n')
			s2=scan(conn,what=character(),nlines=1,quiet=TRUE,quote="")
			if(length(s2)==0) stop('Invalid input (not obo format)\n')
			s3=scan(conn,what=character(),nlines=1,quiet=TRUE,quote="")
			if(length(s3)==0) stop('Invalid input (not obo format)\n')
			id=s1[2]
			term=paste(s2[-1],collapse=' ')
			Sys=ifelse(s3[2]=='biological_process','BP',ifelse(s3[2]=='molecular_function','MF',ifelse(s3[2]=='cellular_component','CC',s3[2])))
			dat=cbind(dat,c(id,Sys,term))
			n=n+3
		}
	}
	close(conn)
	if(down) unlink(temp)
	dat=t(dat)
	colnames(dat)=c('GO.ID','System','Term')
	unique(dat)
}
