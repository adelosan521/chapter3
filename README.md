This Github repository contains the scripts used in Chapter 3 of Alejandro De Los Angeles's DPhil thesis. This repository contains scripts for assessing the evolutionary conservation of RBP binding sites and statistical analyses of gene expression data.

The script for assessing evolutionary conservation of RBP binding sites is contained in the "sampling.R" script. Given a nucleotide sequence with accompanying evolutionary conservation (PhyloP) scores, this script will randomly sample nucleotides from the nucleotide sequence and take the median of the PhyloP score for the sampled nucleotides. For example, for the RBP binding site GTGTGTGT, 4Gs and 4Ts will be sampled and the median of this 8-nucleotide sequence will be ascertained. This iterative process is repeated 1000 times generating a distribution of scores. Additionally the script will identify the 2.5 percentile and 97.5 percentile PhyloP scores for the sampled nucleotides.

Additionally code for basic statistical analysis of BrainSpan Developmental Transcriptome Data is provided in the "brainspan_stats.R" script. The script will calculate mean, standard error, and carry out a t-test for comparing two sets of samples.

Contact: Alejandro De Los Angeles (adelosan@gmail.com)

<img src="https://raw.githubusercontent.com/PKief/vscode-material-icon-theme/ec559a9f6bfd399b82bb44393651661b08aaf7ba/icons/folder-github-open.svg" width="80" />

## ⚙️ Project Structure
bash
.
├── README.md
├── brainspan_stats.R
└── sampling.R

1 directory, 3 files---

<img src="https://raw.githubusercontent.com/PKief/vscode-material-icon-theme/ec559a9f6bfd399b82bb44393651661b08aaf7ba/icons/folder-src-open.svg" width="80" />

## 💻 Modules
<details closed><summary>.</summary>

| File              | Summary                                                                                                                                                                                                                                       |
|:------------------|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| brainspan_stats.R | This code reads in U2AF2 data from Brainspan, finds rows with "frontal cortex" in the brain_region column, calculates the median and standard error for rows before and after row 239, and performs a t-test to compare the two sets of data. |
| sampling.R        | This code performs random re-sampling to compare BRUNOL4 / BRUNOL5 binding site to intron between CACNA1C exon 20 and 21.                                                                                                                     |

</details>


