# You are given a map in form of a two-dimensional integer grid where 1 represents land and 0 represents water.
# Grid cells are connected horizontally/vertically (not diagonally). The grid is completely surrounded by water, and there is exactly one island (i.e., one or more connected land cells).
# The island doesn't have "lakes" (water inside that isn't connected to the water around the island). One cell is a square with side length 1. 
# The grid is rectangular, width and height don't exceed 100. Determine the perimeter of the island.
 

# Example:

# Input:
# [[0,1,0,0],
#  [1,1,1,0],
#  [0,1,0,0],
#  [1,1,0,0]]

# Output: 16

# @param {Integer[][]} grid
# @return {Integer}
# This is a simple island problem. We just need to traverse matrix and find perimeter.
# Time Complexity = O(mn)
# Space Complexity = O(1)
def island_perimeter(a)
	# Return 0 if array is nil or empty
    if a == nil || a.size == 0 || a[0].size == 0
    	return 0
    end
    m = a.size
    n = a[0].size
    result = 0  # Initialize result to store perimeter
    # Traverse all the eleemtns of matrix
    for i in 0..m-1 do
    	for j in 0..n-1 do
    		# Perimeter is sum of boundary length
    		# As each cell with 1 represent a square with side length 1.
    		# So perimeter of cell will be 4, hence add 4 to result.
    		if a[i][j] == 1
    			result = result + 4
    			# If above cell is also 1, then this cell boundary will used in island.
    			# The contribution of this cell will be 2 only, so deduct 2 as we have already added 4.
    			if i > 0 && a[i-1][j] == 1
    				result = result-2
    			end	
    			# If left cell is also 1, then this cell boundary will used in island.
    			# The contribution of this cell will be 2 only, so deduct 2 as we have already added 4.
    			if j > 0 && a[i][j-1] == 1
    				result = result-2
    			end	
    		end	
    	end	
    end	
    return(result)  # return result
end

a = [[0,1,0,0],
	 [1,1,1,0],
	 [0,1,0,0],
	 [1,1,0,0]]

puts island_perimeter(a)
