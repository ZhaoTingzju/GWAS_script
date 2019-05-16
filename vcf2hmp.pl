#!/usr/bin/perl
# Usage perl VCF2Hmp.pl test.vcf > out.hmp.txt
use strict;
use Data::Dumper;

open (MYFILE, $ARGV[0]);

my @firstcolsh = ("rs#","alleles","chrom","pos","strand","assembly#","center","protLSID","assayLSID","panelLSID","QCcode");
#my ($samlples);
while (<MYFILE>) {
    chomp;
    
    next if ($_ =~ /^##/);
    
    my @arr = split /\t/, $_;
    my @arr2 = @arr[ 9 .. $#arr ];
    
    if ($_ =~ /^#/) {
        #$samlples = join "\t", @arr2,"\n";
        print join "\t", @firstcolsh, join "\t", @arr2 ,"\n";
        next;
    }
    
    next if (length($arr[3].$arr[4]) > 2);
    
    #print Dumper(\@arr); die;
    my @firstcols = ($arr[0]."__".$arr[1], $arr[3]."/".$arr[4], $arr[0], $arr[1], "+", "NA", "NA", "NA", "NA", "NA", "NA");
    
    my %convert = (
        '1/0' => $arr[3].$arr[4],
        '0/1' => $arr[3].$arr[4],
        '0/0' => $arr[3].$arr[3],
        '1/1' => $arr[4].$arr[4],
    );
    
    my $x01 = $arr[3].$arr[4];
    my $x00 = $arr[3].$arr[3];
    my $x11 = $arr[4].$arr[4];
    
    for (my $i=0; $i<scalar(@arr2); $i++ )
    {
        my @arr3 = split /:/, $arr2[$i];
        $arr2[$i] = $arr3[0];
        $arr2[$i] =~ s/(\Q$arr3[0]\E)/$convert{$1}/g; 
    }
    
    #print Dumper(\@arr2); die;
    
    print join "\t", @firstcols, join "\t", @arr2 ,"\n";
    #die;
    #print $_."\n"; die;
}
# This script were obtained from 
#  https://github.com/haktansuren/ngs-tutorials/blob/master/VCF2Hmp/VCF2Hmp.pl
