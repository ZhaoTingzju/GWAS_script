#The output was generated from emmax
# Only suit for my cotton project
argv <- commandArgs(TRUE)
df=read.table(argv[1],header = F,sep="\t")
head(df)
library(dplyr)
library(tidyr)
library(qqman)
new_df=df %>% separate(V1,c("Chr","Bp"),":",remove=F)
df_gwas =subset(new_df,select=c("V1","Chr","Bp","V3"))
colnames(df_gwas)=c("SNP","CHR","BP","P")
df_gwas$CHR[df_gwas$CHR=="A01"] = 1
df_gwas$CHR[df_gwas$CHR=="A02"] = 2
df_gwas$CHR[df_gwas$CHR=="A03"] = 3
df_gwas$CHR[df_gwas$CHR=="A04"] = 4
df_gwas$CHR[df_gwas$CHR=="A05"] = 5
df_gwas$CHR[df_gwas$CHR=="A06"] = 6
df_gwas$CHR[df_gwas$CHR=="A07"] = 7
df_gwas$CHR[df_gwas$CHR=="A08"] = 8
df_gwas$CHR[df_gwas$CHR=="A09"] = 9
df_gwas$CHR[df_gwas$CHR=="A10"] = 10
df_gwas$CHR[df_gwas$CHR=="A11"] = 11
df_gwas$CHR[df_gwas$CHR=="A12"] = 12
df_gwas$CHR[df_gwas$CHR=="A13"] = 13
df_gwas$CHR[df_gwas$CHR=="D01"] = 14
df_gwas$CHR[df_gwas$CHR=="D02"] = 15
df_gwas$CHR[df_gwas$CHR=="D03"] = 16
df_gwas$CHR[df_gwas$CHR=="D04"] = 17
df_gwas$CHR[df_gwas$CHR=="D05"] = 18
df_gwas$CHR[df_gwas$CHR=="D06"] = 19
df_gwas$CHR[df_gwas$CHR=="D07"] = 20
df_gwas$CHR[df_gwas$CHR=="D08"] = 21
df_gwas$CHR[df_gwas$CHR=="D09"] = 22
df_gwas$CHR[df_gwas$CHR=="D10"] = 23
df_gwas$CHR[df_gwas$CHR=="D11"] = 24
df_gwas$CHR[df_gwas$CHR=="D12"] = 25
df_gwas$CHR[df_gwas$CHR=="D13"] = 26
df_gwas$CHR=as.numeric(df_gwas$CHR)
df_gwas$BP=as.numeric(df_gwas$BP)
pdf(paste(argv[1],"_manhattan.pdf",sep=""))
manhattan(df_gwas)
dev.off()
png(paste(argv[1],"_manhattan.png",sep=""))
manhattan(df_gwas)
dev.off()
pdf(paste(argv[1],"_qqplot.pdf",sep=""))
qq(df_gwas$P)
dev.off()
png(paste(argv[1],"_qqplot.png",sep=""))
qq(df_gwas$P)
dev.off()
