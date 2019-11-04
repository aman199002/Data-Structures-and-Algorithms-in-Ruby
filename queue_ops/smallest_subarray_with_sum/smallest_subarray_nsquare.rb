def find_subset(arr,x)
	result = []
	for i in 0..arr.size-1 do
		current_sum = 0
		temp_arr = []
		for j in i..arr.size-1 do
			if current_sum <= x #&& temp_arr.size < result.size
				current_sum = current_sum + arr[j]
				temp_arr << arr[j]
			end
			if current_sum > x && (result.empty? || temp_arr.size <= result.size)
				result = temp_arr
			end
		end
	end
	result
end

print find_subset([1,4,45,6,0,19],51)
print find_subset([1, 10, 5, 2, 7],9)
print find_subset([1, 11, 100, 1, 0, 200, 3, 2, 1, 250],280)
print find_subset([1, 2, 4],8)