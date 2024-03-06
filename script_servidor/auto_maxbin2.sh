#!/bin/bash

# Diretório de trabalho
Current_Diretory=$PWD
echo "WORK_DIR : $Current_Diretory"

diretory="Current_Diretory"

# Change to the directory containing the sequence files
cd "$directory"

#Output Maxbin
OUTPUT_DIR="~/Primeagro/07-MaxBin"

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
    run_MaxBin.pl -contig $FULL_READS_FILE -reads $FULL_READS_FILE -out $OUTPUT_FILE -thread $NUM_THREADS  -min_contig_length 200
done 

#modelo individual setando para 200 pb fragmento
#run_MaxBin.pl -contig ~/Primeagro/04-MetaSPAdes/00-metagenomes/677_scaffolds.fasta -reads ~/Primeagro/00-Dados_brutos1/677_S44_L001_R1_001.fastq.gz  -reads2 ~/Primeagro/00-Dados_brutos1/677_S44_L001_R2_001.fastq.gz  -out 677_maxbin -verbose -thread 8  -min_contig_length 200
