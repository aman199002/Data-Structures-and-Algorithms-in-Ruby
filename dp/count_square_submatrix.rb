# Count Square Submatrices with All Ones
# Given a m * n matrix of ones and zeros, return how many square submatrices have all ones.

# Example:

# Input: matrix =
# [
#   [0,1,1,1],
#   [1,1,1,1],
#   [0,1,1,1]
# ]
# Output: 15
# Explanation: 
# There are 10 squares of side 1.
# There are 4 squares of side 2.
# There is  1 square of side 3.
# Total number of squares = 10 + 4 + 1 = 15.

# Input: matrix = 
# [
#   [1,0,1],
#   [1,1,0],
#   [1,1,0]
# ]
# Output: 7

# @param {Integer[][]} matrix
# @return {Integer}
def count_squares(a)
    m = a.size
    return 0 if m == 0
    n = a[0].size
    res = 0
    # Traverse matrix
    for i in 0..m-1 do
    	for j in 0..n-1 do
    		next if a[i][j] == 0  # Continue to next element if value is 0.
    		if i == 0 || j == 0  # If row or column is first and value is 1, then increment result by 1 and continue to next.
    			res = res + 1
    			next
    		end
    		# Find minimum of left, top and diagonal cell values.
    		min = [a[i][j-1],a[i-1][j],a[i-1][j-1]].min
    		# Update matrix cell with min plus cell value.
    		a[i][j] = min + a[i][j]
    		# Add matrix cell value to result.
    		res = res + a[i][j]
    	end	
    end
    res
end

a = [[0,1,1,1],
	 [1,1,1,1],
	 [0,1,1,1]]
puts count_squares(a)

a = [[1,0,1],
  	 [1,1,0],
     [1,1,0]]
puts count_squares(a)

