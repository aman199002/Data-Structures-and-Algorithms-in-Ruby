# @param {Integer[]} nums
# @return {Boolean}
def contains_duplicate(nums)
    h1 = {}
    for i in 0..nums.length-1 do
        if h1[nums[i]] == nums[i]
            return true
        else
            h1[nums[i]] = nums[i]
        end    
    end
    false
end

nums = [1,1,1,3,3,4,3,2,4,2]
print contains_duplicate(nums)