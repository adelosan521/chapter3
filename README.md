This Github repository contains the scripts used in Chapter 3 of Alejandro De Los Angeles's DPhil thesis. This repository contains scripts for assessing the evolutionary conservation of RBP binding sites and statistical analyses of gene expression data.

The script for assessing evolutionary conservation of RBP binding sites is contained in the "sampling.R" script. Given a nucleotide sequence with accompanying evolutionary conservation (PhyloP) scores, this script will randomly sample nucleotides from the nucleotide sequence and take the median of the PhyloP score for the sampled nucleotides. This iterative process is repeated 1000 times generating a distribution of scores. Additionally the script will identify the 2.5 percentile and 97.5 percentile PhyloP scores.

Additionally code for basic statistical analysis of BrainSpan Developmental Transcriptome Data is provided in the "brainspan_stats.R" script. The script will calculate mean, standard error, and carry out a t-test for comparing two sets of samples.

Contact: Alejandro De Los Angeles (adelosan@gmail.com)
