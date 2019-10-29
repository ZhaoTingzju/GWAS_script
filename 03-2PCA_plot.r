setwd("/Users/tin/GWAS/Data_new/01Evolution/PCA/")
df=read.table("ggplot_pca.txt",header = F,sep = " ")
library(ggplot2)
head(df)

pdf("PCA.pdf",width = 4,height = 4)

Gb=df[grep(pattern = "B",df[,1]),]
Gb$V4="Gb"
Gh=df[grep(pattern = "L",df[,1]),]
Gh$V4="Gh"

df=rbind(Gb,Gh)

#pdf("PCA.pdf",width = 4.5,height = 4)

ggplot(df,aes(x=V2,y=V3,color=V4,shape=V4))+geom_point(size=5,alpha=0.5)+
  xlab("PCA1 (78.08 %)")+
  ylab("PCA2 (1.40%)")+
   theme(legend.position="none")+
  theme_bw()+theme(legend.position =c(0.15,0.85) ,legend.title = element_blank(),legend.box.background = element_rect(color="black", size=0.5),
                   legend.box.margin = margin(6, 6, 6, 6)) +scale_color_jco()

dev.off()
