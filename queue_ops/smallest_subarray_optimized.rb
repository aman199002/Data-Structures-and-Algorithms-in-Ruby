def find_minlength_subarray(arr,x)
	n = arr.size
	min_length = n + 1
	start = 0 
	last = 0
	current_sum = 0
	# Keep traversing till last poimter has been reached to end of array
	while last < n do
		# Last pointer is less than array size and current_sum must be less than given value x
		while last < n && current_sum <= x do
			current_sum = current_sum + arr[last]
			last = last + 1
		end
		# Traverse till sum is greater than x and start pointer is less than last
		while current_sum > x && start < last do
			min_length = last - start if (last - start) < min_length
			current_sum = current_sum - arr[start]			
			start = start + 1
		end	
	end
	return 0 if min_length == n + 1
	min_length
end

puts find_minlength_subarray([1,4,45,6,0,19],51)
puts find_minlength_subarray([1, 10, 5, 2, 7],9)
puts find_minlength_subarray([1, 11, 100, 1, 0, 200, 3, 2, 1, 250],280)
puts find_minlength_subarray([1, 2, 4],8)
