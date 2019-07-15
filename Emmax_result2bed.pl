sub log10 { my $n = shift; return log($n)/log(10); }

#A01:296	-0.3123129821	0.09139493916
#A01:13691	0.1903852553	0.2448494178

open (IN,"$ARGV[0]");
while (<IN>) {
	chomp;
@a=split("\t",$_);
$id=$a[0];
@b=split(":",$id);
#print $chr;
$loci=$b[1];
$chr=$b[0];
$pvalue= -log10($a[2]);
print "$chr\t$loci\t$loci\t$id\t$pvalue\t+\n";

}