##This code reads in RBP expression data from Brainspan (shown is code for U2AF2), finds rows with "frontal cortex" in the brain_region column (for analysis of frontal cortex samples). It calculates the median and standard error for rows before and after row 239 (in a dataframe containing the sample names and RPKM values, row 239 is when the postnatal samples begins). It also performs a t-test to compare the two sets of data.

#read data (example is U2AF2 data from Brainspan)
data <- read.csv("/home/a/aangeles/Downloads/U2AF2_data.csv")
head(data)
# use grep to find rows with "frontal cortex"
fc_rows <- grep("frontal", data$brain_region)
head(fc_rows)
print(fc_rows)
# calculate median and SE for "frontal cortex" rows before row 239
prenatal_mean <- mean(data$RPKM[fc_rows[fc_rows < 239]])
prenatal_se <- sd(data$RPKM[fc_rows[fc_rows < 239]]) / sqrt(length(fc_rows[fc_rows < 239]))

# calculate median and SE for "frontal cortex" rows after row 239
postnatal_mean <- mean(data$RPKM[fc_rows[fc_rows >= 239]])
postnatal_se <- sd(data$RPKM[fc_rows[fc_rows >= 239]]) / sqrt(length(fc_rows[fc_rows >= 239]))

fc_before <- data$RPKM[fc_rows[fc_rows < 239]]
fc_after <- data$RPKM[fc_rows[fc_rows >= 239]]
ttest <- t.test(fc_before, fc_after)

# print results
cat("Prenatal mean:", prenatal_mean, "\n")
cat("Prenatal SE:", prenatal_se, "\n")
cat("Postnatal mean:", postnatal_mean, "\n")
cat("Postnatal SE:", postnatal_se, "\n")
cat("t-value:", ttest$statistic, "\n")
cat("p-value:", ttest$p.value, "\n")
