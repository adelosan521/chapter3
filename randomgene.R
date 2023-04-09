##This script randomly selects genes from the human genome. 

library(tidyverse)
library(biomaRt)

# connect to the Ensembl database and select the human genome
ensembl = useMart("ensembl")
ensembl = useDataset("hsapiens_gene_ensembl", mart = ensembl)

# retrieve all gene IDs and names
genes = getBM(attributes = c("ensembl_gene_id", "external_gene_name"), mart = ensembl)

# randomly select 10 genes
n_genes = 10
random = genes %>% sample_n(n_genes)

# print the selected genes
cat("Randomly selected genes:\n")
for (i in 1:n_genes) {
  cat(paste(i, ".", random[i, "external_gene_name"], "(", random[i, "ensembl_gene_id"], ")\n"))
}
