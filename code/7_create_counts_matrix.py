#importing the required modules
import os
import pandas as pd

#define function for reading pandas series
def count_reader(filename):
	sample_id=f"{filename.split('.')[0]}_counts"
	gene_counts=pd.read_csv(f'../data/gene_counts_old/{filename}',
		sep='\t',
		index_col=0,
		header=None,
		names=['gene_id',sample_id])
	return gene_counts

#make the function work
gene_counts=pd.Series(os.listdir('../data/gene_counts/')).apply(count_reader)
gene_counts.index=pd.Series(os.listdir('../data/gene_counts/')).apply(lambda filename: filename.split('.')[0])

#merge the series into a dataframe
gene_counts_df=pd.concat(gene_counts.to_list(),axis=1)

#get info part and write into file
info_df=gene_counts_df.loc[gene_counts_df.index.str.startswith('_')]
info_df.to_csv('../results/gene_counts_info.csv', header=True, index=True)

#get genes part and write into file
genes_df=gene_counts_df.loc[~gene_counts_df.index.str.startswith('_')]
genes_df.to_csv('../results/gene_counts.csv', header=True, index=True)