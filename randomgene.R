##This script randomly selects genes from the human genome. Example shown is for randomly selecting ten genes.

library(tidyverse)
library(biomaRt)

# Establish a connection to the Ensembl database and choose the human genome
mart <- useMart("ensembl")
mart <- useDataset("hsapiens_gene_ensembl", mart = mart)

# Obtain all gene IDs and names
all_genes <- getBM(attributes = c("ensembl_gene_id", "external_gene_name"), mart = mart)

# Select 10 random genes
num_genes <- 10
random_genes <- all_genes %>% sample_n(num_genes)

# Display the selected genes
cat("Randomly selected genes:\n")
for (i in seq_len(num_genes)) {
  cat(paste(i, ".", random_genes[i, "external_gene_name"], "(", random_genes[i, "ensembl_gene_id"], ")\n"))
}
