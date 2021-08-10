# MSigDB Gene Set Collections

This R package contains the MSigDB gene set collections (version 7.4 downloaded on August 9, 2021). To avoid a conflict with `Bioconductor/msigdb`, this package has been renamed to `msigdbi`. The official MSigDB website is https://www.gsea-msigdb.org/gsea/index.jsp.

## Installation
```
devtools::install_github("mw201608/msigdbi")
```
To install a previous release of MSigDB v6.1:
```
devtools::install_github("mw201608/msigdb@cc6785981f12de23650911d64a646c807bbe04be")
```
## Usage
See help documentation ?msigdb.genesets for how to loading the gene sets. For example, to load human gene ontology (GO) gene sets:
```
Result = msigdb.genesets(sets = c('c5.go.bp','c5.go.cc', 'c5.go.mf'), type = 'symbols', species = 'human')
```
To see all available gene sets, see variable
```
msigdb.collections
```
Examples of performing functional enrichment analysis with the MSigDB gene sets can be found in two packages:

##### 1. GOtest, available at https://github.com/mw201608/GOtest

##### 2. GOplot, available at https://github.com/ericaenjoy3/GOplot (to be updated to work with renamed msigdbi)
