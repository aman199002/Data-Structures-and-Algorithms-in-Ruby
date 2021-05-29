# Maximum Erasure Value

# You are given an array of positive integers nums and want to erase a subarray containing unique elements. 
# The score you get by erasing the subarray is equal to the sum of its elements.
# Return the maximum score you can get by erasing exactly one subarray.
# An array b is called to be a subarray of a if it forms a contiguous subsequence of a, that is, if it is equal to a[l],a[l+1],...,a[r] for some (l,r).

 
# Example:

# Input: nums = [4,2,4,5,6]
# Output: 17
# Explanation: The optimal subarray here is [2,4,5,6].s

# Input: nums = [5,2,1,2,5,2,1,2,5]
# Output: 8
# Explanation: The optimal subarray here is [5,2,1] or [1,2,5].

# Time Complexity = O(n)
# Space Complexity = O(n)   
# @param {Integer[]} nums
# @return {Integer}
def maximum_unique_subarray(a)
    return 0 if a == nil || a.size == 0
    i,j = 0,0
    size = a.size
    num_hash = {}
    sum,max = 0,0
    while i < size && j < size do
        # puts "size = #{size}, j = #{j}, num_hash = #{num_hash}"
        if num_hash[a[j]]
            while i < j do
                sum = sum - a[i]
                num_hash.delete(a[i])
                if a[i] == a[j]
                    i = i+1
                    break
                end
                i = i+1
            end
        else
            num_hash[a[j]] = 1
            sum = sum + a[j]
            max = [max,sum].max
            j = j+1
        end
    end
    return max
end

puts maximum_unique_subarray([4,2,4,5,6])
puts maximum_unique_subarray([5,2,1,2,5,2,1,2,5])
