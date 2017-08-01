\name{read.obo}
\docType{package}
\alias{read.obo}
\title{Read .obo File}
\description{
  This function reads in gene ontology annotations from a .obo file
}
\usage{read.obo(filename='http://purl.obolibrary.org/obo/go.obo')}
\arguments{
 \item{filename}{The name of a gene ontology data file in OBO format.}
}
\details{
 By default, the argument \code{filename} links to the obo file at geneontology.org.
}
\value{
A data.frame with three components:
 \item{GO.ID}{GO Term ID}
 \item{System}{Ontology System}
 \item{Term}{GO Term}
}
\seealso{\code{\link{read.gaf}}}
\examples{
##not run###
#x=read.obo()
}
