##This code uses "intersectBed" from bedtools to identify overlapping binding sites between two different BED files.
## For the example below, consider two files: FIMO.bed (results from FIMO) and HOMER.bed (results from HOMER global):

intersectBed -a FIMO.bed -b HOMER.bed -wa -wb > overlap.bed

##This code creates a new filed "overlap.bed" with the overlapping regions from FIMO.bed and HOMER.bed
