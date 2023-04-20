## This script was used to conduct a Fisher's exact test to compare FIMO and HOMER for five different RBPs (ELAVL1, KHDRBS1, TARDBP, PABPC4, FXR1). It produces a table that is saved to a PNG image file.
## Create a data frame of the frequencies for FIMO and HOMER
frequencies <- data.frame(
  Method = rep(c("FIMO", "HOMER"), each = 5),
  RBP = c("ELAVL1", "KHDRBS1", "TARDBP", "PABPC4", "FXR1"),
  Observed_FIMO = c(6, 2, 5, 7, 0),
  Not_Observed_FIMO = c(24, 28, 25, 23, 30),
  Observed_HOMER = c(20, 5, 11, 11, 1),
  Not_Observed_HOMER = c(10, 25, 19, 19, 29)
)

## Create an empty data frame to store the results
results <- data.frame(RBP = character(5), FIMO = character(5), HOMER = character(5), 
                      FishersExact = numeric(5), PValue = character(5))

## Perform a Fisher's exact test for each RBP and fill in the results data frame
for (i in 1:5) {
  table <- matrix(c(frequencies[i, "Observed_FIMO"], frequencies[i, "Observed_HOMER"],
                    frequencies[i, "Not_Observed_FIMO"], frequencies[i, "Not_Observed_HOMER"]),
                  nrow = 2, byrow = TRUE)
  colnames(table) <- c("Observed", "Not Observed")
  rownames(table) <- c("FIMO", "HOMER")
  test <- fisher.test(table)
  results[i, "RBP"] <- frequencies[i, "RBP"]
  results[i, "FIMO"] <- paste(frequencies[i, "Observed_FIMO"], "/", frequencies[i, "Observed_FIMO"] + frequencies[i, "Not_Observed_FIMO"])
  results[i, "HOMER"] <- paste(frequencies[i, "Observed_HOMER"], "/", frequencies[i, "Observed_HOMER"] + frequencies[i, "Not_Observed_HOMER"])
  results[i, "FishersExact"] <- format(test$estimate, digits = 4)
  results[i, "PValue"] <- format.pval(test$p.value, digits = 4)
}

## Print the results table
cat("RBP\tFIMO\tHOMER\tFisher's Exact Test\tp-value\n")
for (i in 1:5) {
  cat(paste0(results[i, "RBP"], "\t", results[i, "FIMO"], "\t", 
             results[i, "HOMER"], "\t", results[i, "FishersExact"], "\t", 
             results[i, "PValue"], "\n"))
}

## Save the results table as a PNG file
png(file = "/home/a/aangeles/Downloads/results3.png", width = 800, height = 600)
grid.table(as.matrix(results), theme = ttheme_default(base_size = 10))
dev.off()
