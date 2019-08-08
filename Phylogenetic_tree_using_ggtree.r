#Phylogenetic tree analysis
library(ggtree)
setwd("./")
argv <- commandArgs(TRUE)
tree=read.tree(argv[1])
id_info = read.table(argv[2],header = F,sep = "\t")
pdf("Circular_tree.pdf",width = 25,height = 25)
p = ggtree(tree,layout = 'circular',branch.length = 'none')
p %<+% id_info + 
  geom_tippoint(aes(colour=V3))+
  geom_tiplab2(aes(label=V2))
dev.off()

# Example of id.txt
# s0001	Gbs0001	Gb
# s0006	Gbs0006	Gb
