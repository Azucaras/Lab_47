#!/bin/bash


#
diretorio_atual=$PWD
echo "Diretório atual: $diretorio_atual"

# Set the directory path where your paired-end sequence files are located
directory="diretorio_atual"

# Change to the directory containing the sequence files
cd "$directory"

#activating environment
conda activate python2.7

# Loop através de todos os arquivos no diretório
for metagenoma_file in "$diretorio_atual"/*
do
    # Verifica se o arquivo é um arquivo regular
    if [ -f "$metagenoma_file" ]
    then
        # Extrai o nome do arquivo (sem o caminho)
        metagenoma_name=$(basename "$metagenoma_file")
        
        # Executa o MetaQuast para o metagenoma atual
        metaquast.py "$metagenoma_file" -o "$metagenoma_name"_results -t 8
    fi
done
