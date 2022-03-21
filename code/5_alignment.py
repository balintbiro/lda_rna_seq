#import the required modules
import os
import pandas as pd
from subprocess import call

#create directory for alignments
if os.path.exists('../data/alignments/')==False:
	os.mkdir('../data/alignments/')

#define function for alignment
def alignment(filename):
	file_id=filename.split('.')[0]
	alignment_filename=f'{file_id}.sam'
	call(f'hisat2 -x ../data/idx/Bos_taurus.ARS-UCD1.2.dna.toplevel.hisat -U ../data/fastas/{filename} -S ../data/alignments/{alignment_filename}',
		shell=True)

#make the function work
pd.Series(os.listdir('../data/fastas/')).apply(alignment)