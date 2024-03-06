import os
import pandas
import subprocess

try:
    subprocess.run('mkdir', '01-fastqc', '02-trimmomatic', '03-fastqc_trimados', '04-seqtk', '05-metaspades', '06-metaspades', '07-bowtie-samtools', '08-maxbin', '09-prokka', '10-eggNOG', '11-prodigal')
    subprocess.run('fastqc')

except subprocess.CalledProcessError as e:
    print(f'Error: {e}')
