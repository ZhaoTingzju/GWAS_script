#!/usr/bin/perl -w
use Getopt::Long;
my ($sample,$ref,$gtf,$thread);
GetOptions
(
        "sample:s" => \$sample,
	"ref:s" => \$ref,
	"gtf:s" => \$gtf,
        "thread:i" => \$thread,
        "bam:i" => \$bam,
);
sub usage
{
        die qq/
Usage: perl $0 [options]
Cleandata -> vcf and bam

Options:
        -sample        <s> : list of reads, fastq|fastq.gz|bam
        -ref            <s> : reference genome for mapping used hista2 index file, fasta [pwd]
        -gtf            <s> : gene transcription file [pwd]
        -thread         <i> : numters of thread to use [4]
        -bam          <i>: 0 , bam keeped; 1 ,bam 
\n/;
}
$thread ||=4;
$bam ||=0;
my $samtools ="/public/home/zhaoting/biosoftware/samtools-1.6/samtools";
my $picard= "java -jar /public/home/zhaoting/biosoftware/picard-tools-1.124/picard.jar";
my $gatk = "/public/home/zhaoting/biosoftware/gatk-4.1.0.0/gatk";
my $star= "/public/home/zhaoting/biosoftware/STAR-master/bin/Linux_x86_64_static/STAR";


if (!defined $sample ||  !defined $ref || !defined $gtf )
{    &usage();       }

open SAMPLE,"$sample" or die "$!";
open SHELL,">Script.sh";

while ($sample_name = <SAMPLE>) {
chomp $sample_name;

print SHELL "echo \"mapping\"\n";

print SHELL "$star --runThreadN $thread --genomeDir $ref --readFilesIn ${sample_name}.R1.clean.fastq.gz ${sample_name}.R2.clean.fastq.gz --readFilesCommand zcat --outFileNamePrefix ${sample_name}\n";
print SHELL "echo \"sam2bam\"\n";
print SHELL "$samtools sort -@ $thread -o ${sample_name}.bam ${sample_name}Aligned.out.sam && rm ${sample_name}Aligned.out.sam\n";
print SHELL "echo \"Sort and add header\"\n";
print SHELL "$picard AddOrReplaceReadGroups I=${sample_name}.bam O=${sample_name}sort_add_head.bam SO=coordinate RGID=${sample_name} RGLB=rna RGPL=illumina RGPU=hiseq RGSM=${sample_name}\n";
print SHELL "echo \"rm Depulications\"\n";

if ($bam =~/1/) {print SHELL "rm ${sample_name}.bam \n";}
print SHELL "echo \"Call snp\"\n";
print SHELL "$picard MarkDuplicates I=${sample_name}sort_add_head.bam O=${sample_name}sort_add_head_dedup.bam CREATE_INDEX=true VALIDATION_STRINGENCY=SILENT M=dedup.metrics\n";
print SHELL "rm ${sample_name}sort_add_head.bam\n";
print SHELL "echo \"Call snp\"\n";
print SHELL "$gatk SplitNCigarReads -I ${sample_name}sort_add_head_dedup.bam -R $ref -O ${sample_name}sort_add_head_dedup_split.bam\n";
print SHELL "rm ${sample_name}sort_add_head_dedup.bam";
print SHELL "$gatk HaplotypeCaller -I ${sample_name}sort_add_head_dedup_split.bam -R $ref -O ${sample_name}.vcf\n";
print SHELL "rm ${sample_name}sort_add_head_dedup_split.bam\n";


}















