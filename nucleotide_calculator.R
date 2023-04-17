##This script calculates the frequency of A, C, G, and T in a given nucleotide sequence.

# Function to calculate nucleotide frequencies
calculate_frequencies <- function(sequence) {

# Convert the sequence to uppercase
  sequence <- toupper(sequence)
  
# Count the occurrences of each nucleotide
  a_count <- sum(substr(sequence, 1:nchar(sequence), 1:nchar(sequence)) == "A")
  c_count <- sum(substr(sequence, 1:nchar(sequence), 1:nchar(sequence)) == "C")
  g_count <- sum(substr(sequence, 1:nchar(sequence), 1:nchar(sequence)) == "G")
  t_count <- sum(substr(sequence, 1:nchar(sequence), 1:nchar(sequence)) == "T")
  
# Calculate the frequencies
  total_count <- a_count + c_count + g_count + t_count
  a_frequency <- a_count / total_count
  c_frequency <- c_count / total_count
  g_frequency <- g_count / total_count
  t_frequency <- t_count / total_count
  
# Create a list to store the frequencies
  frequencies <- list(A = a_frequency, C = c_frequency, G = g_frequency, T = t_frequency)
  
  return(frequencies)
}

# Example usage
sequence <- "ATGCGATCGATCGTAGCTAGCTAGCTAGCATGCTAGCATCGATCGATCGTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCATCGTAGCTAGC"
frequencies <- calculate_frequencies(sequence)
print(frequencies)
