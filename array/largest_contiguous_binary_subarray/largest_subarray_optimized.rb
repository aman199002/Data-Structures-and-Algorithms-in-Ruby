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
	max_length = 0
	h1 = {}
	# Replace each 0 element by -1
	for i in 0..a.size-1 do
		if a[i] == 0
			a[i] = -1
		end	
	end	
	# Initalize loop and store cummulative left sum.
	# If cummulcative sum equal to 0, means it can be possible subarray starting from index 0, then update max_length.
	# Store sum as key in hash and index i as value.
	# When same sum appear again, means elements between current and previous index is possible subarray.
	# Update max value if current_index - previous_index greater than max
	sum = 0
	for i in 0..a.size-1 do
		sum = sum + a[i]
		if sum == 0
			max_length = i+1
		end
		if h1[sum]
			if max_length < i - h1[sum]
				max_length = i - h1[sum]
			end	
		else
			h1[sum] = i
		end	
	end
	# Replace each -1 element back to 0 again.
	for i in 0..a.size-1 do
		if a[i] == -1
			a[i] = 0 
		end	
	end	
	max_length  # Return max length
end

puts find_max_length([])
puts find_max_length([0,1])
puts find_max_length([0,1,0])
puts find_max_length([0,1,0,1,1])
puts find_max_length([0,0,0,1,1])