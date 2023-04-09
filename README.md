This Github repository contains the scripts used in Chapter 3 of Alejandro De Los Angeles's DPhil thesis. This repository contains scripts for assessing the evolutionary conservation of RBP binding sites and statistical analyses of gene expression data.

The code for randomly selecting genes from the human genome is featured in the "randomgene.R" script. This code was used to select randomly select genes for testing FIMO and HOMER sensitivity.

The script for intersecting binding site results from FIMO and HOMER global is contained in the "intersection.sh" script. The code will identify overlapping binding sites between two different BED files.

The script for assessing evolutionary conservation of RBP binding sites is contained in the "sampling.R" script. Given a nucleotide sequence with accompanying evolutionary conservation (PhyloP) scores, this script will randomly sample nucleotides from the nucleotide sequence and take the median of the PhyloP score for the sampled nucleotides. For example, for the RBP binding site GTGTGTGT, 4Gs and 4Ts will be sampled and the median of this 8-nucleotide sequence will be ascertained. This iterative process is repeated 1000 times generating a distribution of scores. Additionally the script will identify the 2.5 percentile and 97.5 percentile PhyloP scores for the sampled nucleotides.

Additionally code for basic statistical analysis of BrainSpan Developmental Transcriptome Data is provided in the "brainspan_stats.R" and "brainspan_stats2.R" scripts. The scripts involve checking if a dataset is normally distributed using the Shapiro-Wilk test. They calculate median, interquartile range, and provides code for conducting a Mann-Whitney U test to test for differences. "brainspan_stats.R" script contains code for comparing fetal versus postnatal stamples whereas "brainspan_stats2.R" script contains code for comparing early versus late fetal stage samples. Although not used in this thesis, the "brain_stats.R" script also includes code for calculating mean, standard error, and carrying out a t-test for comparing two sets of samples.

Contact: Alejandro De Los Angeles (adelosan@gmail.com)
