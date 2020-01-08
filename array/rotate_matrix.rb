# Rotate a square matrix by 90 degree
# @param {Integer[][]} matrix
# @return {Void} Do not return anything, modify matrix in-place instead.
def rotate(matrix)
	matrix = transpose(matrix) # First get transpose of matrix
	reverse(matrix) # Then reverse elements of each row
end

private

def transpose(a)
	m = a[0].size
	n = a.size
	for i in 0..a.size-1 do
		for j in i..a.size-1 do
			a[i][j],a[j][i] = a[j][i],a[i][j] # Swap 2 elements of array
		end	
	end
	a
end

def reverse(a)
	for i in 0..a.size-1 do
		k = a.size-1
		for j in 0..(a.size-1)/2 do
			a[i][j],a[i][k] = a[i][k],a[i][j] # Swap 2 elements of array
			k = k-1
		end
	end	
	a
end	

matrix = [
  [1,2,3],
  [4,5,6],
  [7,8,9]
]
print rotate(matrix)