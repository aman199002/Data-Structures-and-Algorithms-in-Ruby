# Largest Number
# Given a list of non negative integers, arrange them such that they form the largest number.

# Example 1:

# Input: [10,2]
# Output: "210"
# Example 2:

# Input: [3,30,34,5,9]
# Output: "9534330"

# Note: The result may be very large, so you need to return a string instead of an integer.

# @param {Integer[]} nums
# @return {String}
def largest_number(nums)
    return '' if nums == nil || nums.size == 0
    # Here sorting in only ascending or descending order will not suffice.
    # Sort in desc order by writing custom comparator such that b+a > a+b where a and b are array elements converted into string.
    nums = nums.sort{|a,b| b.to_s+a.to_s <=> a.to_s+b.to_s}
    return(nums.join('').to_i.to_s) # Return by joining nums after being sorted using custom comparator.
end

puts largest_number([10,2])
puts largest_number([])
puts largest_number([0,0])
puts largest_number([3,30,34,5,9])
