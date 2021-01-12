# Given two sorted integer arrays nums1 and nums2, merge nums2 into nums1 as one sorted array.
# The number of elements initialized in nums1 and nums2 are m and n respectively. You may assume that nums1 has enough space (size that is equal to m + n) to hold additional elements from nums2.

# Example:

# Input: nums1 = [1,2,3,0,0,0], m = 3, nums2 = [2,5,6], n = 3
# Output: [1,2,2,3,5,6]

# Input: nums1 = [1], m = 1, nums2 = [], n = 0
# Output: [1]

# @param {Integer[]} nums1
# @param {Integer} m
# @param {Integer[]} nums2
# @param {Integer} n
# @return {Void} Do not return anything, modify nums1 in-place instead.
# Time Complexity = O(n+m)
# Space Complexity = O(1)
def merge(a, m, b, n)
    i = m-1
    j = n-1
    k = m+n-1
    while i >= 0 && j >= 0 do
        if b[j] >= a[i]
            a[k] = b[j]
            j = j-1
            k = k-1
        else
            a[k] = a[i]
            a[i] = 0
            k = k-1
            i = i-1
        end    
    end    
    # Add missing elements from second array
    while j >= 0 do
        a[k] = b[j]
        k = k-1
        j = j-1
    end    
    return a
end


print merge([1,2,3,0,0,0],3,[2,5,6],3)
puts
print merge([1],1,[],0)
puts
print merge([0,0,0],0,[1,2,3],3)
puts

