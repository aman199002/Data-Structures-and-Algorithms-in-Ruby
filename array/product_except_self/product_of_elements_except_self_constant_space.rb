# @param {Integer[]} nums
# @return {Integer[]}
# Store product of all left elements respectively in 1 array
# Iterate original array from last. Keep storing product of right elements
# At each iteration, multiply respective element from left array to right product
def product_except_self(nums)
    ans = [1]
    for i in 1..nums.size-1 do
        ans[i] = ans[i-1] * nums[i-1]
    end
    i = nums.size - 1
    rproduct = 1
    while i >= 0 do
        element = nums[i]
        ans[i] = ans[i] * rproduct
        i = i-1
        rproduct = rproduct * element
    end    
    ans
end

print product_except_self([1, 2, 3, 4, 5])