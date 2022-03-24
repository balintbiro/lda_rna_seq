#load required libraries
library(DESeq2)
library(gplots)

gene_counts <- read.csv('../results/gene_names_counts.csv',
                          sep=',')
gene_counts <- gene_counts[,-1]

metadata <- as.data.frame(cbind(idx=colnames(gene_counts)[c(-1)],
                  dex=c('c','t','c','t','c','c','t','c','t','c','t')))

dds <- DESeqDataSetFromMatrix(countData=gene_counts, 
                              colData=metadata, 
                              design=~dex, tidy=TRUE)


d.dds <- DESeq(dds)

with(res, plot(log2FoldChange, -log10(pvalue), pch=20, main="Volcano plot", xlim=c(-7,7), ylim=c(0,6)))

vsdata <- varianceStabilizingTransformation(d.dds)
plotPCA(vsdata,intgroup=c('dex'))

vstable <- as.data.frame(assay(vsdata))
vstable_rowsum <- transform(vstable,sum=rowSums(vstable))
selected <- order(vstable_rowsum$sum, decreasing = TRUE)[1:100]
heatmap.2(as.matrix(vstable[selected,]), row=FALSE, dendrogram = 'column', col=redgreen(75),
          key=TRUE, keysize=1.5,
          density.info = 'none',trace='none',cexCol = 0.9,labRow = NA)
