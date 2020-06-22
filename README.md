# MSigDB Gene Set Collections

This R package contains the MSigDB gene set collections (version 7.1 downloaded on June 22, 2020). The official MSigDB website is https://www.gsea-msigdb.org/gsea/index.jsp.

## Installation
```
devtools::install_github("mw201608/msigdb")
```
To install a previous release of MSigDB v6.1:
```
devtools::install_github("mw201608/msigdb@cc6785981f12de23650911d64a646c807bbe04be")
```
## Usage
See help documentation ?msigdb.genesets for how to loading the gene sets. For example, to load human gene ontology (GO) gene sets:
```
Result=msigdb.genesets(sets=c('C5.BP','C5.CC', 'C5.MF'), type='symbols', species='human')
```
To see all available gene sets, see variable
```
msigdb.collections
```
Examples of performing functional enrichment analysis with the MSigDB gene sets can be found in two packages:

##### 1. GOtest, available at https://github.com/mw201608/GOtest

##### 2. GOplot, available at https://github.com/ericaenjoy3/GOplot
