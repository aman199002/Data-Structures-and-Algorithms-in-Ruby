def find_max_sum(a)
	max_ending_here = 0
	max_so_far = 0
	for i in 0..a.size-1 do
		max_ending_here = max_ending_here + a[i]
		max_ending_here = 0 if max_ending_here < 0
		if max_ending_here > 0 && max_ending_here > max_so_far
			max_so_far = max_ending_here
		end	
	end
	return max_so_far
end

puts find_max_sum([-2,-3,4,-1,-2,1,5,-3])
puts find_max_sum([-2,-3,-4,-1,-2,-1,-5,-3])