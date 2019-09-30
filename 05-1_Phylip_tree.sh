#!/bin/bash
#produce import file  used for phylogenetic tree construction for software phylip.
#bash ./sample.vcf 
vcftools --vcf $1 --plink --out Tree
plink --file Tree --make-bed --out Tree
plink --file Tree --allow-extra-chr --distance-matrix --out Dis_matrix
perl -pi -e "s/\t.*/        /" Dis_matrix.mdist.id
wc -l Dis_matrix.mdist.id|perl -pi -e 's/ .*//' > tree_import.txt
paste Dis_matrix.mdist.id Dis_matrix.mdist >> tree_import.txt
rm Dis_matrix*
