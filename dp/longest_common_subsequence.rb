# Longest Common Subsequence
# Given two strings text1 and text2, return the length of their longest common subsequence.
# A subsequence of a string is a new string generated from the original string with some characters(can be none) deleted without changing the relative order of the remaining characters. (eg, "ace" is a subsequence of "abcde" while "aec" is not). A common subsequence of two strings is a subsequence that is common to both strings.
# If there is no common subsequence, return 0.

# Example :

# Input: text1 = "abcde", text2 = "ace" 
# Output: 3 

# Input: text1 = "abc", text2 = "abc"
# Output: 3

# Input: text1 = "abc", text2 = "def"
# Output: 0

# Time Complexity = O(mn)
# @param {String} text1
# @param {String} text2
# @return {Integer}
def longest_common_subsequence(text1,text2)
	m = text1.size
	n = text2.size
	# Initialize a 2d matrix dp with height and width equal to length of string text1 and text2
	dp = Array.new(n+1) { Array.new(m+1) }
	for i in 0..n do
		for j in 0..m do
			# Put all the values equal to 0 in first row and first column in dp
			if i == 0 || j == 0
				dp[i][j] = 0
			elsif text1[j-1] == text2[i-1] # Compare each character of string text1 and text2. If equal, then store diagonal value plus 1 to dp
				dp[i][j] = dp[i-1][j-1]	+ 1
			else    # If character is not equal in text1 and text2, then take max of previous row or previous column and store to dp
				dp[i][j] = [dp[i][j-1],dp[i-1][j]].max
			end	
		end	
	end	
	return dp[n][m]  # Return last cell value from the matrix
end

puts longest_common_subsequence('abcde','ace')
puts longest_common_subsequence('abc','abc')
puts longest_common_subsequence('abc','def')
puts longest_common_subsequence('abc','')