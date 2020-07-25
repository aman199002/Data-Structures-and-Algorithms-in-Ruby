# Find Minimum in Rotated Sorted Array II

# Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.
# (i.e.,  [0,1,2,4,5,6,7] might become  [4,5,6,7,0,1,2]).

# Find the minimum element. The array may contain duplicates.

# Example:

# Input: [1,3,5]
# Output: 1
# Example 2:

# Input: [2,2,2,0,1]
# Output: 0

# @param {Integer[]} nums
# @return {Integer}
def find_min(nums)
	# Traverse given array till second last.
	# Compare each element with next element.
	# As array is sorted, if next element is smaller, then return next element.
	# If no next smaller element is preent, then it will be at first position. So return first element.
    for i in 0..nums.size-2 do
        if nums[i] > nums[i+1]
            return nums[i+1]
        end
    end
    return nums[0]
end

puts find_min([1,3,5])
puts find_min([2,2,2,0,1])
puts find_min([2,2,2,1])

