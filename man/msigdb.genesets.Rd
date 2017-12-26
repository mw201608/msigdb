\name{msigdb.genesets}
\docType{package}
\alias{msigdb.genesets}
\title{MSigDB Gene Sets}
\description{
  This function returns pre-compiled MSigDB gene set collections
}
\usage{msigdb.genesets(sets=NULL, type=c('symbols', 'entrez'), species=c('human','mouse'))}
\arguments{
 \item{sets}{A vector of possible gene set collections. See \code{details}.}
 \item{type}{Type of gene name. Must be one of '\code{symbols}' and '\code{entrez}'.}
 \item{species}{Specifying the species of gene set. Mouse gene sets were converted from human gene sets by orthology mapping.}
}
\details{
To view the collections of available MSigDB gene sets, see exported variable \code{\link{msigdb.collections}}. If \code{sets} is \code{NULL}, all the collections will be returned.
}
\value{
A list with three components:
 \item{genesets}{List of gene names in each gene set.}
 \item{geneset.names}{Vector of gene set identities. The gene set identities will be in a format of \code{xxx:yyy}, where \code{xxx} is collection and \code{yyy} is gene set name.}
 \item{geneset.descriptions}{Vector of gene set descriptions.}
}
\seealso{\code{\link{read.gmt}}, \code{\link{msigdb.version}}, \code{\link{msigdb.collections}}}
\examples{
#To load human gene ontology gene sets
\dontrun{
Result=msigdb.genesets(c('C5.BP','C5.CC','C5.MF'))
}
}
