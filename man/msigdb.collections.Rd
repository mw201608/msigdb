\name{msigdb.collections}
\alias{msigdb.collections}
\title{Msigdb Collections}
\description{
  Character vector of available gene set collections
}
\details{
The Molecular Signatures Database (MSigDB) gene sets are divided into 8 major collections (C1-7 and CH), and several sub-collections:

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

\code{C7.IMMUNE}: immunologic signatures;

\code{CH.HALLMARK}: hallmark gene sets, specific well-defined biological states or processes.

}
\seealso{\code{\link{msigdb.version}}, \code{\link{msigdb.genesets}}}
\examples{
msigdb.collections
}
