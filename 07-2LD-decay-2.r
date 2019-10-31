setwd("/Users/tin/GWAS/Data_new/03GWAS/01GWASLD/raw_data")



table=read.table("ggplot.txt",header = F,sep = "\t")

head(table)

pdf("LD.pdf",width = 5,height = 4)

ggplot(table,aes(V2/1000,y=V3,color=V1))+geom_point()+xlim(5,500) + scale_color_jco() +theme_bw() + ylab("Mean R^2") +xlab("kb")

dev.off()
