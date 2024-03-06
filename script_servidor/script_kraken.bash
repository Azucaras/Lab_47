DB=/data/db/kraken2/standard-2021
DIR=~/filt
OUT=~/profiling/kraken2 # redo with clean reads

mkdir -p "$OUT/"

for R1 in $DIR/Sample*_R1.fq.gz;
do
    sample=$(basename ${R1%_R1.fq.gz})
    R2=${R1%_R1.fq.gz}_R2.fq.gz
    echo "profiling sample" $sample
    echo "Read1:" $R1
    echo "Read2:" $R2
    kraken2 \
        --db $DB \
        --threads 20 \
        --confidence 0.5 \
        --minimum-base-quality 22 \
        --report $OUT/${sample}.report  > $OUT/${sample}.txt \
        --paired $R1 $R2
done
