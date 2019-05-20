#!/bin/bash
#produce import file which can be used for phylogenetic tree construction for software phylip.
#bash ./sample.vcf ./gene.bed
vcftools --vcf $1 --bed $2 --out SNP_in_Gene --recode --keep-INFO-all
plink --vcf SNP_in_Gene.recode.vcf --allow-extra-chr --distance-matrix --out Dis_matrix
perl -pi -e "s/\t.*/        /" Dis_matrix.mdist.id
wc -l Dis_matrix.mdist.id|perl -pi -e 's/ .*//' > tree_import.txt
paste Dis_matrix.mdist.id Dis_matrix.mdist >> tree_import.txt
rm Dis_matrix*
rm SNP_in_Gene.recode.vcf