# Search Insert Position

# Given a sorted array and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.
# You may assume no duplicates in the array.

# Example:

# Input: [1,3,5,6], 5
# Output: 2

# Input: [1,3,5,6], 2
# Output: 1

# Input: [1,3,5,6], 7
# Output: 4

# Input: [1,3,5,6], 0
# Output: 0

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search_insert(nums, target)
    return 0 if nums == nil || nums.size == 0
    for i in 0..nums.size-1 do
    	# Return i if target equals value at i or greater than that.
        if nums[i] == target || nums[i] > target
            return i
        end   
   end
   # If value is not found in array, means it should be at last. Return i+1.
   return(i+1)
end
