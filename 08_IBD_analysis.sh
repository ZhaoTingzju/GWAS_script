# phase
~/biosoftware/jdk1.8.0_201/bin/java -jar ~/bin/beagle.r1399.jar gt=D01.vcf out=phased_D01 nthreads=5
~/biosoftware/jdk1.8.0_201/bin/java -jar ~/bin/beagle.r1399.jar gt=D02.vcf out=phased_D02 nthreads=5
~/biosoftware/jdk1.8.0_201/bin/java -jar ~/bin/beagle.r1399.jar gt=D03.vcf out=phased_D03 nthreads=5
~/biosoftware/jdk1.8.0_201/bin/java -jar ~/bin/beagle.r1399.jar gt=D04.vcf out=phased_D04 nthreads=5
~/biosoftware/jdk1.8.0_201/bin/java -jar ~/bin/beagle.r1399.jar gt=D05.vcf out=phased_D05 nthreads=5
~/biosoftware/jdk1.8.0_201/bin/java -jar ~/bin/beagle.r1399.jar gt=D06.vcf out=phased_D06 nthreads=5
~/biosoftware/jdk1.8.0_201/bin/java -jar ~/bin/beagle.r1399.jar gt=D07.vcf out=phased_D07 nthreads=5
~/biosoftware/jdk1.8.0_201/bin/java -jar ~/bin/beagle.r1399.jar gt=D08.vcf out=phased_D08 nthreads=5
~/biosoftware/jdk1.8.0_201/bin/java -jar ~/bin/beagle.r1399.jar gt=D09.vcf out=phased_D09 nthreads=5
~/biosoftware/jdk1.8.0_201/bin/java -jar ~/bin/beagle.r1399.jar gt=D10.vcf out=phased_D10 nthreads=5
~/biosoftware/jdk1.8.0_201/bin/java -jar ~/bin/beagle.r1399.jar gt=D11.vcf out=phased_D11 nthreads=5
~/biosoftware/jdk1.8.0_201/bin/java -jar ~/bin/beagle.r1399.jar gt=D12.vcf out=phased_D12 nthreads=5
~/biosoftware/jdk1.8.0_201/bin/java -jar ~/bin/beagle.r1399.jar gt=D13.vcf out=phased_D13 nthreads=5

#  plink 
ls *gz|while read id; do vcftools --gzvcf $id --plink --out $id; done
ls *gz|while read id; do ~/biosoftware/germline-1-5-3/germline -input ./${id}.ped ./${id}.map -output $id -bits 100 -err_hom 3 -err_het 3 ;done
cat *match > result.txt
# ibd2bed.pl
open (IN,"$ARGV[0]");
while (<IN>) {
chomp;
@a=split("\t",$_);
if ($a[0]=~/L/ && $a[1]=~ /L/) { next; }
if ($a[0]=~/B/ && $a[1]=~ /B/) { next; }
if ($a[0]=~/C/ && $a[1]=~ /C/) { next; }
if ($a[0]=~/C/ && $a[1]=~ /L/) { next; }
if ($a[0]=~/L/ && $a[1]=~ /C/) { next; }
#print $a[0];
#print $a[1];
#@name=($a[0],$a[1]);
#@name=sort(@name);
#$name_id=join (@name,"-");
#print $name_id;
#print $a[2];
$name_id= $a[0]."-".$a[1];
$str=$a[2]."\t".$a[3]."\t"."$name_id\n";
@b=split(" ",$str);
print $b[0]."\t".$b[1]."\t$b[2]\t$b[4]\n";
}
