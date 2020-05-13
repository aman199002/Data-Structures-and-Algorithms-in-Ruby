# Number of Islands
# Given a 2d grid map of '1's (land) and '0's (water), count the number of islands. An island is surrounded by water and is formed 
# by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.

# Example:

# Input:
# 11000
# 11000
# 00100
# 00011

# Output: 3

# @param {Character[][]} a
# @return {Integer}
def num_islands(a)
    return 0 if a.size == 0  # Return 0 if empty array.
	rows = a.size
	cols = a[0].size
	num_of_islands = 0  # Initialize num_of_islands with 0.
	# Traverse the whole matrix
	for i in 0..rows-1 do
		for j in 0..cols-1 do
			# If cell value equals 1, then increment num_of_islands and call dfs for that cell.
			if a[i][j] == '1'
				num_of_islands = num_of_islands+1
				dfs(a,i,j,rows,cols)
			end
		end
	end
	num_of_islands
end

private

def dfs(a,i,j,rows,cols)
	# If cell is not valid or value equal to 0, return.
	if (i < 0 || i >= rows || j < 0 || j >= cols || a[i][j]=='0')
		return 0
	end
	# Set each adjacent cell equal to 0 if its value is 1
	a[i][j]	= '0'
	# Call dfs function in all 4 possible directions.
	dfs(a,i-1,j,rows,cols)
	dfs(a,i+1,j,rows,cols)
	dfs(a,i,j-1,rows,cols)
	dfs(a,i,j+1,rows,cols)
end

a = [[1,1,0,0,0,],
	 [1,1,0,0,0],
	 [0,0,1,0,0],
	 [0,0,0,1,1]]

puts num_of_islands(a)	 

