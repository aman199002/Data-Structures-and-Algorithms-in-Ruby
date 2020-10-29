# Summary Ranges

# You are given a sorted unique integer array nums.
# Return the smallest sorted list of ranges that cover all the numbers in the array exactly. 
# That is, each element of nums is covered by exactly one of the ranges, and there is no integer x such that x is in one of the ranges but not in nums.
# Each range [a,b] in the list should be output as:
# "a->b" if a != b
# "a" if a == b
 
# Example:

# Input: nums = [0,1,2,4,5,7]
# Output: ["0->2","4->5","7"]

# Input: nums = [0,2,3,4,6,8,9]
# Output: ["0","2->4","6","8->9"]

# Input: nums = []
# Output: []

# Input: nums = [-1]
# Output: ["-1"]

# @param {Integer[]} nums
# @return {String[]}
def summary_ranges(a)
    return [] if a == nil || a.size == 0
    start = a[0]
    last = a[0]
    res = []
    for i in 1..a.size-1 do
        if a[i] == a[i-1]+1
            last = a[i]
        else            
            res << ((start==last) ? start.to_s : "#{start}->#{last}")
            start = a[i]
            last = a[i]
        end    
    end    
    res << (start==last ? start.to_s : "#{start}->#{last}")
    return res
end

print summary_ranges([0,1,2,4,5,7])
puts
print summary_ranges([0,2,3,4,6,8,9])
puts
print summary_ranges([])
puts
print summary_ranges([-1])

