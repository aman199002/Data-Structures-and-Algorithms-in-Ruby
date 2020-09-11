# Maximum Product Subarray.
# Given an integer array nums, find the contiguous subarray within an array (containing at least one number) which has the largest product.

# Example:

# Input: [2,3,-2,4]
# Output: 6
# Explanation: [2,3] has the largest product 6.

# Input: [-2,0,-1]
# Output: 0
# Explanation: The result cannot be 2, because [-2,-1] is not a subarray.

# @param {Integer[]} nums
# @return {Integer}
def max_product(a)
	return nil if a == nil || a.size == 0
    max_so_far = a[0]
    min_so_far = a[0]
    res = max_so_far
    for i in 1..a.size-1 do
    	temp_max = [a[i],(max_so_far * a[i]),(min_so_far * a[i])].max
    	min_so_far = [a[i],(max_so_far * a[i]),(min_so_far * a[i])].min
    	max_so_far = temp_max
    	res = [res,max_so_far].max
    end
    return res
end

puts max_product([2,3,-2,4])
puts max_product([-2,3,2,-4])
puts max_product([-4,-3,-2])
puts max_product([0,2])
