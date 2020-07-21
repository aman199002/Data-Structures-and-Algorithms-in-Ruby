# Transpose Matrix

# Given a matrix A, return the transpose of A.
# The transpose of a matrix is the matrix flipped over it's main diagonal, switching the row and column indices of the matrix.

# Example
# [[1,2,3],
# [4,5,6],
# [7,8,9]]

# =>

# [[1,4,7],
# [2,5,8],
# [3,6,9]]

# @param {Integer[][]} a
# @return {Integer[][]}
def transpose(a)
    return [] if a == nil || a.size == 0
    m = a.size
    n = a[0].size
    # Initialize new matrix with n*m taking n as row size and m as column size.
    res = Array.new(n){Array.new(m){}}
    for i in 0..m-1 do
    	for j in 0..n-1 do
    		res[j][i] = a[i][j] # Assign each cell value to new matrix by transposing.
    	end	
    end	
    return res  # Return res matrix
end

a = [
		[1,2,3],
		[4,5,6],
		[7,8,9]
	]
print transpose(a)

puts

a = [[1,2,3],[4,5,6]]
print transpose(a)
