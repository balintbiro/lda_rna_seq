#get the genome file and gunzip it
wget --directory-prefix=../data/ http://ftp.ensembl.org/pub/release-105/fasta/bos_taurus/dna/Bos_taurus.ARS-UCD1.2.dna.toplevel.fa.gz
gunzip -d ../data/Bos_taurus.ARS-UCD1.2.dna.toplevel.fa.gz ../data/Bos_taurus.ARS-UCD1.2.dna.toplevel.fa

#get index file
wget --directory-prefix=../data/ http://ftp.ensembl.org/pub/release-105/gtf/bos_taurus/Bos_taurus.ARS-UCD1.2.105.gtf.gz