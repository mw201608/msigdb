\name{read.gmt}
\docType{package}
\alias{read.gmt}
\alias{write.gmt}
\title{Read and write .gmt file}
\description{
  Read/write gene set collections from/to a .gmt file
}
\usage{
read.gmt(filename)
write.gmt(obj, filename)
}
\arguments{
 \item{filename}{The name of a .gmt file. As input, it should be a tab-separated text file, with one row per gene set. Column 1 has gene set names (identifiers), column 2 has gene set descriptions, remaining columns are gene ids for genes in that gene set.}
 \item{obj}{a list. See \code{Value} explained below.}
}
\value{
Function \code{read.gmt} returns a list with three components:
 \item{genesets}{List of gene names (identifiers) in each gene set}
 \item{geneset.names}{Vector of gene set names (identifiers)}
 \item{geneset.descriptions}{Vector of gene set descriptions}
}
\seealso{\code{\link{msigdb.genesets}}, \code{\link{msigdb.version}}}
\examples{
\dontrun{
x = read.gmt('c2.cp.v7.4.symbols.gmt')
}
}
