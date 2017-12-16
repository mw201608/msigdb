# MSigDB Gene Set Collections

This R package contains the MSigDB gene set collections (version 5.0 downloaded on Jul 14, 2015). The official MSigDB website is http://www.broadinstitute.org/gsea/msigdb.

## Installation
devtools::install_github("mw201608/msigdb")

## Usage
See help documentation ?msigdb.genesets for how to loading the gene sets. For example, to load human gene ontology (GO) gene sets:
```
Result=msigdb.genesets(sets=c('C5.BP','C5.CC', 'C5.MF'), type='symbols', species='human')
```
To see all available gene sets, run
```
msigdb.collections
```
An example of performing functional enrichment analysis with the MSigDB gene sets can be found in a related package GOplot at
https://github.com/ericaenjoy3/GOplot
