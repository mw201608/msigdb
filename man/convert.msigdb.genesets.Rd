\name{convert.msigdb.genesets}
\docType{package}
\alias{convert.msigdb.genesets}
\title{Read .obo File}
\description{
  Converts human gene collections in gmt format to other species by ortholog mapping
}
\usage{convert.msigdb.genesets(source.species='human', target.species='mouse')}
\arguments{
 \item{source.species}{Species of the gene annotaitons in the source gmt files.}
 \item{target.species}{Species of the gene annotaitons to be converted to in the target gmt files.}
}
\details{
 Package \code{orthology} will be used to convert homology gene symbols. The source gmt files must be in folder named by \code{source.species}. After processing, the new gmt files will be stored in folder named by \code{target.species}
}
\value{
No returned value.
}
\seealso{\code{\link{read.gmt}}, \code{\link{write.gmt}}}
\examples{
##not run###
#x=convert.msigdb.genesets()
}
