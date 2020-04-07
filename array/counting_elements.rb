# Given an integer array arr, count element x such that x + 1 is also in arr.
# If there're duplicates in arr, count them seperately.

# Example

# Input: arr = [1,3,2,3,5,0]
# Output: 3
# Explanation: 0, 1 and 2 are counted cause 1, 2 and 3 are in arr.

# Input: arr = [1,1,3,3,5,5,7,7]
# Output: 0
# Explanation: No numbers are counted, cause there's no 2, 4, 6, or 8 in arr.

# Time Complexity = O(n)
# Space Complexity = O(n)
def count_elements(a)
	h1 = {}
	count = 0
	for i in 0..a.size-1 do
		if h1[a[i]]
			h1[a[i]] = h1[a[i]]+1
		else
			h1[a[i]] = 1
		end
	end
	h1.each do |k,v|
		if h1[k+1]
			count = count + h1[k]
		end	
	end
	count
end

puts count_elements([1,2,3])
puts count_elements([1,1,3,3,5,5,7,7])
puts count_elements([1,3,2,3,5,0])
puts count_elements([1,1,2,2])
