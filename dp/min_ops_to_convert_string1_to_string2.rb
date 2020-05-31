# Edit Distance

# Given two words word1 and word2, find the minimum number of operations required to convert word1 to word2.
# You have the following 3 operations permitted on a word:
# Insert a character
# Delete a character
# Replace a character

# Example:

# Input: word1 = "horse", word2 = "ros"
# Output: 3
# Explanation: 
# horse -> rorse (replace 'h' with 'r')
# rorse -> rose (remove 'r')
# rose -> ros (remove 'e')
# Example 2:

# Input: word1 = "intention", word2 = "execution"
# Output: 5
# Explanation: 
# intention -> inention (remove 't')
# inention -> enention (replace 'i' with 'e')
# enention -> exention (replace 'n' with 'x')
# exention -> exection (replace 'n' with 'c')
# exection -> execution (insert 'u')

# Time Compexity = O(m*n)
# Space Compexity = O(m*n)
# Solve using dynamic programming.
def min_distance(word1,word2)
	return 0 if word1.empty? && word2.empty?
	m = word1.size
	n = word2.size
	# Initialize a matrix with size m+1 and n+1
	dp = Array.new(m+1) { Array.new(n+1) {} }
	for i in 0..m do
		for j in 0..n do
			# If i and j both equals j, put 0
			if i == 0 && j == 0
				dp[i][j] = 0
			# First row and column should be incremental, so place previous value plus 1 for both first column and first row.
			elsif i == 0
				dp[i][j] = dp[i][j-1] + 1
			elsif j == 0
				dp[i][j] = dp[i-1][j] + 1
			# If char in word1 and word2 are equal, then take diagonal value.
			elsif word1[i-1] == word2[j-1]
				dp[i][j] = dp[i-1][j-1]
			# If char in word1 & word2 are not equal, then take min of left, top and diagonal cells and add 1.
			elsif word1[i-1] != word2[j-1]
				dp[i][j] = [dp[i-1][j],dp[i][j-1],dp[i-1][j-1]].min + 1
			end	
		end	
	end
	# Return last cell value
	return dp[i][j]
end

puts min_distance('horse','ros')
puts min_distance('intention','execution')
puts min_distance('horse','')
