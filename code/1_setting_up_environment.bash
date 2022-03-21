#create and activate the environment
conda create --name rna_seq_env
conda activate rna_seq_env

#make the required directories
mkdir code
mkdir data
mkdir results

#install the programs
conda install -c bioconda fastqc
conda install -c bioconda hisat2
conda install -c bioconda htseq
conda install -c anaconda pandas