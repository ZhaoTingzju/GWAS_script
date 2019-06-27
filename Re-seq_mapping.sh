#!/bin/bash
destdir=./bam
for fname in *_1.clean.fq.gz
do
base=${fname%_1.clean.fq.gz}
sm=${fname%%_*}
bwa mem -t 18 -M -R "@RG\tID:${sm}\tSM:${sm}\tPL:illumina\tLB:${sm}" ~/genome/updata_cotton/TM-1_V2.1.fa "$fname" "${base}_2.clean.fq.gz" | gzip -3 > "$destdir/${base}.sam.gz"
~/biosoftware/samtools-1.6/samtools fixmate -O bam $destdir/${base}.sam.gz $destdir/${base}_fixmate.bam
rm $destdir/${base}.sam.gz
~/biosoftware/samtools-1.6/samtools sort -@ 8 -O bam -o $destdir/${sm}_sorted.bam -T $destdir/${sm}_temp  $destdir/${base}_fixmate.bam
rm $destdir/${base}_fixmate.bam

java -jar /public/home/zhaoting/biosoftware/picard-tools-1.124/picard.jar MarkDuplicates VALIDATION_STRINGENCY=LENIENT MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=1000 INPUT="$destdir/${sm}_sorted.bam" OUTPUT="$destdir/${sm}_dedup.bam" METRICS_FILE="$destdir/${sm}_metrics.txt"
~/biosoftware/samtools-1.6/samtools index $destdir/${sm}_dedup.bam

rm $destdir/${sm}_sorted.bam
done
