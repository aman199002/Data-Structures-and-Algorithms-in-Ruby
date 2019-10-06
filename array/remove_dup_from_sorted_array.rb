def remove_duplicates(nums)
    return 0 if nums.empty?
    for i in 0..nums.length-1 do
       if nums[i] == nums[i+1]
       		nums[i] = nil
       end
    end
    nums.delete(nil)
    nums.length
end

nums = [0,0,1,1,1,2,2,3,3,4]
print remove_duplicates(nums)