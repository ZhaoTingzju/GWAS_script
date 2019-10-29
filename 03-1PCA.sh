
vcftools --vcf file.vcf --plink --out file 
./plink --noweb --file file --make-bed --out file 
$gcta64 --bfile ../file --make-grm --autosome --out file_temp
$gcta64 --grm file_temp --pca --out file_temp_pca
cut -d " " -f 2,3,4 file_temp_pca.eigenvec > ggplot_pca.txt
awk '{sum += $1};END {print sum}' file.eigenval

