#import rewuired modules
import os
import pandas as pd
from subprocess import call

#define function for counting genes
def gene_counts(sam_filename):
	count_filename=f"{sam_filename.split('.')[0]}.txt"
	call(f'htseq-count ../data/alignments/{sam_filename} ../data/Bos_taurus.ARS-UCD1.2.105.gtf > ../data/gene_counts/{count_filename}',
		shell=True)

#make the function work
pd.Series(os.listdir('../data/alignments/')).apply(gene_counts)