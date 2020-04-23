# Bitwise AND of Numbers Range
# Given a range [m, n] where 0 <= m <= n <= 2147483647, return the bitwise AND of all numbers in this range, inclusive.

# Example:

# Input: [5,7],  Output: 4

# Input: [0,1],  Output: 0


# Left shift both the elements if not equal
# Keep track of Count when eash element is shifted
# When both are equal, then do right shift of element by number of times it had been shifted left and return
# @param {Integer} m
# @param {Integer} n
# @return {Integer}
def range_bitwise_and(m, n)
	count = 0
	while m != n do
		m = m >> 1
		n = n >> 1
		count = count+1
	end
	m = m << count
end

puts range_bitwise_and(5, 7)
puts range_bitwise_and(16, 19)
puts range_bitwise_and(0,0)