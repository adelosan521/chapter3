# Create a function to calculate nucleotide frequencies
calculate_frequencies <- function(sequence) {
  # Convert the sequence to uppercase
  sequence <- toupper(sequence)
  
# Count the occurrences of each nucleotide A, C, G, and T separately
  a_count <- sum(grepl("A", strsplit(sequence, "")[[1]]))
  c_count <- sum(grepl("C", strsplit(sequence, "")[[1]]))
  g_count <- sum(grepl("G", strsplit(sequence, "")[[1]]))
  t_count <- sum(grepl("T", strsplit(sequence, "")[[1]]))
  
# Calculate the frequencies of A, C, G, and T separately
  total_count <- a_count + c_count + g_count + t_count
  a_frequency <- a_count / total_count
  c_frequency <- c_count / total_count
  g_frequency <- g_count / total_count
  t_frequency <- t_count / total_count
  
# Create a list to store the frequencies
  frequencies <- list(A = a_frequency, C = c_frequency, G = g_frequency, T = t_frequency)
  
  return(frequencies)
}

# Example usage (sequence is "ACGTAGAGAGAGTAC")
sequence <- "ACGTAGAGAGAGTAC"
frequencies <- calculate_frequencies(sequence)
print(frequencies)
