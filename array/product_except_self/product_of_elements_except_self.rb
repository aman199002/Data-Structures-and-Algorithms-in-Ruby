# @param {Integer[]} nums
# @return {Integer[]}
def product_except_self(nums)
    nums2 = []
    for i in 0..nums.size-1 do
        product = 1
        for j in 0..nums.size-1 do
            if i != j
                product = product * nums[j]
            end    
        end
        nums2 << product
    end
    nums2
end

print product_except_self([1, 2, 3, 4, 5])