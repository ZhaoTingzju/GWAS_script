## the first file 
#E114	Zhong 30
#E154	HZ06331
#E162	Lumianyan 22
#E165	Xinluzhong 6
## The tree
## perl ./Change_tree_name.pl name_id tree
open (IN,"$ARGV[0]");
$tree= $ARGV[1];
open (OUT,">rename.sh");
while (<IN>) {
chomp;
$_=~s/\'//g;
@a=split("\t",$_);
$comand= "perl -pi -e ".'"s/'.$a[0].':/'.$a[1].":\/\"". ' '.$tree."\n";
print OUT $comand;
}
system ("bash ./rename.sh");
system("rm ./rename.sh");