# Longest Common Substring
# Given two strings ‘a’ and ‘b’, find the length of the longest common substring.

# Example:

# Input : a = “GeeksforGeeks”, b = “GeeksQuiz”
# Output : 5
# The longest common substring is “Geeks” and is of length 5.

# Input : a = “abcdxyz”, b = “xyzabcd”
# Output : 4
# The longest common substring is “abcd” and is of length 4.

# Input : a = “zxabcdezy”, b = “yzabcdezx”
# Output : 6
# The longest common substring is “abcdez” and is of length 6.

# Time Complexity = O(mn)
# Space Complexity = O(mn)
# @param {String} text1
# @param {String} text2
# @return {Integer}
def length_longest_common_substring(a,b)
	return 0 if a == nil || b == nil || a.size == 0 || b.size == 0
	m = a.size
	n = b.size
	max = 0
	# Initialize a 2d matrix dp with height and width equal to length of string a and b
	dp = Array.new(m+1){Array.new(n+1){}}
	for i in 0..m do
		for j in 0..n do
			# Put all the values equal to 0 in first row and first column in dp matrix
			if i == 0 || j == 0
				dp[i][j] = 0
				next
			end			
			if a[i-1] == b[j-1]  # Compare each character of string text1 and text2. If equal, then store diagonal value plus 1 to dp.
				dp[i][j] = dp[i-1][j-1]+1
				max = [max,dp[i][j]].max  # Keep track of max length by comparing with each value in dp.
			else  # If character is not equal in a and b, then take store 0 in dp.
				dp[i][j] = 0
			end
		end
	end
	# puts "dp = #{dp}"
	return max  # Return max length
end

puts length_longest_common_substring('abcdxyz','xyzabcd')
puts length_longest_common_substring('zxabcdezy','yzabcdezx')
puts length_longest_common_substring('GeeksforGeeks','GeeksQuiz')


