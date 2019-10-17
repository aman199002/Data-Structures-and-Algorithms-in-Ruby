# @param {Integer[]} nums
# @param {Integer} k
# @return {Void} Do not return anything, modify nums in-place instead.
# def rotate(nums, k)
#     counter = 0
#     nums2 = []
#     for i in (nums.length-k)..nums.length-1 do
#         nums2[counter] = nums[i]
#         counter = counter + 1
#     end    
#     if k != 0
#         for i in 0..nums.length-k-1 do
#             nums2[counter] = nums[i]
#             counter = counter + 1
#         end
#     end
#     print nums2
# end

# rotate([1,2,3,4,5,6,7])



def rotate(a, k)
    n = a.length
    mod = k%n
    for i in 0..n-1 do
        print a[(n - mod + i) % n]
        print ' '
    end   
end

rotate([1,2,3,4,5,6,7],3)
# rotate([1,2],3)
# rotate([1,2,3,4,5,6,7],3)