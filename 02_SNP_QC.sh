## remove indel.sh
vcftools --gzvcf A01.vcf.gz --remove-indels --recode --recode-INFO-all --out A01.vcf.gz_noindel&
vcftools --gzvcf A02.vcf.gz --remove-indels --recode --recode-INFO-all --out A02.vcf.gz_noindel&
vcftools --gzvcf A03.vcf.gz --remove-indels --recode --recode-INFO-all --out A03.vcf.gz_noindel&
vcftools --gzvcf A04.vcf.gz --remove-indels --recode --recode-INFO-all --out A04.vcf.gz_noindel&
vcftools --gzvcf A05.vcf.gz --remove-indels --recode --recode-INFO-all --out A05.vcf.gz_noindel&
vcftools --gzvcf A06.vcf.gz --remove-indels --recode --recode-INFO-all --out A06.vcf.gz_noindel&
vcftools --gzvcf A07.vcf.gz --remove-indels --recode --recode-INFO-all --out A07.vcf.gz_noindel&
vcftools --gzvcf A08.vcf.gz --remove-indels --recode --recode-INFO-all --out A08.vcf.gz_noindel&
vcftools --gzvcf A09.vcf.gz --remove-indels --recode --recode-INFO-all --out A09.vcf.gz_noindel&
vcftools --gzvcf A10.vcf.gz --remove-indels --recode --recode-INFO-all --out A10.vcf.gz_noindel&
vcftools --gzvcf A11.vcf.gz --remove-indels --recode --recode-INFO-all --out A11.vcf.gz_noindel&
vcftools --gzvcf A12.vcf.gz --remove-indels --recode --recode-INFO-all --out A12.vcf.gz_noindel&
vcftools --gzvcf A13.vcf.gz --remove-indels --recode --recode-INFO-all --out A13.vcf.gz_noindel&
vcftools --gzvcf D01.vcf.gz --remove-indels --recode --recode-INFO-all --out D01.vcf.gz_noindel&
vcftools --gzvcf D02.vcf.gz --remove-indels --recode --recode-INFO-all --out D02.vcf.gz_noindel&
vcftools --gzvcf D03.vcf.gz --remove-indels --recode --recode-INFO-all --out D03.vcf.gz_noindel&
vcftools --gzvcf D04.vcf.gz --remove-indels --recode --recode-INFO-all --out D04.vcf.gz_noindel&
vcftools --gzvcf D05.vcf.gz --remove-indels --recode --recode-INFO-all --out D05.vcf.gz_noindel&
vcftools --gzvcf D06.vcf.gz --remove-indels --recode --recode-INFO-all --out D06.vcf.gz_noindel&
vcftools --gzvcf D07.vcf.gz --remove-indels --recode --recode-INFO-all --out D07.vcf.gz_noindel&
vcftools --gzvcf D08.vcf.gz --remove-indels --recode --recode-INFO-all --out D08.vcf.gz_noindel&
vcftools --gzvcf D09.vcf.gz --remove-indels --recode --recode-INFO-all --out D09.vcf.gz_noindel&
vcftools --gzvcf D10.vcf.gz --remove-indels --recode --recode-INFO-all --out D10.vcf.gz_noindel&
vcftools --gzvcf D11.vcf.gz --remove-indels --recode --recode-INFO-all --out D11.vcf.gz_noindel&
vcftools --gzvcf D12.vcf.gz --remove-indels --recode --recode-INFO-all --out D12.vcf.gz_noindel&
vcftools --gzvcf D13.vcf.gz --remove-indels --recode --recode-INFO-all --out D13.vcf.gz_noindel&
wait
## 
awk '$5 !~ /([[:alpha:]])+,[[:alpha:]]/{print}' A01.vcf.gz_noindel.recode.vcf > A01_noindel.recode.vcf_biallelic.vcf&
awk '$5 !~ /([[:alpha:]])+,[[:alpha:]]/{print}' A02.vcf.gz_noindel.recode.vcf > A02_noindel.recode.vcf_biallelic.vcf&
awk '$5 !~ /([[:alpha:]])+,[[:alpha:]]/{print}' A03.vcf.gz_noindel.recode.vcf > A03_noindel.recode.vcf_biallelic.vcf&
awk '$5 !~ /([[:alpha:]])+,[[:alpha:]]/{print}' A04.vcf.gz_noindel.recode.vcf > A04_noindel.recode.vcf_biallelic.vcf&
awk '$5 !~ /([[:alpha:]])+,[[:alpha:]]/{print}' A05.vcf.gz_noindel.recode.vcf > A05_noindel.recode.vcf_biallelic.vcf&
awk '$5 !~ /([[:alpha:]])+,[[:alpha:]]/{print}' A06.vcf.gz_noindel.recode.vcf > A06_noindel.recode.vcf_biallelic.vcf&
awk '$5 !~ /([[:alpha:]])+,[[:alpha:]]/{print}' A07.vcf.gz_noindel.recode.vcf > A07_noindel.recode.vcf_biallelic.vcf&
awk '$5 !~ /([[:alpha:]])+,[[:alpha:]]/{print}' A08.vcf.gz_noindel.recode.vcf > A08_noindel.recode.vcf_biallelic.vcf&
awk '$5 !~ /([[:alpha:]])+,[[:alpha:]]/{print}' A09.vcf.gz_noindel.recode.vcf > A09_noindel.recode.vcf_biallelic.vcf&
awk '$5 !~ /([[:alpha:]])+,[[:alpha:]]/{print}' A10.vcf.gz_noindel.recode.vcf > A10_noindel.recode.vcf_biallelic.vcf&
awk '$5 !~ /([[:alpha:]])+,[[:alpha:]]/{print}' A11.vcf.gz_noindel.recode.vcf > A11_noindel.recode.vcf_biallelic.vcf&
awk '$5 !~ /([[:alpha:]])+,[[:alpha:]]/{print}' A12.vcf.gz_noindel.recode.vcf > A12_noindel.recode.vcf_biallelic.vcf&
awk '$5 !~ /([[:alpha:]])+,[[:alpha:]]/{print}' A13.vcf.gz_noindel.recode.vcf > A13_noindel.recode.vcf_biallelic.vcf&
awk '$5 !~ /([[:alpha:]])+,[[:alpha:]]/{print}' D01.vcf.gz_noindel.recode.vcf > D01_noindel.recode.vcf_biallelic.vcf&
awk '$5 !~ /([[:alpha:]])+,[[:alpha:]]/{print}' D02.vcf.gz_noindel.recode.vcf > D02_noindel.recode.vcf_biallelic.vcf&
awk '$5 !~ /([[:alpha:]])+,[[:alpha:]]/{print}' D03.vcf.gz_noindel.recode.vcf > D03_noindel.recode.vcf_biallelic.vcf&
awk '$5 !~ /([[:alpha:]])+,[[:alpha:]]/{print}' D04.vcf.gz_noindel.recode.vcf > D04_noindel.recode.vcf_biallelic.vcf&
awk '$5 !~ /([[:alpha:]])+,[[:alpha:]]/{print}' D05.vcf.gz_noindel.recode.vcf > D05_noindel.recode.vcf_biallelic.vcf&
awk '$5 !~ /([[:alpha:]])+,[[:alpha:]]/{print}' D06.vcf.gz_noindel.recode.vcf > D06_noindel.recode.vcf_biallelic.vcf&
awk '$5 !~ /([[:alpha:]])+,[[:alpha:]]/{print}' D07.vcf.gz_noindel.recode.vcf > D07_noindel.recode.vcf_biallelic.vcf&
awk '$5 !~ /([[:alpha:]])+,[[:alpha:]]/{print}' D08.vcf.gz_noindel.recode.vcf > D08_noindel.recode.vcf_biallelic.vcf&
awk '$5 !~ /([[:alpha:]])+,[[:alpha:]]/{print}' D09.vcf.gz_noindel.recode.vcf > D09_noindel.recode.vcf_biallelic.vcf&
awk '$5 !~ /([[:alpha:]])+,[[:alpha:]]/{print}' D10.vcf.gz_noindel.recode.vcf > D10_noindel.recode.vcf_biallelic.vcf&
awk '$5 !~ /([[:alpha:]])+,[[:alpha:]]/{print}' D11.vcf.gz_noindel.recode.vcf > D11_noindel.recode.vcf_biallelic.vcf&
awk '$5 !~ /([[:alpha:]])+,[[:alpha:]]/{print}' D12.vcf.gz_noindel.recode.vcf > D12_noindel.recode.vcf_biallelic.vcf&
awk '$5 !~ /([[:alpha:]])+,[[:alpha:]]/{print}' D13.vcf.gz_noindel.recode.vcf > D13_noindel.recode.vcf_biallelic.vcf&
wait

