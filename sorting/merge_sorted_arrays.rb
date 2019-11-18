# @param {Integer[]} nums1
# @param {Integer} m
# @param {Integer[]} nums2
# @param {Integer} n
# @return {Void} Do not return anything, modify nums1 in-place instead.
def merge(nums1, m, nums2, n)
    i = 0
    j = 0
    k = 0
    arr = []
    while i < m && j < n do
    	# puts "k = #{k}"
    	# puts "i = #{i}, j = #{j}"
    	# puts "i = #{nums1[i]}, j = #{nums2[j]}"
        if nums1[i] <= nums2[j]
            arr[k] = nums1[i]
            i = i+1
        else
            arr[k] = nums2[j]
            j = j+1
        end
        k = k+1
    end
    while i < m do
        arr[k] = nums1[i]
        i = i+1
        k = k+1
    end    
    while j < n do
        arr[k] = nums2[j]
        j = j+1
        k = k+1
    end
    print arr
end

nums1 = [1,2,3]
m = 3
nums2 = [2,5,6]
n = 3
merge(nums1, m, nums2, n)
