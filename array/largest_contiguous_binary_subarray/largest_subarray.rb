# Given a binary array, find the maximum length of a contiguous subarray with equal number of 0 and 1.

# Example:

# Input: [0,1]
# Output: 2
# Explanation: [0, 1] is the longest contiguous subarray with equal number of 0 and 1.

# Input: [0,1,0]
# Output: 2
# Explanation: [0, 1] (or [1, 0]) is a longest contiguous subarray with equal number of 0 and 1.

# Input: [0,0,1,1]
# Output: 4

# Time Complexity = O(n^2)
# Space Complexity = O(n)
def find_max_length(a)
	max = 0	
	for i in 0..a.size-2 do
		count_0 = 0
		count_1 = 0
		current_max = 0
		for j in i..a.size-1 do
			if a[j] == 0
				count_0 = count_0+1
			elsif a[j] == 1
				count_1 = count_1+1
			end
			if count_0 == count_1
				current_max = count_0+count_1
			end
		end
		if current_max > max
			max = current_max
		end
	end
	max
end

puts find_max_length([])
puts find_max_length([0,1])
puts find_max_length([0,1,0])
puts find_max_length([0,1,0,1,1])
puts find_max_length([0,0,0,1,1])