### merge
~/biosoftware/gatk-4.1.0.0/gatk GatherVcfs  \
-I A01_noindel.recode.vcf_biallelic.vcf \
-I A02_noindel.recode.vcf_biallelic.vcf \
-I A03_noindel.recode.vcf_biallelic.vcf \
-I A04_noindel.recode.vcf_biallelic.vcf \
-I A05_noindel.recode.vcf_biallelic.vcf \
-I A06_noindel.recode.vcf_biallelic.vcf \
-I A07_noindel.recode.vcf_biallelic.vcf \
-I A08_noindel.recode.vcf_biallelic.vcf \
-I A09_noindel.recode.vcf_biallelic.vcf \
-I A10_noindel.recode.vcf_biallelic.vcf \
-I A11_noindel.recode.vcf_biallelic.vcf \
-I A12_noindel.recode.vcf_biallelic.vcf \
-I A13_noindel.recode.vcf_biallelic.vcf \
-I D01_noindel.recode.vcf_biallelic.vcf \
-I D02_noindel.recode.vcf_biallelic.vcf \
-I D03_noindel.recode.vcf_biallelic.vcf \
-I D04_noindel.recode.vcf_biallelic.vcf \
-I D05_noindel.recode.vcf_biallelic.vcf \
-I D06_noindel.recode.vcf_biallelic.vcf \
-I D07_noindel.recode.vcf_biallelic.vcf \
-I D08_noindel.recode.vcf_biallelic.vcf \
-I D09_noindel.recode.vcf_biallelic.vcf \
-I D10_noindel.recode.vcf_biallelic.vcf \
-I D11_noindel.recode.vcf_biallelic.vcf \
-I D12_noindel.recode.vcf_biallelic.vcf \
-I D13_noindel.recode.vcf_biallelic.vcf \
-O merge.vcf 

vcftools --vcf merge.vcf --missing-indv
awk '$5< 0.5{print $1}' out.imss > id.txt
vcftools --vcf merge.vcf --keep id.txt --recode --recode-INFO-all --out merged_437

nohup vcftools --vcf ./merged_437.recode.vcf --maf 0.05 --max-maf 0.95 --max-missing 0.9 \
--out merged_437_maf5maxmaf95maxmissing9 --recode --recode-INFO-all &
