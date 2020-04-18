# Given a m x n grid filled with non-negative numbers, find a path from top left to bottom right which minimizes the sum of all numbers along its path.
# Note: You can only move either down or right at any point in time.

# Example

# Input:
# [
#   [1,3,1],
#   [1,5,1],
#   [4,2,1]
# ]
# Output: 7
# Explanation: Because the path 1→3→1→1→1 minimizes the sum.


def min_path_sum(a)
	return 0 if a.size == 0 || a == nil # Return if array is empty
	m = a[0].size
	n = a.size
	sum = Array.new(n){Array.new(m)}  # Define new matrix with same dimensions
	sum[0][0] = a[0][0]   # Initialize first element with given matrix first element
	# Fill first row
	for i in 1..m-1 do
		sum[0][i] = sum[0][i-1] + a[0][i]
	end
	# Fill first left
	for j in 1..n-1 do
		sum[j][0] = sum[j-1][0] + a[j][0]
	end
	# Fill rest of the entries
	# Compare with adjacent row and column and take minimum of 2 
	for i in 1..n-1 do
		for j in 1..m-1 do
			if sum[i-1][j] < sum[i][j-1]
				sum[i][j] = sum[i-1][j] + a[i][j]
			else
				sum[i][j] = sum[i][j-1] + a[i][j]
			end
		end
	end
	# puts "sum = #{sum}"
	sum[n-1][m-1]  # Retun last path which will be minimum
end

a = [
	  [1,3,1],
	  [1,5,1],
	  [4,2,1]
	]
puts min_path_sum(a)

a = [
	  [1,3,1]
	]
puts min_path_sum(a)

a = [
	  [1],[3],[1]
	]
puts min_path_sum(a)

a = [[1,2,5],[3,2,1]]
puts min_path_sum(a)

a = [[1,4,8,6,2,2,1,7],[4,7,3,1,4,5,5,1],[8,8,2,1,1,8,0,1],[8,9,2,9,8,0,8,9],[5,7,5,7,1,8,5,5],[7,0,9,4,5,6,5,6],[4,9,9,7,9,1,9,0]]
puts min_path_sum(a)

