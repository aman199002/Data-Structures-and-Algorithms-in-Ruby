# @param {Integer[][]} matrix
# @param {Integer} target
# @return {Boolean}
def search_matrix(matrix,target)
    return false if matrix.empty?
	rows_count = matrix.length
	columns_count = matrix[0].length
	# Iterate each row from first to last
	0.upto(rows_count-1) do |i|
		# If most right cell is equal to target
		if matrix[i][columns_count-1] == target
			return([i,columns_count-1])
		# If most right cell is greater than target
		elsif matrix[i][columns_count-1] && matrix[i][columns_count-1] > target
			# Iterate each column from right to left
			(columns_count-1).downto(0) do |j|
				if matrix[i][j] == target
					return([i,j])
				end
			end
		end
	end
    return false
end	

matrix = [
  [1,   3,  5,  7],
  [10, 11, 16],
  [23, 30, 34, 50]
]
target = 50
print search_matrix(matrix,target)