argv <- commandArgs(TRUE)
command= paste ("awk '$0!~/#/{print $0}' ",argv[1],"|cut -f 1,2 >Position.txt", sep="")
system(command)
system("ls")

setwd("/Users/zt/learn/00软件包/00Myscript/GWAS/Draw_snp_density")
snps<-read.table("Position.txt",sep="\t",header=F)

colnames(snps)<-c("chr","start")

AOrder1 <- paste("A0",c(1:9),sep="")
AOrder2 <- paste("A",c(10:13),sep="")

DOrder1 <- paste("D0",c(1:9),sep="")
DOrder2 <- paste("D",c(10:13),sep="")

CHRorder <- c(AOrder1,AOrder2,DOrder1,DOrder2)
snps$chr <- factor(snps$chr,levels=CHRorder)

library(ggplot2)
snpDensity<-ggplot(snps) + 
  geom_histogram(aes(x=start),binwidth=1e6,fill="pink") + 
  facet_wrap(~ chr,ncol=3,scales="free") + 
  ggtitle("Density of SNP across cotton") +
  xlab("Position in the genome") + 
  ylab("SNP density") + 
  theme_bw() 

number_of_snp_in_each_chr= as.data.frame(table(snps$chr))
##import the length of cotton chr
chr_length=c(118174371,108272889,111586618,87703368,110845161,126488190,96598283,125056055,83216487,115096118,121376521,107588319,110367549,64698102,69777850,53896199,56935404,63929679,65459843,58417686,69080421,52000373,66881427,71358197,61693100,64447585)
df=as.data.frame(chr_length)

df=cbind(number_of_snp_in_each_chr,df)

df$density=df$Freq/df$chr_length*1000000
colnames(df)=c("Chr","No.SNPs","Chr_Length","Density perl MB")

write.table(df,"number_of_snp_per_MB.txt",quote=F,row.name=F)


pdf("snp_density.pdf")
print(snpDensity)
dev.off()
system("rm Position.txt")



