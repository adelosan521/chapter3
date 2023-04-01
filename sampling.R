##This code performs random re-sampling of nucleotides within a given nucleotide sequence. In the code below, random re-sampling of the nucleotide sequence for the intron between CACNA1C exon 20 and 21 is conducted 1000 times to generate a distribution of scores (i.e. median PhyloP scores for the sampled nucleotides). For the code below, random re-sampling is conducted to compare the BRUNOL4 / BRUNOL5 binding site to the intron between CACNA1C exon 20 and 21.
# read data  
mydata <- read.table("/ceph/project/tunbridgelab/aangeles/conservation/phyloP17/phyloP_CACNA1C-exon20_21.txt", header=TRUE, sep="\t")

# Sample 4 Gs and 4 Ts and compute mean conservation score (because BRUNOL4 / BRUNOL5 binding site is comprised of 4 Gs and 4 Ts)
head(mydata)

# Sample 4 Gs and 4 Ts and compute median of conservation score
set.seed(123) # set seed for reproducibility
results <- replicate(1000, {
  selected_indices <- c(sample(which(mydata$DNA_nucleotides == "G"), 4), 
                        sample(which(mydata$DNA_nucleotides == "T"), 4))
  mean_score <- median(mydata$evolutionary_conservation_score[selected_indices])
  c(mean_score, sd_score)
})

# Extract mean values
means <- results[seq(1, length(results), 2)]
# Compute percentiles
percentiles <- quantile(means, c(0.025, 0.975))
cat("2.5% percentile:", percentiles[1], "\n")
cat("97.5% percentile:", percentiles[2], "\n")

# calculate median evoltuionary score
median_score <- median(mydata$evolutionary_conservation_score)
cat("Median evolutionary score:", median_score, "\n")

# Plot histogram with mean and percentile lines
hist(means, breaks=50, xlab="Median conservation score", main="Distribution of median conservation score")
abline(v=mean(means), col="red", lwd=2)
abline(v=percentiles[1], col="blue", lwd=2, lty="dashed")
abline(v=percentiles[2], col="blue", lwd=2, lty="dashed")
legend("topleft", legend=c("Median", "2.5% percentile", "97.5% percentile"), col=c("red", "blue", "blue"), lty=c(1, 1, 1), lwd=1)
## We use the sample() function to randomly select 4 indices from the set of indices where the nucleotides are "G" or "T". We compute the mean and standard deviation of the conservation scores for these indices using the mean() and sd() functions. We repeat this process 1000 times using the replicate() function and store the results in the results matrix. We extract the means and standard deviations into separate vectors. We then compute the 2.5% and 97.5% percentiles of the means using the quantile() function. Finally, we plot the distribution of means using the hist() function and add lines for the mean and percentiles using the abline() function. We also add a legend using the legend() function.

