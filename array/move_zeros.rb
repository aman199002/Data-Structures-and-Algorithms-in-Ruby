def move_zeroes(nums)
    for i in 0..nums.length-1 do
        if nums[i] == 0
            nums[i] = nil
            nums[nums.length] = 0
        end        
    end
    nums.delete(nil)
    nums
end

print move_zeroes([0,1,0,3,12])
print move_zeroes([0,0,1])
