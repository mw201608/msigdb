\name{read.gaf}
\docType{package}
\alias{read.gaf}
\title{Read GAF}
\description{
  This function reads in gene ontology annotations from a GAF file
}
\usage{read.gaf(filename='http://geneontology.org/gene-associations/gene_association.mgi.gz')}
\arguments{
 \item{filename}{The name of input file. Should be a (tab-separated text) gene ontology file of GAF format, with one row per GO item per gene.}
}
\details{
 By default, the argument \code{filename} links to the mouse gene ontology data file at geneontology.org. More annotation files can be found from http://geneontology.org/page/download-annotations.
}
\value{
A data.frame with three components:
 \item{ID}{Accession ID}
 \item{Symbol}{Gene Symbol}
 \item{GO.ID}{GO Term ID}
}
\seealso{\code{\link{read.obo}}}
\examples{
##not run###
#x=read.gaf()
}
