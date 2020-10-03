# K-diff Pairs in an Array
# Given an array of integers nums and an integer k, return the number of unique k-diff pairs in the array.
# A k-diff pair is an integer pair (nums[i], nums[j]), where the following are true:

# Example:

# Input: nums = [3,1,4,1,5], k = 2, Output: 2
# Explanation: There are two 2-diff pairs in the array, (1, 3) and (3, 5).
# Although we have two 1s in the input, we should only return the number of unique pairs.

# Input: nums = [1,2,3,4,5], k = 1, Output: 4
# Explanation: There are four 1-diff pairs in the array, (1, 2), (2, 3), (3, 4) and (4, 5).

# Input: nums = [1,3,1,5,4], k = 0, Output: 1
# Explanation: There is one 0-diff pair in the array, (1, 1).

# Input: nums = [1,2,4,4,3,3,0,9,2,3], k = 3, Output: 2

# Input: nums = [-1,-2,-3], k = 1, Output: 2


# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def find_pairs(a, k)
    return 0 if a == nil || a.size == 0
    h1 = {}
    res = 0
    # Convert array to hash
    for i in 0..a.size-1 do
    	if h1[a[i]]
    		h1[a[i]] = h1[a[i]]+1
    	else
    		h1[a[i]] = 1
    	end	
    end
    for i in 0..a.size-1 do
    	val = a[i] + k
    	# If target is 0, then we should not find if sum of array element and target exists in array because it will be true for each element.
    	# Here we have to find if this element exists twice so that difference of both can be zero.
    	# Hence, using compare value 1 if k equals 0, else 0.
    	compare_with = k == 0 ? 1 : 0
    	if h1[val] && h1[val] > compare_with
			h1[val] = 0  # Set value to 0 as we should consider unique pairs only.
			res = res+1
		end
    end
    return res
end

puts find_pairs([3,1,4,1,5], 2)
puts find_pairs([1,2,3,4,5],1)
puts find_pairs([1,3,1,5,4],0)
puts find_pairs([1,2,4,4,3,3,0,9,2,3],3)
puts find_pairs([-1,-2,-3],1)
