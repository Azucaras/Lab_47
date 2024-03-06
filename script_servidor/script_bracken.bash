DB=/data/db/kraken2/standard-2021
DIR=~/profiling/kraken2
OUT=~/profiling/bracken

mkdir -p $OUT

for K2 in $DIR/Sample*.report;
do
    sample=$(basename ${K2%.report})
    echo "Re-estimating abundances with bracken for" $K2
    bracken \
        -d $DB \
        -i $K2 \
        -o ${OUT}/${sample}.bracken \
        -w ${OUT}/${sample}_bracken_species.report \
        -r 150 \
        -l S
done
