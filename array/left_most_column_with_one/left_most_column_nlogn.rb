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
# Time Complexity = rlogr
# Space Complexity = 1
# Initialize from row 0
# Search left most 1 for each row using binary search as row is sorted.
# Update left_min is new left most index is less than left_min
# Return left_min
def leftMostColumnWithOne(binaryMatrix)
	h,w = binaryMatrix.dimensions
    return -1 if h == 0
    left_min = 2**32
    i = 0
    j = h-1
    while i < h do
    	if binaryMatrix.get(i,j) == 0
    		i = i+1
    	else
    		idx = binary_search(binaryMatrix,0,w-1,1,i)
    		if idx != -1 && idx < left_min
    			left_min = idx
    		end
    		i = i+1
    	end
    end
    left_min == 2**32 ? -1 : left_min
end

private

# If mid is equal to 0, search in right direction else search in left.
# If mid is equal to 1, check if its left most by comparing adjacent left of mid to 0. 
# If yes, then return index else again repeat binary search to left elements.
def binary_search(binaryMatrix,start,last,n,row)
	if start > last
		return -1
	end
	mid = start + (last-start)/2
	if binaryMatrix.get(row,mid) == 1
		if binaryMatrix.get(row,mid-1) == 0 || mid == 0
			return mid
		else
			binary_search(binaryMatrix,start,mid-1,n,row)
		end	
	elsif binaryMatrix.get(row,mid) == 0
		binary_search(binaryMatrix,mid+1,last,n,row)
	end
end

bin_matrix = BinaryMatrix.new([[0,0],[1,1]])
puts leftMostColumnWithOne(bin_matrix)
bin_matrix = BinaryMatrix.new([[0,0],[0,1]])
puts leftMostColumnWithOne(bin_matrix)
bin_matrix = BinaryMatrix.new([[0,0],[0,0]])
puts leftMostColumnWithOne(bin_matrix)
bin_matrix = BinaryMatrix.new([ [0,0,0,1],[0,0,1,1],[0,1,1,1]])
puts leftMostColumnWithOne(bin_matrix)