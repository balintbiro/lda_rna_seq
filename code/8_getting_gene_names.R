library(biomaRt)

ensembl <- useEnsembl(biomart='genes',
                      dataset='btaurus_gene_ensembl',
                      mirror='useast')
data <- getBM(attributes=c('external_gene_name'),
              filters=c('ensembl_gene_id'),
              values=)