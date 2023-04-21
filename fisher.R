## This script was used to conduct a Fisher's exact test to compare FIMO and HOMER for five different RBPs (ELAVL1, KHDRBS1, TARDBP, PABPC4, FXR1). It produces a table that is saved to a PNG image file.
## Below is the code to conduct Fisher's Exact Test for comparing ELAVL1 frequency between FIMO and HOMER
# Define the observed counts
observed_counts <- matrix(c(6, 24, 20, 10), nrow = 2)

# Define the row and column names
rownames(observed_counts) <- c("FIMO", "HOMER")
colnames(observed_counts) <- c("ELAVL1 present", "ELAVL1 absent")

# Perform the Fisher's Exact Test
result <- fisher.test(observed_counts)

# Print the odds ratio and p-value
cat("Odds ratio: ", result$estimate, "\n")
cat("p-value: ", result$p.value, "\n")

# Check for significance at 0.05 level (i.e. alpha is set at 0.05)
if(result$p.value < 0.05){
  cat("The difference in ELAVL1 frequency between FIMO and HOMER is significant.\n")
}else{
  cat("There is no significant difference in ELAVL1 frequency between FIMO and HOMER.\n")
}
