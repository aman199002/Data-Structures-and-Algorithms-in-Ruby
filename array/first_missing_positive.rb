# First Missing Positive

# Given an unsorted integer array, find the smallest missing positive integer.

# Example:

# Input: [1,2,0]
# Output: 3

# Input: [3,4,-1,1]
# Output: 2

# Input: [7,8,9,11,12]
# Output: 1

# Follow up:

# Your algorithm should run in O(n) time and uses constant extra space.

# @param {Integer[]} nums
# @return {Integer}
# Time Complexity = O(n)
# Space Complexity = O(1)
def first_missing_positive(a)
    h1 = {}
    min = 2**32
    for i in 0..a.size-1 do
        h1[a[i]] = true
        min = a[i] if a[i] > 0 && a[i] < min
    end
    max = a.max
    if min > 1
        return 1
    else
      num = min
      while num <= max do
          if !h1[num]
              return num
          end
          num = num+1
      end    
      return num  
    end    
end

puts first_missing_positive([1,2,0])
puts first_missing_positive([3,4,6])
puts first_missing_positive([3,4,-1,1])
puts first_missing_positive([7,8,9,11,12])
puts first_missing_positive([-1,-2,-3])
