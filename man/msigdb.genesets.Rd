\name{msigdb.genesets}
\docType{package}
\alias{msigdb.genesets}
\title{MSigDB Gene Sets}
\description{
  This function returns MSigDB gene set collections
}
\usage{msigdb.genesets(sets=NULL, type=c('symbols', 'entrez'), species=c('human','mouse'))}
\arguments{
 \item{sets}{A vector of possible set collections. See \code{details}.}
 \item{type}{Type of gene name. Must be one of '\code{symbols}' and '\code{entrez}'.}
 \item{species}{Specifying the species of gene set.}
}
\details{
The Molecular Signatures Database (MSigDB) are divided into 7 major collections, and several sub-collections. The values of argument \code{sets} and the corresponding descriptions are listed below.

\code{C1.CYTO}: positional gene sets;

\code{C2.CGP}: chemical and genetic perturbations;

\code{C2.CP}: Canonical pathways (including BioCarta, KEGG and Reactome gene sets);

\code{C3.MIR}: microRNA targets;

\code{C3.TFT}: transcription factor targets;

\code{C4.CGN}: cancer gene neighborhoods;

\code{C4.CM}: cancer modules;

\code{C5.BP}: GO biological process;

\code{C5.CC}: GO cellular component;

\code{C5.MF}: GO molecular function;

\code{C6.ONCOGENE}: oncogenic signatures;

\code{C7.IMMUNE}: immunologic signatures.

If \code{sets} is \code{NULL}, all the collections will be returned.
}
\value{
A list with three components:
 \item{genesets}{List of gene names in each gene set.}
 \item{geneset.names}{Vector of gene set identities. The gene set identities will be in a format of \code{xxx:yyy}, where \code{xxx} is collection and \code{yyy} is gene set name.}
 \item{geneset.description}{Vector of gene set descriptions.}
}
\seealso{\code{\link{read.gmt}}, \code{\link{msigdb.version}}}
\examples{
##not run###
#x=msigdb.genesets(c('C5.BP','C5.CC','C5.MF'))
}
