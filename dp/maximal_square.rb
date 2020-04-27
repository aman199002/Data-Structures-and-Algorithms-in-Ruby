# Maximal Square
# Given a 2D binary matrix filled with 0's and 1's, find the largest square containing only 1's and return its area.

# Example:

# Input: 
# 1 0 1 0 0
# 1 0 1 1 1
# 1 1 1 1 1
# 1 0 0 1 0

# Output: 4

# Tine Complexity = O(mn)
# Space Complexity = O(mn)
def maximal_square(a)
	return 0 if a.size == 0 || a == nil
	rows = a.size
	cols = a[0].size
	largest = 0
	dp = Array.new(rows+1) { Array.new(cols+1) }
	for i in 0..rows do
		for j in 0..cols do
			# Initialize first row and column of matrix with 0
			if i==0 || j==0
				dp[i][j] = 0  
			# If matrix cell value for specific row and cell is 1, take minimum of left, right, diagonal and add 1.
			# As all these 3 directions should be checked and must contain 1. Store it to dp corresponding cell.
			# Keep track of largest matrix by comparing with dp cell value.
			elsif a[i-1][j-1] == '1'
				dp[i][j] = [ dp[i-1][j], dp[i][j-1], dp[i-1][j-1] ].min + 1
				largest = dp[i][j] if dp[i][j] > largest
			# If element equals 0 then put 0 in dp corresponding cell
			else
				dp[i][j] = 0
			end	
		end	
	end	
	return (largest*largest)  # Return area by multiplying largest element to itself.
end	

a = [
	["1","0","1","0","0"],
	["1","0","1","1","1"],
	["1","1","1","1","1"],
	["1","0","0","1","0"]
	]
puts maximal_square(a)

