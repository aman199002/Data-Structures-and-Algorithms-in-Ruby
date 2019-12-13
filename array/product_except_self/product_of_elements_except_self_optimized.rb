# @param {Integer[]} nums
# @return {Integer[]}
# Store product of all left elements respectively in 1 array
# Store product of all right elements respectively in 2nd array
# Multiply each element of first and second array respectively
def product_except_self(nums)
    lnums = [1]
    rnums = Array.new(nums.size)
    for i in 1..nums.size-1 do
        lnums[i] = lnums[i-1] * nums[i-1]
    end
    rnums[nums.size-1] = 1
    i = nums.size - 2
    while i >= 0 do
        rnums[i] = nums[i+1] * rnums[i+1]
        i = i-1
    end
    for i in 0..nums.size-1 do
        nums[i] = lnums[i] * rnums[i]
    end
    nums
end

print product_except_self([1, 2, 3, 4, 5])