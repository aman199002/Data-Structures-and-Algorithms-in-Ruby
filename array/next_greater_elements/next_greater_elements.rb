def find_next_greater(a)
	a2 = []
	for i in 0..a.size-2 do
		next_greater = nil
		for j in (i+1)..a.size-1 do
			if a[j] > a[i]
				next_greater = a[j]
				break
			end
		end
		if next_greater == nil
			next_greater = -1 
		end
		a2 << next_greater
	end
	a2 << -1
end

# puts find_next_greater([40, 5, 2, 25])
# puts find_next_greater([13, 7, 6, 12])
# puts find_next_greater([13, 12, 11, 10])
puts find_next_greater([1,2,1])