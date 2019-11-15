def find_max_sum_negative(a)
	current_max = a[0]
	max_so_far = a[0]
	for i in 1..a.size-1 do
		current_max = [a[i],current_max+a[i]].max
		max_so_far = [current_max,max_so_far].max
	end	
	return max_so_far
end	

puts find_max_sum_negative([-2,-3,-4,-10,-2,-11,-5,-3])
puts find_max_sum_negative([-2,-3,-4,-10,2,-11,-5,-3])
puts find_max_sum_negative([-2,-3,-4,-10,-2,-11,-5,-3,0])