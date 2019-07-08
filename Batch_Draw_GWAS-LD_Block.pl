use Getopt::Long;
my ($gwas_result,$sig_SNP,$flank_region,$hmp);
GetOptions
(
    "gwas_result:s" => \$gwas_result,
	"snp:s" => \$sig_SNP,
	"flank_region:i" => \$flank_region,
	"hmp:s" => \$hmp,
);
sub usage
{
        die qq/
Usage: perl $0 [options]
Options:
        -gwas_result  <s> : GWAS_output_generated_from_EMMAIX
        -snp  <s> : txt containing SNP
        -flank_region  <s> : bp The region to draw LD heatmap
        -hmp  <S>: The snp data in HMP format
	-gwas_result Example:
        A01:296 -0.3123129821   0.09139493916
        A01:13691   0.1903852553    0.2448494178
        A01:13719   0.09806853342   0.5357535847
	-snp Example:
        A06:2313312321
	-hmp Example:
        rs# B001    B002    B003    B004    B005
        A01:296 A\/A A\/A A\/A A\/A A\/A
        A01:13691   T\/T T\/T T\/T T\/T T\/T
\n/;
}
if (!defined $gwas_result ||  !defined $sig_SNP || !defined $flank_region || !defined  $hmp )
{    &usage();       }
# Change the format for SNP
#open (IN,"$hmp");
#open (OUT,">temp.txt");
#$head= <IN>;
#print OUT $head;
#while (<IN>) {
 #   chomp;
#@a=split("\t",$_);
#$id= shift@a;
#print OUT $id."\t";
#foreach $_(@a){
#@b=split(//,$_);
#print OUT $b[0].'/'.$b[1]."\t";
#}
#print OUT "\n";
#}
#close IN;
#close OUT;
#system("mv temp.txt $hmp");
##  Construct hmp
open (I, "$sig_SNP") or die "cant not open input.txt"; # A01:27713123
#print "The GWAS loci were read";
while (<I>) { ## Loop1
chomp;
@arrary=split(":",$_);
$loci=$arrary[1];
$chr=$arrary[0];
$start= $loci- $flank_region;
$start == 0 if ($start < 0);
$end= $loci  + $flank_region;
$name= $_;
if (!defined $name) { next;}

open (IN2,"$hmp")or die "cant not open hmp.txt";
open (OUT2, ">${name}_hmp.txt");
while (<IN2>) { # loop2
$_=~s/\t\n/\n/;
$_=~/:(.*?)\t/;
$pos=$1;
#print $pos."\n";
if ($_=~/$arrary[0]/ && $pos > $start && $pos < $end) {
 print OUT2 $_ ;
}
}# loop2
} # loop1
open (IN3 ,"$sig_SNP")or die "cant not open snp.txt"; # 对每个snp进行操作 #A03:2312313213
while (<IN3>) {  # loop1 step3
$snp= $_;
chomp $snp;
open (R,">${snp}.r");
#system ("echo 'SNP' > list.txt");
system ("cut -f 1 ${snp}_hmp.txt > ${snp}_list.txt");
system("csvtk join -t ${snp}_list.txt $gwas_result|cut -f 3 > ${snp}pvalue.txt");
system("csvtk join -t ${snp}_list.txt $gwas_result|cut -f 1 > ${snp}distance.txt");
system("perl -pi -e 's/.*?://g' ${snp}distance.txt");
system("perl -pi -e 's/BP\n//g' ${snp}pvalue.txt ${snp}distance.txt");
system("perl -pi -e 's/P\n//g' ${snp}pvalue.txt ${snp}distance.txt");
#print R "library(ggplot2)\n";
print R "library(LDheatmap)\n";
print R "library(genetics)\n";
print R "pdf(\"${snp}.pdf \",width=12,height=8)\n";
print R "table=read.table(\"${snp}_hmp.txt\",header = F,sep = \"\\t\")\n";
print R "table=t(table)\n";
print R "write.table(table,\"temp.txt\",quote = F,sep=\"\t\",row.names = F,col.names = F)\n";
print R "table=read.table(\"temp.txt\",header = T,sep = \"\\t\",na.strings = \"NA\")\n";
print R "num<-ncol(table) \n";
print R "for(i in 1:num){table[,i]<-as.genotype(table[,i]) }\n";
print R "distance=scan(\"${snp}distance.txt\")\n";
print R "distance=as.vector(distance)\n";
print R "MyHeatmap <- LDheatmap(table, distance,title = \"$snp\", add.map = T,color = heat.colors(20),name = \"myLDgrob\", add.key = TRUE,flip = T)\n";
print R "pvale=scan(\"${snp}pvalue.txt\")\n";
print R "pvale=as.vector(-log10(pvale))\n";
print R "assoc <- LDheatmap.addScatterplot(MyHeatmap, pvale,height=0.8)\n";
print R "dev.off()\n";
system ("Rscript ${snp}.r");
system ("rm *pvalue.txt");
system ("rm *distance.txt");
system ("rm temp.txt");
system ("rm *list.txt");

} # loop 1 step3
