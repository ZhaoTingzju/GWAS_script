##r plot for Gh
pdf("PCA.pdf",width = 4,height = 4)
setwd("/Users/tin/GWAS/new_data/Evolution/Gh/")
table=read.table("ggplot.txt",header = F,sep = "\t")
library(ggplot2)
ggplot(table,aes(x=V2,y=V3))+geom_point() +theme_classic()+
xlab("PC1 3.98%")+ylab("PC2 2.70 %")
dev.off()
library(ggrepel)
pdf("Gh_with_name.pdf",width = 15,height = 15)
ggplot(table,aes(x=V2,y=V3,label=V4))+geom_point() +theme_classic()+
  xlab("PC1 3.98%")+ylab("PC2 2.70 %")+
  geom_text_repel() +ylim(-1,1)
dev.off()

##r plot for Total accessions.
pdf("PCA.pdf",width = 5.5,height = 4)
setwd("/Users/tin/GWAS/new_data/Evolution")
table=read.table("ggplot.txt",header = F,sep = "\t")
head(table)
library(ggplot2)
ggplot(table,aes(x=V2,y=V3,color=V5,shape=V5))+geom_point() +theme_classic()+
xlab("PC1 75.96%")+ylab("PC2 1.31%")
dev.off()
##r plot for Gb
pdf("PCA.pdf",width = 4,height = 4)
setwd("/Users/tin/GWAS/new_data/Evolution/Gb/")
table=read.table("ggplot.txt",header = F,sep = "\t")
head(table)
library(ggrepel)
#library(ggplot2)
ggplot(table,aes(x=V2,y=V3,label=V4))+geom_point() +
#  geom_text_repel()+
  theme_classic()+
  xlab("PC1: 25.49%")+ylab("PC2: 4.86%")
dev.off()

pdf("PCA_with_name.pdf",width = 15,height = 15)
ggplot(table,aes(x=V2,y=V3,label=V4))+geom_point() +
 geom_text_repel()+
  theme_classic()+
  xlab("PC1: 25.49%")+ylab("PC2: 4.86%")
dev.off()
