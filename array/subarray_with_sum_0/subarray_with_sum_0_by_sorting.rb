def is_0_sum_subarray(arr)
	arr = arr.sort
	sum = 0
	for i in 0..arr.size-1 do
		sum = sum + arr[i]
		return true if sum == 0
	end
	return false
end

print is_0_sum_subarray([4,2,-3,1,6])