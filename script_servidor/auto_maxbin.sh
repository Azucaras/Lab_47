#!/bin/bash

#directory
diretorio_atual=$PWD
echo "Diretório atual: $diretorio_atual"

# Set the directory path where your paired-end sequence files are located
directory="diretorio_atual"

# Change to the directory containing the sequence files
cd "$directory"

# Set the path to the directory containing the metagenome files
metagenome_Raw_reads="/Primeagro/00-Dados_brutos1"


# verify metagenomes
for metagenome_file in "diretorio_atual"/*
do
   # Verifica se o arquivo é um arquivo regular
    if [ -f "$metagenome_file" ]
    then
        # Extract the file name
        metagenome_name=$(basename "$metagenome_file")

reads = metagenome_Raw_reads

for file1 in *_R1_pair_001.fastq; do
    # Get the corresponding reverse file
    file2="${file1/_R1/_R2}"

        # Run MaxBin2
 	run_MaxBin.pl -contig "$metagenome_file" -reads 
-o "$metagenome_name"_results -t 8



 -contig ~/Peixes_metagenomica/04-MetaSPAdes/390/scaffolds.fasta -reads ~/Peixes_metagenomica/00-Dados_brutos/376_S16_L001_R1_001.fastq  -reads2 ~/Peixes_metagenomica/00-Dad$


#!/bin/bash

# Set the path to the directory containing the metagenome files
metagenome_dir="/path/to/metagenomes"

# Set the path to the MaxBin tool
maxbin_path="/path/to/maxbin"

# Iterate through each file in the metagenome directory
for metagenome_file in "${metagenome_dir}"/*; do
    # Check if the file is a regular file
    if [[ -f "${metagenome_file}" ]]; then
        echo "Processing ${metagenome_file}..."

        # Run the MaxBin tool on the current metagenome file
        "${maxbin_path}" -i "${metagenome_file}" -o "${metagenome_file}_maxbin_output"
        
        echo "Done processing ${metagenome_file}."
    fi
done

