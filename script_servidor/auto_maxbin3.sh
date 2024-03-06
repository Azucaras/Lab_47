#!/bin/bash

# Diretório de trabalho
Current_Diretory=$PWD
echo "WORK_DIR : $Current_Diretory"

diretory="Current_Diretory"

#Output Maxbin
OUTPUT_DIR="~/Primeagro/07-MaxBin"

#Contigs directory
Contigs_dir="/home/sheila.silva.bio/Primeagro//home/sheila.silva.bio/Primeagro/05-MetaSPAdes/00-scaffolds" 


# verify metagenomes
for metagenome_file in "Current_Diretory"/*
do
   # Verifica se o arquivo é um arquivo regular
    if [ -f "$metagenome_file" ]
    then
        # Extract the file name
        metagenome_name=$(basename "$metagenome_file")

# RAW READS directory
RAW_READS_DIR="/home/sheila.silva.bio/Primeagro/00-Dados_brutos1"

# Lista de arquivos de reads brutas
READS_LIST=$(ls $RAW_READS_DIR/*.fastq)

# Número de threads para uso pelo MaxBin
NUM_THREADS=8

# Execução do MaxBin para cada arquivo de reads brutas
for READS_FILE in $READS_LIST; do
    # Obter o nome do arquivo de reads brutas sem a extensão
    BASENAME=$(basename "$READS_FILE" .fastq)

    # Caminho completo para o arquivo de reads brutas
    FULL_READS_FILE="$RAW_READS_DIR/$BASENAME.fastq"

    # Caminho completo para o arquivo de saída do MaxBin
    OUTPUT_FILE="$OUTPUT_DIR/$BASENAME.maxbin"

    # Comando MaxBin
    run_MaxBin.pl -contig $FULL_metagenome_file -reads $FULL_READS_FILE -out $OUTPUT_FILE -thread $NUM_THREADS  -min_contig_length 200
done
