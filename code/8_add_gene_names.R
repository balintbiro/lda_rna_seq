#load biomart library
library(biomaRt)

#set working directory
setwd('/Users/birobalint/Documents/Projects/lda_rna_seq/code/')

#read data
gene_counts <- read.csv('../results/gene_counts.csv',
                        header=TRUE,
                        row.names=NULL)

#create Ensembl query
ensembl <- useEnsembl(biomart='genes',
                      dataset='btaurus_gene_ensembl',
                      mirror='useast')

#get data
gene_names <- getBM(attributes=c('external_gene_name','ensembl_gene_id'),
              filters=c('ensembl_gene_id'),
              values=gene_counts$gene_id,
              mart=ensembl)

#add external_gene_name to gene_counts as a column
gene_counts$gene_name <- gene_names$external_gene_name

#reorder columns-so gene names will be in the first position
gene_counts <- gene_counts[ , c("gene_name",
                       names(gene_counts)[names(gene_counts) != "gene_name"])]

#write output
write.csv(x=gene_counts,
          file='../results/gene_names_counts.csv',
          row.names=FALSE)
