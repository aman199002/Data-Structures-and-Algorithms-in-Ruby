# A binary matrix means that all elements are 0 or 1. For each individual row of the matrix, this row is sorted in non-decreasing order.

# Given a row-sorted binary matrix binaryMatrix, return leftmost column index(0-indexed) with at least a 1 in it. If such index doesn't exist, return -1.

# You can't access the Binary Matrix directly.  You may only access the matrix using a BinaryMatrix interface:

# BinaryMatrix.get(x, y) returns the element of the matrix at index (x, y) (0-indexed).
# BinaryMatrix.dimensions() returns a list of 2 elements [m, n], which means the matrix is m * n.
# Submissions making more than 1000 calls to BinaryMatrix.get will be judged Wrong Answer.  Also, any solutions that attempt to circumvent the judge will result in disqualification.

# For custom testing purposes you're given the binary matrix mat as input in the following four examples. You will not have access the binary matrix directly.

# Example:
# Input: mat = [[0,0],[1,1]], Output: 0

# Input: mat = [[0,0],[0,1]],  Output: 1

# Input: mat = [[0,0],[0,0]], Output: -1

# Input: mat = [[0,0,0,1],[0,0,1,1],[0,1,1,1]], Output: 1

class BinaryMatrix
	
	def initialize(val)
		@matrix = val
	end	

	def get(x, y)
		@matrix[x][y]
	end

	def dimensions()
		[@matrix.size,@matrix[0].size]
	end
end

# @param {BinaryMatrix} binaryMatrix
# @return {Integer}
# Time Complexity = r*c
# Space Complexity = 1
def leftMostColumnWithOne(binaryMatrix)
	h,w = binaryMatrix.dimensions
    return -1 if h == 0
    for j in 0..w-1 do
		for i in 0..h-1 do
			# puts "binaryMatrix[i][j] = #{binaryMatrix[i][j]}"
			if binaryMatrix.get(i,j) == 1
				return j
			end
		end
	end
	return -1
end

bin_matrix = BinaryMatrix.new([[0,0],[1,1]])
puts leftMostColumnWithOne(bin_matrix)
bin_matrix = BinaryMatrix.new([[0,0],[0,1]])
puts leftMostColumnWithOne(bin_matrix)
bin_matrix = BinaryMatrix.new([[0,0],[0,0]])
puts leftMostColumnWithOne(bin_matrix)
bin_matrix = BinaryMatrix.new([ [0,0,0,1],[0,0,1,1],[0,1,1,1]])
puts leftMostColumnWithOne(bin_matrix)