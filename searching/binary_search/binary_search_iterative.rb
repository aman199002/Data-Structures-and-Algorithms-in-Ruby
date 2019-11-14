# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search(target,nums)
    l = 0
    h = nums.size - 1
    while l <= h do
		x = (l+h)/2
		if target == nums[x]
			return x
		elsif target < nums[x]
			h = x-1
		elsif target > nums[x]
			l = x+1
		end	
	end
    return -1
end


print search(17,[-6,2,4,6,9,11,13,17])