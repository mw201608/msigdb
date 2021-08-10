\name{msigdb.collections}
\alias{msigdb.collections}
\title{Msigdb Collections}
\description{
  Character vector of available gene set collections
}
\details{
The Molecular Signatures Database (MSigDB) gene sets are divided into 9 major collections (C1-8 and H), and several sub-collections:
\code{c1.all}: positional gene sets;

\code{c2.cgp}: chemical and genetic perturbations;

\code{c2.cp}: Canonical pathways (including BioCarta, KEGG and Reactome gene sets);

\code{c3.mir}: microRNA targets;

\code{c3.tft}: transcription factor targets;

\code{c4.cgn}: cancer gene neighborhoods;

\code{c4.cm}: cancer modules;

\code{c5.go.bp}: GO biological process;

\code{c5.go.cc}: GO cellular component;

\code{c5.go.mf}: GO molecular function;

\code{c5.hpo}: human phenotype ontology;

\code{c6.all}: oncogenic signatures;

\code{c7.immunesigdb}: immunologic signatures;

\code{c7.vax}: vaccine reponse gene sets

\code{c8.all}: cell type signature gene sets

\code{h.all}: hallmark gene sets, specific well-defined biological states or processes.
}
\seealso{\code{\link{msigdb.version}}, \code{\link{msigdb.genesets}}}
\examples{
msigdb.collections
}
