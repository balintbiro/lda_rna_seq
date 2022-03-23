#create directory for alignments
mkdir ../data/alignments/

#align the reads to the reference genome - readable form
for file in ../data/fastas/*
do
	filename_without_path=$(basename -- "$file")
	alignment_filename="${filename_without_path%%.*}"
	hisat2
	-x ../data/idx/Bos_taurus.ARS-UCD1.2.dna.toplevel.hisat #index files
	-U "$file" #input file (.fastq)
	-S "../data/alignments/$alignment_filename.sam" #alignment output file (.sam)
done

#using nohup
nohup sh -c 'for file in ../data/fastas/*;do filename_without_path=$(basename -- "$file"); alignment_filename="${filename_without_path%%.*}"; hisat2 -x ../data/idx/Bos_taurus.ARS-UCD1.2.dna.toplevel.hisat -U "$file" -S "../data/alignments/$alignment_filename.sam"; done'