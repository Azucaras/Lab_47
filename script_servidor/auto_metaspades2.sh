#!/bin/bash

#
diretorio_atual=$PWD
echo "Diretório atual: $diretorio_atual"

# Set the directory path where your paired-end sequence files are located
directory="diretorio_atual"

# Change to the directory containing the sequence files
cd "$directory"

# Run Metaspades for each pair of files in the directory
for file1 in *_R1_seqtk.fastq; do
    # Get the corresponding reverse file
    file2="${file1/_R1/_R2}"
    
    # Specify the output directory for each run (change as needed)
    output_dir="${file1/_R1_seqtk.fastq/}"
    
    # Run Metaspades with the pair of files
    metaspades.py -1 "$file1" -2 "$file2" -o "$output_dir" -t 8
done

