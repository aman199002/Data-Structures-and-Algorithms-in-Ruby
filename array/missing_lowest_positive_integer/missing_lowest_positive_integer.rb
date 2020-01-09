# Time Complexity nlog(n)
# Space Complexity O(1)
def missing_positive_number(a)
	a = a.sort # Quick sort, implement manually
	num = 0
	for i in 0..a.size-1 do
		if !(a[i] <= 0 || a[i] == a[i-1])		
			num = num+1
			if a[i] != num
				return num
			end
		end	
	end
	return num+1
end

puts missing_positive_number([2,3,4,-1,1,1,0,2,6])
puts missing_positive_number([1,2,0])