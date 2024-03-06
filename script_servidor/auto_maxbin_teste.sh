#!/bin/bash

#directory
diretorio_atual=$PWD
echo "Diretório atual: $diretorio_atual"

# Set the directory path where your paired-end sequence files are located
directory="diretorio_atual"

# Change to the directory containing the sequence files
cd "$directory"

#run MaxBin2
for metagenome_file in "diretorio_atual"/*
do
   # Verifica se o arquivo é um arquivo regular
    if [ -f "$metagenome_file" ]
    then
        # Extract the file name
        metagenome_name=$(basename "$metagenome_file")

        # Run MaxBin2
 	run_MaxBin.pl -contig "$metagenome_file" -reads -o "$metagenome_name"_results -t 8



 -contig ~/Peixes_metagenomica/04-MetaSPAdes/390/scaffolds.fasta -reads ~/Peixes_metagenomica/00-Dados_brutos/376_S16_L001_R1_001.fastq  -reads2 ~/Peixes_metagenomica/00-Dad$


