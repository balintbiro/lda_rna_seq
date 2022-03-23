#create directory for gene count files
mkdir ../data/gene_counts/

#count the genes - readable form
for file in ../data/alignments/*
do
	filename_without_path=$(basename -- $"file")
	gene_count_filename="${filename_without_path%.*}"
	htseq-count file ../data/Bos_taurus.ARS-UCD1.2.105.gtf > ../data/gene_counts/$gene_count_filename.txt
done

#using nohup
nohup sh -c 'for file in ../data/alignments/*;do filename_without_path=$(basename -- $"file"); gene_count_filename="${filename_without_path%.*}"; htseq-count file ../data/Bos_taurus.ARS-UCD1.2.105.gtf > "../data/gene_counts/$gene_count_filename.txt"; done'