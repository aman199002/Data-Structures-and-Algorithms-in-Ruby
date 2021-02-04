# Longest Harmonious Subsequence
# We define a harmonious array as an array where the difference between its maximum value and its minimum value is exactly 1.
# Given an integer array nums, return the length of its longest harmonious subsequence among all its possible subsequences.
# A subsequence of array is a sequence that can be derived from the array by deleting some or no elements without changing the order of the remaining elements.

# Example:

# Input: nums = [1,3,2,2,5,2,3,7]
# Output: 5
# Explanation: The longest harmonious subsequence is [3,2,2,2,3].

# Input: nums = [1,2,3,4]
# Output: 2

# Input: nums = [1,1,1,1]
# Output: 0

# @param {Integer[]} nums
# @return {Integer}
# Time Complexity = O(n)
# Space Complexity = O(n)
def find_lhs(a)
    h1 = {}
    max = 0
    for i in 0..a.size-1 do
        if h1[a[i]]
            h1[a[i]] = h1[a[i]] + 1
        else
            h1[a[i]] = 1
        end    
    end    
    h1.each do |k,v|
        count = 0
        if h1[k+1]
            count = h1[k] + h1[k+1]
        end    
        max = [max,count].max
    end    
    return max
end

puts find_lhs([1,3,2,2,5,2,3,7])
puts find_lhs([1,2,3,4])
puts find_lhs([1,1,1,1])
