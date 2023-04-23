## This script is code for calculating nucleotide frequencies in a given nucleotide sequence. In this thesis, this script was used to calculate nucleotide frequency of VGCC splicing regions of interest.
# Define a function to compute nucleotide frequencies
compute_frequencies <- function(seq) {
  # Change the sequence to uppercase
  seq <- toupper(seq)

  # Determine the counts of each nucleotide A, C, G, and T individually
  count_a <- sum(grepl("A", strsplit(seq, "")[[1]]))
  count_c <- sum(grepl("C", strsplit(seq, "")[[1]]))
  count_g <- sum(grepl("G", strsplit(seq, "")[[1]]))
  count_t <- sum(grepl("T", strsplit(seq, "")[[1]]))

  # Compute the frequencies of A, C, G, and T individually
  total_count <- count_a + count_c + count_g + count_t
  freq_a <- count_a / total_count
  freq_c <- count_c / total_count
  freq_g <- count_g / total_count
  freq_t <- count_t / total_count

  # Store the frequencies in a list
  freq_list <- list(A = freq_a, C = freq_c, G = freq_g, T = freq_t)
  return(freq_list)
}

# Example usage (sequence is "ACGTAGAGAGAGTAC")
input_sequence <- "ACGTAGAGAGAGTAC"
resulting_frequencies <- compute_frequencies(input_sequence)
print(resulting_frequencies)
