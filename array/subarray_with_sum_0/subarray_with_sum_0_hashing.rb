def is_0_sum_subarray(arr)
	h1 = {}
	sum = 0
	for i in 0..arr.size-1 do
		sum = sum + arr[i]
		if sum==0 || h1[sum]
			return true 
		end	
		h1[sum] = true
	end
	return false
end

print is_0_sum_subarray([4,2,-3,1,6])